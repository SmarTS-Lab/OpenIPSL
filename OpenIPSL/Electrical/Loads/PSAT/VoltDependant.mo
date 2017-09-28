within OpenIPSL.Electrical.Loads.PSAT;
model VoltDependant "Voltage Dependent Load"
  extends BaseClasses.baseLoad;
  parameter Real alphap=2.0 "Active power exponent";
  parameter Real alphaq=2.0 "Reactive power exponent";
protected
  Real a "Auxiliary variable, voltage division";
equation
  a = V/V_0;
  P = P_0/S_b*a^alphap;
  Q = Q_0/S_b*a^alphaq;
  annotation (Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={10,10})), Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>Voltage Dependent Load, PSAT Manual 2.1.8</p></td>
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
end VoltDependant;
