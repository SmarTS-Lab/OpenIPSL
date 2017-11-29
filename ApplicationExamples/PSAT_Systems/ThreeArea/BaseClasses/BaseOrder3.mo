within PSAT_Systems.ThreeArea.BaseClasses;
partial model BaseOrder3
  extends BaseNetwork;
  OpenIPSL.Electrical.Machines.PSAT.Order3 order3_1(
    Sn=900,
    ra=0,
    xd=1.8,
    x1d=0.3,
    M=21,
    V_0=1.05,
    angle_0=0.820649645221365,
    D=2,
    P_0=49.9999999999999,
    Q_0=19.7946892114272,
    T1d0=8,
    xq=1.7,
    V_b=1000,
    Vn=1000)
    annotation (Placement(transformation(extent={{-130,70},{-110,90}})));
equation
  connect(order3_1.p, B800.p) annotation (Line(points={{-109,80.0496},{-104.5,
          80.0496},{-104.5,80},{-100,80}}, color={0,0,255}));
  connect(order3_1.pm, order3_1.pm0) annotation (Line(points={{-130,75},{-132,
          75},{-132,74},{-132,70},{-132,69},{-128,69}}, color={0,0,127}));
  annotation (Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p></p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>Tin Rabuzin, May 2016</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Yuwa Chompoobutrgool, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end BaseOrder3;
