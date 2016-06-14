within iPSL.NonElectrical.Eurostag.Nonlinear;
class ImDelay_2 "Delay_2. 2014/03/10"

  extends Modelica.Blocks.Interfaces.SISO;
  parameter Real T "Delay time";
  parameter Real SimpleLagStartValue;
  iPSL.NonElectrical.Continuous.SimpleLag SimpleLag(K = 1, T = T / 20, y_start = SimpleLagStartValue) annotation(Placement(transformation(extent={{-66,-22},
            {-22,22}})));
  Modelica.Blocks.Nonlinear.FixedDelay Delay(delayTime = T) annotation(Placement(transformation(extent={{8,-22},
            {52,22}})));
equation
  connect(u, SimpleLag.u) annotation(Line(points={{-120,0},
          {-70.4,0}},                                                       color = {0, 0, 127}, smooth = Smooth.None));
  connect(SimpleLag.y, Delay.u) annotation(Line(points={{-19.8,0},
          {3.6,0}},                                                                  color = {0, 0, 127}, smooth = Smooth.None));
  connect(Delay.y, y) annotation(Line(points={{54.2,0},
          {110,0}},                                                      color = {0, 0, 127}, smooth = Smooth.None));

  annotation(Icon(graphics={                                                                       Text(extent={{
              -46,64},{52,-12}},                                                                                                    lineColor = {0, 0, 255}, textStyle = {TextStyle.Bold}, textString = "Delay_2"), Text(extent={{
              -36,-2},{42,-40}},                                                                                                    lineColor = {0, 0, 255},
            horizontalAlignment =                                                                                                   TextAlignment.Left, textString = "e^(-Ts) ", textStyle = {TextStyle.Bold})}),
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
This block computes the output (y(t)) as the simple-lag response of input u at the time (t-T)
</p>
<p>
This Block is equivalent to spesific DELAY_2 Block from Eurostag. 
</p>
</html>"));
end ImDelay_2;
