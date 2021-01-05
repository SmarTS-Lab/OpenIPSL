within OpenIPSL.Electrical.Solar.PowerFactory.DigSILENT.Auxiliary;

model PVarray
  Modelica.Blocks.Interfaces.RealInput V1(start = Vmp) "Voltage" annotation(
    Placement(transformation(origin = {-168.2602, -0.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}), iconTransformation(origin = {-120.0, 70.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}})));
  parameter Types.Voltage Vt = (2 * Vmp - Vocref) * (Iscref - Imp) / (Imp + (Iscref - Imp) * log((Iscref - Imp) / Iscref));
  parameter SI.Resistance Rs = (Vt * log((Iscref - Imp) / Iscref) + Vocref - Vmp) / Imp;
  Modelica.Blocks.Interfaces.RealInput E(start = Estc) "Irradiance" annotation(
    Placement(transformation(origin = {-170.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}), iconTransformation(origin = {-120.0, 0.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}})));
  Modelica.Blocks.Interfaces.RealInput T(start = Tstc) "Temperature" annotation(
    Placement(transformation(origin = {-168.0185, 40.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}), iconTransformation(origin = {-120.0, -70.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}})));
  parameter Types.Current Imp = 1;
  parameter Types.Voltage Vmp = 1;
  parameter Types.Current Iscref = 1 "Module short-circuit current reference at reference temp and irradiance";
  parameter Types.Voltage Vocref = 1 "Module open-circuit voltage reference at reference temp and irradiance";
  parameter Real Kv = 1 "temperature correction factor for the voltage";
  parameter Real Ki = 1 "temperature correction factor for the current";
  parameter SI.Temperature Tstc = 1 "Temperature at the standard test conditions";
  parameter SI.Irradiance Estc = 1 "Irradiance at the standard test conditions";
  Types.Voltage Voct;
  Types.Voltage Voc;
  Types.Current Isct;
  Types.Current Isc;
  Types.Current I0 "diode dark current";
  Types.Current Iph;
  Types.Current Id;
  Modelica.Blocks.Interfaces.RealOutput I(start = Imp) annotation(
    Placement(transformation(origin = {160.0, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}), iconTransformation(origin = {110.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput V(start = Vmp) annotation(
    Placement(transformation(origin = {160.0, 21.9548}, extent = {{-10.0, -10.0}, {10.0, 10.0}}), iconTransformation(origin = {110.0, -34.2738}, extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation
  Voct = Vocref + Kv * (T - Tstc);
  Voc = Voct * log(E) / log(Estc);
  Isct = Iscref * (1 + Ki / 100 * (T - Tstc));
  Isc = Isct * E / Estc;
  I0 = Isct / exp(Voct / Vt);
  Iph = Isc;
  Id = I0 * exp((V + I * Rs) / Vt);
  I = Iph - Id;
  V = V1;
  annotation(
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, grid = {10, 10}), graphics = {Rectangle(fillColor = {255, 255, 255}, extent = {{-100.0, -100.0}, {100.0, 100.0}}), Text(origin = {40.0, 0.0}, fillPattern = FillPattern.Solid, extent = {{-45.9305, -23.3368}, {45.9305, 23.3368}}, textString = "%name", fontName = "Arial"), Text(origin = {-46.5008, 63.2046}, fillPattern = FillPattern.Solid, extent = {{-51.9003, -55.1779}, {51.9003, 55.1779}}, textString = "Vdc(ex=35)", fontName = "Arial"), Text(origin = {-80.0, 0.0}, fillPattern = FillPattern.Solid, extent = {{-12.8628, -13.6751}, {12.8628, 13.6751}}, textString = "E", fontName = "Arial"), Text(origin = {-80.0, -70.0}, fillPattern = FillPattern.Solid, extent = {{-12.8628, -13.6751}, {12.8628, 13.6751}}, textString = "T", fontName = "Arial"), Text(origin = {70.7131, 40.0}, fillPattern = FillPattern.Solid, extent = {{-20.7131, -17.8652}, {20.7131, 17.8652}}, textString = "Ipv(4.58)", fontName = "Arial"), Text(origin = {70.0, -37.1013}, fillPattern = FillPattern.Solid, extent = {{-25.1013, -17.1013}, {25.1013, 17.1013}}, textString = "Vpv(35)", fontName = "Arial")}),
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
end PVarray;
