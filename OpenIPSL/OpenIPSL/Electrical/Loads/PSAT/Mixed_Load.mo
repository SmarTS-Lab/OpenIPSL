within OpenIPSL.Electrical.Loads.PSAT;
model Mixed_Load "Mixed Load"
  extends BaseClasses.baseLoad;
  parameter Real Kpf=0 "Frequency coefficient for the active power (pu)";
  parameter Real alpha=0 "Voltage exponent for the active power";
  parameter Real Tpv=0.12 "Time constant of dV/dt for the active power (s)";
  parameter Real Kqf=0 "Frequency coefficient for the reactive power (pu)";
  parameter Real beta=0 "Voltage exponent for the reactive power";
  parameter Real Tqv=0.075 "Time constant of dV/dt for the reactive power (s)";
  parameter Real Tfv=0.005 "Time constant of voltage magnitude filter (s)";
  parameter Real Tft=0.007 "Time constant of voltage angle filter (s)";
  Real deltaw "Frequency deviation (pu)";
protected
  Real a "Auxiliary variable, voltage division";
  Real b "Auxiliary variable, derivation";
  Real x(start=-v_0/Tfv);
  Real y(start=0);
equation
  a = v/v_0;
  der(x) = ((-v/Tfv) - x)/Tfv;
  b = x + v/Tfv;
  der(y) = -1/Tft*(1/(2*C.pi*fn*Tft)*(Angle_V - angle_0rad) + y);
  deltaw = y + 1/(2*C.pi*fn*Tft)*(Angle_V - angle_0rad);
  P = Kpf*deltaw + P_0/S_b*(a^alpha + Tpv*b);
  Q = Kqf*deltaw + Q_0/S_b*(a^beta + Tqv*b);
  annotation (
    Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        grid={10,10})),
    Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        grid={5,5})),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>Mixed Load, PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>September 2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>
<html>
<pre><span style=\"font-family: Courier New,courier; color: #006400;\">Remember:&nbsp;Pz+Pi+Pp=1&nbsp;and&nbsp;Qz+Qi+Qp=1;</span></pre>
</html>"));
end Mixed_Load;
