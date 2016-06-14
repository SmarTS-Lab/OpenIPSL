within iPSL.NonElectrical.Eurostag.Math;
class ImArcTangent "ArcTangent. 2014/03/10"

  Modelica.Blocks.Interfaces.RealInput u1 "numerator"  annotation (Placement(transformation(extent={{-140,20},
            {-100,60}},
          rotation=0)));
  Modelica.Blocks.Interfaces.RealInput u2 "denominator"  annotation (Placement(transformation(extent={{-140,
            -60},{-100,-20}},
          rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(extent={{99,-10},
            {119,10}}),                                                                                        iconTransformation(extent={{99,-10},
            {119,10}})));
  Real a1;
  Real a2;
  //Real x0;
  Real x;
  parameter Real offset "offset of the arctan";
  parameter Real PI = 3.14159265;
equation
  a1 = 2 * PI * floor(offset / (2 * PI));
  a2 = offset - a1;
  //x0 = atan(abs(p1/p2));
  if u1 >= 0 and u2 > 0 then
    x = atan(abs(u1 / u2));
  elseif u1 >= 0 and u2 < 0 then
    x = PI - atan(abs(u1 / u2));
  elseif u1 < 0 and u2 > 0 then
    x = -atan(abs(u1 / u2));
  elseif u1 < 0 and u2 < 0 then
    x = -(PI - atan(abs(u1 / u2)));
  else
    x = 0;
  end if;
  if x <= a2 - PI then
    y = x + a1 + 2 * PI;
  elseif x > a2 + PI then
    y = x + a1 - 2 * PI;
  else
    y = x + a1;
  end if;
   annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}),
          graphics={
          Text(
          extent={{-62,66},{58,-44}},
          lineColor={0,0,255},
          textString="atan
 (N / D)")}),
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
<td><p>RAIA</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>modelica@aia.es<a href=\"mailto:modelica@aia.es\"></a></p></td>
</tr>
</table>
<P>
The computation of arctangent usually belongs to the [- &#960;, + &#960;] interval, 
It uses a OFFSET parameter to obtain a value of Y in the [OFFSET - &#960;, OFFSET + &#960;] interval.
</P>
<p>
This Block is equivalent to spesific ARC-TANGENT Block from Eurostag. 
</p>
</html>"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}),
                    graphics={
        Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
          Text(
          extent={{-46,42},{42,-26}},
          lineColor={0,0,255},
          textString="atan
 (u1 / u2)"),
        Line(points={{-100,40},{-60,40}}, color={28,108,200}),
        Line(points={{-100,-40},{-60,-40}}, color={28,108,200}),
        Line(points={{60,0},{100,0}}, color={28,108,200})}));
end ImArcTangent;
