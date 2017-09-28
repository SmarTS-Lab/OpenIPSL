within Namsskogan_Grid;
model StaticCondenser
  parameter Real B "Susceptance, (p.u.)";
  OpenIPSL.Interfaces.PwPin p
    annotation (Placement(transformation(extent={{80,-8},{100,12}})));
  Real V "Voltage magnitude (pu)";
  Real Angle_V "voltage angle (rad)";
  Real Q "Reactive power (pu)";

equation
  0 = p.vr*p.ir + p.vi*p.ii;
  Q = p.vi*p.ir - p.vr*p.ii;
  V = sqrt(p.vr^2 + p.vi^2);
  Angle_V = atan2(p.vi, p.vr);
  Q = B*V^2;
end StaticCondenser;
