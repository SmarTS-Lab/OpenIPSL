within OpenIPSL.Electrical.Buses;
model BusExt
  outer OpenIPSL.Electrical.SystemBase SysData
    "Must add this line in all models";
  parameter Integer np(min=0) = 0 "Number of left connection"
    annotation (Dialog(connectorSizing=true), HideResult=true);
  parameter Integer nn(min=0) = 0 "Number of right connections"
    annotation (Dialog(connectorSizing=true), HideResult=true);
  OpenIPSL.Interfaces.PwPin p[np] annotation (Placement(
      transformation(
        origin={-20.0001,1},
        extent={{-9.99994,-99},{10.0001,99}}),
      iconTransformation(
        origin={20,0},
        extent={{-4,-60},{4,60}})));
  OpenIPSL.Interfaces.PwPin n[nn] annotation (Placement(
      transformation(
        origin={20,0},
        extent={{-12,-100},{12,100}}),
      iconTransformation(
        extent={{-4,-60},{4,60}})));
  SI.PerUnit v(start=v_0) "Bus voltage magnitude (pu)";
  SI.Conversions.NonSIunits.Angle_deg angle(start=angle_0) "Bus voltage angle";
  parameter SI.PerUnit v_0=1 "Voltage magnitude (pu)"
    annotation (Dialog(group="Power flow data"));
  parameter SI.Conversions.NonSIunits.Angle_deg angle_0=0 "Voltage angle"
    annotation (Dialog(group="Power flow data"));
  parameter SI.Voltage V_b=130e3 "Base voltage"
    annotation (Dialog(group="Power flow data"));
  parameter SI.ApparentPower S_b=SysData.S_b "System base power"
    annotation (Dialog(group="Power flow data"));
protected
  parameter SI.Angle angle_0rad = SI.Conversions.from_deg(angle_0) "Intial angle in rad";
  parameter SI.PerUnit vr0=v_0*cos(angle_0rad);
  parameter SI.PerUnit vi0=v_0*sin(angle_0rad);
equation
  if np > 1 then
    for i in 2:np loop
      connect(p[1], p[i]);
    end for;
  end if;
  if nn > 1 then
    for i in 2:nn loop
      connect(n[1], n[i]);
    end for;
  end if;
  if np > 0 and nn > 0 then
    connect(p[1], n[1]);
  end if;
  if np > 0 then
    v = sqrt(p[1].vr^2 + p[1].vi^2);
    angle = SI.Conversions.to_deg(atan2(p[1].vi, p[1].vr));
  elseif nn > 0 then
    v = sqrt(n[1].vr^2 + n[1].vi^2);
    angle = SI.Conversions.to_deg(atan2(n[1].vi, n[1].vr));
  else
    v = 0;
    angle = 0;
  end if;
  annotation (
    Diagram(coordinateSystem(extent={{0,-100},{20,100}})),
    Icon(coordinateSystem(extent={{0,-100},{20,100}}, preserveAspectRatio=false),
        graphics={Rectangle(
          extent={{0,100},{20,-100}},
          lineColor={0,0,255},
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid)}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>None</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2017-07-07</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Jan Lavenius, Giuseppe Laera, KTH Royal Institute of Technology; <a href=\"https://github.com/tbeu\">tbeu</a> </p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end BusExt;
