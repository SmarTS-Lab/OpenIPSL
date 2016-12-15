within OpenIPSL.Electrical.Machines.PSSE;
model GENCLS
  import Modelica.Constants.pi;
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  OpenIPSL.Connectors.PwPin p(
    vr(start=vr0),
    vi(start=vi0),
    ir(start=ir0),
    ii(start=ii0)) annotation (Placement(
      visible=true,
      transformation(
        origin={2.2777,10.4683},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0),
      iconTransformation(
        origin={110.0,-1.5036},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));

  parameter Real M_b "Machine base power rating (MVA)" annotation (Dialog(group="Power flow data"));
  parameter Real H = 0 "Inertia constant (s)" annotation (Dialog(group="Machine parameters"));
  parameter Real D = 0 "Damping coefficient" annotation (Dialog(group="Machine parameters"));
  parameter Real R_a = 0 "Amature resistance (pu)" annotation (Dialog(group="Machine parameters"));
  parameter Real X_d = 0.2 "d-axis transient reactance (pu)" annotation (Dialog(group="Machine parameters"));

  Real delta(start=delta0, fixed=true) "Rotor angle (deg)";
  Real omega(start=0, fixed=true) "Rotor speed (pu)";
  Real V(start=V_0) "Bus voltage magnitude (pu)";
  Real anglev(start=anglev_rad) "Bus voltage angle (rad)";
  Real eq(start=vf0, fixed=true) "Constant emf behind transient reactance (pu)";
  Real vd(start=vd0) "d-axis voltage (pu)";
  Real vq(start=vq0) "q-axis voltage (pu)";
  Real id(start=id0) "d-axis current (pu)";
  Real iq(start=iq0) "q-axis current (pu)";
  Real P(start=P_0/S_b) "Active power (pu. of S_b)";
  Real Q(start=Q_0/S_b) "Reactive power (pu of S_b)";


protected
  parameter Real CoB=M_b/S_b "Change from system to machine base";
  parameter Real anglev_rad=angle_0*pi/180 "Initial bus voltage angle (rad)";
  parameter Real p0=P_0/M_b "Initial active power (pu on M_b)";
  parameter Real q0=Q_0/M_b "Initial reactive power in (pu on M_b)";

  parameter Real vr0=V_0*cos(anglev_rad);
  parameter Real vi0=V_0*sin(anglev_rad);
  parameter Real ir0=(p0*vr0 + q0*vi0)/(vr0^2 + vi0^2);
  parameter Real ii0=(p0*vi0 - q0*vr0)/(vr0^2 + vi0^2);

  parameter Real delta0=atan2(vi0 + R_a*ii0 + X_d*ir0, vr0 + R_a*ir0 - X_d*ii0);

  parameter Real vd0=vr0*cos(pi/2 - delta0) - vi0*sin(pi/2 - delta0);
  parameter Real vq0=vr0*sin(pi/2 - delta0) + vi0*cos(pi/2 - delta0);
  parameter Real id0=ir0*cos(pi/2 - delta0) - ii0*sin(pi/2 - delta0);
  parameter Real iq0=ir0*sin(pi/2 - delta0) + ii0*cos(pi/2 - delta0);

  parameter Real vf0=vq0 + R_a*iq0 + X_d*id0;
equation

  //Swing equation
  //der(delta) = omega*2*pi*50;
  //der(omega) = (P_0/S_b - P - D*omega)/(2*H);
  // Swing equation was ommited becase it causes derivative by zero in examples
  // where the inertia constant is zero (in PSS/E setting to zero is equivalent
  // to removing the swing equation

  der(delta) = 0;
  omega = 0;

  // d-q voltage and current equations
  der(eq) = 0 "Classical model assumes constant emf";
  vq = eq - R_a*iq - X_d*id "q-axis voltage equation";
  vd = X_d*iq - R_a*id "d-axis voltage equation";

  // Park's transformation
  [p.ir; p.ii] = -CoB*[sin(delta), cos(delta); -cos(delta), sin(delta)]*[id; iq];
  [p.vr; p.vi] = [sin(delta), cos(delta); -cos(delta), sin(delta)]*[vd; vq];

  //Power injections
  -P = p.vr*p.ir + p.vi*p.ii;
  -Q = p.vi*p.ir - p.vr*p.ii;

  // Terminal voltage magnitude and angle
  V = sqrt(p.vr^2 + p.vi^2);
  anglev = atan2(p.vi, p.vr);


  annotation (
    Icon(coordinateSystem(
        extent={{0,-100},{100,100}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={10,10}), graphics={Rectangle(
          extent={{80,100},{100,-100}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          fillColor={0,0,255}),Line(
          points={{40,110},{80,90},{90,90}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{40,-70},{80,-90},{90,-90}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{40,70},{80,50},{90,50}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{40,50},{80,30},{90,30}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{40,30},{80,10},{90,10}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{40,10},{80,-10},{90,-10}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{40,-10},{80,-30},{90,-30}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{40,90},{80,70},{90,70}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{40,-30},{80,-50},{90,-50}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{40,-50},{80,-70},{90,-70}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),Text(
          extent={{50,150},{100,110}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textStyle={TextStyle.Bold},
          textString="INF")}),
    Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={5,5})),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSS/E Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>Unknown</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Mengjia Zhang,SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>", revisions="<html>
<!--DISCLAIMER-->
<p>OpenIPSL:</p>
<p>Copyright 2016 SmarTS Lab (Sweden)</p>
<ul>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>

<p></p>
<p>iPSL:</p>
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>
"));
end GENCLS;

