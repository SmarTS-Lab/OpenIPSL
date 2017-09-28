within PSAT_Systems.ThreeArea.BaseClasses;
partial model BaseOrder5
  extends BaseNetwork;
  OpenIPSL.Electrical.Machines.PSAT.Order5_Type2 Syn2(
    Sn=900,
    Vn=1000,
    V_b=1000,
    ra=0,
    xd=1.8,
    xd1=0.3,
    M=21,
    V_0=1.05,
    D=2,
    angle_0=0.820649645221366,
    xd2=0.25,
    xq2=0.25,
    Td20=0.03,
    Tq20=0.05,
    P_0=50,
    Q_0=19.7946892114274,
    xq=1.7,
    Td10=8,
    Taa=0.002)
    annotation (Placement(transformation(extent={{-140,68},{-116,92}})));
equation
  connect(Syn2.pm, Syn2.pm0) annotation (Line(points={{-140,74},{-144,74},{-144,
          66.8},{-137.6,66.8}}, color={0,0,127}));
  connect(Syn2.p, B800.p) annotation (Line(points={{-114.8,80.0596},{-107.4,
          80.0596},{-107.4,80},{-100,80}}, color={0,0,255}));
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
end BaseOrder5;
