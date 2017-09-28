within OpenIPSL.Electrical.Loads.PSAT;
model ZIP "ZIP Load"
  extends BaseClasses.baseLoad;
  parameter Real Pz=0.33 "Conductance (pu)";
  parameter Real Pi=0.33 "Active current (pu)";
  parameter Real Pp=1 - Pz - Pi "Active power (pu)";
  parameter Real Qz=0.33 "Susceptance (pu)";
  parameter Real Qi=0.33 "Reactive current (pu)";
  parameter Real Qp=1 - Qz - Qi "Reactive power (pu)";
protected
  Real a "Auxiliary variable, voltage division";
equation
  a = V/V_0;
  P = P_0/S_b*(Pz*a^2 + Pi*a + Pp);
  Q = Q_0/S_b*(Qz*a^2 + Qi*a + Qp);
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
<td><p>ZIP Load, PSAT Manual 2.1.8</p></td>
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
</html>"));
end ZIP;
