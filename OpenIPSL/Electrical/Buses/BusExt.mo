within OpenIPSL.Electrical.Buses;
model BusExt
  outer OpenIPSL.Electrical.SystemBase SysData
    "Must add this line in all models";
  parameter Integer np(min=0) = 0 "Number of left connection"
    annotation (Dialog(connectorSizing=true), HideResult=true);
  parameter Integer nn(min=0) = 0 "Number of right connections"
    annotation (Dialog(connectorSizing=true), HideResult=true);
  OpenIPSL.Interfaces.PwPin p[np] annotation (Placement(
      visible=true,
      transformation(
        origin={-20.0001,1},
        extent={{-9.99994,-99},{10.0001,99}},
        rotation=0),
      iconTransformation(
        origin={20,0},
        extent={{-4,-60},{4,60}},
        rotation=0)));
  OpenIPSL.Interfaces.PwPin n[nn] annotation (Placement(
      visible=true,
      transformation(
        origin={20,0},
        extent={{-12,-100},{12,100}},
        rotation=0),
      iconTransformation(
        origin={0,0},
        extent={{-4,-60},{4,60}},
        rotation=0)));
  Real V(start=V_0) "Bus voltage magnitude (pu)";
  Real angle(start=angle_0) "Bus voltage angle (deg)";
  parameter Real V_0=1 "Voltage magnitude (pu)"
    annotation (Dialog(group="Power flow data"));
  parameter Real angle_0=0 "Voltage angle (deg)"
    annotation (Dialog(group="Power flow data"));
  parameter Real V_b=130 "Base voltage (kV)"
    annotation (Dialog(group="Power flow data"));
  parameter Real S_b=SysData.S_b "System base power (MVA)"
    annotation (Dialog(group="Power flow data"));
protected
  parameter Real vr0=V_0*cos(angle_0*Modelica.Constants.pi/180);
  parameter Real vi0=V_0*sin(angle_0*Modelica.Constants.pi/180);
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
    V = sqrt(p[1].vr^2 + p[1].vi^2);
    angle = atan2(p[1].vi, p[1].vr)*180/Modelica.Constants.pi;
  elseif nn > 0 then
    V = sqrt(n[1].vr^2 + n[1].vi^2);
    angle = atan2(n[1].vi, n[1].vr)*180/Modelica.Constants.pi;
  else
    V = 0;
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
</html>", revisions=""),
    uses(OpenIPSL(version="1.0.0"), Modelica(version="3.2.1")));
end BusExt;
