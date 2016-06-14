within PSAT_Systems.ThreeArea.BaseClasses;
partial model BaseOrder3
  extends BaseNetwork;

  OpenIPSL.Electrical.Machines.PSAT.Order3 order3_1(
    Sn=900,
    ra=0,
    xd=1.8,
    xd1=0.3,
    M=21,
    V_0=1.05,
    angle_0=0.820649645221365,
    D=2,
    P_0=49.9999999999999,
    Q_0=19.7946892114272,
    Td10=8,
    xq=1.7,
    V_b=1000,
    Vn=1000) annotation (Placement(transformation(extent={{-130,70},{-110,90}})));
equation
  connect(order3_1.p, B800.p) annotation (Line(points={{-109,80.0496},{-104.5,80.0496},{-104.5,80},{-100,80}}, color={0,0,255}));
  connect(order3_1.pm, order3_1.pm0) annotation (Line(points={{-130,75},{-132,75},{-132,74},{-132,70},{-132,69},{-128,69}}, color={0,0,127}));
  annotation (Documentation(revisions="<html>
<!--DISCLAIMER-->
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
</html>", info="<html>
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
