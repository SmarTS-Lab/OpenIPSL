within iPSL.NonElectrical.Eurostag.Math;
class ImRampUpToAPower "power of the input signal 2014/03/10"
  parameter Real A "Exponent parameter";
  extends Modelica.Blocks.Interfaces.SISO;
equation
  if floor(A) == A then
    y = u ^ A;
  else
    y = abs(u) ^ A;
  end if;
  annotation (                  Icon(graphics={                                                                       Text(extent={{
              -48,60},{42,-38}},                                                                                                    lineColor=
              {0,0,255},
          textString="u"), Text(
          extent={{18,54},{50,16}},
          lineColor={0,0,255},
          textString="A")}),
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
In this Block the output (y) is equal to input (u) to the (A) power. if(A) is not a integer number them y is equal to abs(u) to the (A) power 
<p>
This Block is equivalent to spesific RAMP UP POWER Block from Eurostag. 
</p>
</html>"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={
        Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),                                                   Text(extent={{
              -32,32},{32,-18}},                                                                                                    lineColor=
              {0,0,255},
          textString="u"),
        Text(
          extent={{6,24},{26,8}},
          lineColor={0,0,255},
          textString="A"),
        Line(points={{-100,0},{-60,0}}, color={0,0,255}),
        Line(points={{60,0},{100,0}}, color={0,0,255})}));
end ImRampUpToAPower;
