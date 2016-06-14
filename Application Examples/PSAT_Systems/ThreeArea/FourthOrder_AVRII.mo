within PSAT_Systems.ThreeArea;
model FourthOrder_AVRII "ABC system with 4th-order machines (Syn2) and AVR Type II"
  extends PSAT_Systems.ThreeArea.BaseClasses.BaseOrder4;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII Exc1(
    Te=0.01,
    v0=1.05,
    vrmax=5,
    vrmin=-5,
    Tr=0.001,
    vf0=1.091853765980820,
    vref0=1.093674150639233,
    v(start=1.091853765980820),
    Ka=25,
    Ta=10,
    Kf=6.67,
    Tf=1,
    Ke=1,
    Ae=0,
    Be=0) annotation (Placement(transformation(extent={{-154,80},{-144,90}})));
  Modelica.Blocks.Sources.Constant vref(k=1.093674150639233) annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=0,
        origin={-166,88})));
  Modelica.Blocks.Sources.Constant vref1(k=1.093835147859700) annotation (Placement(transformation(
        extent={{3,-3},{-3,3}},
        rotation=0,
        origin={177,23})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII Exc2(
    Te=0.01,
    v0=1.05,
    vrmax=5,
    vrmin=-5,
    Tr=0.001,
    Ka=25,
    Ta=10,
    Kf=6.67,
    Tf=1,
    Ke=1,
    Ae=0,
    Be=0,
    v(start=1.095878696492499),
    vref0=1.093835147859700,
    vf0=1.095878696492499) annotation (Placement(transformation(extent={{166,-2},{156,8}})));
equation
  connect(Exc2.vf, order3_2.vf) annotation (Line(points={{156.75,4.3},{154.375,4.3},{154.375,5},{152,5}}, color={0,0,127}));
  connect(vref1.y, Exc2.vref) annotation (Line(points={{173.7,23},{168,23},{168,5.7},{165,5.7}}, color={0,0,127}));
  connect(Exc2.v, order3_2.v) annotation (Line(points={{165,2.5},{170,2.5},{170,14},{128,14},{128,3},{131,3}}, color={0,0,127}));
  connect(Exc1.vf, order4_1.vf) annotation (Line(points={{-144.75,86.3},{-143.375,86.3},{-143.375,86},{-140,86}}, color={0,0,127}));
  connect(vref.y, Exc1.vref) annotation (Line(points={{-161.6,88},{-153,88},{-153,87.7}}, color={0,0,127}));
  connect(Exc1.v, order4_1.v) annotation (Line(points={{-153,84.5},{-156,84.5},{-156,96},{-112,96},{-112,83.6},{-114.8,83.6}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-180,-120},{180,120}}, preserveAspectRatio=false)),
    Icon(coordinateSystem(extent={{-180,-120},{180,120}})),
    experiment(
      StopTime=20,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Rkfix2"),
    __Dymola_experimentSetupOutput,
    Documentation(revisions="<html>
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
end FourthOrder_AVRII;
