within OpenIPSL.Electrical.Solar.PowerFactory.General;

model ElmGenstat
  extends OpenIPSL.Electrical.Essentials.pfComponent(
    final enabledisplayPF=false,
    final enablefn=true,
    final enableV_b=false,
    final enableangle_0=true,
    final enablev_0=true,
    final enableQ_0=false,
    final enableP_0=false,
    final enableS_b=true);
  parameter Types.ApparentPower M_b "Machine base power"
    annotation (Dialog(group="Generator parameters"));
  parameter Boolean pll_connected = false "Enable/disable use of PLL inputs" annotation (Dialog(group="Generator parameters"));
  SI.Angle angle_i;
  SI.Angle angle_v;
  SI.PerUnit Q;
  SI.PerUnit P;
  Modelica.Blocks.Interfaces.RealInput id_ref annotation(
    Placement(visible = true, transformation(origin = {-108, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput iq_ref annotation(
    Placement(visible = true, transformation(origin = {-108, 30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  OpenIPSL.Interfaces.PwPin p(vr(start=v_0*cos(angle_0)), vi(start=v_0*sin(angle_0))) annotation(
    Placement(transformation(extent = {{90, -10}, {110, 10}})));
  Modelica.Blocks.Interfaces.RealOutput i annotation(
    Placement(visible = true, transformation(origin = {110, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput v annotation(
    Placement(visible = true, transformation(origin = {110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput sinref if pll_connected "Optional PLL input for sine" annotation(
    Placement(visible = true, transformation(origin = {-108, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput cosref if pll_connected "Optional PLL input for cosine"annotation(
    Placement(visible = true, transformation(origin = {-108, -70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, -100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Real sinu "Internal sine of the voltage angle";
  Real cosu "Internal cosine of the voltage angle";
equation
  if pll_connected then
    connect(sinref, sinu);
    connect(cosref, cosu);
  else
    sinu = p.vi/v;
    cosu = p.vr/v; 
  end if;
  p.ir*S_b/M_b = -(id_ref * cosu - iq_ref * sinu);
  p.ii*S_b/M_b = -(id_ref * sinu + iq_ref * cosu);
  P = p.vr * p.ir + p.vi * p.ii;
  Q = p.vi * p.ir - p.vr * p.ii;
  v = sqrt(p.vr ^ 2 + p.vi ^ 2);
  angle_v = atan2(p.vi, p.vr);
  i = sqrt(p.ii ^ 2 + p.ir ^ 2)*S_b/M_b;
  angle_i = atan2(p.ii, p.ir);
  annotation(
    Icon(graphics = {Rectangle(lineColor = {118, 18, 62}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, -160}, {100, 160}}), Text(origin = {-35.7, 100.01}, fillPattern = FillPattern.Solid, extent = {{-20.3, -10.18}, {20.3, 10.18}}, textString = "id_ref", fontName = "Arial", horizontalAlignment = TextAlignment.Left), Text(origin = {-32.7, 41.82}, fillPattern = FillPattern.Solid, extent = {{-23.3, -10.18}, {23.3, 10.18}}, textString = "iq_ref", fontName = "Arial", horizontalAlignment = TextAlignment.Left), Text(origin = {24.8302, 168.735}, lineColor = {118, 18, 62}, fillPattern = FillPattern.Solid, extent = {{-122.83, -30.7345}, {75.3098, -8.89452}}, textString = "ElmStatgen", fontName = "Arial"), Ellipse(origin = {71.43, -32.67}, lineColor = {118, 18, 62}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-71.43, 66.67}, {-1.43, -1.33}}, endAngle = 360), Line(origin = {49.9468, -19.7732}, points = {{-38, 19}, {8, 19}}, color = {118, 18, 62}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 10), Text(origin = {-30.7, -36.18}, fillPattern = FillPattern.Solid, extent = {{-21.3, -10.18}, {21.3, 10.18}}, textString = "sinref", fontName = "Arial", horizontalAlignment = TextAlignment.Left), Text(origin = {-27.7, -98.18}, fillPattern = FillPattern.Solid, extent = {{-24.3, -10.18}, {24.3, 10.18}}, textString = "cosref", fontName = "Arial", horizontalAlignment = TextAlignment.Left), Text(origin = {24.07, -122.08}, lineColor = {118, 18, 62}, fillPattern = FillPattern.Solid, extent = {{-124.07, -27.92}, {76.07, -8.08}}, textString = "%name", fontName = "Arial"), Text(origin = {74.3, 58.01}, fillPattern = FillPattern.Solid, extent = {{-20.3, -10.18}, {20.3, 10.18}}, textString = "i", fontName = "Arial", horizontalAlignment = TextAlignment.Right), Text(origin = {74.3, -81.99}, fillPattern = FillPattern.Solid, extent = {{-20.3, -10.18}, {20.3, 10.18}}, textString = "v", fontName = "Arial", horizontalAlignment = TextAlignment.Right)}, coordinateSystem(initialScale = 0.1, extent = {{-100, -160}, {100, 160}})),
    Diagram);
end ElmGenstat;
