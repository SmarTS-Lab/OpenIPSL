within PSAT_Systems.ThreeArea;
model FifthOrder_AVRII
  "ABC system with 5th-order machines (Syn2) and AVR Type II"
  extends PSAT_Systems.ThreeArea.BaseClasses.BaseOrder5;
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
    Be=0) annotation (Placement(transformation(extent={{-156,80},{-146,90}})));
  Modelica.Blocks.Sources.Constant vref(k=1.093674150639233) annotation (
      Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=0,
        origin={-168,88})));
  Modelica.Blocks.Sources.Constant vref1(k=1.093835147859700) annotation (
      Placement(transformation(
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
    vf0=1.095878696492499)
    annotation (Placement(transformation(extent={{168,0},{158,10}})));
equation
  connect(Exc1.vf, Syn2.vf) annotation (Line(points={{-146.75,86.3},{-144.375,
          86.3},{-144.375,86},{-140,86}}, color={0,0,127}));
  connect(vref.y, Exc1.vref) annotation (Line(points={{-163.6,88},{-155,88},{-155,
          87.7}}, color={0,0,127}));
  connect(Exc1.v, Syn2.v) annotation (Line(points={{-155,84.5},{-158,84.5},{-158,
          96},{-112,96},{-112,83.6},{-114.8,83.6}}, color={0,0,127}));
  connect(Exc2.vf, order3_2.vf) annotation (Line(points={{158.75,6.3},{156.375,
          6.3},{156.375,5},{152,5}}, color={0,0,127}));
  connect(vref1.y, Exc2.vref) annotation (Line(points={{171.6,24},{170,24},{170,
          7.7},{167,7.7}}, color={0,0,127}));
  connect(Exc2.v, order3_2.v) annotation (Line(points={{167,4.5},{172,4.5},{172,
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
end FifthOrder_AVRII;
