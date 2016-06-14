within iPSL.NonElectrical.Eurostag.Logical;
class ImOr "Logical 'or': p1>0 or p2>0 or p3>0 or p4>0 or p5>0.
              2016/04/26"
 extends Modelica.Blocks.Interfaces.PartialRealMISO;
initial equation
   y = if (max(u) <= 0) then 0 else 1;
equation
 y = if (max(u) <= 0) then 0 else 1;
 annotation(Icon(graphics={  Rectangle(extent={{-100,100},{100,-100}},  lineColor = {0, 0, 255}), Text(extent={{
              -40,34},{34,-16}},                                                                                                    lineColor = {0, 0, 255}, textStyle = {TextStyle.Bold}, textString = "OR")}), Diagram(graphics={
        Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),                               Text(extent={{
              -32,22},{30,-20}},                                                                                                    lineColor = {0, 0, 255}, textStyle = {TextStyle.Bold}, textString = "OR"),
        Line(points={{-90,0},{-60,0}}, color={28,108,200}),
        Line(points={{60,0},{100,0}}, color={28,108,200})}),
         Documentation(info="<html>
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
In this Block the output (y) is 1 if any the outputs (u[n]) are larger than 0 else y = 0 
<p>
This Block is equivalent to spesific OR Block from Eurostag. 
</p>
</html>"));
end ImOr;
