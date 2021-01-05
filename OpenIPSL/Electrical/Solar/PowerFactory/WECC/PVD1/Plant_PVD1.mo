within OpenIPSL.Electrical.Solar.PowerFactory.WECC.PVD1;

model Plant_PVD1
  import SI = Modelica.SIunits;
  extends OpenIPSL.Electrical.Essentials.pfComponent(P_0(fixed = false), Q_0(fixed = false), v_0(fixed = false), angle_0(fixed = false), final enabledisplayPF = false, final enablefn = true, final enableV_b = false, final enableangle_0 = true, final enablev_0 = true, final enableQ_0 = true, final enableP_0 = true, final enableS_b = true);
  parameter SI.PerUnit omega_0 "Initial frequency" annotation(
    Dialog(group = "Power flow data"));
  parameter SI.PerUnit M_b "Base power of the PV generation" annotation(
    Dialog(group = "Power flow data"));
  parameter SI.PerUnit Imax = 1.1 "Maximum allowable total converter current" annotation(
    Dialog(group = "PVD1 Model Parameters"));
  parameter Boolean PqFlag "Priority on current limit flag: 1=P prio.; 0 = Q prio." annotation(
    Dialog(group = "PVD1 Model Parameters"));
  parameter SI.Time Tg = 0.02 "Inverter current regulator time constat" annotation(
    Dialog(group = "PVD1 Model Parameters"));
  parameter SI.PerUnit Xc = 0 "Line drop compensation reactance" annotation(
    Dialog(group = "PVD1 Model Parameters"));
  parameter SI.PerUnit Qmx = 0.328 "Maximum reactive power" annotation(
    Dialog(group = "PVD1 Model Parameters"));
  parameter SI.PerUnit Qmn = -0.328 "Minimum reactive power" annotation(
    Dialog(group = "PVD1 Model Parameters"));
  parameter SI.PerUnit v0 = 0.9 "Low voltage threshold for Volt/Var Control" annotation(
    Dialog(group = "PVD1 Model Parameters"));
  parameter SI.PerUnit v1 = 1.1 "High voltage threshold for Volt/Var Control" annotation(
    Dialog(group = "PVD1 Model Parameters"));
  parameter SI.PerUnit dqdv = 0 "Voltage/Var droop compensation" annotation(
    Dialog(group = "PVD1 Model Parameters"));
  parameter SI.PerUnit fdbd = -99 "Frequency deadband over frequency response" annotation(
    Dialog(group = "PVD1 Model Parameters"));
  parameter Real Ddn = 0 "Down regulation droop" annotation(
    Dialog(group = "PVD1 Model Parameters"));
  parameter Real vr_recov = 1 "Amount of generation to reconnect after voltage disconnection" annotation(
    Dialog(group = "PVD1 Model Parameters"));
  parameter Real fr_recov = 1 "Amount of generation to reconnect after frequency disconnection" annotation(
    Dialog(group = "PVD1 Model Parameters"));
  parameter Real Ft0 = 0.99 annotation(
    Dialog(group = "PVD1 Model Parameters"));
  parameter Real Ft1 = 0.995 annotation(
    Dialog(group = "PVD1 Model Parameters"));
  parameter Real Ft2 = 1.005 annotation(
    Dialog(group = "PVD1 Model Parameters"));
  parameter Real Ft3 = 1.01 annotation(
    Dialog(group = "PVD1 Model Parameters"));
  parameter Real Vt0 = 0.88 annotation(
    Dialog(group = "PVD1 Model Parameters"));
  parameter Real Vt1 = 0.9 annotation(
    Dialog(group = "PVD1 Model Parameters"));
  parameter Real Vt2 = 1.1 annotation(
    Dialog(group = "PVD1 Model Parameters"));
  parameter Real Vt3 = 1.2 annotation(
    Dialog(group = "PVD1 Model Parameters"));
  OpenIPSL.Interfaces.PwPin p annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ElmGenstat static_generator(M_b = M_b, S_b = S_b, angle_0rad = angle_0rad, v_0 = v_0) annotation(
    Placement(visible = true, transformation(origin = {50, -3.55271e-15}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput omega annotation(
    Placement(visible = true, transformation(origin = {100, 70}, extent = {{20, -20}, {-20, 20}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  DynEq.Elements.Solar.WECC.PVD1 pvd1(Ddn = Ddn, Ft0 = Ft0, Ft1 = Ft1, Ft2 = Ft2, Ft3 = Ft3, Imax = Imax, PqFlag = PqFlag, Pref = P_0 / M_b, Qmn = Qmn, Qmx = Qmx, Qref = Q_0 / M_b, Tg = Tg, Vt0 = Vt0, Vt1 = Vt1, Vt2 = Vt2, Vt3 = Vt3, Xc = Xc, dqdv = dqdv, fdbd = fdbd, fr_recov = fr_recov, u_0 = v_0, v0 = v0, v1 = v1, vr_recov = vr_recov) annotation(
    Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(static_generator.p, p) annotation(
    Line(points = {{60, 0}, {110, 0}}, color = {0, 0, 255}));
  connect(omega, static_generator.omega) annotation(
    Line(points = {{100, 70}, {50, 70}, {50, 10}, {50, 10}}, color = {0, 0, 127}));
  connect(pvd1.Ip, static_generator.id_ref) annotation(
    Line(points = {{20, 6}, {38, 6}, {38, 4}, {40, 4}}, color = {0, 0, 127}));
  connect(pvd1.Iq, static_generator.iq_ref) annotation(
    Line(points = {{20, -4}, {40, -4}, {40, -6}, {40, -6}}, color = {0, 0, 127}));
  connect(static_generator.i, pvd1.It) annotation(
    Line(points = {{62, 6}, {68, 6}, {68, 14}, {-4, 14}, {-4, 2}, {0, 2}, {0, 4}}, color = {0, 0, 127}));
  connect(static_generator.v, pvd1.Vt) annotation(
    Line(points = {{62, -8}, {72, -8}, {72, 20}, {-8, 20}, {-8, 6}, {0, 6}, {0, 8}}, color = {0, 0, 127}));
  connect(omega, pvd1.freq) annotation(
    Line(points = {{100, 70}, {-16, 70}, {-16, -2}, {0, -2}, {0, -2}}, color = {0, 0, 127}));
protected
  annotation(
    Icon(graphics = {Ellipse(origin = {50, -48}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-150, 148}, {50, -52}}, endAngle = 360), Line(origin = {-0.0673837, 60.7896}, points = {{0, -83}, {0, 25}}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 10), Text(origin = {-1, -52}, extent = {{-65, 12}, {65, -12}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end Plant_PVD1;
