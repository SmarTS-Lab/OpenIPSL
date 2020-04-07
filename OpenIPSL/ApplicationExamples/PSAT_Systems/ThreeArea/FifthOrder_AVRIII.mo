within PSAT_Systems.ThreeArea;
model FifthOrder_AVRIII
  "ABC system with 5th-order machine (Syn2) and AVR Type III"
  extends PSAT_Systems.ThreeArea.BaseClasses.BaseOrder5;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII Exc1(
    T2=10,
    T1=1,
    Te=0.01,
    K0=25) annotation (Placement(transformation(extent={{-160,80},{-148,92}})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII Exc2(
    T2=10,
    T1=1,
    Te=0.01,
    K0=25) annotation (Placement(transformation(extent={{170,0},{160,10}})));
  Modelica.Blocks.Sources.Constant vs_1(k=0) annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=0,
        origin={-172,84})));
  Modelica.Blocks.Sources.Constant vs_2(k=0) annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=0,
        origin={164,-16})));
equation
  connect(Exc1.vf, Syn2.vf) annotation (Line(points={{-147.4,86},{-144,86},{-144,
          86},{-140,86}}, color={0,0,127}));
  connect(Exc1.vf0, Syn2.vf0) annotation (Line(points={{-154,93.2},{-154,96},{-137.6,
          96},{-137.6,93.2}}, color={0,0,127}));
  connect(Exc1.v, Syn2.v) annotation (Line(points={{-161.2,89},{-164,89},{-164,
          98},{-112,98},{-112,83.6},{-114.8,83.6}}, color={0,0,127}));
  connect(Exc2.vf, order3_2.vf) annotation (Line(points={{159.5,5},{156.75,5},{
          156.75,5},{152,5}}, color={0,0,127}));
  connect(order3_2.vf0, Exc2.vf0) annotation (Line(points={{150,11},{150,14},{
          165,14},{165,11}}, color={0,0,127}));
  connect(Exc2.v, order3_2.v) annotation (Line(points={{171,7.5},{174,7.5},{174,
          16},{128,16},{128,3},{131,3}}, color={0,0,127}));
  connect(vs_1.y, Exc1.vs) annotation (Line(points={{-167.6,84},{-161.2,84},{-161.2,
          83.6}}, color={0,0,127}));
  connect(Exc2.vs, vs_2.y) annotation (Line(points={{171,3},{172,3},{172,-16},{
          168.4,-16}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-180,-120},{180,120}},
          preserveAspectRatio=false)),
    Icon(coordinateSystem(extent={{-180,-120},{180,120}})),
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
end FifthOrder_AVRIII;
