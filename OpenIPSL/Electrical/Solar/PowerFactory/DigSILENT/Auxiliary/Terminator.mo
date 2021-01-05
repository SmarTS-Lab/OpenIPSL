within OpenIPSL.Electrical.Solar.PowerFactory.DigSILENT.Auxiliary;

model Terminator
  Modelica.Blocks.Interfaces.RealInput V annotation(
    Placement(transformation(origin = {-155.0, 1.9703}, extent = {{-20.0, -20.0}, {20.0, 20.0}}), iconTransformation(origin = {-120.0, 0.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}})));
  parameter Types.Time T1 = 0.1;
  parameter Types.Time T2 = 0.05;
  parameter Real Step = 0.001;
  parameter Real Iniv123;
  parameter Real Inidv;
  Real Value[:](start = {1});
  Real v123(start = Iniv123);
  Real dv(start = Inidv);
  Integer i(start = 1);
algorithm
  Value[i] := V;
  if time < T1 then
    v123 := Iniv123;
    dv := Inidv;
  else
    v123 := Value[i - 50];
    dv := Value[i - 100];
  end if;
  i := i + 1;
  annotation(
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, grid = {10, 10}), graphics = {Rectangle(fillColor = {255, 255, 255}, extent = {{-100.0, -100.0}, {100.0, 100.0}})}),
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
end Terminator;
