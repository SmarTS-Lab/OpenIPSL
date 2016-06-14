within iPSL.NonElectrical.Continuous;
block SimpleLagRateLimVar "First order lag transfer function block with a non windup limiter, rate limits, variable output limits and blocking input"
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Modelica.SIunits.Time T "Lag time constant" annotation (Evaluate=false);
  parameter Real y_start "Output start value" annotation (Dialog(group="Initialization"));
  parameter Real rmin "Minimum rate limit";
  parameter Real rmax "Maximum rate limit";
  Real rate "Rate";
  Real x;
  Modelica.Blocks.Interfaces.RealInput outMin
    annotation (Placement(transformation(extent={{-90,-6},{-50,34}}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-80,-140})));
  Modelica.Blocks.Interfaces.RealInput outMax
    annotation (Placement(transformation(extent={{98,106},{138,146}}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={80,140})));
initial equation
  x = y_start;
  y = y_start;
equation
  assert(
    T >= 1e-10,
    "Time constant must be greater than 0",
    AssertionLevel.error);
  rate = if u > outMax then (outMax - x)/T elseif u < outMin then (outMin - x)/T else (u - x)/T;
  der(x) = if rate > rmax then rmax elseif rate < rmin then rmin else rate;
  y = if x > outMax then outMax elseif x < outMin then outMin else x;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Line(points={{-100,-140},{-60,-140},{-40,-100}}, color={0,0,0}),Line(points={{40,100},{60,140},{100,140}},
          color={0,0,0}),Text(
          extent={{-20,68},{20,8}},
          lineColor={0,0,255},
          textString="K"),Line(
          points={{-80,0},{78,0}},
          color={0,0,255},
          smooth=Smooth.Bezier,
          thickness=0.5),Text(
          extent={{-70,-20},{70,-80}},
          lineColor={0,0,255},
          textString="1 + Ts"),Line(points={{-60,100},{-80,140},{-120,140}}, color={255,0,0}),Line(points={{120,-140},{80,-140},{60,-100}}, color={255,0,0})}),
    Documentation(revisions="<html>
<!--DISCLAIMER-->
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
</html>"));
end SimpleLagRateLimVar;
