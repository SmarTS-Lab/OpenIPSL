within OpenIPSL.NonElectrical.Logical;
model Relay "Relay"
  Modelica.Blocks.Interfaces.RealInput u1 annotation (Placement(transformation(extent={{-61,20},{-41,40}}), iconTransformation(extent={{-60,20},{-40,40}})));
  Modelica.Blocks.Interfaces.RealInput u2 annotation (Placement(transformation(extent={{-61,-10},{-41,10}}), iconTransformation(extent={{-60,-10},{-40,10}})));
  Modelica.Blocks.Interfaces.RealInput u3 annotation (Placement(transformation(extent={{-61,-40},{-41,-20}}), iconTransformation(extent={{-60,-40},{-40,-20}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(extent={{39,-10},{59,10}}), iconTransformation(extent={{40,-8},{56,8}})));
equation
  y = if u1 > 0 then u2 else u3;
  annotation (
    Icon(coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=true), graphics={Rectangle(
          extent={{-40,40},{40,-40}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Line(
          points={{-28,0},{-8,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-28,-20},{-8,-20}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-12,-2},{4,-12},{24,-12}},
          color={0,0,255},
          smooth=Smooth.None),Ellipse(extent={{-8,2},{-4,-2}}, lineColor={0,0,255}),Ellipse(extent={{-8,-18},{-4,-22}}, lineColor={0,0,255}),Rectangle(
          extent={{-12,36},{12,24}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Line(points={{-12,30},{-28,30}}, color={0,0,255}),Line(points={{28,30},{12,30}}, color={0,0,255}),Line(
          points={{0,24},{0,-10}},
          color={0,0,255},
          pattern=LinePattern.Dash),Text(
          extent={{-110,58},{110,42}},
          lineColor={0,0,255},
          textString="%name")}),
    Diagram(coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=true)),
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
end Relay;
