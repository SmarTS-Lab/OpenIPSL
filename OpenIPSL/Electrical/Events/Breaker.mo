within OpenIPSL.Electrical.Events;
model Breaker
  parameter Real t_o=Modelica.Constants.inf "Opening time (s)";
  parameter Boolean rc_enabled=false "Enable reclosure";
  parameter Real t_rc=Modelica.Constants.inf "Reclosing time (s)";
  Interfaces.PwPin s annotation (Placement(transformation(extent={{-60,-10},{-40,
            10}}), iconTransformation(extent={{-60,-10},{-40,10}})));
  Interfaces.PwPin r annotation (Placement(transformation(extent={{40,-10},{60,
            10}}), iconTransformation(extent={{40,-10},{60,10}})));
  Complex vs(re=s.vr, im=s.vi);
  Complex vr(re=r.vr, im=r.vi);
  Complex is(re=s.ir, im=s.ii);
  Complex ir(re=r.ir, im=r.ii);
equation
  if time < t_o then
    vs = vr;
    is = -ir;
  elseif time > t_o + t_rc and rc_enabled then
    vs = vr;
    is = -ir;
  else
    is = Complex(0, 0);
    ir = Complex(0, 0);
  end if;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-40,-40},{40,40}}),
        graphics={Rectangle(
          extent={{-40,40},{40,-40}},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),Ellipse(
          extent={{-40,40},{40,-42}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}),
    Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>-</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>Major change - 2016-02-22</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Tin Rabuzin, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end Breaker;
