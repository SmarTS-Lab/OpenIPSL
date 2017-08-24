within OpenIPSL.Electrical.Controls.PSSE.ES;
model SEXS "Simplified excitation system model"
  extends OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter;
  parameter Real T_AT_B;
  parameter Real T_B;
  parameter Real K;
  parameter Real T_E;
  parameter Real E_MIN;
  parameter Real E_MAX;
  Modelica.Blocks.Math.Add3 V_erro(
    k3=1,
    k1=1,
    k2=1) annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=K,
    T=T_E,
    y_start=Efd0,
    outMax=E_MAX,
    outMin=E_MIN) annotation (Placement(transformation(extent={{120,-10},{140,10}})));
  Modelica.Blocks.Math.Add DiffV1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-100,-50})));
  NonElectrical.Continuous.LeadLag leadLag(
    K=1,
    T1=T_AT_B*T_B,
    T2=T_B,
    y_start=Efd0/K,
    x_start=Efd0/K) annotation (Placement(transformation(extent={{40,-10},{60,10}})));
initial equation
  V_REF = Efd0/K + ECOMP0;
equation
  connect(simpleLagLim.y, EFD) annotation (Line(points={{141,0},{210,0}}, color={0,0,127}));
  connect(DiffV1.u1, VUEL) annotation (Line(points={{-106,-62},{-106,-80},{-130,-80},{-130,-200}}, color={0,0,127}));
  connect(DiffV1.u2, VOEL) annotation (Line(points={{-94,-62},{-94,-80},{-70,-80},{-70,-200}}, color={0,0,127}));
  connect(DiffV1.y, V_erro.u3) annotation (Line(points={{-100,-39},{-100,-20},{-52,-20},{-52,-8},{-42,-8}}, color={0,0,127}));
  connect(DiffV.y, V_erro.u2) annotation (Line(points={{-99,0},{-42,0}}, color={0,0,127}));
  connect(V_erro.u1, VOTHSG) annotation (Line(points={{-42,8},{-52,8},{-52,90},{-200,90}}, color={0,0,127}));
  connect(ECOMP, DiffV.u2) annotation (Line(points={{-200,0},{-166,0},{-132,0},{-132,-6},{-122,-6}}, color={0,0,127}));
  connect(leadLag.y, simpleLagLim.u) annotation (Line(points={{61,0},{118,0}}, color={0,0,127}));
  connect(leadLag.u, V_erro.y) annotation (Line(points={{38,0},{-19,0}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-200,-200},{200,160}}, initialScale=0.1)),
    Icon(coordinateSystem(extent={{-200,-200},{200,160}}, initialScale=0.1), graphics={Text(
          extent={{-100,160},{100,100}},
          lineColor={28,108,200},
          textString="SEXS")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSS/E Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>Unknown</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Mengjia Zhang,SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>", revisions="<html>
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
"));
end SEXS;
