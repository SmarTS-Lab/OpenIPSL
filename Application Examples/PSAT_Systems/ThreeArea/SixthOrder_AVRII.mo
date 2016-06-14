within PSAT_Systems.ThreeArea;
model SixthOrder_AVRII "ABC system with 6th-order machines (Syn2) and AVR Type II"
  extends PSAT_Systems.ThreeArea.BaseClasses.BaseOrder6;

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
    Be=0) annotation (Placement(transformation(extent={{-150,80},{-140,90}})));
  Modelica.Blocks.Sources.Constant vref(k=1.093674150639233) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-167,87})));
  Modelica.Blocks.Sources.Constant vref1(k=1.093835147859700) annotation (Placement(transformation(
        extent={{4,-4},{-4,4}},
        rotation=0,
        origin={176,24})));
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
  connect(vref.y, Exc1.vref) annotation (Line(
      points={{-161.5,87},{-158,87},{-158,87.7},{-149,87.7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Syn2.vf, Exc1.vf) annotation (Line(points={{-136,86},{-138,86},{-138,86.3},{-140.75,86.3}}, color={0,0,127}));
  connect(Exc1.v, Syn2.v) annotation (Line(points={{-149,84.5},{-154,84.5},{-154,96},{-108,96},{-108,83.6},{-110.8,83.6}}, color={0,0,127}));
  connect(order3_2.vf, Exc2.vf) annotation (Line(points={{152,5},{156,5},{156,4.3},{156.75,4.3}}, color={0,0,127}));
  connect(Exc2.v, order3_2.v) annotation (Line(points={{165,2.5},{168,2.5},{168,14},{128,14},{128,3},{131,3}}, color={0,0,127}));
  connect(vref1.y, Exc2.vref) annotation (Line(points={{171.6,24},{165,24},{165,5.7}}, color={0,0,127}));
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
end SixthOrder_AVRII;
