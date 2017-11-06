within PSAT_Systems.TwoAreaOld.BaseClasses;
partial model BaseOrder5
  extends PSAT_Systems.TwoAreaOld.BaseClasses.BaseNetwork;
  OpenIPSL.Electrical.Machines.PSAT.Order5_Type2 order5(
    Sn=991,
    Vn=20,
    V_b=20,
    V_0=1.05,
    angle_0=0.159255652433349,
    ra=0,
    T1d0=5,
    x2d=0.2,
    x2q=0.2,
    T2d0=0.05,
    T2q0=0.1,
    xd=1.1,
    xq=0.7,
    x1d=0.25,
    M=6,
    D=0,
    Taa=0.002,
    P_0=89.9999999999999,
    Q_0=-9.0933105025882)
    annotation (Placement(transformation(extent={{-112,-10},{-92,10}})));
equation
  connect(order5.p, bus1.p) annotation (Line(points={{-91,0.04964},{-84.35,
          0.04964},{-84.35,0},{-80,0}}, color={0,0,255}));
  connect(order5.pm, order5.pm0) annotation (Line(points={{-112,-5},{-114,-5},{
          -114,-11},{-110,-11}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
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
end BaseOrder5;
