within ThreePhase.Loads;
model DeltaLoad_3Ph
  outer OpenIPSL.Electrical.SystemBase SysData;
  parameter Real Sn=SysData.S_b "Power rating (MVA)"
    annotation (Dialog(group="Power flow"));
  OpenIPSL.Interfaces.PwPin A(vr(start=var0), vi(start=vai0)) annotation (
      Placement(
      transformation(
        extent={{80.0,0.0},{100.0,20.0}},
        origin={0.0,0.0},
        rotation=0),
      iconTransformation(
        extent={{-80.0,0.0},{-60.0,20.0}},
        origin={159,100},
        rotation=0),
      visible=true));
  OpenIPSL.Interfaces.PwPin B(vr(start=vbr0), vi(start=vbi0)) annotation (
      Placement(
      transformation(
        extent={{-10.0,0.0},{10.0,20.0}},
        origin={0.0,0.0},
        rotation=0),
      iconTransformation(
        extent={{-80.0,0.0},{-60.0,20.0}},
        origin={70,100},
        rotation=0),
      visible=true));
  OpenIPSL.Interfaces.PwPin C(vr(start=vcr0), vi(start=vci0)) annotation (
      Placement(
      transformation(
        extent={{-100.0,0.0},{-80.0,20.0}},
        origin={0.0,0.0},
        rotation=0),
      iconTransformation(
        extent={{-80.0,0.0},{-60.0,20.0}},
        origin={-19,100},
        rotation=0),
      visible=true));
  parameter Integer ModelType=0 "0- Constant Power Model, 1- ZIP Model;"
    annotation (choices(choice=0 "Constant Power", choice=1 "ZIP Model"),
      Dialog(group="Power flow"));
  parameter Real P_ab "Active power for line AB (MW)"
    annotation (Dialog(group="Power flow"));
  parameter Real Q_ab "Reactive power for line AB (MVAr)"
    annotation (Dialog(group="Power flow"));
  parameter Real P_bc "Active power for line BC (MW)"
    annotation (Dialog(group="Power flow"));
  parameter Real Q_bc "Reactive power for line BC (MVAr)"
    annotation (Dialog(group="Power flow"));
  parameter Real P_ca "Active power for line CA (MW)"
    annotation (Dialog(group="Power flow"));
  parameter Real Q_ca "Reactive power for line CA (MVAr)"
    annotation (Dialog(group="Power flow"));

  parameter Real VA=1 "Guess value for phase A magnitude (pu)"
    annotation (Dialog(group="Initialization"));
  parameter Real AngA=0 "Guess value for phase A angle (deg)"
    annotation (Dialog(group="Initialization"));
  parameter Real VB=1 "Guess value for phase B magnitude (pu)"
    annotation (Dialog(group="Initialization"));
  parameter Real AngB=-120 "Guess value for phase B angle (deg)"
    annotation (Dialog(group="Initialization"));
  parameter Real VC=1 "Guess value for phase C magnitude (pu)"
    annotation (Dialog(group="Initialization"));
  parameter Real AngC=120 "Guess value for phase C angle (deg)"
    annotation (Dialog(group="Initialization"));

  parameter Real A_ab=0 "Percentage of Constant Power Load for Line AB (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
  parameter Real B_ab=0 "Percentage of Constant Current Load for Line AB (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
  parameter Real C_ab=0 "Percentage of Constant Impedance Load for Line AB (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
  parameter Real A_bc=0 "Percentage of Constant Power Load for Line BC (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
  parameter Real B_bc=0 "Percentage of Constant Current Load for Line BC (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
  parameter Real C_bc=0
    "Percentage of Constant Impedance Load] for Line BC (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
  parameter Real A_ca=0 "Percentage of Constant Power Load for Line CA (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
  parameter Real B_ca=0 "Percentage of Constant Current Load for Line CA (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
  parameter Real C_ca=0 "Percentage of Constant Impedance Load for Line CA (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));

