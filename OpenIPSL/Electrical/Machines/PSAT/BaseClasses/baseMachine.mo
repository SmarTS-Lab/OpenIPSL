within OpenIPSL.Electrical.Machines.PSAT.BaseClasses;
partial model baseMachine
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  import Modelica.Constants.pi;
  parameter Real Sn "Power rating (MVA)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real Vn "Voltage rating (kV)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real ra "Armature resistance (pu)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real xd1 "d-axis transient reactance (pu)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real M "Machanical starting time (2H), kWs/kVA"
    annotation (Dialog(group="Machine parameters"));
  parameter Real D "Damping coefficient"
    annotation (Dialog(group="Machine parameters"));
  //Initialization
  //Initialization of currents and voltages
  OpenIPSL.Interfaces.PwPin p(
    vr(start=vr0),
    vi(start=vi0),
    ir(start=ir0),
    ii(start=ii0)) annotation (Placement(visible=true, transformation(
        origin={100,0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput delta "Rotor angle (deg)" annotation (
      Placement(visible=true, transformation(
        origin={110,60},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput w(start=1) "Rotor speed (pu)"
    annotation (Placement(visible=true, transformation(
        origin={110,90},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput v(start=V_0, fixed=true)
    "Generator terminal voltage (pu)" annotation (Placement(visible=true,
        transformation(
        origin={110,30},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput P(start=P_0/S_b) "Active power (pu)"
    annotation (Placement(visible=true, transformation(
        origin={110,-30},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput Q(start=Q_0/S_b) "Reactive power (pu)"
    annotation (Placement(visible=true, transformation(
        origin={110,-70},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput vf "Field voltage (pu)" annotation (
      Placement(visible=true, transformation(
        origin={-120,50},
        extent={{-20,-20},{20,20}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput vf0 "Initial field voltage (pu)"
    annotation (Placement(visible=true, transformation(
        origin={-80,110},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Blocks.Interfaces.RealOutput pm0 "Initial mechanical power (pu)"
    annotation (Placement(visible=true, transformation(
        origin={-80,-110},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Blocks.Interfaces.RealInput pm "Mechanical power (pu)" annotation (
      Placement(visible=true, transformation(
        origin={-120,-50},
        extent={{-20,-20},{20,20}},
        rotation=0)));
  Real anglev(start=angle_0/180*pi) " Bus voltage angle";
  Real vd "d-axis voltage (pu)";
  Real vq "q-axis voltage (pu)";
  Real id "d-axis currrent (pu)";
  Real iq "q-axis current (pu)";
protected
  parameter Real vr0=V_0*cos(angle_0/180*pi) "Initialitation";
  parameter Real vi0=V_0*sin(angle_0/180*pi) "Initialitation";
  parameter Real ir0=(P_0/S_b*vr0 + Q_0/S_b*vi0)/(vr0^2 + vi0^2)
    "Initialitation";
  parameter Real ii0=(P_0/S_b*vi0 - Q_0/S_b*vr0)/(vr0^2 + vi0^2)
    "Initialitation";
  //Change of base constants
  parameter Real CoB=S_b*Vn/(Sn*V_b);
  parameter Real CoB2=S_b/Sn;
  parameter Real m=M/CoB2 "Mechanical starting time (2H), kWs/kVA";
  parameter Real d=D/CoB2 "Damping coefficient";
  parameter Real Ra=ra*CoB "armature resistance, p.u.";
  parameter Real x1d=xd1*CoB "d-axis transient reactance, p.u.";
  parameter Real w_b=2*pi*fn "Base frequency in rad/s";
protected
  Real pe;
initial equation
  w = 1;
equation
  v = sqrt(p.vr^2 + p.vi^2);
  anglev = atan2(p.vi, p.vr);
  der(delta) = w_b*(w - 1);
  der(w) = (pm - pe - d*(w - 1))/m;
  [p.ir; p.ii] = -[sin(delta), cos(delta); -cos(delta), sin(delta)]*[id; iq];
  [p.vr; p.vi] = [sin(delta), cos(delta); -cos(delta), sin(delta)]*[vd; vq];
  // -P = p.vr * p.ir + p.vi * p.ii;
  // -Q = p.vi * p.ir - p.vr * p.ii;
  P = vd*id + vq*iq;
  Q = vq*id - vd*iq;
  pe = (vq + Ra*iq)*iq + (vd + Ra*id)*id;
  annotation (Icon(coordinateSystem(extent={{-100,-100},{100,100}},
          initialScale=0.1), graphics={Text(
          origin={-80,50},
          extent={{-10,-10},{10,10}},
          lineColor={28,108,200},
          textString="vf"),Text(
          origin={-80,-50},
          extent={{-10,-10},{10,10}},
          lineColor={28,108,200},
          textString="pm"),Text(
          origin={-80,90},
          extent={{-10,-10},{10,10}},
          lineColor={28,108,200},
          textString="vf0"),Text(
          origin={-80,-90},
          extent={{-10,-10},{10,10}},
          lineColor={28,108,200},
          textString="pm0"),Text(
          origin={85,60},
          extent={{-15,-10},{15,10}},
          lineColor={28,108,200},
          textString="delta"),Text(
          origin={90,90},
          extent={{-10,-10},{10,10}},
          lineColor={28,108,200},
          textString="w"),Text(
          origin={90,30},
          extent={{-10,-10},{10,10}},
          lineColor={28,108,200},
          textString="v"),Rectangle(
          fillColor={255,255,255},
          extent={{-100,-100},{100,100}},
          lineColor={28,108,200}),Ellipse(extent={{-40,40},{40,-40}}, lineColor
          ={28,108,200}),Line(
          points={{-20,0},{-9,15},{9,-15},{20,0}},
          color={28,108,200},
          smooth=Smooth.Bezier),Text(
          origin={0,-60},
          extent={{-60,-20},{60,20}},
          lineColor={28,108,200},
          textString="%name"),Text(
          origin={90,-31},
          extent={{-10,-10},{10,10}},
          lineColor={28,108,200},
          textString="P"),Text(
          origin={90,-70},
          extent={{-10,-10},{10,10}},
          lineColor={28,108,200},
          textString="Q")}), Documentation);
end baseMachine;
