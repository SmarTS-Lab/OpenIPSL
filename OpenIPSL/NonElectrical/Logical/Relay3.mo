within OpenIPSL.NonElectrical.Logical;


model Relay3 "input dependent output"
  input Modelica.Blocks.Interfaces.RealInput u1 annotation (Placement(transformation(extent={{-54,-40},{-41,-26}}), iconTransformation(extent={{-56,-38},{-40,-22}})));
  input Modelica.Blocks.Interfaces.RealInput u2 annotation (Placement(transformation(extent={{-54,26},{-41,40}}), iconTransformation(extent={{-56,22},{-40,38}})));
  input Modelica.Blocks.Interfaces.RealInput u3 annotation (Placement(transformation(extent={{-54,4},{-41,18}}), iconTransformation(extent={{-56,2},{-40,18}})));
  output Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(extent={{41,-8},{61,12}}), iconTransformation(extent={{40,-6},{52,6}})));
  parameter Real Vov=0.5;
  input Modelica.Blocks.Interfaces.RealInput u4 annotation (Placement(transformation(extent={{-54,-16},{-40,-2}}), iconTransformation(extent={{-56,-18},{-40,-2}})));
equation
  y = if u1 > Vov then u3 elseif u1 < (-Vov) then u4 else u2;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-40,-40},{40,40}}), graphics={Rectangle(extent={{-40,40},{40,-40}}, lineColor={0,0,255}),Line(
          points={{-34,30},{-14,30}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-34,10},{-14,10}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-12,14},{14,10},{34,10}},
          color={0,0,255},
          smooth=Smooth.None),Ellipse(extent={{-14,32},{-10,28}}, lineColor={0,0,255}),Ellipse(extent={{-14,12},{-10,8}}, lineColor={0,0,255}),Line(
          points={{-34,-10},{-14,-10}},
          color={0,0,255},
          smooth=Smooth.None),Ellipse(extent={{-14,-8},{-10,-12}}, lineColor={0,0,255}),Rectangle(
          extent={{-12,-24},{12,-36}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Line(points={{-12,-30},{-28,-30}}, color={0,0,255}),Line(points={{28,-30},{12,-30}}, color={0,0,255}),Line(
          points={{0,12},{0,-24}},
          color={0,0,255},
          pattern=LinePattern.Dash)}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-40,-40},{40,40}}), graphics),
    Documentation(revisions="<html>
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
end Relay3;