protected
  parameter Real[1, 6] TPhasePower=[P_ab/(Sn/3), P_bc/(Sn/3), P_ca/(Sn/3), Q_ab
      /(Sn/3), Q_bc/(Sn/3), Q_ca/(Sn/3)];
  parameter Real[1, 9] ZIP_coef=[A_ab/100, B_ab/100, C_ab/100, A_bc/100, B_bc/
      100, C_bc/100, A_ca/100, B_ca/100, C_ca/100];

  // Calculating the Line Voltage in p.u.
  Real Vabr=(A.vr - B.vr)/sqrt(3);
  Real Vabi=(A.vi - B.vi)/sqrt(3);
  Real Vbcr=(B.vr - C.vr)/sqrt(3);
  Real Vbci=(B.vi - C.vi)/sqrt(3);
  Real Vcar=(C.vr - A.vr)/sqrt(3);
  Real Vcai=(C.vi - A.vi)/sqrt(3);
  Real[3, 2] Vline=[Vabr, Vabi; Vbcr, Vbci; Vcar, Vcai];

  // Calculating the Magnitude of V and V squared
  function Voltages
    input Real[3, 2] Vline;
    output Real[2, 3] out_volt;
  protected
    Real Vab=sqrt(Vline[1, 1]^2 + Vline[1, 2]^2);
    Real Vbc=sqrt(Vline[2, 1]^2 + Vline[2, 2]^2);
    Real Vca=sqrt(Vline[3, 1]^2 + Vline[3, 2]^2);
    Real Vab2=Vab^2;
    Real Vbc2=Vbc^2;
    Real Vca2=Vca^2;
  algorithm
    out_volt := [Vab, Vbc, Vca; Vab2, Vbc2, Vca2];
  end Voltages;

  Real[2, 3] Volt=Voltages(Vline);

  // Calculating the Coeficients for Adjusting the Power
  Real Coef_A=ZIP_coef[1, 1] + ZIP_coef[1, 2]*Volt[1, 1] + ZIP_coef[1, 3]*Volt[
      2, 1];
  Real Coef_B=ZIP_coef[1, 4] + ZIP_coef[1, 5]*Volt[1, 2] + ZIP_coef[1, 6]*Volt[
      2, 2];
  Real Coef_C=ZIP_coef[1, 7] + ZIP_coef[1, 8]*Volt[1, 3] + ZIP_coef[1, 9]*Volt[
      2, 3];

  Real[1, 3] in_coef=[Coef_A, Coef_B, Coef_C];

  function Coeficients
    input Real[1, 3] in_coef;
    input Integer ModelType;
    output Real[1, 3] Coef;

  algorithm
    if ModelType == 0 then
      Coef := [1, 1, 1];
    elseif ModelType == 1 then
      Coef := in_coef;
    end if;
  end Coeficients;

  Real[1, 3] Coef=Coeficients(in_coef, ModelType);

  // Calculating new value for Active and Reactive Power
  Real Pab=TPhasePower[1, 1]*Coef[1, 1];
  Real Pbc=TPhasePower[1, 2]*Coef[1, 2];
  Real Pca=TPhasePower[1, 3]*Coef[1, 3];
  Real Qab=TPhasePower[1, 4]*Coef[1, 1];
  Real Qbc=TPhasePower[1, 5]*Coef[1, 2];
  Real Qca=TPhasePower[1, 6]*Coef[1, 3];

  // Initializing voltages and currents for each pin
  parameter Real var0=VA*cos(AngA*Modelica.Constants.pi/180) "Initialization";
  parameter Real vai0=VA*sin(AngA*Modelica.Constants.pi/180) "Initialization";
  parameter Real vbr0=VB*cos(AngB*Modelica.Constants.pi/180) "Initialization";
  parameter Real vbi0=VB*sin(AngB*Modelica.Constants.pi/180) "Initialization";
  parameter Real vcr0=VC*cos(AngC*Modelica.Constants.pi/180) "Initialization";
  parameter Real vci0=VC*sin(AngC*Modelica.Constants.pi/180) "Initialization";

equation

  A.ir = (Pab*(A.vr - B.vr) + Qab*(A.vi - B.vi))/((A.vr - B.vr)^2 + (A.vi - B.vi)
    ^2) - (Pca*(C.vr - A.vr) + Qca*(C.vi - A.vi))/((C.vr - A.vr)^2 + (C.vi - A.vi)
    ^2);
  A.ii = (Pab*(A.vi - B.vi) - Qab*(A.vr - B.vr))/((A.vr - B.vr)^2 + (A.vi - B.vi)
    ^2) - (Pca*(C.vi - A.vi) - Qca*(C.vr - A.vr))/((C.vr - A.vr)^2 + (C.vi - A.vi)
    ^2);
  B.ir = (Pbc*(B.vr - C.vr) + Qbc*(B.vi - C.vi))/((B.vr - C.vr)^2 + (B.vi - C.vi)
    ^2) - (Pab*(A.vr - B.vr) + Qab*(A.vi - B.vi))/((A.vr - B.vr)^2 + (A.vi - B.vi)
    ^2);
  B.ii = (Pbc*(B.vi - C.vi) - Qbc*(B.vr - C.vr))/((B.vr - C.vr)^2 + (B.vi - C.vi)
    ^2) - (Pab*(A.vi - B.vi) - Qab*(A.vr - B.vr))/((A.vr - B.vr)^2 + (A.vi - B.vi)
    ^2);
  C.ir = (Pca*(C.vr - A.vr) + Qca*(C.vi - A.vi))/((C.vr - A.vr)^2 + (C.vi - A.vi)
    ^2) - (Pbc*(B.vr - C.vr) + Qbc*(B.vi - C.vi))/((B.vr - C.vr)^2 + (B.vi - C.vi)
    ^2);
  C.ii = (Pca*(C.vi - A.vi) - Qca*(C.vr - A.vr))/((C.vr - A.vr)^2 + (C.vi - A.vi)
    ^2) - (Pbc*(B.vi - C.vi) - Qbc*(B.vr - C.vr))/((B.vr - C.vr)^2 + (B.vi - C.vi)
    ^2);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, initialScale=0.1),
        graphics={Line(points={{-100,100},{100,100},{0,-100},{-100,100}}, color
          ={28,108,200}),Text(
          origin={-24,20},
          lineColor={28,108,200},
          extent={{-18,72},{66,45}},
          textString="Delta Load"),Text(
          origin={18,4},
          lineColor={28,108,200},
          extent={{-62,45},{28,26}},
          textString="PQ/ZIP Load")}), Documentation);
end DeltaLoad_3Ph;
