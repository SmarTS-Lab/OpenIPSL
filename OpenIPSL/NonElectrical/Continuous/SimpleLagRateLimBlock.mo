within OpenIPSL.NonElectrical.Continuous;
block SimpleLagRateLimBlock "First order lag transfer function block with a non windup limiter, rate limits and blocking input"
  extends Modelica.Blocks.Interfaces.SISO(y(start=y_start));
  parameter Real K "Gain" annotation (Evaluate=false);
  parameter Modelica.SIunits.Time T "Lag time constant" annotation (Evaluate=false);
  parameter Real y_start "Output start value" annotation (Dialog(group="Initialization"));
  parameter Real outMax "Maximum output value" annotation (Evaluate=false);
  parameter Real outMin "Minimum output value" annotation (Evaluate=false);
  parameter Real rmin "Minimum rate limit" annotation (Evaluate=false);
  parameter Real rmax "Maximum rate limit" annotation (Evaluate=false);
  Real x;
  Real rate;
  Modelica.Blocks.Interfaces.RealInput Block annotation (Placement(transformation(extent={{-140,60},{-100,100}}), iconTransformation(extent={{-140,60},{-100,100}})));
initial equation
  y = y_start;
equation
  assert(
    T >= 1e-10,
    "Time constant must be greater than 0",
    AssertionLevel.error);
  assert(
    outMax > outMin,
    "Upper limit must be greater than lower limit",
    AssertionLevel.error);
  rate = if u > outMax then (outMax - x)/T elseif u < outMin then (outMin - x)/T else (u - x)/T;
  if Block > 0 then
    der(x) = 0;
  else
    der(x) = if rate > rmax then rmax elseif rate < rmin then rmin else rate;
  end if;
  y = if x > outMax then outMax elseif x < outMin then outMin else x;
  annotation (
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>IEEE Std. 421.5-2005, Annex E</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-11-25</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Tin Rabuzin,SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>

</html>", revisions="<html>
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
</html>"),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Line(points={{40,100},{60,140},{100,140}}, color={0,0,0}),Text(
          extent={{-20,68},{20,8}},
          lineColor={0,0,255},
          textString="K"),Line(
          points={{-80,0},{78,0}},
          color={0,0,255},
          smooth=Smooth.Bezier,
          thickness=0.5),Text(
          extent={{-70,-20},{70,-80}},
          lineColor={0,0,255},
          textString="1 + Ts"),Line(points={{-100,-140},{-60,-140},{-40,-100}}, color={0,0,0}),Ellipse(
          extent={{-82,86},{-96,72}},
          lineColor={255,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),Rectangle(
          extent={{-94,80},{-84,78}},
          lineColor={255,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}),
    Diagram);
end SimpleLagRateLimBlock;
