within iPSL.NonElectrical.Functions;
model ImSE_exp "Block for Saturation function of Exc "
  Modelica.Blocks.Interfaces.RealInput VE_IN "Unsaturated Input" annotation (Placement(transformation(extent={{-140,-20},{-130,-10}}), iconTransformation(extent={{-120,-10},{-100,10}})));
  Modelica.Blocks.Interfaces.RealOutput VE_OUT "Saturated Output" annotation (Placement(transformation(extent={{100,-2},{110,8}}), iconTransformation(extent={{100,-6},{112,6}})));
  parameter Real SE1 "Saturation at E1";
  parameter Real SE2 "Saturation at E2";
  parameter Real E1;
  parameter Real E2;
equation
  VE_OUT = iPSL.NonElectrical.Functions.SE_exp(
    VE_IN,
    SE1,
    SE2,
    E1,
    E2);
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-60},{100,60}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-60},{100,60}}), graphics={Ellipse(
          extent={{-100,60},{100,-60}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-88,38},{82,-42}},
          lineColor={0,0,255},
          textString="SE(Efd)")}),
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
end ImSE_exp;
