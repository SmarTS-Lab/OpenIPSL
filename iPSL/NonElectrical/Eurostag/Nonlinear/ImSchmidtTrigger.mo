within iPSL.NonElectrical.Eurostag.Nonlinear;
class ImSchmidtTrigger "Switching with hysteresis. 2014/03/10"

  extends Modelica.Blocks.Interfaces.SISO;
  parameter Real XMAX;
  parameter Real XMIN;
  parameter Real initValue;
  Real y1(start = initValue);
equation
  if u - XMAX + y1 * (XMAX - XMIN) <= 0 then
    y1 = 0;
  else
    y1 = 1;
  end if;
  y = y1;
  //assert(XMIN > XMAX, "XMIN must be smaller than XMAX");
  annotation(Diagram(graphics={
        Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
        Line(points={{-100,0},{-60,0}}, color={0,0,
              255}),
        Line(points={{60,0},{100,0}}, color={0,0,255}),
        Text(
          extent={{-38,16},{36,-6}},
          lineColor={0,0,255},
          lineThickness=0.5,
          textString="Schmidt
Trigger")}),                    Icon(graphics={                                                                       Line(points={{
              -42,12},{8,12}},                                                                                                    color={0,0,
              255},
          thickness=0.5),                                                                                                    Line(points={{8,
              12},{8,52},{8,52}},                                                                                                    color={0,0,
              255},
          thickness=0.5),                                                                                                    Line(points={{
              -8,12},{-8,50}},                                                                                                    color={0,0,
              255},
          thickness=0.5),                                                                                                    Line(points={{8,
              52},{58,52}},                                                                                                    color={0,0,
              255},
          thickness=0.5),                                                                                                    Line(points={{
              -10,20},{-8,18},{-6,20}},                                                                                                    color={0,0,
              255},
          thickness=0.5),                                                                                                    Line(points={{8,
              32},{6,30},{8,32},{10,30}},                                                                                                    color={0,0,
              255},
          thickness=0.5),                                                                                                    Line(points={{
              56,-8},{28,-8},{28,-36},{12,-36},{2,
              -36}},                                                                                                    color={0,0,
              255},
          thickness=0.5),                                                                                                    Line(points={{
              58,-48},{28,-48},{28,-78},{22,-78},{
              2,-78}},                                                                                                    color={0,0,
              255},
          thickness=0.5),                                                                                                    Line(points={{
              28,-20},{26,-22},{28,-20},{30,-22}},                                                                                                    color={0,0,
              255},
          thickness=0.5),                                                                                                    Line(points={{
              28,-62},{26,-64},{28,-62},{30,-64}},                                                                                                    color={0,0,
              255},
          thickness=0.5)}),
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
In this Block, if y = 0, y remains equal to 0 as long as x £ xmax and becomes equal to 1 as soon as x > xmax
if y = 1, y remains equal to 1 as long as x > xmin and becomes equal to 0 as soon as x £ xmin 
</p>
<p>
This Block is equivalent to spesific SCHMIDT-TRIGGER Block from Eurostag.
</p>
</html>"));
end ImSchmidtTrigger;
