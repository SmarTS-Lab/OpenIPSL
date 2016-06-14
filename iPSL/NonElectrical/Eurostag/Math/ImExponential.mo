within iPSL.NonElectrical.Eurostag.Math;
class ImExponential "Output exponential of input.
              2014/03/10"
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Real A "exponential gain";
  parameter Real B "exponent gain";
equation
  y = A * exp(B * u);
  annotation(Icon(graphics={
          Text(
          extent={{-62,52},{42,-28}},
          lineColor={0,0,255},
          textString="Ae"),
          Text(
          extent={{-8,50},{84,24}},
          lineColor={0,0,255},
          textString=" (Bu)")}),
          Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Eurostag/Model Editor User's Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2016/04/26 by AIA<td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>RTE-AIA</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>modelica@aia.es<a href=\"mailto:modelica@aia.es\"></a></p></td>
</tr>
</table>
<p>
This Block is equivalent to spesific EXPONENTIAL Block from Eurostag. 
</p>
</html>"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={
          Text(
          extent={{-48,30},{42,-26}},
          lineColor={0,0,255},
          textString="Ae"),
          Text(
          extent={{-6,30},{68,12}},
          lineColor={0,0,255},
          textString=" (Bu)"),
        Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
        Line(points={{-100,0},{-60,0}}, color={28,108,200}),
        Line(points={{60,0},{100,0}}, color={28,108,200})}));
end ImExponential;
