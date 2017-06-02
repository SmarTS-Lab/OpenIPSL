within OpenIPSL.Electrical.Loads.PSSE;
model Load_switch "PSS/E Load"
  extends OpenIPSL.Electrical.Loads.PSSE.BaseClasses.baseLoad;
  parameter Modelica.SIunits.Time t1 "Time of switching on";
  parameter Modelica.SIunits.Time t2 "Time of switching off";
equation
  if time >= t1 and time < t2 then
    kI*S_I.re*v + S_Y.re*v^2 + kP*S_P.re = p.vr*p.ir + p.vi*p.ii;
    kI*S_I.im*v + S_Y.im*v^2 + kP*S_P.im = (-p.vr*p.ii) + p.vi*p.ir;
  else
    p.ir = 0;
    p.ii = 0;
  end if;
  annotation (Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSS/E Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>Unknown</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Mengjia Zhang,SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end Load_switch;
