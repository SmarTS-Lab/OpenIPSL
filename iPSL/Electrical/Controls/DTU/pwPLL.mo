within iPSL.Electrical.Controls.DTU;
model pwPLL "Developed by DTU"
  iPSL.Connectors.PwPin pwPin annotation (Placement(transformation(extent={{-60,-6},{-48,6}}), iconTransformation(extent={{-60,-6},{-48,6}})));
  Modelica.Blocks.Interfaces.RealOutput imPin annotation (Placement(transformation(extent={{48,-6},{60,6}}), iconTransformation(extent={{45,-6},{59,6}})));
  iPSL.Electrical.Sensors.PwVoltage pwVoltage annotation (Placement(transformation(extent={{-44,-10},{-24,10}})));
  Modelica.Blocks.Math.Atan2 atan2_1 annotation (Placement(transformation(extent={{-4,-10},{16,10}})));
equation
  connect(pwVoltage.p, pwPin) annotation (Line(
      points={{-39,0},{-54,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwVoltage.vr, atan2_1.u2) annotation (Line(points={{-29.1,3},{-18,3},{-18,-6},{-6,-6}}, color={0,0,127}));
  connect(pwVoltage.vi, atan2_1.u1) annotation (Line(points={{-29.1,0},{-16,0},{-16,6},{-6,6}}, color={0,0,127}));
  connect(atan2_1.y, imPin) annotation (Line(points={{17,0},{54,0},{54,0}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Rectangle(
          extent={{-48,50},{46,-50}},
          lineColor={0,0,255},
          lineThickness=0.5),Text(
          extent={{-28,22},{34,-22}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillPattern=FillPattern.Solid,
          textString="PLL")}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
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
end pwPLL;
