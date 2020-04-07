within ThreePhase.Branches.Lines;
model Line_2Ph "Modeled as a PI element"
  extends Branches.BaseClasses.baseLine;

  OpenIPSL.Interfaces.PwPin Ain
    annotation (Placement(transformation(extent={{-140,35},{-120,55}})));
  OpenIPSL.Interfaces.PwPin Bin
    annotation (Placement(transformation(extent={{-140,-55},{-120,-35}})));
  OpenIPSL.Interfaces.PwPin Aout
    annotation (Placement(transformation(extent={{120,35},{140,55}})));
  OpenIPSL.Interfaces.PwPin Bout
    annotation (Placement(transformation(extent={{120,-55},{140,-35}})));

  parameter Real Gseraa=0 "in p.u." annotation (Dialog(group="Power flow data"));
  parameter Real Bseraa=-10 "in p.u."
    annotation (Dialog(group="Power flow data"));
  parameter Real Gserab=0 "in p.u." annotation (Dialog(group="Power flow data"));
  parameter Real Bserab=0 "in p.u." annotation (Dialog(group="Power flow data"));
  parameter Real Gserbb=0 "in p.u." annotation (Dialog(group="Power flow data"));
  parameter Real Bserbb=-10 "in p.u."
    annotation (Dialog(group="Power flow data"));
  parameter Real Bshtaa=0 "in p.u." annotation (Dialog(group="Power flow data"));
  parameter Real Bshtab=0 "in p.u." annotation (Dialog(group="Power flow data"));
  parameter Real Bshtbb=0 "in p.u." annotation (Dialog(group="Power flow data"));

  //Writing the Y_ser matrix for the pi model
protected
  parameter Real[4, 4] Y_ser=[Gseraa, -Bseraa, Gserab, -Bserab; Bseraa, Gseraa,
      Bserab, Gserab; Gserab, -Bserab, Gserbb, -Bserbb; Bserab, Gserab, Bserbb,
      Gserbb];

  //Writing the Y_sht matrix for the pi model
  parameter Real[4, 4] Y_sht=[zero, -Bshtaa, zero, -Bshtab; Bshtaa, zero,
      Bshtab, zero; zero, -Bshtab, zero, -Bshtbb; Bshtab, zero, Bshtbb, zero];

  //Calculating the parameters for the Transformer
  //Writing the matrix A (Yser1+Yshtk)
  parameter Real[4, 4] A=Y_ser + Y_sht;

  //Writing the matrix B (-Yser1)
  parameter Real[4, 4] B=-Y_ser;

  // Writing matrix for voltages (in and out)
  Real[4, 1] Vin=[Ain.vr; Ain.vi; Bin.vr; Bin.vi];
  Real[4, 1] Vout=[Aout.vr; Aout.vi; Bout.vr; Bout.vi];
  // Writing matrix for currents (in and out)
  Real[4, 1] Iin=[Ain.ir; Ain.ii; Bin.ir; Bin.ii];
  Real[4, 1] Iout=[Aout.ir; Aout.ii; Bout.ir; Bout.ii];

equation
  // Equations according to pi model
  Iin = A*Vin + B*Vout;
  Iout = B*Vin + A*Vout;

  annotation (
    Icon(coordinateSystem(
        extent={{-140,-100},{140,100}},
        preserveAspectRatio=true,
        initialScale=0.1), graphics={Line(points={{-90,0},{-110,45},{-130,45}},
          color={0,0,255}),Line(points={{-90,0},{-110,-45},{-130,-45}}, color={
          0,0,255}),Line(points={{90,0},{110,45},{130,45}}, color={0,0,255}),
          Line(points={{90,0},{110,-45},{130,-45}}, color={0,0,255})}),
    Diagram(coordinateSystem(
        extent={{-140,-100},{140,100}},
        preserveAspectRatio=true,
        initialScale=0.1)),
    uses(Modelica(version="3.2.1")),
    Documentation);
end Line_2Ph;
