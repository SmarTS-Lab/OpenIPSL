within OpenIPSL.Electrical.Machines.PSAT.BaseClasses;
partial model baseMachine
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  import Modelica.Constants.pi;
  import SI = Modelica.SIunits;
  import CM = Modelica.ComplexMath;
  import Complex;
  parameter Real Sn "Power rating (MVA)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real Vn "Voltage rating (kV)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real ra "Armature resistance (pu)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real x1d "d-axis transient reactance (pu)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real M "Mechanical starting time (2H), kWs/kVA"
    annotation (Dialog(group="Machine parameters"));
  parameter Real D "Damping coefficient"
    annotation (Dialog(group="Machine parameters"));

  OpenIPSL.Interfaces.PwPin p(
    vr(start=vr0),
    vi(start=vi0),
    ir(start=ir0),
    ii(start=ii0)) annotation (Placement(visible=true, transformation(
        origin={100,0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput delta(
    start=delta0,
    quantity="Angle",
    unit="rad",
    displayUnit="rad") "Rotor angle (rad)" annotation (Placement(visible=true,
        transformation(
        origin={110,60},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput w(start=1) "Rotor speed (pu)"
    annotation (Placement(visible=true, transformation(
        origin={110,90},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput v(start=V_0)
    "Generator terminal voltage (pu)" annotation (Placement(visible=true,
        transformation(
        origin={110,30},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput P(start=p0) "Active power (pu)"
    annotation (Placement(visible=true, transformation(
        origin={110,-30},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput Q(start=q0) "Reactive power (pu)"
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
  Modelica.Blocks.Interfaces.RealOutput pm0(start=pm00)
    "Initial mechanical power (pu)" annotation (Placement(visible=true,
        transformation(
        origin={-80,-110},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Blocks.Interfaces.RealInput pm(start=pm00) "Mechanical power (pu)"
    annotation (Placement(visible=true, transformation(
        origin={-120,-50},
        extent={{-20,-20},{20,20}},
        rotation=0)));
  SI.Angle anglev(start=SI.Conversions.from_deg(angle_0))
    " Bus voltage angle (rad)";
  Real vd(start=vd0) "d-axis voltage (pu)";
  Real vq(start=vq0) "q-axis voltage (pu)";
  Real id(start=id0) "d-axis currrent (pu)";
  Real iq(start=iq0) "q-axis current (pu)";
protected
  parameter Real w_b=2*pi*fn "Base frequency in rad/s";
  parameter Real CoB=Sn/S_b "From machine base to system base";

  // Initialize stator quantities (system base):
  //protected
  parameter Real p0=P_0/S_b
    "Initial active power generation in pu (system base)";
  parameter Real q0=Q_0/S_b
    "Initial reactive power generation in pu (system base)";
  parameter Complex Vt0=CM.fromPolar(V_0, SI.Conversions.from_deg(angle_0))
    "conj.";
  parameter Complex S0(re=p0, im=-q0) "conj.";
  parameter Complex I0=S0/(CM.conj(Vt0));
  parameter Real vr0=CM.real(Vt0) "Initialization (pu)";
  parameter Real vi0=CM.imag(Vt0) "Initialization (pu)";
  parameter Real ir0=-CM.real(I0) "Initialization (pu)";
  parameter Real ii0=-CM.imag(I0) "Initialization (pu)";

  // Initialize DQ-quantities (machine base)

  parameter Real xq0 "used for setting the initial rotor angle";
  parameter SI.Angle delta0=CM.arg(Vt0 + (ra + CM.j*xq0)*(I0/CoB))
    "Initial rotor angle";
  parameter Complex Vdq0=Vt0*CM.fromPolar(1, -delta0 + (pi/2));
  parameter Complex Idq0=I0/CoB*CM.fromPolar(1, -delta0 + (pi/2));
  parameter Real vd0=CM.real(Vdq0) "Initialization (pu, machine base)";
  parameter Real vq0=CM.imag(Vdq0) "Initialization (pu, machine base)";
  parameter Real id0=CM.real(Idq0) "Initialization (pu, machine base)";
  parameter Real iq0=CM.imag(Idq0) "Initialization (pu, machine base)";
  parameter Real pm00=(vq0 + ra*iq0)*iq0 + (vd0 + ra*id0)*id0
    "Initialization (pu, machine base";
initial equation
  w = 1;
  der(delta) = 0;
  delta = delta0;
equation
  v = sqrt(p.vr^2 + p.vi^2);
  anglev = atan2(p.vi, p.vr);
  der(delta) = w_b*(w - 1);
  if D > Modelica.Constants.eps then
    der(w) = ((pm - P)/CoB - D*(w - 1))/M;
  else
    der(w) = ((pm - P)/CoB)/M;
  end if;
  [p.ir; p.ii] = -CoB*[sin(delta), cos(delta); -cos(delta), sin(delta)]*[id; iq];
  [p.vr; p.vi] = [sin(delta), cos(delta); -cos(delta), sin(delta)]*[vd; vq];
  -P = p.vr*p.ir + p.vi*p.ii;
  -Q = p.vi*p.ir - p.vr*p.ii;
  pm0 = CoB*pm00 "pu, system base";
  annotation (
    Icon(coordinateSystem(extent={{-100,-100},{100,100}}, initialScale=0.1),
        graphics={
        Rectangle(
          fillColor={255,255,255},
          extent={{-100,-100},{100,100}},
          lineColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Text(
          origin={-80,50},
          extent={{-10,-10},{10,10}},
          lineColor={28,108,200},
          textString="vf"),
        Text(
          origin={-80,-50},
          extent={{-10,-10},{10,10}},
          lineColor={28,108,200},
          textString="pm"),
        Text(
          origin={-80,90},
          extent={{-10,-10},{10,10}},
          lineColor={28,108,200},
          textString="vf0"),
        Text(
          origin={-80,-90},
          extent={{-10,-10},{10,10}},
          lineColor={28,108,200},
          textString="pm0"),
        Text(
          origin={85,60},
          extent={{-15,-10},{15,10}},
          lineColor={28,108,200},
          textString="delta"),
        Text(
          origin={90,90},
          extent={{-10,-10},{10,10}},
          lineColor={28,108,200},
          textString="w"),
        Text(
          origin={90,30},
          extent={{-10,-10},{10,10}},
          lineColor={28,108,200},
          textString="v"),
        Ellipse(extent={{-40,40},{40,-40}}, lineColor={28,108,200}),
        Line(
          points={{-20,0},{-9,15},{9,-15},{20,0}},
          color={28,108,200},
          smooth=Smooth.Bezier),
        Text(
          origin={0,-60},
          extent={{-60,-20},{60,20}},
          lineColor={28,108,200},
          textString="%name"),
        Text(
          origin={90,-31},
          extent={{-10,-10},{10,10}},
          lineColor={28,108,200},
          textString="P"),
        Text(
          origin={90,-70},
          extent={{-10,-10},{10,10}},
          lineColor={28,108,200},
          textString="Q")}),
    Documentation,
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})));
end baseMachine;
