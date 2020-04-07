within PSAT_Systems.ThreeArea.BaseClasses;
partial model BaseOrder4
  extends BaseNetwork;
  OpenIPSL.Electrical.Machines.PSAT.Order4 order4_1(
    Sn=900,
    Vn=1000,
    V_b=1000,
    ra=0,
    xd=1.8,
    x1d=0.3,
    M=21,
    V_0=1.05,
    angle_0=0.820649645221365,
    P_0=49.9999999999999,
    Q_0=19.7946892114272,
    D=2,
    T1q0=0.4,
    xq=1.7,
    x1q=0.5,
    T1d0=8) annotation (Placement(transformation(extent={{-140,68},{-116,92}})));
equation
  connect(order4_1.p, B800.p) annotation (Line(points={{-114.8,80.0596},{-107.4,
          80.0596},{-107.4,80},{-100,80}}, color={0,0,255}));
  connect(order4_1.pm, order4_1.pm0) annotation (Line(points={{-140,74},{-144,
          74},{-144,66.8},{-137.6,66.8}}, color={0,0,127}));
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
end BaseOrder4;
