within OpenIPSL.Electrical.Solar.PowerFactory.General;
model ElmPhi_pll "Phase-locked loop (PLL)"
  parameter Real angle_0rad;
  parameter Real omega_0;
  parameter Real v_0;
  parameter Boolean PLLEnable = false "Enable/disable PLL (PLL not implemented yet)";
  OpenIPSL.Interfaces.PwPin p annotation (
    Placement(visible = true, transformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput sinphi annotation (
    Placement(visible = true, transformation(origin = {110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput cosphi annotation (
    Placement(visible = true, transformation(origin = {110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Types.PerUnit v;
equation
  v = sqrt(p.vr ^ 2 + p.vi ^ 2);
  sinphi = p.vi/v;
  cosphi = p.vr/v;
  p.ii = 0;
  p.ir = 0;
  annotation(
    Diagram(coordinateSystem(initialScale = 0.1)),
    Icon(graphics = {Rectangle(lineColor = {118, 18, 62},fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, -10}, lineColor = {0, 0, 255}, extent = {{-100, 150}, {100, 110}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
end ElmPhi_pll;
