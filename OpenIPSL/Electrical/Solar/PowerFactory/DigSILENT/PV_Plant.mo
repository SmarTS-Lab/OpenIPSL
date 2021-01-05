within OpenIPSL.Electrical.Solar.PowerFactory.DigSILENT;

model PV_Plant
  OpenIPSL.Interfaces.PwPin p annotation(
    Placement(visible = true, transformation(origin = {210, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Solar.PowerFactory.General.ElmGenstat ElmGenstat annotation(
    Placement(visible = true, transformation(origin = {170, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Solar.PowerFactory.DigSILENT.Controller controller annotation(
    Placement(visible = true, transformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  OpenIPSL.Electrical.Solar.PowerFactory.General.StaVmeas voltage_measurements annotation(
    Placement(visible = true, transformation(origin = {110, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Solar.PowerFactory.General.ElmPhi_pll elmPhi_pll annotation(
    Placement(visible = true, transformation(origin = {130, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(ElmGenstat.p, p) annotation(
    Line(points = {{180, 0}, {204, 0}, {204, 0}, {210, 0}}, color = {0, 0, 255}));
  connect(controller.id_ref, ElmGenstat.id_ref) annotation(
    Line(points = {{142, 10}, {151, 10}, {151, 4}, {159.5, 4}, {159.5, 6}, {160, 6}}, color = {0, 0, 127}));
  connect(controller.iq_ref, ElmGenstat.iq_ref) annotation(
    Line(points = {{142, -10}, {151, -10}, {151, -4}, {160, -4}}, color = {0, 0, 127}));
  connect(voltage_measurements.p, p) annotation(
    Line(points = {{121, -50}, {187, -50}, {187, -6}, {209, -6}, {209, 0}}, color = {0, 0, 255}));
  connect(voltage_measurements.u, controller.uac) annotation(
    Line(points = {{99, -45}, {87, -45}, {87, -7}, {101, -7}}, color = {0, 0, 127}));
  connect(elmPhi_pll.p, p) annotation(
    Line(points = {{141, 50}, {187, 50}, {187, 6}, {209, 6}, {209, 0}}, color = {0, 0, 255}));
protected
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Line(origin = {0, 60.3123}, points = {{-100, 39.6877}, {0, -40.3123}, {100, 39.6877}, {100, 39.6877}})}));
end PV_Plant;
