within PSAT_Systems.ThreeArea;
model ThirdOrder_AVRII "ABC system with 3rd-order machines and AVR Type II"
  extends PSAT_Systems.ThreeArea.BaseClasses.BaseOrder3;
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
    Be=0) annotation (Placement(transformation(extent={{-144,78},{-134,88}})));
  Modelica.Blocks.Sources.Constant vref(k=1.093674150639233) annotation (
      Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=0,
        origin={-156,86})));
  Modelica.Blocks.Sources.Constant vref1(k=1.093835147859700) annotation (
      Placement(transformation(
        extent={{3,-3},{-3,3}},
        rotation=0,
        origin={175,17})));
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
    vf0=1.095878696492499)
    annotation (Placement(transformation(extent={{166,-2},{156,8}})));
equation
  connect(Exc1.vf, order3_1.vf) annotation (Line(points={{-134.75,84.3},{-132.375,
          84.3},{-132.375,85},{-130,85}}, color={0,0,127}));
  connect(vref.y, Exc1.vref) annotation (Line(points={{-151.6,86},{-143,86},{-143,
          85.7}}, color={0,0,127}));
  connect(Exc1.v, order3_1.v) annotation (Line(points={{-143,82.5},{-146,82.5},
          {-146,94},{-106,94},{-106,83},{-109,83}}, color={0,0,127}));
  connect(Exc2.vf, order3_2.vf) annotation (Line(points={{156.75,4.3},{154.375,
          4.3},{154.375,5},{152,5}}, color={0,0,127}));
  connect(vref1.y, Exc2.vref) annotation (Line(points={{171.7,17},{168,17},{168,
          5.7},{165,5.7}}, color={0,0,127}));
  connect(Exc2.v, order3_2.v) annotation (Line(points={{165,2.5},{170,2.5},{170,
          14},{128,14},{128,3},{131,3}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-180,-120},{180,120}},
          preserveAspectRatio=false)),
    Icon(coordinateSystem(extent={{-180,-120},{180,120}})),
    experiment(
      StopTime=20,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Rkfix2"),
    __Dymola_experimentSetupOutput,
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
end ThirdOrder_AVRII;
