within OpenIPSL.Electrical.Solar.PowerFactory.DigSILENT;

model DCBusBar
  parameter SI.Voltage UdcN = 1000 "Nominal DC Voltage";
  parameter SI.Voltage Udc0 = 700 "Initial DC Voltage";
  parameter SI.ActivePower Pnen = 0.5e6 "Rated power";
  parameter SI.Time Capacity=0.0172 "Capacity of capacitor on DC busbar";
  Modelica.Blocks.Interfaces.RealInput P_conv annotation (
      Placement(
      visible = true,transformation(
        origin={-120.245,-44},
        extent={{-20, -20},{20, 20}}, rotation = 0),
      iconTransformation(
        origin={-180,-50},
        extent={{-20, -20},{20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput I_pv "current array" annotation (
      Placement(
      visible = true,transformation(
        origin={-120.096,51.0723},
        extent={{-20, -20},{20, 20}}, rotation = 0),
      iconTransformation(
        origin={-180,50},
        extent={{-20, -20},{20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Udc annotation (Placement(
      visible = true,transformation(
        origin={130,0},
        extent={{-10, -10},{10, 10}}, rotation = 0),
      iconTransformation(
        origin={210,0},
        extent={{-10, -10},{10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k2=-1) annotation (Placement(visible = true, transformation(origin = {6, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division P_to_I annotation(
    Placement(visible = true, transformation(origin = {-24, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator(initType = Modelica.Blocks.Types.Init.InitialOutput, k = 1 / Capacity, y_start = Udc0 / UdcN)  annotation(
    Placement(visible = true, transformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain pu_to_A(k = UdcN)  annotation(
    Placement(visible = true, transformation(origin = {104, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain A_to_pu(k = Pnen / UdcN)  annotation(
    Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(I_pv, add1.u1) annotation(
    Line(points = {{-120, 51}, {-10, 51}, {-10, 6}, {-6, 6}}, color = {0, 0, 127}));
  connect(P_to_I.y, add1.u2) annotation(
    Line(points = {{-12, -50}, {-10, -50}, {-10, -6}, {-6, -6}, {-6, -6}}, color = {0, 0, 127}));
  connect(pu_to_A.y, Udc) annotation(
    Line(points = {{115, 0}, {121, 0}, {121, 0}, {129, 0}}, color = {0, 0, 127}));
  connect(pu_to_A.u, integrator.y) annotation(
    Line(points = {{92, 0}, {81, 0}}, color = {0, 0, 127}));
  connect(add1.y, A_to_pu.u) annotation(
    Line(points = {{18, 0}, {28, 0}, {28, 0}, {28, 0}}, color = {0, 0, 127}));
  connect(A_to_pu.y, integrator.u) annotation(
    Line(points = {{52, 0}, {58, 0}, {58, 0}, {58, 0}}, color = {0, 0, 127}));
  connect(P_conv, P_to_I.u1) annotation(
    Line(points = {{-120, -44}, {-36, -44}}, color = {0, 0, 127}));
  connect(P_to_I.u2, pu_to_A.y) annotation(
    Line(points = {{-36, -56}, {-40, -56}, {-40, -80}, {118, -80}, {118, 0}, {116, 0}, {116, 0}}, color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(
        extent={{-200, -100},{200, 100}},
        preserveAspectRatio=true,
        grid={2,2}), graphics={Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-200, -100}, {200, 100}}),Text(origin = {-130, -50}, fillPattern = FillPattern.Solid, extent = {{-29.23, -10}, {29.23, 10}}, textString = "P_conv", fontName = "Arial"),Text(origin = {-139.52, 50.04}, fillPattern = FillPattern.Solid, extent = {{-20.9, -9.01}, {20.9, 9.01}}, textString = "I_pv", fontName = "Arial"),Text(origin = {172, 0}, fillPattern = FillPattern.Solid, extent = {{-25.16, -9.47}, {25.16, 9.47}}, textString = "Udc", fontName = "Arial"), Text(origin = {2.48, 88.04}, fillPattern = FillPattern.Solid, extent = {{-78.9, -11.01}, {78.9, 11.01}}, textString = "DC Busbar", fontName = "Arial"), Line(origin = {-11.3552, 3.58643}, points = {{0, 41}, {0, -41}}), Line(origin = {8.25836, 3.07042}, points = {{0, 41}, {0, -41}}), Line(origin = {39.5161, 4}, points = {{-31, 0}, {31, 0}}), Line(origin = {-42.3581, 3.67705}, points = {{-31, 0}, {31, 0}})}),
    Diagram(coordinateSystem(
        extent={{-120, -100},{120, 100}},
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
