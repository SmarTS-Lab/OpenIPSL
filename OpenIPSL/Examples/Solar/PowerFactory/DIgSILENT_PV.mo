within OpenIPSL.Examples.Solar.PowerFactory;

model DIgSILENT_PV
  extends Modelica.Icons.Example;

  Modelica.Blocks.Sources.Constant const1(k = 25) annotation(
    Placement(visible = true, transformation(origin = {-240, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const4(k = -0.2) annotation(
    Placement(visible = true, transformation(origin = {-328, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step(height = -0.2, offset = 1, startTime = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {-272, -96}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step voltage(height = -0.05, offset = 1, startTime = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {70, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Solar.PowerFactory.General.ElmVac elmVac(angle_0 = 0, v_0 = 1)  annotation(
    Placement(visible = true, transformation(origin = {30, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step frequency(height = -0.05, offset = 1, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {70, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  inner OpenIPSL.Electrical.SystemBase SysData annotation(
    Placement(visible = true, transformation(origin = {-70.5, 90}, extent = {{-29.5, -10}, {29.5, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Solar.PowerFactory.DIgSILENT.PV_Plant pv_plant(M_b(displayUnit = "V.A") = 0.5e6, P_0 = 300000, angle_0 = 0, v_0 = 1)  annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(frequency.y, elmVac.f0) annotation(
    Line(points = {{60, 30}, {50, 30}, {50, 6}, {40, 6}, {40, 6}}, color = {0, 0, 127}));
  connect(voltage.y, elmVac.v) annotation(
    Line(points = {{60, -20}, {50, -20}, {50, -6}, {40, -6}, {40, -4}}, color = {0, 0, 127}));
  connect(pv_plant.p, elmVac.p) annotation(
    Line(points = {{-18, 0}, {18, 0}, {18, 0}, {20, 0}}, color = {0, 0, 255}));
protected
  annotation(
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "rungekutta"));
end DIgSILENT_PV;
