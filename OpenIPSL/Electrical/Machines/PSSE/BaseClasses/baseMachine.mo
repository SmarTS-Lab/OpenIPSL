within OpenIPSL.Electrical.Machines.PSSE.BaseClasses;
partial model baseMachine
  import Modelica.Constants.pi;
  import Complex;
  import Modelica.ComplexMath.arg;
  import Modelica.ComplexMath.real;
  import Modelica.ComplexMath.imag;
  import Modelica.ComplexMath.'abs';
  import Modelica.ComplexMath.conj;
  import Modelica.Blocks.Interfaces.*;
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  //Machine parameters
  parameter Real M_b "Machine base power (MVA)"
    annotation (Dialog(group="Power flow data"));
  parameter Real Tpd0 "d-axis transient open-circuit time constant (s)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real Tppd0 "d-axis sub-transient open-circuit time constant (s)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real Tppq0 "q-axis transient open-circuit time constant (s)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real H "Inertia constant (s)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real D "Speed damping"
    annotation (Dialog(group="Machine parameters"));
  parameter Real Xd "d-axis reactance"
    annotation (Dialog(group="Machine parameters"));
  parameter Real Xq "q-axis reactance"
    annotation (Dialog(group="Machine parameters"));
  parameter Real Xpd "d-axis transient reactance"
    annotation (Dialog(group="Machine parameters"));
  parameter Real Xppd "d-axis sub-transient reactance"
    annotation (Dialog(group="Machine parameters"));
  parameter Real Xppq "q-axis sub-transient reactance"
    annotation (Dialog(group="Machine parameters"));
  parameter Real Xl "leakage reactance"
    annotation (Dialog(group="Machine parameters"));
  parameter Real S10 "Saturation factor at 1.0 pu"
    annotation (Dialog(group="Machine parameters"));
  parameter Real S12 "Saturation factor at 1.2 pu"
    annotation (Dialog(group="Machine parameters"));
  parameter Real R_a=0 "amature resistance"
    annotation (Dialog(group="Machine parameters"));
  //Initialization
  OpenIPSL.Interfaces.PwPin p(
    vr(start=vr0),
    vi(start=vi0),
    ir(start=ir0),
    ii(start=ii0))
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  RealOutput SPEED(start=0) "Machine speed deviation from nominal (pu)"
    annotation (Placement(transformation(extent={{100,60},{120,80}})));
  RealInput PMECH "Turbine mechanical power (pu on M_b)"
    annotation (Placement(transformation(extent={{-140,30},{-100,70}})));
  RealOutput PMECH0 "Initial value of machine electrical power (pu on M_b)"
    annotation (Placement(transformation(extent={{100,40},{120,60}})));
  RealOutput ETERM(start=V_0) "Machine terminal voltage (pu)"
    annotation (Placement(transformation(extent={{100,-40},{120,-20}})));
  RealInput EFD "Generator main field voltage (pu)"
    annotation (Placement(transformation(extent={{-140,-70},{-100,-30}})));
  RealOutput EFD0 "Initial generator main field voltage (pu)"
    annotation (Placement(transformation(extent={{100,-60},{120,-40}})));
  RealOutput PELEC(start=p0) "Machine electrical power (pu on M_b)"
    annotation (Placement(transformation(extent={{100,20},{120,40}})));
  RealOutput ISORCE "Machine source current (pu)"
    annotation (Placement(transformation(extent={{100,-80},{120,-60}})));
  RealOutput ANGLE "Machine relative rotor angle (deg.)"
    annotation (Placement(transformation(extent={{100,78},{120,98}})));
  RealOutput XADIFD "Machine field current (pu)" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={110,-90}), iconTransformation(
        extent={{-8,-8},{8,8}},
        rotation=0,
        origin={108,-90})));
  Real w(start=0) "Machine speed deviation (pu)";
  Real delta "Rotor angle (deg.)";
  Real Vt(start=V_0) "Bus voltage magnitude (pu)";
  Real anglev(start=anglev_rad) "Bus voltage angle (deg.)";
  Real I(start=sqrt(ir0^2 + ii0^2)) "Terminal current magnitude (pu)";
  Real anglei(start=atan2(ii0, ir0)) "Terminal current angle (deg.)";
  Real P(start=P_0/S_b) "Active power (p.u. on S_b)";
  Real Q(start=Q_0/S_b) "Reactive power (p.u. on S_b)";
  Real Te "Electrical torque (pu)";
  Real id "d-axis armature current (pu)";
  Real iq "q-axis armature current (pu)";
  Real ud "d-axis terminal voltage (pu)";
  Real uq "q-axis terminal voltage (pu)";
