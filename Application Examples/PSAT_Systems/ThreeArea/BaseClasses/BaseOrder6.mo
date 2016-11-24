within PSAT_Systems.ThreeArea.BaseClasses;


partial model BaseOrder6
  extends BaseNetwork;
  OpenIPSL.Electrical.Machines.PSAT.Order6 Syn2(
    Sn=900,
    Vn=1000,
    V_b=1000,
    ra=0,
    xd=1.8,
    xd1=0.3,
    M=21,
    V_0=1.05,
    D=2,
    Tq10=0.4,
    xd2=0.25,
    xq2=0.25,
    Td20=0.03,
    Tq20=0.05,
    xq1=0.55,
    Q_0=19.7946892114274,
    angle_0=0.820649645221366,
    P_0=50) annotation (Placement(transformation(extent={{-136,68},{-112,92}})));
equation
  connect(Syn2.p, B800.p) annotation (Line(points={{-110.8,80.0596},{-107.4,80.0596},{-107.4,80},{-100,80}}, color={0,0,255}));
  connect(Syn2.pm0, Syn2.pm) annotation (Line(points={{-133.6,66.8},{-133.6,66},{-140,66},{-140,74},{-136,74}}, color={0,0,127}));
  annotation (Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>OpenIPSL:</p>
<p>Copyright 2016 SmarTS Lab (Sweden)</p>
<ul>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>

<p></p>
<p>iPSL:</p>
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>
", info="<html>
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
