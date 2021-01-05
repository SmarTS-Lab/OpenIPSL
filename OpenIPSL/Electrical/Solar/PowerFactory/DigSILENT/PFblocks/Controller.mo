within OpenIPSL.Electrical.Solar.PowerFactory.DigSILENT.PFblocks;

model Controller
  parameter Types.PerUnit v0 = 1;
  parameter Types.PerUnit ibase = 1.02;
  parameter Types.PerUnit ibase_iq = 1;
  parameter Real Kdc = -0.005 "DC voltage Controller Gain";
  parameter Types.Time Tdc = 0.0015 "DC controller time constant";
  parameter Types.PerUnit id_max = 1;
  parameter Types.PerUnit id_min = 0;
  parameter Real Kac = -2.346 "AC voltage Controller Gain";
  parameter Types.Time Tac = -0.0002131 "AC controller time constant";
  parameter Types.PerUnit iq_max = 3;
  parameter Types.PerUnit iq_min = -3;
  parameter Types.PerUnit xq = 1 "Initialization";
  parameter Types.PerUnit xd = 1 "Initialization";
  Modelica.Blocks.Interfaces.RealInput udc annotation(
    Placement(transformation(origin = {-168.0386, -48.3466}, extent = {{-20.0, -20.0}, {20.0, 20.0}}), iconTransformation(origin = {-120.0, -30.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}})));
  Modelica.Blocks.Interfaces.RealOutput id_ref annotation(
    Placement(transformation(origin = {160.0, 45.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}), iconTransformation(origin = {110.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput Vdcref annotation(
    Placement(transformation(origin = {-168.3642, -81.5161}, extent = {{-20.0, -20.0}, {20.0, 20.0}}), iconTransformation(origin = {-120.0, -80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}})));
  Modelica.Blocks.Math.Add add1(k1 = -1) annotation(
    Placement(transformation(origin = {-85.0, -65.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = id_max, uMin = id_min) annotation(
    Placement(transformation(origin = {-11.5403, -65.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Math.Gain gain1(k = 1 / ibase) annotation(
    Placement(transformation(origin = {16.5869, -65.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput uac annotation(
    Placement(transformation(origin = {-168.3642, 60.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}), iconTransformation(origin = {-120.0, 70.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}})));
  Modelica.Blocks.Interfaces.RealInput Vacref annotation(
    Placement(transformation(origin = {-168.1269, 30.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}), iconTransformation(origin = {-120.0, 20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}})));
  Modelica.Blocks.Math.Add add2(k1 = -1) annotation(
    Placement(transformation(origin = {-95.0, 48.1957}, extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Nonlinear.Limiter limiter2(uMax = iq_max, uMin = iq_min) annotation(
    Placement(transformation(origin = {-26.5403, 47.3513}, extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Math.Gain gain2(k = 1 / ibase_iq) annotation(
    Placement(transformation(origin = {10.0, 47.3513}, extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput iq_ref annotation(
    Placement(transformation(origin = {160.0, -60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}), iconTransformation(origin = {110.0, -48.2723}, extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  OpenIPSL.Electrical.Solar.KTH.Auxiliary.PI PI2(K = Kdc, T = Tdc, xo = xd, Ymax = id_max, Ymin = id_min) annotation(
    Placement(transformation(origin = {-50.0, -65.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  OpenIPSL.Electrical.Solar.KTH.Auxiliary.PI PI3(K = Kac, T = 0.0005, Ymax = iq_max, Ymin = iq_min, xo = xq) annotation(
    Placement(transformation(origin = {-65.0, 47.5332}, extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  OpenIPSL.Electrical.Solar.KTH.Auxiliary.SimpleLagg simpleLagg1(xo = v0) annotation(
    Placement(transformation(origin = {-132.2917, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation
  connect(id_ref, gain1.y) annotation(
    Line(origin = {97.9312, -8.9184}, points = {{62.0688, 53.9184}, {27.0688, 53.9184}, {27.0688, 2.1631}, {-22.9312, 2.1631}, {-22.9312, -56.0816}, {-70.3443, -56.0816}}, color = {0, 0, 127}));
  connect(PI2.yo, limiter1.u) annotation(
    Line(origin = {-31.2702, -65.0}, points = {{-7.7298, 0}, {7.7299, 0}}, color = {0, 0, 127}));
  connect(add1.y, PI2.yi) annotation(
    Line(origin = {-68.0, -65.0}, points = {{-6.0, 0.0}, {6.0, 0.0}}, color = {0, 0, 127}));
  connect(simpleLagg1.yo, add2.u1) annotation(
    Line(origin = {-117.0729, 57.0978}, points = {{-4.2188, 2.9022}, {-2.9271, 2.9022}, {-2.9271, -2.9021}, {10.0729, -2.9021}}, color = {0, 0, 127}));
  connect(uac, simpleLagg1.yi) annotation(
    Line(origin = {-156.3279, 60.0}, points = {{-12.0363, 0.0}, {12.0362, 0.0}}, color = {0, 0, 127}));
  connect(PI3.yo, limiter2.u) annotation(
    Line(origin = {-43.9052, 47.4423}, points = {{-10.0948, 0.0909}, {2.3649, 0.0909}, {2.3649, -0.091}, {5.3649, -0.091}}, color = {0, 0, 127}));
  connect(add2.y, PI3.yi) annotation(
    Line(origin = {-80.25, 47.8645}, points = {{-3.75, 0.3312}, {0.25, 0.3312}, {0.25, -0.3313}, {3.25, -0.3313}}, color = {0, 0, 127}));
  connect(udc, add1.u1) annotation(
    Line(origin = {-116.2596, -53.6733}, points = {{-51.779, 5.3267}, {16.2596, 5.3267}, {16.2596, -5.3267}, {19.2596, -5.3267}}, color = {0, 0, 127}));
  connect(gain2.y, iq_ref) annotation(
    Line(origin = {97.75, -6.3243}, points = {{-76.75, 53.6756}, {7.25, 53.6757}, {7.25, -53.6757}, {62.25, -53.6757}}, color = {0, 0, 127}));
  connect(Vdcref, add1.u2) annotation(
    Line(origin = {-116.341, -76.258}, points = {{-52.0232, -5.2581}, {16.341, -5.258}, {16.341, 5.258}, {19.341, 5.258}}, color = {0, 0, 127}));
  connect(add2.u2, Vacref) annotation(
    Line(origin = {-141.1202, 36.0979}, points = {{34.1202, 6.0978}, {-3.5567, 6.0979}, {-3.5567, -6.0979}, {-27.0067, -6.0979}}, color = {0, 0, 127}));
  connect(limiter2.y, gain2.u) annotation(
    Line(origin = {-8.7701, 47.3513}, points = {{-6.7702, 0}, {6.7701, 0}}, color = {0, 0, 127}));
  connect(limiter1.y, gain1.u) annotation(
    Line(origin = {2.0233, -65.0}, points = {{-2.5636, 0}, {2.5636, 0}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, grid = {10, 10}), graphics = {Rectangle(fillColor = {255, 255, 255}, extent = {{-100.0, -100.0}, {100.0, 100.0}}), Text(origin = {2.9728, 2.2168}, fillPattern = FillPattern.Solid, extent = {{-41.0253, -27.7832}, {41.0253, 27.7832}}, textString = "Controller", fontName = "Arial"), Text(origin = {-70.0, 72.8039}, fillPattern = FillPattern.Solid, extent = {{-25.3921, -17.1961}, {25.3921, 17.1961}}, textString = "vac", fontName = "Arial"), Text(origin = {-71.5131, 22.8039}, fillPattern = FillPattern.Solid, extent = {{-25.3921, -17.1961}, {25.3921, 17.1961}}, textString = "vacref", fontName = "Arial"), Text(origin = {-70.0, -27.1961}, fillPattern = FillPattern.Solid, extent = {{-25.3921, -17.1961}, {25.3921, 17.1961}}, textString = "vdc", fontName = "Arial"), Text(origin = {-71.8371, -80.0}, fillPattern = FillPattern.Solid, extent = {{-25.3921, -17.1961}, {25.3921, 17.1961}}, textString = "vdcref", fontName = "Arial"), Text(origin = {67.86, 42.8039}, fillPattern = FillPattern.Solid, extent = {{-25.3921, -17.1961}, {25.3921, 17.1961}}, textString = "id_ref", fontName = "Arial"), Text(origin = {68.1306, -47.1961}, fillPattern = FillPattern.Solid, extent = {{-25.3921, -17.1961}, {25.3921, 17.1961}}, textString = "iq_ref", fontName = "Arial")}),
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
end Controller;
