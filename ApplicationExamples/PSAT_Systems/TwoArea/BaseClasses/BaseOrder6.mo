within PSAT_Systems.TwoArea.BaseClasses;
partial model BaseOrder6
  extends BaseNetwork;
  OpenIPSL.Electrical.Machines.PSAT.Order6 order6(
    Sn=991,
    Vn=20,
    V_b=20,
    V_0=1.05,
    ra=0,
    T1d0=5,
    angle_0=0.145884959290248,
    x2d=0.2,
    x2q=0.2,
    M=6,
    xd=2,
    xq=1.91,
    x1d=0.245,
    x1q=0.42,
    T1q0=0.66,
    T2d0=0.031,
    T2q0=0.061,
    P_0=109.9999999999998,
    Q_0=-13.6620666228504,
    D=0,
    Taa=0.002)
    annotation (Placement(transformation(extent={{-120,20},{-100,40}})));
equation
  connect(order6.p, B1.p) annotation (Line(points={{-99,30.0496},{-89.5,30.0496},
          {-89.5,30},{-80,30}}, color={0,0,255}));
  connect(order6.pm, order6.pm0) annotation (Line(points={{-120,25},{-122,25},{
          -122,19},{-118,19}}, color={0,0,127}));
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
end BaseOrder6;
