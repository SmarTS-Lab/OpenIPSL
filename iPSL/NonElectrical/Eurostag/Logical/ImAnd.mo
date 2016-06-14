within iPSL.NonElectrical.Eurostag.Logical;
class ImAnd "Logical 'and': u[1]>0 and u[2]>0 and u[3]>0..... and u[nu]>0 .
              2016/04/26"
  extends Modelica.Blocks.Interfaces.PartialRealMISO;

equation
 y = if (min(u) <= 0) then 0 else 1;

annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),
                graphics={  Rectangle(extent={{-100,100},{100,-100}},  lineColor = {0, 0, 255}), Text(extent={{
              -38,34},{42,-24}},                                                                                                    lineColor = {0, 0, 255}, textStyle = {TextStyle.Bold}, textString = "AND")}), Diagram(graphics={
        Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
        Line(points={{-90,0},{-60,0}}, color={28,108,200}),
        Line(points={{60,0},{100,0}}, color={28,108,200}),                                       Text(extent={{
              -38,20},{38,-16}},                                                                                                    lineColor=  {0, 0, 255}, textStyle=  {TextStyle.Bold}, textString=  "AND")}),
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
In this Block the output (y) is 1 if all the outputs (u[n]) are larger than 0 else y = 0 
<p>
This Block is equivalent to spesific AND Block from Eurostag. 
</p>
</html>"));
end ImAnd;
