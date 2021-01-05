within OpenIPSL.Electrical.Solar.PowerFactory.DigSILENT.Auxiliary;

model AtoPU
  Modelica.Blocks.Interfaces.RealOutput y0 annotation(
    Placement(transformation(origin = {155.0, -0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput yi annotation(
    Placement(transformation(origin = {-155.0, 0.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}), iconTransformation(origin = {-120.0, -0.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}})));
  parameter Types.ActivePower Pnen;
  parameter Types.Voltage UdcN;
equation
  y0 = yi / Pnen * 1 / UdcN;
  annotation(
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, grid = {10, 10}), graphics = {Text(origin = {1.9581, 1.6889}, fillPattern = FillPattern.Solid, extent = {{-31.9581, -31.6889}, {31.9581, 31.6889}}, textString = "A_to_pu", fontName = "Arial"), Rectangle(fillColor = {255, 255, 255}, extent = {{-100.0, -100.0}, {100.0, 100.0}})}),
    Diagram(coordinateSystem(extent = {{-148.5, -105.0}, {148.5, 105.0}}, preserveAspectRatio = true, grid = {5, 5})),
    Documentation(revisions = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Last update</p></td>
<td>2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end AtoPU;
