within OpenIPSL.Electrical.Solar.PowerFactory.DigSILENT;

model PVArray
  parameter SI.ActivePower P_init "Initial active power of the array";
  parameter Integer n_series = 20 "Number of modules in series" annotation(Dialog(group="PV Array Dimensions"));
  parameter Integer n_parallel = 140 "Number of modules in parallel" annotation(Dialog(group="PV Array Dimensions"));
  parameter SI.Time Tr = 0.01 "Time constant of modules" annotation(Dialog(group="Parameters of PV Modules"));
  parameter SI.Voltage U0_stc = 43.8 "Open-circuit voltage at Standard Test Conditions"annotation(Dialog(group="Parameters of PV Modules"));
  parameter SI.Voltage Umpp_stc = 35 "MPP voltage at Standard Test Conditions"annotation(Dialog(group="Parameters of PV Modules"));
  parameter SI.Current Impp_stc = 4.58 "MPP current at Standard Test Conditions"annotation(Dialog(group="Parameters of PV Modules"));
  parameter SI.Current Isc_stc = 5"Short-circuit current at Standard Test Conditions"annotation(Dialog(group="Parameters of PV Modules"));
  parameter SI.LinearTemperatureCoefficient au = -0.0039 "Temperature correction factor (voltage)"annotation(Dialog(group="Parameters of PV Modules"));
  parameter SI.LinearTemperatureCoefficient ai = 0.0004 "Temperature correction factor (current)"annotation(Dialog(group="Parameters of PV Modules"));
  parameter Boolean use_input_E = false;
  parameter Boolean use_input_theta = false;
  Modelica.Blocks.Interfaces.RealOutput Iarray annotation(
    Placement(visible = true, transformation(origin = {110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Vmpp_array annotation(
    Placement(visible = true, transformation(origin = {110, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Uarray annotation(
    Placement(visible = true, transformation(origin = {-100, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput E annotation(
    Placement(visible = true, transformation(origin = {-100, 30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput theta annotation(
    Placement(visible = true, transformation(origin = {-100, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = n_parallel)  annotation(
    Placement(visible = true, transformation(origin = {70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = n_series) annotation(
    Placement(visible = true, transformation(origin = {70, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Solar.PowerFactory.DigSILENT.PVModule module(Impp_stc = Impp_stc, Isc_stc = Isc_stc, P_init = P_init / (n_series * n_parallel), U0_stc = U0_stc, Umpp_stc = Umpp_stc, ai = ai, au = au, use_input_E = use_input_E, use_input_theta = use_input_theta)  annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder module_time(T = Tr)  annotation(
    Placement(visible = true, transformation(origin = {-60, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = 1 / n_series) annotation(
    Placement(visible = true, transformation(origin = {-30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(gain.y, Iarray) annotation(
    Line(points = {{82, 50}, {104, 50}, {104, 50}, {110, 50}}, color = {0, 0, 127}));
  connect(gain1.y, Vmpp_array) annotation(
    Line(points = {{82, -50}, {104, -50}, {104, -50}, {110, -50}}, color = {0, 0, 127}));
  connect(module.E, E) annotation(
    Line(points = {{-18, 6}, {-68, 6}, {-68, 30}, {-100, 30}, {-100, 30}}, color = {0, 0, 127}));
  connect(module.theta, theta) annotation(
    Line(points = {{-18, -6}, {-60, -6}, {-60, -30}, {-100, -30}, {-100, -30}}, color = {0, 0, 127}));
  connect(module.I, gain.u) annotation(
    Line(points = {{22, 10}, {40, 10}, {40, 50}, {58, 50}, {58, 50}}, color = {0, 0, 127}));
  connect(module.Umpp, gain1.u) annotation(
    Line(points = {{22, -10}, {40, -10}, {40, -50}, {58, -50}, {58, -50}}, color = {0, 0, 127}));
  connect(module_time.u, Uarray) annotation(
    Line(points = {{-72, 70}, {-82, 70}, {-82, 70}, {-100, 70}}, color = {0, 0, 127}));
  connect(module_time.y, gain2.u) annotation(
    Line(points = {{-48, 70}, {-30, 70}, {-30, 62}, {-30, 62}}, color = {0, 0, 127}));
  connect(gain2.y, module.U) annotation(
    Line(points = {{-30, 40}, {-30, 40}, {-30, 14}, {-18, 14}, {-18, 14}}, color = {0, 0, 127}));

annotation(
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {-50, 70}, extent = {{-20, 8}, {20, -8}}, textString = "Uarray"), Text(origin = {-58, 30}, extent = {{-20, 8}, {20, -8}}, textString = "E"), Text(origin = {-54, -28}, extent = {{-20, 8}, {20, -8}}, textString = "theta"), Text(origin = {-52, -70}, extent = {{-20, 8}, {20, -8}}, textString = "P_conv"), Text(origin = {72, 52}, extent = {{-20, 8}, {20, -8}}, textString = "Iarray"), Text(origin = {59, -48}, extent = {{-37, 8}, {37, -8}}, textString = "Vmpp_array"), Text(origin = {-1, 90}, extent = {{-55, 8}, {55, -8}}, textString = "Photovoltaic Array")}));
end PVArray;
