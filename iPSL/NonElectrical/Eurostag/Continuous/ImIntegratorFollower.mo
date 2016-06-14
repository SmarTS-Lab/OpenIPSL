within iPSL.NonElectrical.Eurostag.Continuous;
class ImIntegratorFollower "Integrator Follower. 2014/03/10"

  Modelica.Blocks.Interfaces.RealInput u1 annotation(Placement(transformation(extent={{-119,60},
            {-99,80}}),                                                                                         iconTransformation(extent={{-119,60},
            {-99,80}})));
  Modelica.Blocks.Interfaces.RealInput u2 annotation(Placement(transformation(extent={{-119,
            -10},{-99,10}}),                                                                                     iconTransformation(extent={{-119,
            -10},{-99,10}})));
  Modelica.Blocks.Interfaces.RealInput u3 annotation(Placement(transformation(extent={{-119,
            -80},{-99,-60}}),                                                                                     iconTransformation(extent={{-119,
            -80},{-99,-60}})));
  Modelica.Blocks.Interfaces.RealOutput y(start= y_start) annotation(Placement(transformation(extent={{99,-10},
            {119,10}}),                                                                                                    iconTransformation(extent={{99,-10},
            {119,10}})));
  parameter Real y_start "Output start value";
  parameter Real K "Gain Value";
  parameter Real T "Time Constant";
//initial equation
 // y = if u1 <= 0 then u3 else 0;
equation
  if u1 > 0 then
    der(y) = K * u2;
  else
    der(y) = 1 / T * (u3 - y);
  end if;
  //assert(T == 0, "T must be different of 0");
  annotation(Icon(graphics={  Rectangle(extent={{-100,100},{100,-100}},  lineColor = {0, 0, 255}), Text(extent={{
              64,82},{28,48}},                                                                                                    lineColor = {0, 0, 255}, textString = "K"), Text(extent={{
              66,48},{24,16}},                                                                                                    lineColor = {0, 0, 255}, textString = "S"), Line(points={{
              24,48},{52,48},{66,48}},                                                                                                    color={0,0,
              255},
          thickness=0.5),                                                                                                    Text(extent={{
              62,-12},{26,-40}},                                                                                                    lineColor = {0, 0, 255}, textString = "1"), Text(extent={{
              66,-40},{26,-68}},                                                                                                    lineColor = {0, 0, 255}, textString = "1+Ts"), Line(points={{
              26,-40},{60,-40},{66,-40}},                                                                                                    color={0,0,
              255},
          thickness=0.5),                                                                                                    Text(extent={{
              -82,-8},{-44,-36}},                                                                                                    lineColor = {0, 0, 255}, textString = "K"), Text(extent={{
              -82,-48},{-44,-68}},                                                                                                    lineColor = {0, 0, 255}, textString = "T"), Text(extent={{
              -86,-76},{-48,-100}},                                                                                                    lineColor = {0, 0, 255}, textString = "-/0")}), Diagram(graphics={
        Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
        Line(points={{-100,70},{-80,70},{-80,40},{
              -60,40}}, color={28,108,200}),
        Line(points={{-100,0},{-60,0}}, color={28,
              108,200}),
        Line(points={{-100,-70},{-80,-70},{-80,-40},
              {-60,-40}}, color={28,108,200}),                                                     Text(extent={{
              52,44},{32,26}},                                                                                                    lineColor = {0, 0, 255}, textString = "K"), Text(extent={{
              56,26},{28,10}},                                                                                                    lineColor = {0, 0, 255}, textString = "S"), Line(points={{
              30,26},{42,26},{52,26}},                                                                                                    color={0,0,
              255},
          thickness=0.5),                                                                                                    Text(extent={{
              50,-14},{32,-32}},                                                                                                    lineColor = {0, 0, 255}, textString = "1"), Text(extent={{
              54,-32},{32,-44}},                                                                                                    lineColor = {0, 0, 255}, textString = "1+Ts"), Line(points={{
              30,-32},{48,-32},{54,-32}},                                                                                                    color={0,0,
              255},
          thickness=0.5),                                                                                                    Text(extent={{
              -46,8},{-34,-4}},                                                                                                    lineColor = {0, 0, 255}, textString = "K"), Text(extent={{
              -46,-10},{-34,-22}},                                                                                                    lineColor = {0, 0, 255}, textString = "T"), Text(extent={{
              -48,-34},{-36,-48}},                                                                                                    lineColor = {0, 0, 255}, textString = "-/0"),
        Line(points={{60,0},{100,0}}, color={28,108,
              200})}),
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
If the first input (u1) is largest than 0, this block computes the output (y) as integral of the second input (u2) multiplied with the gain k 
else it defines the transfer function between the input u3 and the output y with a gain equal to 1. 
</p>
<p>
This Block is equivalent to spesific INTEGRATOR FOLLOWER Block from Eurostag. 
</p>
</html>"));
end ImIntegratorFollower;
