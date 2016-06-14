within iPSL.Electrical.Loads.Eurostag;
model PwLoadwithVariation "Load with a power variation event.
              2014/03/10"
 extends iPSL.Electrical.Essentials.pfComponent;
  iPSL.Connectors.PwPin p annotation(Placement(transformation(extent = {{-80, 0}, {-60, 20}}), iconTransformation(extent = {{-80, 0}, {-60, 20}})));
  parameter Real Po = P_0/S_b "Initial Active Power in p.u.";
  parameter Real Qo = Q_0/S_b "Initial Reactive Power in p.u.";
  parameter Real t1 "Time of Load variation";
  parameter Real P2 "Active load variation in p.u.";
  parameter Real Q2 "Reactive load variation in p.u";
  Real Vo;
  Real P;
  Real Q;
  Real R;
  Real X;
  Real a;
equation
  Vo = V_0;
  if time > t1 then
    P = Po + P2;
    Q = Qo + Q2;
  else
    P = Po;
    Q = Qo;
  end if;
  a = P / Q;
  R = abs(Vo) * abs(Vo) / P * a * a / (1 + a * a);
  X = R / a;
  p.vr = R * p.ir - X * p.ii;
  p.vi = X * p.ir + R * p.ii;
  annotation(Diagram(graphics), Icon(graphics={  Rectangle(extent = {{-60, 60}, {40, -40}}, lineColor = {0, 0, 255}), Rectangle(extent = {{-40, 40}, {20, -20}}, lineColor = {0, 0, 255}), Line(points = {{-40, 40}, {20, -20}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-40, -20}, {20, 40}}, color = {0, 0, 255}, smooth = Smooth.None)}));
end PwLoadwithVariation;
