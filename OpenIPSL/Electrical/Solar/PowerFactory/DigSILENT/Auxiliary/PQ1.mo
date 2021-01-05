within OpenIPSL.Electrical.Solar.PowerFactory.DigSILENT.Auxiliary;

model PQ1
  OpenIPSL.Interfaces.PwPin p annotation(
    Placement(transformation(origin = {55.0, 22.7992}, extent = {{-10.0, -10.0}, {10.0, 10.0}}), iconTransformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  parameter Types.ApparentPower S_b = 100000000 "System base power" annotation(
    Dialog(group = "Power flow data"));
  parameter Types.ApparentPower Sn = 10000000 "Nominal power";
  parameter Types.PerUnit v0 = 1.00018548610126 "Voltage magnitude" annotation(
    Dialog(group = "Power flow data"));
  parameter Types.Angle anglev0 = -0.0000253046024029618 "Voltage angle" annotation(
    Dialog(group = "Power flow data"));
  parameter Types.PerUnit P0 = 0.4 "Active power" annotation(
    Dialog(group = "Power flow data"));
  parameter Types.PerUnit Q0 = 0.3 "Reactive power" annotation(
    Dialog(group = "Power flow data"));
  parameter Types.Time Td = 15 "d-axis inverter time constant";
  parameter Types.Time Tq = 15 "q-axis inverter time constant";
  Types.PerUnit idref1(start = idref);
  Types.PerUnit iqref1(start = iqref);
  Types.PerUnit v;
  Types.Angle anglev;
  Types.PerUnit id(start = idref);
  Types.PerUnit iq(start = iqref);
  Types.PerUnit vd(start = vd0);
  Types.PerUnit vq(start = vq0);
  Types.PerUnit Pgen(start = Pref);
  Types.PerUnit Q(start = Qref);
  Modelica.Blocks.Interfaces.RealInput P(start = Pref) annotation(
    Placement(transformation(origin = {165.1089, 40.5794}, extent = {{-20.0, -20.0}, {20.0, 20.0}}), iconTransformation(origin = {120.0, 60.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = -180)));
protected
  parameter Real CoB = Sn / S_b;
  parameter Types.PerUnit Pref = P0 * CoB "active power initialization";
  parameter Types.PerUnit Qref = Q0 * CoB "reactive power initialization";
  parameter Types.PerUnit vd0 = -v0 * sin(anglev0) "d-axis voltage initialization";
  parameter Types.PerUnit vq0 = v0 * cos(anglev0) "q-axis voltage initialization";
  parameter Types.PerUnit idref = (vq0 * Qref + Pref * vd0) / (vq0 ^ 2 + vd0 ^ 2) "d-axis current initialization";
  parameter Types.PerUnit iqref = ((-vd0 * Qref) + Pref * vq0) / (vq0 ^ 2 + vd0 ^ 2) "q-axis current initialization";
equation
  Pgen = vd * id + vq * iq;
  Q = vq * id - vd * iq;
  idref1 = (vq * Qref + P * vd) / (vq ^ 2 + vd ^ 2);
  iqref1 = ((-vd * Qref) + P * vq) / (vq ^ 2 + vd ^ 2);
  der(id) = (idref1 - id) / Td;
  der(iq) = (iqref1 - iq) / Tq;
  v = sqrt(p.vr ^ 2 + p.vi ^ 2);
  anglev = atan2(p.vi, p.vr);
  p.ir = -iq "change of sign due to the fact than in modelica when entering is + and in this case is going out";
  p.ii = id "change of sign due to the fact than in modelica when entering is + and in this case is going out";
  p.vr = vq;
  p.vi = -vd;
  annotation(
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, grid = {10, 10}), graphics = {Rectangle(fillColor = {255, 255, 255}, extent = {{-100.0, -100.0}, {100.0, 100.0}}), Text(origin = {0.0, 15.3102}, fillPattern = FillPattern.Solid, extent = {{-31.415, -20.0667}, {31.415, 20.0667}}, textString = "%name", fontName = "Arial")}),
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
end PQ1;
