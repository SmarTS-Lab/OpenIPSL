within OpenIPSL.Examples.Solar.PowerFactory;

model DIgSILENT_PV "Voltage drop test of DIgSILENT_PV model"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Step voltage(height = -0.05, offset = 1, startTime = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {70, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Solar.PowerFactory.General.ElmVac voltage_source(angle_0 = 0, v_0 = 1)  annotation(
    Placement(visible = true, transformation(origin = {30, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step frequency(height = -0.05, offset = 1, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {70, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  inner OpenIPSL.Electrical.SystemBase SysData annotation(
    Placement(visible = true, transformation(origin = {-70.5, 90}, extent = {{-29.5, -10}, {29.5, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Solar.PowerFactory.DIgSILENT.PV_Plant pv_plant(M_b(displayUnit = "V.A") = 0.5e6, P_0 = 300000, angle_0 = 0, v_0 = 1)  annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(pv_plant.p, voltage_source.p) annotation(
    Line(points = {{-18, 0}, {18, 0}, {18, 0}, {20, 0}}, color = {0, 0, 255}));
  connect(voltage.y, voltage_source.v) annotation(
    Line(points = {{60, -20}, {48, -20}, {48, -4}, {40, -4}}, color = {0, 0, 127}));
  connect(voltage_source.f0, frequency.y) annotation(
    Line(points = {{40, 4}, {50, 4}, {50, 30}, {60, 30}}, color = {0, 0, 127}));
  annotation (
experiment(StopTime=10),Documentation(info="<html>
<p>
Simulate for 10 seconds.
</p>
<p>Variables of interest:</p>
<ul>
<li><code>pv_plant.generator.id_ref</code></code></li>
<li><code>pv_plant.generator.iq_ref</code></code></li>
<li><code>voltage_source.v</code></code></li>
<li><code>voltage_source.f0</code></code></li>
</ul>
</html>"));
end DIgSILENT_PV;
