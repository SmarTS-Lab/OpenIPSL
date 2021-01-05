within OpenIPSL.Electrical.Solar.PowerFactory.General;
model StaVmeas
  parameter Real Tfe = 3 / 50;
  parameter Real fn = 50;
  parameter Real omega_0;
  parameter Real angle_0rad;
  parameter Real v_0;
  OpenIPSL.Interfaces.PwPin p annotation (
    Placement(visible = true, transformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput u annotation (
    Placement(visible = true, transformation(origin = {118, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput fe annotation (
    Placement(visible = true, transformation(origin = {108, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Real cosphi;
  Real sinphi;
  Real df;
  Real phi; 
  Real vx;
  Real vy;
  Modelica.Blocks.Interfaces.RealInput omega annotation(
    Placement(visible = true, transformation(origin = {-100, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
initial equation
df = 0;
phi = angle_0rad;
equation
  // First this has to be transformed to the rotating reference frame (w.r.t. the frequency of the reference machine) to correspond to PowerFactory implementation
  der(phi) = 2*Modelica.Constants.pi*50*(omega-1);
  vx = p.vr*cos(phi) + p.vi *sin(phi);
  vy = -p.vr*sin(phi) + p.vi*cos(phi);

  u = sqrt(p.vr ^ 2 + p.vi ^ 2);
  der(cosphi) = (vx / u - cosphi) / Tfe;
  der(sinphi) = (vy / u - sinphi) / Tfe;
  if abs(cosphi) > abs(sinphi) then
    df = der(sinphi) / cosphi / (2 * Modelica.Constants.pi * fn);
  else
    df = -der(cosphi) / sinphi / (2 * Modelica.Constants.pi * fn);
  end if;
  // The following line is different from the PF due to different reference frames (most likely)
  fe = omega+df;
  p.ii = 0;
  p.ir = 0;
  annotation (
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, 90}, extent = {{-100, 10}, {100, -10}}, textString = "StaVmeas"), Text(origin = {0, 50}, extent = {{62, 8}, {100, -10}}, textString = "u"), Text(origin = {0, -50}, extent = {{62, 8}, {100, -10}}, textString = "fe")}, coordinateSystem(initialScale = 0.1)),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end StaVmeas;
