within OpenIPSL.Electrical.Solar.PowerFactory.DIgSILENT.Auxiliary;

model SLDWindV "Dynamic support during faults"
  parameter Types.PerUnit Deadband "Deadband for dynamic AC voltage support";
  parameter Real K_FRT "Gain for dynamic AC voltage supports";
  Modelica.Blocks.Math.Add add1(k1 = -1, k2 = 1) annotation(
    Placement(visible = true, transformation(origin = {-10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = K_FRT) annotation(
    Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product annotation(
    Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = Deadband) annotation(
    Placement(visible = true, transformation(origin = {-60, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Abs duac_abs annotation(
    Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput duac annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput diq annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division annotation(
    Placement(visible = true, transformation(origin = {-2, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter(limitsAtInit = true, uMax = Modelica.Constants.inf, uMin = Deadband)  annotation(
    Placement(visible = true, transformation(origin = {-30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(product.y, gain1.u) annotation(
    Line(points = {{51, 0}, {68, 0}}, color = {0, 0, 127}));
  connect(duac_abs.u, duac) annotation(
    Line(points = {{-72, 0}, {-100, 0}}, color = {0, 0, 127}));
  connect(gain1.y, diq) annotation(
    Line(points = {{91, 0}, {110, 0}}, color = {0, 0, 127}));
  connect(add1.u1, const.y) annotation(
    Line(points = {{-22, 46}, {-35, 46}, {-35, 50}, {-48, 50}}, color = {0, 0, 127}));
  connect(add1.u2, duac_abs.y) annotation(
    Line(points = {{-22, 34}, {-40, 34}, {-40, 0}, {-48, 0}, {-48, 0}}, color = {0, 0, 127}));
  connect(division.u2, limiter.y) annotation(
    Line(points = {{-14, -36}, {-18, -36}, {-18, -30}}, color = {0, 0, 127}));
  connect(division.u1, duac) annotation(
    Line(points = {{-14, -24}, {-18, -24}, {-18, -14}, {-78, -14}, {-78, 0}, {-100, 0}}, color = {0, 0, 127}));
  connect(division.y, product.u2) annotation(
    Line(points = {{9, -30}, {20, -30}, {20, -6}, {28, -6}}, color = {0, 0, 127}));
  connect(product.u1, add1.y) annotation(
    Line(points = {{28, 6}, {20, 6}, {20, 40}, {2, 40}, {2, 40}}, color = {0, 0, 127}));
  connect(limiter.u, duac_abs.y) annotation(
    Line(points = {{-42, -30}, {-46, -30}, {-46, 0}, {-48, 0}, {-48, 0}}, color = {0, 0, 127}));

annotation(
    Diagram,
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {73, 2}, extent = {{-83, 12}, {83, -12}}, textString = "diq"), Text(origin = {-33, 2}, extent = {{-83, 12}, {83, -12}}, textString = "duac"), Text(origin = {3, 84}, extent = {{-83, 12}, {83, -12}}, textString = "SLDWindV")}));
end SLDWindV;
