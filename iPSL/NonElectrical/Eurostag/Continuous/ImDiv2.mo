within iPSL.NonElectrical.Eurostag.Continuous;
class ImDiv2 "Quotient block.
              2014/03/10"

  Modelica.Blocks.Interfaces.RealInput u1 annotation(Placement(transformation(extent={{-128,34},
            {-100,62}}),                                                                                        iconTransformation(extent={{-119,60},
            {-99,80}})));
  Modelica.Blocks.Interfaces.RealInput u2 annotation(Placement(transformation(extent={{-127,
            -64},{-100,-36}}),                                                                                 iconTransformation(extent={{-119,
            -80},{-99,-60}})));
  Modelica.Blocks.Interfaces.RealOutput y(start = y_start) annotation(Placement(transformation(extent={{100,-14},
            {128,14}}),                                                                                                    iconTransformation(extent={{99,-10},
            {119,10}})));
  parameter Real a0 "Offset";
  parameter Real a1 "Entry 1 gain";
  parameter Real a2 "Entry 2 gain";
  parameter Boolean StartValue = false;
  parameter Real y_start = 0 "Output start value";
equation
  if u2 > 0 or u2 < 0 then
    y = u1 * a1 / (u2 * a2) + a0;
  else
    y = 1000000;
  end if;
  annotation(Icon(graphics={  Rectangle(extent={{-100,
              100},{100,-100}},                                          lineColor = {0, 0, 255}), Line(points={{
              -34,0},{32,0}},                                                                                                    color = {0, 0, 255}, smooth = Smooth.None, thickness = 1), Ellipse(extent={{
              -4,26},{6,14}},                                                                                                    lineColor = {0, 0, 255}, fillColor = {0, 0, 255},
            fillPattern =                                                                                                   FillPattern.Solid), Ellipse(extent={{
              -4,-18},{6,-28}},                                                                                                    lineColor = {0, 0, 255}, fillColor = {0, 0, 255},
            fillPattern =                                                                                                   FillPattern.Solid)}),
      Diagram(graphics={
        Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
        Line(points={{-100,48},{-60,48}}, color={0,0,
              255}),
        Line(points={{-100,-50},{-60,-50}}, color={0,0,
              255}),
        Line(points={{60,0},{100,0}}, color={0,0,255}),                                            Line(points={{
              -20,0},{20,0}},                                                                                                    color=  {0, 0, 255}, smooth=  Smooth.None, thickness=  1), Ellipse(extent={{
              -2,14},{4,8}},                                                                                                    lineColor=  {0, 0, 255}, fillColor=  {0, 0, 255},
            fillPattern=                                                                                                    FillPattern.Solid), Ellipse(extent={{
              -2,-8},{4,-14}},                                                                                                    lineColor=  {0, 0, 255}, fillColor=  {0, 0, 255},
            fillPattern=                                                                                                    FillPattern.Solid)}),
             Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Eurostag/Model Editor User's Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2016/05/18 by AIA </td>
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
This Block computes the output (y) as the ratio of the first input(u1) times the entry 1 gain to the second input (u2) times the entry 2 gain, and sum of the an offset
</p>
<p>
This Block is equivalent to spesific DIVIDER Block from Eurostag. 
</p>
</html>"));
end ImDiv2;
