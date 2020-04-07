within ThreePhase.Loads;
model WyeLoad_2Ph
  outer OpenIPSL.Electrical.SystemBase SysData;
  parameter Real Sn=SysData.S_b "Power rating (MVA)"
    annotation (Dialog(group="Power flow"));
  OpenIPSL.Interfaces.PwPin A(
    vr(start=var0),
    vi(start=vai0),
    ir(start=iar0),
    ii(start=iai0)) annotation (Placement(
      transformation(
        extent={{35.0,0.0},{55.0,20.0}},
        origin={0.0,0.0},
        rotation=0),
      iconTransformation(
        extent={{35.0,120.0},{55.0,100.0}},
        origin={0.0,0.0},
        rotation=0),
      visible=true));
  OpenIPSL.Interfaces.PwPin B(
    vr(start=vbr0),
    vi(start=vbi0),
    ir(start=ibr0),
    ii(start=ibi0)) annotation (Placement(
      transformation(
        extent={{-35.0,0.0},{-55.0,20.0}},
        origin={0.0,0.0},
        rotation=0),
      iconTransformation(
        extent={{-35.0,120.0},{-55.0,100.0}},
        origin={0.0,0.0},
        rotation=0),
      visible=true));
  parameter Integer ModelType=0 "0- Constant Power Model, 1- ZIP Model;"
    annotation (choices(choice=0 "Constant Power", choice=1 "ZIP Model"),
      Dialog(group="Power flow"));
  parameter Real P_a "Active power for phase A (MW)"
    annotation (Dialog(group="Power flow"));
  parameter Real Q_a "Reactive power for phase A (MVAr)"
    annotation (Dialog(group="Power flow"));
  parameter Real P_b "Active power for phase B (MW)"
    annotation (Dialog(group="Power flow"));
  parameter Real Q_b "Reactive power for phase B (MVAr)"
    annotation (Dialog(group="Power flow"));
  parameter Real VA=1 "Guess value for phase A magnitude (pu)"
    annotation (Dialog(group="Initialization"));
  parameter Real AngA=0 "Guess value for phase A angle (deg)"
    annotation (Dialog(group="Initialization"));
  parameter Real VB=1 "Guess value for phase B magnitude (pu)"
    annotation (Dialog(group="Initialization"));
  parameter Real AngB=-120 "Guess value for phase B angle (deg)"
    annotation (Dialog(group="Initialization"));
  parameter Real A_pa=0 "Percentage of Constant Power Load for Phase A (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
  parameter Real B_pa=0 "Percentage of Constant Current Load for Phase A (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
  parameter Real C_pa=0 "Percentage of Constant Impedance Load for Phase A (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
  parameter Real A_pb=0 "Percentage of Constant Power Load for Phase B (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
  parameter Real B_pb=0 "Percentage of Constant Current Load for Phase B (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
  parameter Real C_pb=0
    "Percentage of Constant Impedance Load] for Phase B (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
protected
  parameter Real[1, 4] TPhasePower=[P_a/(Sn/3), P_b/(Sn/3), Q_a/(Sn/3), Q_b/(Sn
      /3)];
  parameter Real[1, 6] ZIP_coef=[A_pa/100, B_pa/100, C_pa/100, A_pb/100, B_pb/
      100, C_pb/100];
  // Calculating V and V2
  Real Va=sqrt(A.vr^2 + A.vi^2);
  Real Vb=sqrt(B.vr^2 + B.vi^2);
  Real Va2=Va^2;
  Real Vb2=Vb^2;
  // Calculating the Coeficients for Adjusting the Power
  Real Coef_A=ZIP_coef[1, 1] + ZIP_coef[1, 2]*Va + ZIP_coef[1, 3]*Va2;
  Real Coef_B=ZIP_coef[1, 4] + ZIP_coef[1, 5]*Vb + ZIP_coef[1, 6]*Vb2;
  Real[1, 2] in_coef=[Coef_A, Coef_B];

  function Coeficients
    input Real[1, 2] in_coef;
    input Integer ModelType;
    output Real[1, 2] Coef;
  algorithm
    if ModelType == 0 then
      Coef := [1, 1];
    elseif ModelType == 1 then
      Coef := in_coef;
    end if;
  end Coeficients;

  Real[1, 2] Coef=Coeficients(in_coef, ModelType);

  // Calculating new value for Active and Reactive Power
  Real Pa=TPhasePower[1, 1]*Coef[1, 1];
  Real Pb=TPhasePower[1, 2]*Coef[1, 2];
  Real Qa=TPhasePower[1, 3]*Coef[1, 1];
  Real Qb=TPhasePower[1, 4]*Coef[1, 2];

  // Initializing voltages for each pin
  parameter Real var0=VA*cos(AngA*Modelica.Constants.pi/180) "Initialitation";
  parameter Real vai0=VA*sin(AngA*Modelica.Constants.pi/180) "Initialitation";
  parameter Real vbr0=VB*cos(AngB*Modelica.Constants.pi/180) "Initialitation";
  parameter Real vbi0=VB*sin(AngB*Modelica.Constants.pi/180) "Initialitation";
  parameter Real iar0=(TPhasePower[1, 1]*var0 + TPhasePower[1, 3]*vai0)/(var0^2
       + vai0^2) "Initialization";
  parameter Real iai0=(TPhasePower[1, 1]*vai0 - TPhasePower[1, 3]*var0)/(var0^2
       + vai0^2) "Initialization";
  parameter Real ibr0=(TPhasePower[1, 2]*vbr0 + TPhasePower[1, 4]*vbi0)/(vbr0^2
       + vbi0^2) "Initialization";
  parameter Real ibi0=(TPhasePower[1, 2]*vbi0 - TPhasePower[1, 4]*vbr0)/(vbr0^2
       + vbi0^2) "Initialization";
equation
  Pa = A.vr*A.ir + A.vi*A.ii;
  Qa = A.vi*A.ir - A.vr*A.ii;
  Pb = B.vr*B.ir + B.vi*B.ii;
  Qb = B.vi*B.ir - B.vr*B.ii;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, initialScale=0.1),
        graphics={Line(points={{-100,100},{100,100},{0,-100},{-100,100}}, color
          ={28,108,200}),Text(
          lineColor={28,108,200},
          extent={{-62,90},{66,45}},
          textString="Grounded-Wye Load"),Text(
          origin={18,4},
          lineColor={28,108,200},
          extent={{-62,45},{28,26}},
          textString="PQ/ZIP Load")}), Documentation);
end WyeLoad_2Ph;
