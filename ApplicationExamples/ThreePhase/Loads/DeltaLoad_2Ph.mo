within ThreePhase.Loads;
model DeltaLoad_2Ph
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
  parameter Real P_ab "Active power for line AB (MW)"
    annotation (Dialog(group="Power flow"));
  parameter Real Q_ab "Reactive power for line AB (MVAr)"
    annotation (Dialog(group="Power flow"));
  parameter Real VA=1 "Guess value for phase A magnitude (pu)"
    annotation (Dialog(group="Initialization"));
  parameter Real AngA=0 "Guess value for phase A angle (deg)"
    annotation (Dialog(group="Initialization"));
  parameter Real VB=1 "Guess value for phase B magnitude (pu)"
    annotation (Dialog(group="Initialization"));
  parameter Real AngB=-120 "Guess value for phase B angle (deg)"
    annotation (Dialog(group="Initialization"));
  parameter Real A_ab=0 "Percentage of Constant Power Load for Line AB (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
  parameter Real B_ab=0 "Percentage of Constant Current Load for Line AB (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
  parameter Real C_ab=0 "Percentage of Constant Impedance Load for Line AB (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));

protected
  parameter Real[1, 2] TPhasePower=[P_ab/(Sn/3), Q_ab/(Sn/3)];
  parameter Real[1, 3] ZIP_coef=[A_ab/100, B_ab/100, C_ab/100];

  // Calculating the Line Voltage in p.u.
  Real Vabr=(A.vr - B.vr)/sqrt(3);
  Real Vabi=(A.vi - B.vi)/sqrt(3);

  // Calculating the Magnitude of V and V squared
  Real Vab=sqrt(Vabr^2 + Vabi^2);
  Real Vab2=Vab^2;

  // Calculating the Coeficients for Adjusting the Power
  Real Coef_A=ZIP_coef[1, 1] + ZIP_coef[1, 2]*Vab + ZIP_coef[1, 3]*Vab2;

  Real in_coef=Coef_A;

  function Coeficients
    input Real in_coef;
    input Integer ModelType;
    output Real Coef;

  algorithm
    if ModelType == 0 then
      Coef := 1;
    elseif ModelType == 1 then
      Coef := in_coef;
    end if;
  end Coeficients;

  Real Coef=Coeficients(in_coef, ModelType);

  // Calculating new value for Active and Reactive Power
  Real Pab=TPhasePower[1, 1]*Coef;
  Real Qab=TPhasePower[1, 2]*Coef;

  // Initializing voltages for each pin
  parameter Real var0=VA*cos(AngA*Modelica.Constants.pi/180) "Initialization";
  parameter Real vai0=VA*sin(AngA*Modelica.Constants.pi/180) "Initialization";
  parameter Real vbr0=VB*cos(AngB*Modelica.Constants.pi/180) "Initialization";
  parameter Real vbi0=VB*sin(AngB*Modelica.Constants.pi/180) "Initialization";
  parameter Real iar0=(TPhasePower[1, 1]*(var0 - vbr0) + TPhasePower[1, 2]*(
      vai0 - vbi0))/((var0 - vbr0)^2 + (vai0 - vbi0)^2) "Initialization";
  parameter Real iai0=(TPhasePower[1, 1]*(vai0 - vbi0) - TPhasePower[1, 2]*(
      var0 - vbr0))/((var0 - vbr0)^2 + (vai0 - vbi0)^2) "Initialization";
  parameter Real ibr0=-iar0 "Initialization";
  parameter Real ibi0=-iai0 "Initialization";
equation
  A.ir = (Pab*(A.vr - B.vr) + Qab*(A.vi - B.vi))/((A.vr - B.vr)^2 + (A.vi - B.vi)
    ^2);
  A.ii = (Pab*(A.vi - B.vi) - Qab*(A.vr - B.vr))/((A.vr - B.vr)^2 + (A.vi - B.vi)
    ^2);
  B.ir = -(Pab*(A.vr - B.vr) + Qab*(A.vi - B.vi))/((A.vr - B.vr)^2 + (A.vi - B.vi)
    ^2);
  B.ii = -(Pab*(A.vi - B.vi) - Qab*(A.vr - B.vr))/((A.vr - B.vr)^2 + (A.vi - B.vi)
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
end DeltaLoad_2Ph;
