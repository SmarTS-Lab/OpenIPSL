within OpenIPSL.Electrical.Solar.PowerFactory.DigSILENT.Auxiliary;

model PI
  Modelica.Blocks.Interfaces.RealInput yi annotation(
    Placement(transformation(origin = {-137.6396, 33.4951}, extent = {{-20.0, -20.0}, {20.0, 20.0}}), iconTransformation(origin = {-120.0, 0.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}})));
  Modelica.Blocks.Interfaces.RealOutput yo annotation(
    Placement(transformation(origin = {105.0, 35.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  parameter Real K;
  parameter Types.Time T;
  parameter Real xo;
  parameter Real Ymax;
  parameter Real Ymin;
  Real x(start = xo);
  Real x1(start = xo);
equation
  if x > Ymax then
    x1 = Ymax;
  elseif x < Ymin then
    x1 = Ymin;
  else
    x1 = x;
  end if;
  der(x) = K * yi / T;
  yo = K * yi + x1;
  annotation(
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, grid = {10, 10}), graphics = {Text(origin = {-13.5393, 7.4321}, fillPattern = FillPattern.Solid, extent = {{-43.5393, -25.2692}, {43.5393, 25.2692}}, textString = "PI", fontName = "Arial"), Rectangle(fillColor = {255, 255, 255}, extent = {{-100.0, -100.0}, {100.0, 100.0}}), Rectangle(origin = {151.9125, 3.2701}, fillColor = {255, 255, 255}, extent = {{-0.2973, -3.2701}, {0.2973, 3.2701}})}),
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
end PI;
