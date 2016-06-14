within iPSL.NonElectrical.Eurostag.Logical;
class ImOumaint "Logical OR with Hold. 2014/03/10"
  extends Modelica.Blocks.Interfaces.PartialRealMISO;
  parameter Real y_start;
equation
 y = if (min(u) <= 0) and y_start <= 0 then 0 else 1;
  annotation(Icon(graphics={  Rectangle(extent={{-100,100},{100,-100}},  lineColor = {0, 0, 255}), Text(extent={{
              -28,50},{28,-14}},                                                                                                    lineColor = {0, 0, 255}, fillColor = {0, 0, 255},
            fillPattern =                                                                                                   FillPattern.Solid, textString = "OR"),                                                                                                    Text(extent={{
              31,-13},{80,-44}},                                                                                                    lineColor = {0, 0, 255}, fillColor = {0, 0, 255},
            fillPattern =                                                                                                   FillPattern.Solid, textString = "S"), Text(extent={{
              44,-64},{79,-93}},                                                                                                    lineColor = {0, 0, 255}, fillColor = {0, 0, 255},
            fillPattern =                                                                                                   FillPattern.Solid, textString = "R"),
        Line(points={{100,-52},{12,-52},{12,-100}}, color={28,108,200}),
        Line(points={{100,-4},{12,-4},{12,-52}}, color={28,108,200})}),                                                                                             Diagram(graphics={
        Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
        Line(points={{60,-40},{0,-40},{0,-60}}, color={28,108,200}),
        Line(points={{60,-20},{0,-20},{0,-40}}, color={28,108,200}),                               Text(extent={{
              -18,26},{14,-12}},                                                                                                    lineColor=  {0, 0, 255}, fillColor=  {0, 0, 255},
            fillPattern=                                                                                                    FillPattern.Solid, textString=  "OR"),
                                                                                                  Text(extent={{
              22,-22},{36,-36}},                                                                                                    lineColor=
              {0,0,255},                                                                                                    fillColor=
              {0,0,255},
            fillPattern=FillPattern.Solid,
          textString="S"),                                                                         Text(extent={{
              22,-44},{36,-58}},                                                                                                    lineColor=
              {0,0,255},                                                                                                    fillColor=
              {0,0,255},
            fillPattern=FillPattern.Solid,
          textString="R"),
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
The output's changeover from 0 to 1 (switching on) when one of the inputs becomes positive.
Switching off is impossible.
<p>
This Block is equivalent to spesific OUMAINT Block from Eurostag. 
</p>
</html>"));
end ImOumaint;
