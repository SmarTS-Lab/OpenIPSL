within PSAT_Systems.TwoAreaOld.BaseClasses;
partial model BaseOrder6
  extends PSAT_Systems.TwoAreaOld.BaseClasses.BaseNetwork;
  OpenIPSL.Electrical.Machines.PSAT.Order6 order6(
    Sn=991,
    Vn=20,
    V_b=20,
    V_0=1.05,
    angle_0=0.159255652433349,
    ra=0,
    T1d0=5,
    x2d=0.2,
    x2q=0.2,
    xd=2,
    xq=1.91,
    x1d=0.245,
    x1q=0.42,
    T1q0=0.66,
    T2d0=0.031,
    T2q0=0.061,
    M=2.8756*2,
    D=0,
    Taa=0.002,
    P_0=89.9999999999999,
    Q_0=-9.0933105025882)
    annotation (Placement(transformation(extent={{-112,-10},{-92,10}})));
equation
  connect(order6.p, bus1.p) annotation (Line(points={{-91,0.04964},{-85.5,
          0.04964},{-85.5,0},{-80,0}}, color={0,0,255}));
  connect(order6.pm, order6.pm0) annotation (Line(points={{-112,-5},{-114,-5},{
          -114,-6},{-114,-11},{-110,-11}}, color={0,0,127}));
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
