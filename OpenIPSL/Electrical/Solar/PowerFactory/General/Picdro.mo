within OpenIPSL.Electrical.Solar.PowerFactory.General;

model Picdro "Pick-up drop-off implementation for protection functions"
  parameter SI.Time Tpick "Pick-up time delay";
  parameter SI.Time Tdrop "Drop-off time delay";
  Modelica.Blocks.Interfaces.BooleanInput condition annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.BooleanOutput trip annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Timer timer annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold = Tpick + 1e-8)  annotation(
    Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.RSFlipFlop rSFlipFlop annotation(
    Placement(visible = true, transformation(origin = {70, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Timer timer1 annotation(
    Placement(visible = true, transformation(origin = {-10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold1(threshold = Tdrop + 1e-8) annotation(
    Placement(visible = true, transformation(origin = {30, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Not not1 annotation(
    Placement(visible = true, transformation(origin = {-50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(condition, timer.u) annotation(
    Line(points = {{-100, 0}, {-44, 0}, {-44, 0}, {-42, 0}}, color = {255, 0, 255}));
  connect(greaterThreshold.u, timer.y) annotation(
    Line(points = {{-2, 0}, {-18, 0}}, color = {0, 0, 127}));
  connect(rSFlipFlop.Q, trip) annotation(
    Line(points = {{82, 0}, {102, 0}, {102, 0}, {110, 0}}, color = {255, 0, 255}));
  connect(greaterThreshold.y, rSFlipFlop.S) annotation(
    Line(points = {{21, 0}, {58, 0}}, color = {255, 0, 255}));
  connect(timer1.y, greaterThreshold1.u) annotation(
    Line(points = {{1, -70}, {18, -70}}, color = {0, 0, 127}));
  connect(not1.y, timer1.u) annotation(
    Line(points = {{-50, -61}, {-50, -61}, {-50, -71}, {-22, -71}, {-22, -71}}, color = {255, 0, 255}));
  connect(greaterThreshold1.y, rSFlipFlop.R) annotation(
    Line(points = {{42, -70}, {48, -70}, {48, -12}, {58, -12}, {58, -12}}, color = {255, 0, 255}));
  connect(not1.u, greaterThreshold.y) annotation(
    Line(points = {{-50, -38}, {-50, -38}, {-50, -20}, {40, -20}, {40, 0}, {22, 0}, {22, 0}}, color = {255, 0, 255}));

annotation(
    Icon(graphics = {Rectangle(origin = {0, 0.04}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 99.96}, {100, -99.96}}), Text(origin = {-10, 70}, extent = {{-110, 10}, {110, -10}}, textString = "picdro")}),
    Documentation(info="<html>
<p>
This function implements a logical pick-up-drop-off function commonly used when designingprotection schemes (e.g. fault detection, signal out-of-range, etc.).</p>
</html>", revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Model Name</p></td>
<td><p>pickdro function</p></td>
</tr>
<tr>
<td><p>Reference</p></td>
<td><p>PowerFactory Manual</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>January 2021</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Tin Rabuzin, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
<tr>
<td><p>Model Verification</p></td>
<td><p>This model has not been verified against PowerFactory.</p></td>
</tr>
<tr>
<td><p>Description</p></td>
<td><p>See the PF manual for a detailed description. NOTE: a small constant has been added to pick-up drop-off delay to avoid numerical issues when they are set to 0 by user.</p></td>
</tr>
</table>
</html>") );
end Picdro;
