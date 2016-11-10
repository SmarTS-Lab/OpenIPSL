within OpenIPSL.Electrical.Controls.CGMES;

package TG
class GovHydroIEEE0 "IEEE Simplified Hydro Governor-Turbine Model"
  parameter Real k "Governor gain";
  parameter Real mwbase;
  parameter Real pmax "Gate maximum";
  parameter Real pmin "Gate minimum";
  parameter Real t1=0.25 "Governor lag time constant";
  parameter Real t2=0 "Governor lead time constant";
  parameter Real t3=0.1 "Gate actuator time constant";
  parameter Real t4 "water start time";
  parameter Real P0 "Power reference of the governor";
  OpenIPSL.NonElectrical.Continuous.SimpleLag simpleLag1(K = k, T = t1, y_start = P0) annotation(Placement(visible = true, transformation(origin = {-56, -8.88178e-16}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  OpenIPSL.NonElectrical.Continuous.LeadLag leadLag1(K = 1, T1 = t2, T2 = t3, y_start = 0) annotation(Placement(visible = true, transformation(origin = {-26, -8.88178e-16}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput SPEED annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-193, 1}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput PMECH annotation(Placement(visible = true, transformation(origin = {114, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {210, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k2 = -1) annotation(Placement(visible = true, transformation(origin = {8, 4}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = pmax, uMin = pmin) annotation(Placement(visible = true, transformation(origin = {48, -1.9984e-15}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferFunction1(a = {0.5 * t4, 1}, b = {-t4, 1}) annotation(Placement(visible = true, transformation(origin = {84, -8.88178e-16}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput PMECH0 annotation(Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-193, 99}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
equation
  connect(simpleLag1.y, leadLag1.u) annotation(Line(points = {{-47.2, -8.88178e-16}, {-36.2, -8.88178e-16}}, color = {0, 0, 127}));
  connect(leadLag1.y, add1.u2) annotation(Line(points = {{-17, 0}, {-2.2, 0}, {-2.2, -1}}, color = {0, 0, 127}));
  connect(SPEED, simpleLag1.u) annotation(Line(points = {{-100, 0}, {-66, 0}}, color = {0, 0, 127}));
  connect(PMECH0, add1.u1) annotation(Line(points = {{-100, 40}, {-8, 40}, {-8, 8}, {-2, 8}}, color = {0, 0, 127}));
  connect(limiter1.y, transferFunction1.u) annotation(Line(points = {{56.8, -1.9984e-15}, {74.8, -1.9984e-15}, {74.8, -1.9984e-15}, {74.8, -1.9984e-15}}, color = {0, 0, 127}));
  connect(transferFunction1.y, PMECH) annotation(Line(points = {{93, 0}, {114, 0}}, color = {0, 0, 127}));
  connect(add1.y, limiter1.u) annotation(Line(points = {{16.8, 4}, {26.8, 4}, {26.8, 0}, {37.8, 0}}, color = {0, 0, 127}));
  annotation( Diagram(coordinateSystem(extent = {{-200, -200}, {200, 160}}, initialScale = 0.1, preserveAspectRatio = false)), Icon(coordinateSystem(extent = {{-200, -200}, {200, 160}}, initialScale = 0.1), graphics = {Text(lineColor = {28, 108, 200}, extent = {{-100, 160}, {100, 100}}, textString = "GovHydroIEEE0", fontName = "Helvetica"), Rectangle(origin = {1, -20}, lineColor = {0, 64,128}, fillColor = {255, 255, 255}, extent = {{-201, 180}, {199, -80}}), Text(origin = {-8, -107}, lineColor = {0, 64, 128}, extent = {{-188, 100}, {-106, 80}}, textString = "SPEED", fontName = "Helvetica"), Text(origin = {0, -10}, lineColor = {0, 64,128}, extent = {{-188, 100}, {-106, 80}}, textString = "PMECH0", fontName = "Helvetica"), Text(origin = {304, -91}, lineColor = {0, 64, 128}, extent = {{-188, 100}, {-106, 80}}, textString = "PMECH", fontName = "Helvetica")}), Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>CGMES 2.5</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>21/09/2016</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Francisco Gómez,SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end GovHydroIEEE0;
end TG;