within iPSL.Electrical.Loads.Eurostag;
class PwLoadPQ "Constant Power load defined by active power P and reactive power Q.
              2013"

  iPSL.Connectors.PwPin p(vr(start= Vo_real), vi(start= Vo_img), ir(start=1), ii(start=0))   annotation(Placement(transformation(extent = {{-56, -10}, {-36, 10}}), iconTransformation(extent = {{-80, 0}, {-60, 20}})));
  parameter Real P "Active Power p.u.";
  parameter Real Q "Reactive Power in p.u.";
  parameter Real V_0=1 "Voltage magnitude (pu)" annotation (Dialog(group="Power flow data"));
  parameter Real angle_0=0 "Voltage angle (deg)" annotation (Dialog(group="Power flow data"));
 parameter Real Vo_real = V_0*cos(angle_0*Modelica.Constants.pi/180)
    "Initial voltage at node in p.u. (Real part)";
  parameter Real Vo_img = V_0*sin(angle_0*Modelica.Constants.pi/180)
    "Initial voltage at node in p.u. (Imaginary part)";
  Real angle(start = angle_0);
  Real v(start = V_0);
equation
  P = p.vr * p.ir + p.vi * p.ii;
  Q = (-p.vr * p.ii) + p.vi * p.ir;
  angle = atan2(p.vi, p.vr);
  v = sqrt(p.vr ^ 2 + p.vi ^ 2);
  annotation(Diagram(graphics), Icon(graphics={  Rectangle(extent = {{-60, 60}, {40, -40}}, lineColor = {0, 0, 255}), Rectangle(extent = {{-40, 40}, {20, -20}}, lineColor = {0, 0, 255}), Line(points = {{-40, 40}, {20, -20}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-40, -20}, {20, 40}}, color = {0, 0, 255}, smooth = Smooth.None)}));
end PwLoadPQ;