protected
  parameter Real w_b=2*pi*fn "System base speed (rad/s)";
  parameter Real anglev_rad=angle_0*pi/180
    "initial value of bus voltage angle in rad";
  parameter Real CoB=M_b/S_b;
  parameter Real vr0=V_0*cos(anglev_rad)
    "Real component of initial terminal voltage";
  parameter Real vi0=V_0*sin(anglev_rad)
    "Imaginary component of intitial terminal voltage";
  parameter Real ir0=-CoB*(p0*vr0 + q0*vi0)/(vr0^2 + vi0^2)
    "Real component of initial armature current, systembase";
  parameter Real ii0=-CoB*(p0*vi0 - q0*vr0)/(vr0^2 + vi0^2)
    "Imaginary component of initial armature current, systembase";
  parameter Real p0=P_0/M_b "initial active power generation in pu machinebase";
  parameter Real q0=Q_0/M_b
    "initial reactive power generation in pu machinebase";
equation
  //Interfacing outputs with the internal variables
  ANGLE = delta;
  SPEED = w;
  ETERM = Vt;
  PELEC = P/CoB;
  [p.ir; p.ii] = -CoB*[sin(delta), cos(delta); -cos(delta), sin(delta)]*[id; iq];
  [p.vr; p.vi] = [sin(delta), cos(delta); -cos(delta), sin(delta)]*[ud; uq];
  -P = p.vr*p.ir + p.vi*p.ii;
  -Q = p.vi*p.ir - p.vr*p.ii;
  Vt = sqrt(p.vr^2 + p.vi^2);
  anglev = atan2(p.vi, p.vr);
  I = sqrt(p.ii^2 + p.ir^2);
  anglei = atan2(p.ii, p.ir);
  der(w) = ((PMECH - D*w)/(w + 1) - Te)/(2*H);
  der(delta) = w_b*w;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(extent={{-100,100},{100,-100}},
          lineColor={0,0,255}),Text(
          extent={{64,75},{92,65}},
          lineColor={0,0,255},
          lineThickness=0.5,
          textString="SPEED"),Text(
          extent={{60,-66},{92,-76}},
          lineColor={0,0,255},
          lineThickness=0.5,
          textString="ISORCE"),Text(
          extent={{64,-25},{92,-35}},
          lineColor={0,0,255},
          textString="ETERM"),Text(
          extent={{64,94},{92,84}},
          lineColor={0,0,255},
          lineThickness=0.5,
          textString="ANGLE"),Text(
          extent={{58,56},{92,46}},
          lineColor={0,0,255},
          lineThickness=0.5,
          textString="PMECH0"),Text(
          extent={{64,34},{92,24}},
          lineColor={0,0,255},
          lineThickness=0.5,
          textString="PELEC"),Text(
          extent={{72,-46},{92,-56}},
          lineColor={0,0,255},
          lineThickness=0.5,
          textString="EFD0"),Text(
          extent={{56,-86},{92,-96}},
          lineColor={0,0,255},
          lineThickness=0.5,
          textString="XADIFD0"),Text(
          extent={{-84,56},{-44,46}},
          lineColor={0,0,255},
          lineThickness=0.5,
          textString="PMECH0"),Text(
          extent={{-88,-46},{-58,-56}},
          lineColor={0,0,255},
          lineThickness=0.5,
          textString="EFD")}),
    Documentation);
end baseMachine;
