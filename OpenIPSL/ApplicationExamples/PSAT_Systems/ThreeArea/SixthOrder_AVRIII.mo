within PSAT_Systems.ThreeArea;
model SixthOrder_AVRIII
  "ABC system with 6th-order machine (Syn2) and AVR Type III"
  extends PSAT_Systems.ThreeArea.BaseClasses.BaseOrder6;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII Exc1(
    T2=10,
    T1=1,
    Te=0.01,
    K0=25) annotation (Placement(transformation(extent={{-154,80},{-142,92}})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII Exc2(
    T2=10,
    T1=1,
    Te=0.01,
    K0=25) annotation (Placement(transformation(extent={{166,0},{156,10}})));
  Modelica.Blocks.Sources.Constant vs_1(k=0) annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=0,
        origin={-166,84})));
  Modelica.Blocks.Sources.Constant vs_2(k=0) annotation (Placement(
        transformation(
        extent={{4,-4},{-4,4}},
        rotation=0,
        origin={176,24})));
equation
  connect(Exc1.vf, Syn2.vf) annotation (Line(points={{-141.4,86},{-136,86},{-136,
          86}}, color={0,0,127}));
  connect(Exc1.vf0, Syn2.vf0) annotation (Line(points={{-148,93.2},{-148,96},{-133.6,
          96},{-133.6,93.2}}, color={0,0,127}));
  connect(Exc1.v, Syn2.v) annotation (Line(points={{-155.2,89},{-160,89},{-160,
          98},{-108,98},{-108,83.6},{-110.8,83.6}}, color={0,0,127}));
  connect(vs_1.y, Exc1.vs) annotation (Line(points={{-161.6,84},{-155.2,84},{-155.2,
          83.6}}, color={0,0,127}));
  connect(Exc2.vf, order3_2.vf)
    annotation (Line(points={{155.5,5},{155.5,5},{152,5}}, color={0,0,127}));
  connect(order3_2.vf0, Exc2.vf0) annotation (Line(points={{150,11},{150,14},{
          161,14},{161,11}}, color={0,0,127}));
  connect(vs_2.y, Exc2.vs) annotation (Line(points={{171.6,24},{170,24},{170,3},
          {167,3}}, color={0,0,127}));
  connect(Exc2.v, order3_2.v) annotation (Line(points={{167,7.5},{172,7.5},{172,
          16},{128,16},{128,3},{131,3}}, color={0,0,127}));
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
end SixthOrder_AVRIII;
