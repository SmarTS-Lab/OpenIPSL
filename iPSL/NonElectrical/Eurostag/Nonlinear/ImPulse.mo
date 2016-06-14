within iPSL.NonElectrical.Eurostag.Nonlinear;
class ImPulse "Generate pulse signal. 2014/03/10"

  extends Modelica.Blocks.Interfaces.SISO;
  discrete Real tau(start = -Modelica.Constants.inf);
  parameter Real S "Start";
  parameter Real T "Pulse period";
equation
  when u >= S then
    tau = time;
  end when;
  if time - tau < T then
    y = 1;
  else
    y = 0;
  end if;
  annotation(Icon(graphics={                                                                       Text(extent={{
              -34,6},{26,-16}},                                                                                                    lineColor = {0, 0, 255}, textStyle = {TextStyle.Bold}, textString = "T"), Line(points={{
              -62,-18},{-34,-18},{-34,44},{26,44},{26,-18},{50,-18}},                                                                                                    color={0,0,
              255},
          thickness=0.5)}),                                                                                                    Diagram(graphics={
        Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
        Line(points={{-100,0},{-60,0}}, color={0,0,
              255}),
        Line(points={{60,0},{100,0}}, color={0,0,255}),                                                                                                    Line(points={{
              -40,-20},{-20,-20},{-20,20},{20,20},
              {20,-20},{40,-20}},                                                                                                    color={0,0,
              255},
          thickness=0.5),                                                                          Text(extent={{
              -20,-8},{22,-24}},                                                                                                   lineColor=  {0, 0, 255}, textStyle=  {TextStyle.Bold}, textString=  "T")}),
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
In this bolck, the output (y)'s changeover takes place when the input (u) switches from a value below the threshold to a value greater than or equal to it.
The switched position is held during T seconds before switching off to zero. 
</p>
<p>
This Block is equivalent to spesific PULSE Block from Eurostag.
</p>
</html>"));

end ImPulse;
