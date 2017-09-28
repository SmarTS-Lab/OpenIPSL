within OpenIPSL.Electrical.Controls.PSAT.AVR;
model AVRTypeII "PSAT AVR Type 2"
  import Modelica.Constants.e;
  Modelica.Blocks.Interfaces.RealInput v "Generator termminal voltage (pu)"
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}}),
        iconTransformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Interfaces.RealOutput vf "Filed voltage (pu)" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={110,-10}), iconTransformation(extent={{100,-20},{140,20}})));
  Modelica.Blocks.Interfaces.RealInput vref
    "Reference generator terminal voltage (pu)" annotation (Placement(
        transformation(extent={{-140,40},{-100,80}}), iconTransformation(extent
          ={{-140,40},{-100,80}})));
  parameter Real vrmin "Minimum regulator voltage (pu)";
  parameter Real vrmax "Maximum regulator voltage (p.u..)";
  parameter Real Ka "Amplifier gain (p.u/p.u)";
  parameter Real Ta "Amplifier time constant (s)";
  parameter Real Kf "Stabilizer gain (p.u/p.u)";
  parameter Real Tf "Stabilizer time constant (s)";
  parameter Real Ke "Field circuit integral deviation (p.u/p.u)";
  parameter Real Te "Field circuit time constant (s)";
  parameter Real Tr "Measurement time constant (s)";
  parameter Real Ae=0.0006 "1st ceiling coefficient";
  parameter Real Be=0.9 "2nd ceiling coefficient";
  parameter Real v0=1 "Initialization";

  Real Se "Saturated field voltage (pu)";
  Real vm(start=vm0, fixed=true);
protected
  parameter Real vf00(fixed=false) "Initialization";
  parameter Real Ce0=Ke*vf00 + Ae*e^(Be*abs(vf00));
  parameter Real vref00=Ce0/Ka + v0 "Initialization";
  parameter Real vm0=v0 "Initialization";
  parameter Real vr10=Ka*(vref00 - vm0 - vr20 - vf00*Kf/Tf) "Initialization";
  parameter Real vr20=-vf00*Kf/Tf "Initialization";
  Real vr2(start=vr20, fixed=true);
  NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=Ka,
    T=Ta,
    y_start=vr10,
    outMax=vrmax,
    outMin=vrmin)
    annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
public
  Modelica.Blocks.Interfaces.RealOutput vref0 "Voltage reference at t=0 (pu)"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,110}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,120})));
  Modelica.Blocks.Interfaces.RealInput vf0
    "Reference generator terminal voltage (pu)" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-112}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120})));
initial algorithm
  vf00 := vf0;
algorithm
  vref0 := vref00;
equation
  der(vm) = (v - vm)/Tr;
  der(vr2) = -(vf*Kf/Tf + vr2)/Tf;
  simpleLagLim.u = vref - vm - vr2 - vf*Kf/Tf;
  der(vf) = -(vf*(Ke + Se) - simpleLagLim.y)/Te;
  Se = Ae*e^(Be*abs(vf));
  annotation (
    Diagram(coordinateSystem(
        extent={{-100,-100},{100,100}},
        initialScale=0.1,
        preserveAspectRatio=false)),
    Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        initialScale=0.1,
        preserveAspectRatio=false), graphics={
        Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255}),
        Text(
          extent={{-90,80},{-50,40}},
          lineColor={0,0,255},
          textString="vref"),
        Text(
          extent={{-100,-40},{-60,-70}},
          lineColor={0,0,255},
          textString="v"),
        Text(
          extent={{60,20},{100,-20}},
          lineColor={0,0,255},
          textString="vf"),
        Text(
          extent={{-40,40},{40,-40}},
          lineColor={0,0,255},
          textString="AVR2"),
        Text(
          extent={{16,-60},{56,-100}},
          lineColor={0,0,255},
          textString="vf0
"),
        Text(
          extent={{2,102},{42,62}},
          lineColor={0,0,255},
          textString="vref0")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>AVR Type II, PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>September 2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));

end AVRTypeII;
