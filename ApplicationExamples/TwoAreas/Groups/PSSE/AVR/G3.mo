within TwoAreas.Groups.PSSE.AVR;

model G3
  extends TwoAreas.Support.Generator;
  OpenIPSL.Electrical.Machines.PSSE.GENROU g3(
    Tpd0=8,
    Tppd0=0.03,
    Tppq0=0.05,
    D=0,
    Xd=1.8,
    Xq=1.7,
    Xpd=0.3,
    Xppd=0.25,
    Xppq=0.25,
    Xl=0.2,
    H=6.175,
    R_a=0.0025,
    S12=0.802,
    S10=0.18600,
    M_b=900,
    V_b=V_b,
    V_0=V_0,
    P_0=P_0,
    Q_0=Q_0,
    angle_0=angle_0,
    Xpq=0.55,
    Tpq0=0.4) annotation (Placement(transformation(extent={{12,-18},{44,22}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.SEXS sEXS(
    T_AT_B=0.1,
    T_B=10,
    K=200,
    T_E=0.1,
    E_MIN=0,
    E_MAX=4) annotation (Placement(transformation(extent={{-38,-16},{0,0}})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(extent={{-66,4},{-60,10}})));
equation
  connect(g3.PMECH, g3.PMECH0) annotation (Line(points={{12.32,12},{-24,12},{-24,44},{54,44},{54,-4},{45.28,-4}}, color={0,0,127}));
  connect(g3.p, pwPin) annotation (Line(points={{45.6,2},{46.5,2},{46.5,0},{70,0}}, color={0,0,255}));
  connect(sEXS.EFD, g3.EFD) annotation (Line(points={{0.95,-7.11111},{6,-7.11111},{6,-8},{12.32,-8}}, color={0,0,127}));
  connect(sEXS.VOEL, const.y) annotation (Line(points={{-25.65,-16},{-52,-16},{-52,7},{-59.7,7}}, color={0,0,127}));
  connect(sEXS.EFD0, g3.EFD0) annotation (Line(points={{-38,-12.8889},{-44,-12.8889},{-44,-24},{50,-24},{50,-12},{45.28,-12}}, color={0,0,127}));
  connect(sEXS.VUEL, const.y) annotation (Line(points={{-31.35,-16},{-52,-16},{-52,7},{-59.7,7}}, color={0,0,127}));
  connect(sEXS.VOTHSG, const.y) annotation (Line(points={{-38,-3.11111},{-52,-3.11111},{-52,7},{-59.7,7}}, color={0,0,127}));
  connect(g3.ETERM, sEXS.ECOMP) annotation (Line(points={{45.28,12},{52,12},{52,-26},{-46,-26},{-46,-7.11111},{-38,-7.11111}}, color={0,0,127}));
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
end G3;
