within iPSL.NonElectrical.Eurostag.Math;
class ImSetReset "Set Reset. 2014/03/10"

   Modelica.Blocks.Interfaces.RealInput u1 annotation (Placement(transformation(extent={{-140,20},
            {-100,60}},
          rotation=0)));
   Modelica.Blocks.Interfaces.RealInput u2 annotation (Placement(transformation(extent={{-140,
            -60},{-100,-20}},
          rotation=0)));
   Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(extent={{99,-10},
            {119,10}}),                                                                                          iconTransformation(extent={{99,-10},
            {119,10}})));
  parameter Real y_start "Output start value";
  Real y1(start = y_start);
equation
  y = y1;
  if (u1 > 0 or y1 > 0) and u2 <= 0 then
    y1 = 1;
  else
    y1 = 0;
  end if;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),
                  graphics={  Rectangle(extent={{-100,100},{100,-100}},  lineColor = {0, 0, 255}), Text(extent={{8,
              66},{-15,15}},                                                                                                    lineColor = {0, 0, 255}, textString = "S"), Text(extent={{
              11,-21},{-12,-68}},                                                                                                    lineColor = {0, 0, 255}, textString = "R"), Line(points={{
              -100,0},{100,0}},                                                                                                    color = {0, 0, 255}, smooth = Smooth.None), Rectangle(extent={{
              92,0},{100,-100}},                                                                                                    lineColor = {0, 0, 255}, fillColor = {0, 0, 255},
            fillPattern =                                                                                                   FillPattern.Solid)}), Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics={
        Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),                                Text(extent={{6,
              46},{-7,15}},                                                                                                    lineColor=  {0, 0, 255}, textString=  "S"),
        Line(points={{-60,0},{60,0}}, color={28,108,200}),                                                                                                    Text(extent={{8,
              -14},{-6,-48}},                                                                                                    lineColor=  {0, 0, 255}, textString=  "R"),
                                                                                                Rectangle(extent={{
              52,0},{60,-60}},                                                                                                    lineColor=  {0, 0, 255}, fillColor=  {0, 0, 255},
            fillPattern=                                                                                                    FillPattern.Solid),
        Line(points={{60,0},{100,0}}, color={28,108,200}),
        Line(points={{-100,40},{-60,40}}, color={28,108,200}),
        Line(points={{-100,-40},{-60,-40}}, color={28,108,200})}),
             Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Eurostag/Model Editor User's Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2016/04/26 by AIA</td>
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
In this Block the output (y) changes from 0 to 1 when the first input (u1) is positive and the
second one (u2) is negative or zero. The switch on position is held has long as the second input remains
negative or zero.
<p>
This Block is equivalent to spesific SET RESET Block from Eurostag. 
</p>
</html>"));
end ImSetReset;
