within OpenIPSL.Electrical.Loads.PSAT;
model LOADPQ "Constant PQ Load"
  extends BaseClasses.baseLoad;
  parameter Modelica.SIunits.PerUnit Vmax=1.2 "maximum voltage"
    annotation (Evaluate=true, Dialog(tab="To Be Implemented"));
  parameter Modelica.SIunits.PerUnit Vmin=0.8 "minimum voltage"
    annotation (Evaluate=true, Dialog(tab="To Be Implemented"));
  parameter Boolean forcePQ=true
    "force constant PQ-load, false may cause simulation problems" annotation (
    Evaluate=true,
    choices(checkBox=true),
    Dialog(tab="To Be Implemented"));
equation
  if forcePQ or initial() then
    P = P_0/S_b;
    Q = Q_0/S_b;
  elseif (V > Vmax) then
    // needs a better implementation
    P = P_0*V^2/(Vmax^2)/S_b;
    Q = Q_0*V^2/(Vmax^2)/S_b;
  elseif (V < Vmin) then
    P = P_0*V^2/Vmin^2/S_b;
    Q = Q_0*V^2/(Vmin^2)/S_b;
  else
    P = P_0/S_b;
    Q = Q_0/S_b;
  end if;

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
<td><p>No Reference identified</p></td>
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
<pre><span style=\"font-family: Courier New,courier; color: #006400;\">Equations&nbsp;come&nbsp;from&nbsp;the&nbsp;mathematical&nbsp;separation&nbsp;in&nbsp;between&nbsp;reals&nbsp;and&nbsp;imaginary&nbsp;of&nbsp;S=P+jQ=UI*</span></pre>
</html>"));
end LOADPQ;
