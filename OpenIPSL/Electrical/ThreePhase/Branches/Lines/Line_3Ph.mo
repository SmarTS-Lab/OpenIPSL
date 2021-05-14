within OpenIPSL.Electrical.ThreePhase.Branches.Lines;
model Line_3Ph "Three-phase line modeled as a PI-equivalent device."
  import OpenIPSL.Electrical.ThreePhase;
  extends ThreePhase.Branches.BaseClasses.baseLine;

  outer OpenIPSL.Electrical.SystemBase SysData;

  OpenIPSL.Interfaces.PwPin Ain
    annotation (Placement(transformation(extent={{-140,80},{-120,100}})));
  OpenIPSL.Interfaces.PwPin Bin
    annotation (Placement(transformation(extent={{-140,-10},{-120,10}})));
  OpenIPSL.Interfaces.PwPin Cin
    annotation (Placement(transformation(extent={{-140,-100},{-120,-80}})));
  OpenIPSL.Interfaces.PwPin Aout
    annotation (Placement(transformation(extent={{120,80},{140,100}})));
  OpenIPSL.Interfaces.PwPin Bout
    annotation (Placement(transformation(extent={{120,-10},{140,10}})));
  OpenIPSL.Interfaces.PwPin Cout
    annotation (Placement(transformation(extent={{120,-100},{140,-80}})));

  parameter Types.PerUnit Gseraa=0 "Element (1,1) in series conductance matrix" annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit Bseraa=-10 "Element (1,1) in series susceptance matrix"
    annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit Gserab=0 "Element (1,2) in series conductance matrix" annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit Bserab=0 "Element (1,2) in series susceptance matrix" annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit Gserac=0 "Element (1,3) in series conductance matrix" annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit Bserac=0 "Element (1,3) in series susceptance matrix" annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit Gserbb=0 "Element (2,2) in series conductance matrix" annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit Bserbb=-10 "Element (2,2) in series susceptance matrix"
    annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit Gserbc=0 "Element (2,3) in series conductance matrix" annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit Bserbc=0 "Element (2,3) in series susceptance matrix" annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit Gsercc=0 "Element (3,3) in series conductance matrix" annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit Bsercc=-10 "Element (3,3) in series susceptance matrix"
    annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit Bshtaa=0 "Element (1,1) in shunt half susceptance matrix" annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit Bshtab=0 "Element (1,2) in shunt half susceptance matrix" annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit Bshtac=0 "Element (1,3) in shunt half susceptance matrix" annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit Bshtbb=0 "Element (2,2) in shunt half susceptance matrix" annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit Bshtbc=0 "Element (2,3) in shunt half susceptance matrix" annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit Bshtcc=0 "Element (3,3) in shunt half susceptance matrix" annotation (Dialog(group="Power flow data"));

  //Writing the Y_ser matrix for the pi model
protected
  parameter Real[6, 6] Y_ser=[Gseraa, -Bseraa, Gserab, -Bserab, Gserac, -Bserac;
      Bseraa, Gseraa, Bserab, Gserab, Bserac, Gserac; Gserab, -Bserab, Gserbb,
      -Bserbb, Gserbc, -Bserbc; Bserab, Gserab, Bserbb, Gserbb, Bserbc, Gserbc;
      Gserac, -Bserac, Gserbc, -Bserbc, Gsercc, -Bsercc; Bserac, Gserac, Bserbc,
      Gserbc, Bsercc, Gsercc];

  //Writing the Y_sht matrix for the pi model
  parameter Real[6, 6] Y_sht=[zero, -Bshtaa, zero, -Bshtab, zero, -Bshtac;
      Bshtaa, zero, Bshtab, zero, Bshtac, zero; zero, -Bshtab, zero, -Bshtbb,
      zero, -Bshtbc; Bshtab, zero, Bshtbb, zero, Bshtbc, zero; zero, -Bshtac,
      zero, -Bshtbc, zero, -Bshtcc; Bshtac, zero, Bshtbc, zero, Bshtcc, zero];

  //Calculating the parameters for the Transformer
  //Writing the matrix A (Yser1+Yshtk)
  parameter Real[6, 6] A=Y_ser + Y_sht;

  //Writing the matrix B (-Yser1)
  parameter Real[6, 6] B=-Y_ser;

  // Writing matrix for voltages (in and out)
  Real[6, 1] Vin=[Ain.vr; Ain.vi; Bin.vr; Bin.vi; Cin.vr; Cin.vi];
  Real[6, 1] Vout=[Aout.vr; Aout.vi; Bout.vr; Bout.vi; Cout.vr; Cout.vi];
  // Writing matrix for currents (in and out)
  Real[6, 1] Iin=[Ain.ir; Ain.ii; Bin.ir; Bin.ii; Cin.ir; Cin.ii];
  Real[6, 1] Iout=[Aout.ir; Aout.ii; Bout.ir; Bout.ii; Cout.ir; Cout.ii];

equation
  // Equations according to pi model
  Iin = A*Vin + B*Vout;
  Iout = B*Vin + A*Vout;

  annotation (
    Icon(coordinateSystem(
        extent={{-140,-100},{140,100}},
        preserveAspectRatio=true), graphics={Line(points={{-90,0},{-130,0}}, color={0,0,
          255}),Line(points={{-90,0},{-110,90},{-130,90}}, color={0,0,255}),
          Line(points={{-90,0},{-110,-90},{-130,-90}}, color={0,0,255}),Line(
          points={{90,0},{130,0}}, color={0,0,255}),Line(points={{90,0},{110,90},
          {130,90}}, color={0,0,255}),Line(points={{90,0},{110,-90},{130,-90}},
          color={0,0,255})}),
    Diagram(coordinateSystem(
        extent={{-140,-100},{140,100}},
        preserveAspectRatio=true)),
    Documentation(info="<html>
<p>This model was design to represent three-phase power line, modeled as a pi-element.</p>
<p>The user should input the series conductance and susceptance, and half shunt susceptance (line charging). All in matrix form, since the model allows the representation of unbalanced lines.
Series conductance (Gser) matrix is considered to have the following structure:</p>
<p><strong>[Gseraa</strong>, <strong>Gserab</strong>, <strong>Gserac</strong>; </p>
<p><strong> Gserab</strong>, <strong>Gserbb</strong>, <strong>Gserbc</strong>; </p>
<p><strong> Gserac</strong>, <strong>Gserbc</strong>, <strong>Gsercc</strong>] </p>
<p>Series susceptance (Bser) matrix is considered to have the following structure:</p>
<p><strong>[Bseraa</strong>, <strong>Bserab</strong>, <strong>Bserac</strong>; </p>
<p><strong> Bserab</strong>, <strong>Bserbb</strong>, <strong>Bserbc</strong>; </p>
<p><strong> Bserac</strong>, <strong>Bserbc</strong>, <strong>Bsercc</strong>] </p>
<p>The series admittance matrix is <strong>Yser = Gser+jBser</strong>. Each of the two shunt susceptance (Bsht) matrices is considered to have the following structure:</p>
<p><strong>[Bshtaa</strong>, <strong>Bshtab</strong>, <strong>Bshtac</strong>; </p>
<p><strong> Bshtab</strong>, <strong>Bshtbb</strong>, <strong>Bshtbc</strong>; </p>
<p><strong> Bshtac</strong>, <strong>Bshtbc</strong>, <strong>Bshtcc</strong>] </p>
<p>Based on this set of parameters, the pi-equivalent impedance matrices are calculated and the power line equation is assembled.</p>
</html>"));
end Line_3Ph;
