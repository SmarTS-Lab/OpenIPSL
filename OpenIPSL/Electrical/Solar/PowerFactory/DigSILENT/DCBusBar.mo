within OpenIPSL.Electrical.Solar.PowerFactory.DigSILENT;

model DCBusBar
  parameter SI.Capacitance C=1.5e-3 "Capacitance on DC busbar (per inverter)";
  Modelica.Blocks.Interfaces.RealInput P_conv annotation (
      Placement(
      visible = true,transformation(
        origin={-100.245,-50},
        extent={{-20, -20},{20, 20}}, rotation = 0),
      iconTransformation(
        origin={-80,-50},
        extent={{-20, -20},{20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput I_pv "current array" annotation (
      Placement(
      visible = true,transformation(
        origin={-100.096,51.0723},
        extent={{-20, -20},{20, 20}}, rotation = 0),
      iconTransformation(
        origin={-80,50},
        extent={{-20, -20},{20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Udc annotation (Placement(
      visible = true,transformation(
        origin={110,0},
        extent={{-10, -10},{10, 10}}, rotation = 0),
      iconTransformation(
        origin={110,0},
        extent={{-10, -10},{10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k2=-1) annotation (Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain MW_to_W(k = 1e6)  annotation(
    Placement(visible = true, transformation(origin = {-50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division P_to_I annotation(
    Placement(visible = true, transformation(origin = {-10, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator(k = 1 / C)  annotation(
    Placement(visible = true, transformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(limiter1.y, Udc) annotation(
    Line(origin = {135.5, 0.0}, points = {{-24.5, 0.0}, {24.5, 0.0}}, color = {0, 0, 127}));
  connect(I_pv, add1.u1) annotation(
    Line(points = {{-100, 51}, {9, 51}, {9, 6}, {18, 6}}, color = {0, 0, 127}));
  connect(calcurrent1.udc, Udc) annotation(
    Line(origin = {-30.4173, -44.0824}, points = {{-89.8939, 5.5873}, {-106.096, 5.5873}, {-106.096, -23.7522}, {-104.583, -23.7522}, {-104.583, -25.9176}, {160.417, -25.9176}, {160.417, 44.0824}, {190.417, 44.0824}}, color = {0, 0, 127}));
  connect(P_conv, MW_to_W.u) annotation(
    Line(points = {{-100, -50}, {-62, -50}, {-62, -50}, {-62, -50}}, color = {0, 0, 127}));
  connect(MW_to_W.y, P_to_I.u1) annotation(
    Line(points = {{-38, -50}, {-32, -50}, {-32, -44}, {-22, -44}, {-22, -44}}, color = {0, 0, 127}));
  connect(P_to_I.y, add1.u2) annotation(
    Line(points = {{2, -50}, {10, -50}, {10, -6}, {18, -6}}, color = {0, 0, 127}));
  connect(integrator.y, Udc) annotation(
    Line(points = {{82, 0}, {102, 0}, {102, 0}, {110, 0}}, color = {0, 0, 127}));
  connect(integrator.u, add1.y) annotation(
    Line(points = {{58, 0}, {42, 0}, {42, 0}, {42, 0}}, color = {0, 0, 127}));
  connect(P_to_I.u2, integrator.y) annotation(
    Line(points = {{-22, -56}, {-32, -56}, {-32, -80}, {90, -80}, {90, 0}, {82, 0}, {82, 0}}, color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(
        extent={{-100, -100},{100, 100}},
        preserveAspectRatio=true,
        grid={2,2}), graphics={Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, -100}, {100, 100}}),Text(origin = {-30, -50}, fillPattern = FillPattern.Solid, extent = {{-29.23, -10}, {29.23, 10}}, textString = "P_conv", fontName = "Arial"),Text(origin = {-39.52, 50.04}, fillPattern = FillPattern.Solid, extent = {{-20.9, -9.01}, {20.9, 9.01}}, textString = "I_pv", fontName = "Arial"),Text(origin = {72, 1.77636e-15}, fillPattern = FillPattern.Solid, extent = {{-25.16, -9.47}, {25.16, 9.47}}, textString = "Udc", fontName = "Arial"), Text(origin = {-15.52, 88.04}, fillPattern = FillPattern.Solid, extent = {{-20.9, -9.01}, {20.9, 9.01}}, textString = "DCBusBar", fontName = "Arial")}),
    Diagram(coordinateSystem(
        extent={{-100, -100},{100, 100}},
        preserveAspectRatio=true,
        grid={2,2})),
    Documentation(revisions="<html>
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
