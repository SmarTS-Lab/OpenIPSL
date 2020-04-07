within TwoAreas.Groups.PSAT;
model G3
  extends TwoAreas.Support.Generator;
  OpenIPSL.Electrical.Machines.PSAT.Order6 order6_1(
    Sn=900,
    Vn=20,
    ra=0.0025,
    x1d=0.3,
    D=0,
    xd=1.80,
    xq=1.7,
    x1q=0.55,
    x2d=0.25,
    x2q=0.25,
    T1d0=8,
    T1q0=0.4,
    T2d0=0.03,
    T2q0=0.05,
    V_b=V_b,
    V_0=V_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0,
    M=12.35) annotation (Placement(transformation(extent={{-34,-54},{78,56}})));
equation
  connect(order6_1.p, pwPin) annotation (Line(points={{83.6,1.27302},{94.8,
          1.27302},{94.8,0},{70,0}}, color={0,0,255}));
  connect(order6_1.vf0, order6_1.vf) annotation (Line(points={{-22.8,61.5},{-22.8,
          72},{-46,72},{-46,28.5},{-34,28.5}}, color={0,0,127}));
  connect(order6_1.pm0, order6_1.pm) annotation (Line(points={{-22.8,-59.5},{-22.8,
          -76},{-22.8,-84},{-48,-84},{-48,-26.5},{-34,-26.5}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>Two Area System PSAT, d_kundur1.mdl, PSAT</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>February 2016</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Maxime Baudette, Ahsan Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end G3;
