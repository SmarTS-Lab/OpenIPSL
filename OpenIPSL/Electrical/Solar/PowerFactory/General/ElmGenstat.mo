within OpenIPSL.Electrical.Solar.PowerFactory.General;

model ElmGenstat
  import SI = Modelica.SIunits;
  extends OpenIPSL.Electrical.Essentials.pfComponent(
    final enabledisplayPF=false,
    final enablefn=true,
    final enableV_b=false,
    final enableangle_0=true,
    final enablev_0=true,
    final enableQ_0=true,
    final enableP_0=true,
    final enableS_b=true);
  parameter SI.PerUnit S_b annotation (Dialog(group="Power flow data"));
  parameter Types.ApparentPower M_b "Machine base power"
    annotation (Dialog(group="Generator parameters"));
  parameter Real angle_0rad;
  parameter Real v_0;
  SI.Angle angle_i;
  SI.Angle angle_v;
  SI.PerUnit Q;
  SI.PerUnit P;
  Modelica.Blocks.Interfaces.RealInput id_ref annotation(
    Placement(visible = true, transformation(origin = {-108, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput iq_ref annotation(
    Placement(visible = true, transformation(origin = {-108, 30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Interfaces.PwPin p(vr(start=v_0*cos(angle_0rad)), vi(start=v_0*sin(angle_0rad))) annotation(
    Placement(transformation(extent = {{90, -10}, {110, 10}})));
  Modelica.Blocks.Interfaces.RealOutput i annotation(
    Placement(visible = true, transformation(origin = {110, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput omega annotation(
    Placement(visible = true, transformation(origin = {0, 100}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 98}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Real phi;
  Modelica.Blocks.Interfaces.RealOutput v annotation(
    Placement(visible = true, transformation(origin = {110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
initial equation
phi = angle_0rad;
equation
  der(phi) = 2*Modelica.Constants.pi*50*(omega-1);
  p.ir*S_b/M_b = -(id_ref * cos(phi) - iq_ref * sin(phi));
  p.ii*S_b/M_b = -(id_ref * sin(phi) + iq_ref * cos(phi));
  P = p.vr * p.ir + p.vi * p.ii;
  Q = p.vi * p.ir - p.vr * p.ii;
  v = sqrt(p.vr ^ 2 + p.vi ^ 2);
  angle_v = atan2(p.vi, p.vr);
  i = sqrt(p.ii ^ 2 + p.ir ^ 2)*S_b/M_b;
  angle_i = atan2(p.ii, p.ir);
  annotation(
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, -100}, {100, 100}}), Text(origin = {-69.7, 50.01}, fillPattern = FillPattern.Solid, extent = {{-12.3, -8.18}, {12.3, 8.18}}, textString = "id_ref", fontName = "Arial"), Text(origin = {-63.7, -50.18}, fillPattern = FillPattern.Solid, extent = {{-12.3, -8.18}, {12.3, 8.18}}, textString = "iq_ref", fontName = "Arial"), Text(origin = {24.07, -92.08}, fillPattern = FillPattern.Solid, extent = {{-124.07, -27.92}, {76.07, -8.08}}, textString = "ElmStatgen", fontName = "Arial"), Ellipse(origin = {50, -48}, fillColor = {215, 215, 215}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {-2, -2}}, endAngle = 360), Line(origin = {-0.000710326, 0.400639}, points = {{0, -25}, {0, 25}}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 10)}, coordinateSystem(initialScale = 0.1)),
    Diagram);
end ElmGenstat;
