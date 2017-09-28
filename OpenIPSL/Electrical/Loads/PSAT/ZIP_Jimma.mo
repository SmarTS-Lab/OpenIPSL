within OpenIPSL.Electrical.Loads.PSAT;
model ZIP_Jimma "Jimma's Load"
  extends BaseClasses.baseLoad;
  parameter Real Tf=0.01 "Time constant of the high-pass filter (s)";
  parameter Real Pz=0.33 "Conductance";
  parameter Real Pi=0.33 "Active current";
  parameter Real Pp=1 - Pz - Pi "Active power";
  parameter Real Qz=0.33 "Susceptance";
  parameter Real Qi=0.33 "Reactive current";
  parameter Real Qp=1 - Qz - Qi "Reactive power";
  parameter Real Kv=100 "coefficient of the voltage time derivative (1/s)";
protected
  Real a "Auxiliary variable, voltage division";
  Real b "Auxiliary variable, derivation";
  Real x(start=0);
initial equation
  der(x) = 0;
equation
  a = V/V_0;
  der(x) = ((-V/Tf) - x)/Tf;
  b = x + V/Tf;
  P = P_0/S_b*(Pz*a^2 + Pi*a + Pp);
  Q = Q_0/S_b*(Qz*a^2 + Qi*a + Qp + Kv*b);
  annotation (
    Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={10,10})),
    Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={5,5})),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>Jimma's Load, PSAT Manual 2.1.8</p></td>
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
<pre><span style=\"font-family: Courier New,courier; color: #006400;\">Remember:&nbsp;Pz+Pi+Pp=1&nbsp;and&nbsp;Qz+Qi+Qp=1</span></pre>
</html>"));
end ZIP_Jimma;
