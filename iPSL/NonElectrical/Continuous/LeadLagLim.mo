within iPSL.NonElectrical.Continuous;
block LeadLagLim "Lead-Lag filter with a non-windup limiter"
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Real K "Gain";
  parameter Modelica.SIunits.Time T1 "Lead time constant";
  parameter Modelica.SIunits.Time T2 "Lag time constant";
  parameter Real outMax "Maximum output value";
  parameter Real outMin "Minimum output value";
  parameter Real y_start "Output start value" annotation (Dialog(group="Initialization"));

protected
  Real x1(start=y_start);
  Real x2(start=y_start);
  parameter Modelica.SIunits.Time T2_dummy=if abs(T1 - T2) < Modelica.Constants.eps then 1000 else T2 "Lead time constant";
public
  Modelica.Blocks.Sources.RealExpression par1(y=T1) annotation (Placement(transformation(extent={{-80,54},{-60,74}})));
  Modelica.Blocks.Sources.RealExpression par2(y=T2) annotation (Placement(transformation(extent={{-80,34},{-60,54}})));
equation
  x1 + der(x1)*T2_dummy = u*K;
  x1 + T1/T2_dummy*(u*K - x1) = x2;
  when (y >= outMax) and der(x1) < 0 then
    reinit(x1, outMax);
  elsewhen (y <= outMin) and der(x1) > 0 then
    reinit(x1, outMin);
  end when;
  if (abs(par1.y - par2.y) < Modelica.Constants.eps) then
    y = max(min(K*u, outMax), outMin);
  else
    y = max(min(x2, outMax), outMin);
  end if;
  annotation (
    Icon(graphics={Line(points={{38,100},{58,140},{98,140}}, color={0,0,0}),Line(points={{-102,-140},{-62,-140},{-42,-100}}, color={0,0,0}),Text(
          extent={{-50,82},{70,22}},
          lineColor={0,0,255},
          textString="1+sT"),Text(
          extent={{56,44},{76,24}},
          lineColor={0,0,255},
          textString="1"),Line(
          points={{-52,0},{76,0}},
          color={0,0,255},
          smooth=Smooth.Bezier,
          thickness=0.5),Text(
          extent={{-50,-20},{70,-80}},
          lineColor={0,0,255},
          textString="1+sT"),Text(
          extent={{58,-58},{78,-78}},
          lineColor={0,0,255},
          textString="2"),Text(
          extent={{-106,28},{-46,-32}},
          lineColor={0,0,255},
          textString="K")}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Documentation(info="<html>

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
</html>"));
end LeadLagLim;
