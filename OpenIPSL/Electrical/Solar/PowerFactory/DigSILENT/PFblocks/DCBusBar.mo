within OpenIPSL.Electrical.Solar.PowerFactory.DigSILENT.PFblocks;

model DCBusBar
  parameter Types.ActivePower Pnen = 500000 "Rated power";
  parameter Types.Voltage UdcN = 1000 "Nominal DC voltage";
  parameter SI.Capacitance C = 0.0172 "DC busbar capacitance";
  parameter Types.Voltage Udc0 = 700 "Initial dc voltage";
  Modelica.Blocks.Interfaces.RealInput Pac "voltage array" annotation(
    Placement(transformation(origin = {-168.2447, -30.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}), iconTransformation(origin = {-120.0, 60.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}})));
  Modelica.Blocks.Interfaces.RealInput Ipv "current array" annotation(
    Placement(transformation(origin = {-168.0962, 67.0723}, extent = {{-20.0, -20.0}, {20.0, 20.0}}), iconTransformation(origin = {-120.0, -30.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}})));
  Modelica.Blocks.Interfaces.RealOutput Vdc(start = Udc0) annotation(
    Placement(transformation(origin = {160.0, -0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Math.Add add1(k2 = -1) annotation(
    Placement(transformation(origin = {-50.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = 876, uMin = 0) annotation(
    Placement(transformation(origin = {100.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  OpenIPSL.Electrical.Solar.KTH.Auxiliary.Calcurrent calcurrent1(Udc0 = Udc0) annotation(
    Placement(transformation(origin = {-108.3112, -33.4951}, extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  OpenIPSL.Electrical.Solar.KTH.Auxiliary.AtoPU atoPU1(Pnen = Pnen, UdcN = UdcN) annotation(
    Placement(transformation(origin = {-22.2363, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  OpenIPSL.Electrical.Solar.KTH.Auxiliary.Capacitor capacitor1(C = C, Udc0 = Udc0, UdcN = UdcN) annotation(
    Placement(transformation(origin = {7.8812, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  OpenIPSL.Electrical.Solar.KTH.Auxiliary.pu_to_A pu_to_A1(Pnen = Pnen, UdcN = UdcN) annotation(
    Placement(transformation(origin = {40.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation
  connect(limiter1.y, Vdc) annotation(
    Line(origin = {135.5, 0.0}, points = {{-24.5, 0.0}, {24.5, 0.0}}, color = {0, 0, 127}));
  connect(pu_to_A1.y0, limiter1.u) annotation(
    Line(origin = {69.5, 0.0}, points = {{-18.5, 0.0}, {18.5, -0.0}}, color = {0, 0, 127}));
  connect(capacitor1.y0, pu_to_A1.yi) annotation(
    Line(origin = {23.4406, 0.0}, points = {{-4.5594, 0.0}, {4.5594, -0.0}}, color = {0, 0, 127}));
  connect(capacitor1.yi, atoPU1.y0) annotation(
    Line(origin = {-7.6775, 0.0}, points = {{3.5587, 0}, {-3.5588, 0}}, color = {0, 0, 127}));
  connect(add1.y, atoPU1.yi) annotation(
    Line(origin = {-36.6181, 0.0}, points = {{-2.3819, 0}, {2.3818, 0}}, color = {0, 0, 127}));
  connect(add1.u2, calcurrent1.yo) annotation(
    Line(origin = {-77.3245, -22.3845}, points = {{15.3245, 16.3845}, {12.3245, 16.3845}, {12.3245, -10.8292}, {-19.9867, -10.8292}, {-19.9867, -11.1106}}, color = {0, 0, 127}));
  connect(Ipv, add1.u1) annotation(
    Line(origin = {-90.0241, 36.5361}, points = {{-78.0721, 30.5362}, {25.0241, 30.5362}, {25.0241, -30.5361}, {28.0241, -30.5361}}, color = {0, 0, 127}));
  connect(calcurrent1.udc, Vdc) annotation(
    Line(origin = {-30.4173, -44.0824}, points = {{-89.8939, 5.5873}, {-106.096, 5.5873}, {-106.096, -23.7522}, {-104.583, -23.7522}, {-104.583, -25.9176}, {160.417, -25.9176}, {160.417, 44.0824}, {190.417, 44.0824}}, color = {0, 0, 127}));
  connect(Pac, calcurrent1.yi) annotation(
    Line(origin = {-133.7946, -29.7476}, points = {{-34.4501, -0.2524}, {10.4834, -0.2524}, {10.4834, 0.2525}, {13.4834, 0.2525}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, grid = {10, 10}), graphics = {Rectangle(fillColor = {255, 255, 255}, extent = {{-100.0, -100.0}, {100.0, 100.0}}), Text(origin = {-50.0, 60.0}, fillPattern = FillPattern.Solid, extent = {{-47.2303, -30.0}, {47.2303, 30.0}}, textString = "Pac [MW]", fontName = "Arial"), Text(origin = {-68.5241, -31.9581}, fillPattern = FillPattern.Solid, extent = {{-15.9047, -15.0129}, {15.9047, 15.0129}}, textString = "Ipv", fontName = "Arial"), Text(origin = {70.0, 0.0}, fillPattern = FillPattern.Solid, extent = {{-23.1601, -13.4726}, {23.1601, 13.4726}}, textString = "Vdc", fontName = "Arial")}),
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
end DCBusBar;
