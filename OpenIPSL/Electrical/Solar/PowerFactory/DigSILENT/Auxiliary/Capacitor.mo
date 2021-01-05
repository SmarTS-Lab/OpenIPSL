within OpenIPSL.Electrical.Solar.PowerFactory.DigSILENT.Auxiliary;

model Capacitor
  Modelica.Blocks.Interfaces.RealOutput y0 annotation(
    Placement(transformation(origin = {155.0, -0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput yi annotation(
    Placement(transformation(origin = {-155.0, 0.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}), iconTransformation(origin = {-120.0, -0.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}})));
  Real x(start = Udc0 / UdcN);
  parameter SI.Capacitance C;
  parameter Types.Voltage Udc0;
  parameter Types.Voltage UdcN;
equation
  y0 = x;
  der(x) = yi / C;
  annotation(
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, grid = {10, 10}), graphics = {Rectangle(fillColor = {255, 255, 255}, extent = {{-100.0, -100.0}, {100.0, 100.0}}), Text(origin = {0.0, 2.2296}, fillPattern = FillPattern.Solid, extent = {{-23.283, -44.4441}, {23.283, 44.4441}}, textString = "Capacitor", fontName = "Arial")}),
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
end Capacitor;
