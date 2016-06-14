within iPSL.NonElectrical.Eurostag.Math;
class ImMult5 "Product. 2016/04/56"
  extends Modelica.Blocks.Interfaces.PartialRealMISO;
  parameter Real a[nu] = fill(1,nu) "Integrator gain";
  parameter Real a0 = 0 "Offset Parameter";

equation
  if size(u,1) > 0 then
     y = product(u)*product(a) + a0;
  else
     y = 0;
  end if;
  annotation (
            Icon(graphics={Text(
            extent={{-200,-110},{200,-140}},
            lineColor={0,0,255},
            fillColor={255,213,170},
            fillPattern=FillPattern.Solid,
            textString="%k"), Text(
            extent={{-60,60},{60,-60}},
            lineColor={0,0,255},
            fillColor={255,213,170},
            fillPattern=FillPattern.Solid,
            textString="x")}), Documentation(info="<HTML>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Eurostag/Model Editor User's Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>Unknown</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>AIA</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>modelica@aia.es<a href=\"mailto:modelica@aia.es\"></a></p></td>
</tr>
</table>
<p>
This blocks computes the scalar Real output \"y\" as product of the elements of the
Real input signal vector u and the sum a offset:
</p>
<blockquote><pre>
y = a[1]*u[1]*a[2]*u[2]*... a[N]*u[N] + a0;
</pre></blockquote>

<p>
The input connector is a vector of Real input signals.
When a connection line is drawn, the dimension of the input
vector is enlarged by one and the connection is automatically
connected to this new free index (thanks to the
connectorSizing annotation).
</p>
<p>
If no connection to the input connector \"u\" is present,
the output is set to zero: y=0.
</p>
<p>
This Block is equivalent to spesific MULTIPLIER Block from Eurostag. 
</p>
</HTML>"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={
        Line(points={{-90,0},{-60,0}}, color={28,108,200}),
        Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
        Line(points={{60,0},{100,0}}, color={0,0,255}),
                              Text(
            extent={{-56,60},{58,-50}},
            lineColor={0,0,255},
            fillColor={255,213,170},
            fillPattern=FillPattern.Solid,
            textString="x")}));
end ImMult5;
