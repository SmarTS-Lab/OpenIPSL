within iPSL.NonElectrical.Eurostag.Nonlinear;
class ImMonostable "Monostable. 2014/03/10"

  extends Modelica.Blocks.Interfaces.SISO;
  parameter Real S "Start";
  parameter Modelica.SIunits.Time T "Pulse period";
  Boolean mode;
  Boolean cond1;
  Boolean cond2;
protected
  discrete Modelica.SIunits.Time tau;//(start = -T);
initial equation
  pre(tau) = -T;
  mode = false;
  if u > S then
    y = 1;
  else
    y = 0;
  end if;
equation
  cond1 = u > S and pre(mode) == false;
  cond2 = u <= S and time - pre(tau) >= T;
  when {cond1, cond2} then
    mode = not pre(mode);
    tau = time;
  end when;
  if mode then
    y = 1;
  else
    y = 0;
  end if;
  annotation(Icon(graphics={                                                                       Text(extent={{
              -82,-58},{-50,-86}},                                                                                                    lineColor = {0, 0, 255}, textStyle = {TextStyle.Bold}, textString = "T"),                                                                                                    Text(extent={{
              -78,-28},{-54,-54}},                                                                                                    lineColor = {0, 0, 255}, textStyle = {TextStyle.Bold}, textString = "S"),
                                                                                                  Line(points={{
              -58,-12},{-30,-12},{-30,50},{30,50},
              {30,-12},{54,-12}},                                                                                                    color={0,0,
              255},
          thickness=0.5)}),                                                                                                    Diagram(graphics={
        Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
        Line(points={{-100,0},{-60,0}}, color={0,0,
              255}),
        Line(points={{60,0},{100,0}}, color={0,0,255}),                                             Line(points={{
              -40,-20},{-20,-20},{-20,20},{20,20},
              {20,-20},{38,-20}},                                                                                                    color={0,0,
              255},
          thickness=0.5),                                                                                                    Text(extent={{
              -48,-24},{-40,-38}},                                                                                                    lineColor = {0, 0, 255}, textStyle = {TextStyle.Bold}, textString = "S"),
                                                                                                  Text(extent={{
              -52,-40},{-36,-56}},                                                                                                    lineColor = {0, 0, 255}, textStyle = {TextStyle.Bold}, textString = "T")}),
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
Temporary overshoot for a threshold. The output's changeover from 0 to 1 (switching on) takes place when the input 
becomes greater than the threshold. The switched position is held during a time at least equal to T. Then, the changeover from 1 to 0 
(switching off) takes place when the input once more falls (or has already fallen) below the threshold. 
</p>
<p>
This Block is equivalent to spesific MONOSTABLE Block from Eurostag.
</p>
</html>"));
end ImMonostable;
