within PSAT_Systems.ThreeArea;
model ThirdOrder_AVRI "ABC system with 3rd-order machines and AVR Type I"
  extends PSAT_Systems.ThreeArea.BaseClasses.BaseOrder3;

  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeI Exc1(
    Te=0.01,
    v0=1.05,
    K0=25,
    vrmax=5,
    vrmin=-5,
    T1=10,
    T2=6.67,
    Tr=0.001,
    vf0=1.091853765980820,
    vref0=1.093674150639233,
    v(start=1.091853765980820)) annotation (Placement(transformation(extent={{-144,80},{-134,90}})));
  Modelica.Blocks.Sources.Constant vref(k=1.093674150639233) annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=0,
        origin={-162,88})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeI Exc2(
    Te=0.01,
    v0=1.05,
    K0=25,
    vrmax=5,
    vrmin=-5,
    T1=10,
    T2=6.67,
    Tr=0.001,
    vref0=1.093835147859700,
    vf0=1.095878696492499,
    v(start=1.095878696492499)) annotation (Placement(transformation(extent={{166,0},{156,10}})));
  Modelica.Blocks.Sources.Constant vref1(k=1.093835147859700) annotation (Placement(transformation(
        extent={{3,-3},{-3,3}},
        rotation=0,
        origin={175,21})));
equation

  connect(Exc2.vf, order3_2.vf) annotation (Line(points={{155.5,5.1},{154.75,5.1},{154.75,5},{152,5}}, color={0,0,127}));
  connect(vref1.y, Exc2.vref) annotation (Line(points={{171.7,21},{170,21},{170,7.8},{167.1,7.8}}, color={0,0,127}));
  connect(Exc2.v, order3_2.v) annotation (Line(points={{167.2,3.2},{172,3.2},{172,14},{128,14},{128,3},{131,3}}, color={0,0,127}));
  connect(Exc1.vf, order3_1.vf) annotation (Line(points={{-133.5,85.1},{-131.75,85.1},{-131.75,85},{-130,85}}, color={0,0,127}));
  connect(vref.y, Exc1.vref) annotation (Line(points={{-157.6,88},{-145.1,88},{-145.1,87.8}}, color={0,0,127}));
  connect(Exc1.v, order3_1.v) annotation (Line(points={{-145.2,83.2},{-148,83.2},{-148,96},{-106,96},{-106,83},{-109,83}}, color={0,0,127}));
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
end ThirdOrder_AVRI;
