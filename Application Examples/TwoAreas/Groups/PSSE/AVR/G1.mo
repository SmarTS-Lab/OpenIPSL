within TwoAreas.Groups.PSSE.AVR;


model G1
  extends TwoAreas.Support.Generator;
  OpenIPSL.Electrical.Machines.PSSE.GENROU g1(
    Tpd0=8,
    Tppd0=0.03,
    Tppq0=0.05,
    H=6.5,
    Xd=1.8,
    Xq=1.7,
    Xpd=0.3,
    Xppd=0.25,
    Xppq=0.25,
    Xl=0.2,
    R_a=0.0025,
    D=0.02,
    S12=0.802,
    S10=0.18600,
    M_b=900,
    V_b=V_b,
    V_0=V_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0,
    Xpq=0.55,
    Tpq0=0.4) annotation (Placement(transformation(extent={{-2,-18},{38,18}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.SEXS sEXS(
    T_AT_B=1,
    T_B=1,
    K=200,
    T_E=0.01,
    E_MIN=0,
    E_MAX=4) annotation (Placement(transformation(extent={{-42,-18},{-8,0}})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(extent={{-68,-2},{-58,8}})));
equation
  connect(g1.PMECH, g1.PMECH0) annotation (Line(points={{-1.6,9},{-6,9},{-12,9},{-12,10},{-12,26},{44,26},{44,-5.4},{39.6,-5.4}}, color={0,0,127}));
  connect(g1.p, pwPin) annotation (Line(points={{40,0},{40,0},{70,0}}, color={0,0,255}));
  connect(sEXS.EFD, g1.EFD) annotation (Line(points={{-7.15,-8},{-7.15,-9},{-1.6,-9}}, color={0,0,127}));
  connect(sEXS.EFD0, g1.EFD0) annotation (Line(points={{-42,-14.5},{-46,-14.5},{-46,-26},{46,-26},{46,-12.6},{39.6,-12.6}}, color={0,0,127}));
  connect(sEXS.VOEL, const.y) annotation (Line(points={{-30.95,-18},{-30.95,-9.5},{-57.5,-9.5},{-57.5,3}}, color={0,0,127}));
  connect(sEXS.VOTHSG, const.y) annotation (Line(points={{-42,-3.5},{-42,-6.1875},{-57.5,-6.1875},{-57.5,3}}, color={0,0,127}));
  connect(sEXS.VUEL, const.y) annotation (Line(points={{-36.05,-18},{-36.05,-12.1875},{-57.5,-12.1875},{-57.5,3}}, color={0,0,127}));
  connect(g1.ETERM, sEXS.ECOMP) annotation (Line(points={{39.6,9},{50,9},{50,-30},{-50,-30},{-50,-8},{-42,-8}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        initialScale=0.1)),
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        initialScale=0.1)),
    Documentation(revisions="<html>
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
<td>Klein-Rogers-Kundur power network</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-12-01</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Maxime Baudette, Tin Rabuzin, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end G1;
