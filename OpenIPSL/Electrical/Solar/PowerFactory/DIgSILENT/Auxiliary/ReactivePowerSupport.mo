within OpenIPSL.Electrical.Solar.PowerFactory.DIgSILENT.Auxiliary;

model ReactivePowerSupport
  parameter SI.PerUnit iq_max "Maximum d-axis current";
  parameter SI.PerUnit iq_min "Minimum d-axis current";
  parameter Boolean i_EEG "Selection of the FRT Charateristic";
  parameter SI.PerUnit Deadband "Deadband for dynamic AC voltage support";
  parameter Real K_FRT "Gain for dynamic AC voltage supports";
  parameter SI.PerUnit i0 "Initial reactive current";
  Modelica.Blocks.Interfaces.RealInput duac annotation(
    Placement(visible = true, transformation(origin = {-200, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput iq annotation(
    Placement(visible = true, transformation(origin = {210, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch FRT_characteristic_selection annotation(
    Placement(visible = true, transformation(origin = {98, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanConstant FRTCharac(k=i_EEG) annotation(
    Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter(limitsAtInit = true, uMax = iq_max, uMin = iq_min)  annotation(
    Placement(visible = true, transformation(origin = {182, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Solar.PowerFactory.General.Picdro picdro(Tdrop = if i_EEG then 0 else 0.5, Tpick = 0)  annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqualThreshold(threshold = 0)  annotation(
    Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs1 annotation(
    Placement(visible = true, transformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.DeadZone deadZone(deadZoneAtInit = true, uMax = Deadband, uMin = -Deadband)  annotation(
    Placement(visible = true, transformation(origin = {-158, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant initial_current(k = i0)  annotation(
    Placement(visible = true, transformation(origin = {110, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add annotation(
    Placement(visible = true, transformation(origin = {140, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = K_FRT)  annotation(
    Placement(visible = true, transformation(origin = {-30, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch switch annotation(
    Placement(visible = true, transformation(origin = {60, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant zero_FRT_support(k = 0)  annotation(
    Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch switch1 annotation(
    Placement(visible = true, transformation(origin = {60, -50}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  SLDWindV sLDWindV(Deadband = Deadband, K_FRT = K_FRT)  annotation(
    Placement(visible = true, transformation(origin = {-30, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(FRTCharac.y, FRT_characteristic_selection.u2) annotation(
    Line(points = {{71, 0}, {86, 0}}, color = {255, 0, 255}));
  connect(limiter.y, iq) annotation(
    Line(points = {{193, 0}, {199, 0}, {199, 0}, {209, 0}}, color = {0, 0, 127}));
  connect(greaterEqualThreshold.u, abs1.y) annotation(
    Line(points = {{-82, 0}, {-100, 0}, {-100, 0}, {-98, 0}}, color = {0, 0, 127}));
  connect(greaterEqualThreshold.y, picdro.condition) annotation(
    Line(points = {{-59, 0}, {-41, 0}, {-41, 0}, {-39, 0}}, color = {255, 0, 255}));
  connect(duac, deadZone.u) annotation(
    Line(points = {{-200, 0}, {-172, 0}, {-172, 0}, {-170, 0}}, color = {0, 0, 127}));
  connect(deadZone.y, abs1.u) annotation(
    Line(points = {{-146, 0}, {-122, 0}, {-122, 0}, {-122, 0}}, color = {0, 0, 127}));
  connect(FRT_characteristic_selection.y, add.u1) annotation(
    Line(points = {{110, 0}, {120, 0}, {120, 6}, {128, 6}, {128, 6}}, color = {0, 0, 127}));
  connect(add.y, limiter.u) annotation(
    Line(points = {{152, 0}, {170, 0}, {170, 0}, {170, 0}}, color = {0, 0, 127}));
  connect(initial_current.y, add.u2) annotation(
    Line(points = {{122, -50}, {124, -50}, {124, -6}, {128, -6}, {128, -6}}, color = {0, 0, 127}));
  connect(gain.u, deadZone.y) annotation(
    Line(points = {{-42, 70}, {-136, 70}, {-136, 0}, {-146, 0}}, color = {0, 0, 127}));
  connect(picdro.trip, switch.u2) annotation(
    Line(points = {{-18, 0}, {-4, 0}, {-4, 40}, {48, 40}}, color = {255, 0, 255}));
  connect(switch.u1, gain.y) annotation(
    Line(points = {{48, 48}, {26, 48}, {26, 70}, {-19, 70}}, color = {0, 0, 127}));
  connect(switch.y, FRT_characteristic_selection.u1) annotation(
    Line(points = {{72, 40}, {80, 40}, {80, 8}, {86, 8}, {86, 8}}, color = {0, 0, 127}));
  connect(zero_FRT_support.y, switch.u3) annotation(
    Line(points = {{32, 0}, {40, 0}, {40, 32}, {48, 32}, {48, 32}}, color = {0, 0, 127}));
  connect(switch1.y, FRT_characteristic_selection.u3) annotation(
    Line(points = {{71, -50}, {80, -50}, {80, -8}, {86, -8}}, color = {0, 0, 127}));
  connect(switch1.u3, zero_FRT_support.y) annotation(
    Line(points = {{48, -42}, {40, -42}, {40, 0}, {32, 0}, {32, 0}}, color = {0, 0, 127}));
  connect(switch1.u2, picdro.trip) annotation(
    Line(points = {{48, -50}, {34, -50}, {34, -20}, {-4, -20}, {-4, 0}, {-18, 0}}, color = {255, 0, 255}));
  connect(sLDWindV.diq, switch1.u1) annotation(
    Line(points = {{-18, -80}, {34, -80}, {34, -58}, {48, -58}, {48, -58}}, color = {0, 0, 127}));
  connect(sLDWindV.duac, duac) annotation(
    Line(points = {{-38, -80}, {-176, -80}, {-176, 0}, {-200, 0}, {-200, 0}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -120}, {200, 120}}), graphics = {Rectangle(origin = {-92.8493, 0.111888}, pattern = LinePattern.Dash, extent = {{-85.0493, 19.7918}, {85.0493, -19.7918}}), Text(origin = {-67, 27}, extent = {{-55, 5}, {55, -5}}, textString = "Voltage deadband with delay"), Rectangle(origin = {-92.8493, 0.111888}, pattern = LinePattern.Dash, extent = {{-85.0493, 19.7918}, {85.0493, -19.7918}}), Rectangle(origin = {-34.5559, 68.6529}, pattern = LinePattern.Dash, extent = {{-42.6785, 15.9659}, {42.6785, -15.9659}}), Rectangle(origin = {-30.0177, -79.8509}, pattern = LinePattern.Dash, extent = {{-29.8565, 19.5166}, {29.8565, -19.5166}}), Text(origin = {-35, 90}, extent = {{-43, 4}, {43, -4}}, textString = "Transmission Code 2007"), Text(origin = {-21, -56}, extent = {{-21, 4}, {21, -4}}, textString = "SDLWindV")}),
    Icon(graphics = {Rectangle(origin = {-0.01, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-99.99, 100}, {99.99, -100}}), Text(origin = {3, 84}, extent = {{-83, 12}, {83, -12}}, textString = "Reactive Power Support"), Text(origin = {-33, 2}, extent = {{-83, 12}, {83, -12}}, textString = "duac"), Text(origin = {73, 2}, extent = {{-83, 12}, {83, -12}}, textString = "iq")}));
end ReactivePowerSupport;
