within ThreePhase.Branches.Lines;
model Line_3Ph "Modeled as a PI element"
  import ThreePhase;
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

  parameter Real Gseraa=0 "in p.u." annotation (Dialog(group="Power flow data"));
  parameter Real Bseraa=-10 "in p.u."
    annotation (Dialog(group="Power flow data"));
  parameter Real Gserab=0 "in p.u." annotation (Dialog(group="Power flow data"));
  parameter Real Bserab=0 "in p.u." annotation (Dialog(group="Power flow data"));
  parameter Real Gserac=0 "in p.u." annotation (Dialog(group="Power flow data"));
  parameter Real Bserac=0 "in p.u." annotation (Dialog(group="Power flow data"));
  parameter Real Gserbb=0 "in p.u." annotation (Dialog(group="Power flow data"));
  parameter Real Bserbb=-10 "in p.u."
    annotation (Dialog(group="Power flow data"));
  parameter Real Gserbc=0 "in p.u." annotation (Dialog(group="Power flow data"));
  parameter Real Bserbc=0 "in p.u." annotation (Dialog(group="Power flow data"));
  parameter Real Gsercc=0 "in p.u." annotation (Dialog(group="Power flow data"));
  parameter Real Bsercc=-10 "in p.u."
    annotation (Dialog(group="Power flow data"));
  parameter Real Bshtaa=0 "in p.u." annotation (Dialog(group="Power flow data"));
  parameter Real Bshtab=0 "in p.u." annotation (Dialog(group="Power flow data"));
  parameter Real Bshtac=0 "in p.u." annotation (Dialog(group="Power flow data"));
  parameter Real Bshtbb=0 "in p.u." annotation (Dialog(group="Power flow data"));
  parameter Real Bshtbc=0 "in p.u." annotation (Dialog(group="Power flow data"));
  parameter Real Bshtcc=0 "in p.u." annotation (Dialog(group="Power flow data"));


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
        preserveAspectRatio=true,
        initialScale=0.1), graphics={Line(points={{-90,0},{-130,0}}, color={0,0,
          255}),Line(points={{-90,0},{-110,90},{-130,90}}, color={0,0,255}),
          Line(points={{-90,0},{-110,-90},{-130,-90}}, color={0,0,255}),Line(
          points={{90,0},{130,0}}, color={0,0,255}),Line(points={{90,0},{110,90},
          {130,90}}, color={0,0,255}),Line(points={{90,0},{110,-90},{130,-90}},
          color={0,0,255})}),
    Diagram(coordinateSystem(
        extent={{-140,-100},{140,100}},
        preserveAspectRatio=true,
        initialScale=0.1)),
    uses(Modelica(version="3.2.1")),
    Documentation);
end Line_3Ph;
