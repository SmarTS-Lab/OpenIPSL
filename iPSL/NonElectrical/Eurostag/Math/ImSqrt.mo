within iPSL.NonElectrical.Eurostag.Math;
class ImSqrt "Square Root. 2014/03/10"
  extends Modelica.Blocks.Interfaces.SISO;
equation
  y = sqrt(abs(u));
   annotation (Icon(graphics={Text(
            extent={{-200,-110},{200,-140}},
            lineColor={0,0,255},
            fillColor={255,213,170},
            fillPattern=FillPattern.Solid,
            textString="%k"), Line(
            points={{-50,34},{-46,-40},{-42,52},{50,52},{50,44}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None),
            Text(extent={{-30,30},{30,-30}},
            lineColor={0,0,255},
            fillColor={255,213,170},
            fillPattern=FillPattern.Solid,
            textString = "X"),
            Line(points = {{-26, 34}, {-26, -28}, {-26, -28}},
            color = {0, 0, 255},
            thickness=0.5,
            smooth = Smooth.None),
            Line(
            points={{32,34},{32,-28},{32,-28}},
            color = {0, 0, 255},
            thickness=0.5,
            smooth = Smooth.None)}),
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
<p><br>This Block is equivalent to spesific SQUARE ROOT Block from Eurostag. </p>
</html>"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={
                              Line(
            points={{-48,14},{-44,-20},{-36,40},{42,40},{42,32}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None),
            Text(extent={{-20,30},{22,-16}},
            lineColor={0,0,255},
            fillColor={255,213,170},
            fillPattern=FillPattern.Solid,
          textString="u"),
            Line(points={{-20,28},{-20,-16},{-20,-16}},
            color=  {0, 0, 255},
            thickness=0.5,
            smooth=  Smooth.None),
            Line(
          points={{20,28},{20,-16},{20,-16}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),
        Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
        Line(points={{-100,0},{-60,0}}, color={28,108,200}),
        Line(points={{60,0},{100,0}}, color={28,108,200})}));
end ImSqrt;
