within OpenIPSL.NonElectrical.Continuous;
block SimpleLagLim "First order lag transfer function block with a non windup limiter"
  extends Modelica.Blocks.Interfaces.SISO(y(start=y_start));
  Modelica.Blocks.Sources.RealExpression const(y=T) annotation (Placement(transformation(extent={{-58,32},{-38,52}})));
  Real state;
  parameter Real K "Gain";
  parameter Modelica.SIunits.Time T "Lag time constant";
  parameter Real y_start "Output start value";
  parameter Real outMax "Maximum output value";
  parameter Real outMin "Minimum output value";
protected
  parameter Real T_mod=if T < Modelica.Constants.eps then 1000 else T;
initial equation
  state = y_start;
equation
  T_mod*der(state) = K*u - state;
  when state > outMax and K*u - state < 0 then
    reinit(state, outMax);
  elsewhen state < outMin and K*u - state > 0 then
    reinit(state, outMin);
  end when;
  if abs(const.y) <= Modelica.Constants.eps then
    y = max(min(u*K, outMax), outMin);
  else
    y = max(min(state, outMax), outMin);
  end if;
  annotation (Documentation(info="<html>
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
"), Icon(graphics={Line(points={{40,100},{60,140},{100,140}}, color={0,0,0}),Text(
          extent={{-20,68},{20,8}},
          lineColor={0,0,255},
          textString="K"),Line(
          points={{-80,0},{78,0}},
          color={0,0,255},
          smooth=Smooth.Bezier,
          thickness=0.5),Text(
          extent={{-70,-20},{70,-80}},
          lineColor={0,0,255},
          textString="1 + Ts"),Line(points={{-100,-140},{-60,-140},{-40,-100}}, color={0,0,0})}));
end SimpleLagLim;
