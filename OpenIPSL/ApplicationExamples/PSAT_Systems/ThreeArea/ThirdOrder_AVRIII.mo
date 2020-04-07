within PSAT_Systems.ThreeArea;
model ThirdOrder_AVRIII "ABC system with 3rd-order machines and AVR Type III"
  extends PSAT_Systems.ThreeArea.BaseClasses.BaseOrder3;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII Exc1(
    T2=10,
    T1=1,
    Te=0.01,
    K0=25) annotation (Placement(transformation(extent={{-150,80},{-140,90}})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII Exc2(
    T2=10,
    T1=1,
    Te=0.01,
    K0=25) annotation (Placement(transformation(extent={{170,0},{160,10}})));
  Modelica.Blocks.Sources.Constant vs_1(k=0) annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=0,
        origin={-164,80})));
  Modelica.Blocks.Sources.Constant vs_2(k=0) annotation (Placement(
        transformation(
        extent={{4,-4},{-4,4}},
        rotation=0,
        origin={184,0})));
equation
  connect(Exc1.v, order3_1.v) annotation (Line(points={{-151,87.5},{-156,87.5},
          {-156,96},{-106,96},{-106,83},{-109,83}}, color={0,0,127}));
  connect(Exc2.v, order3_2.v) annotation (Line(points={{171,7.5},{174,7.5},{174,
          16},{128,16},{128,3},{131,3}}, color={0,0,127}));
  connect(vs_1.y, Exc1.vs) annotation (Line(points={{-159.6,80},{-156,80},{-156,
          83},{-151,83}}, color={0,0,127}));
  connect(vs_2.y, Exc2.vs) annotation (Line(points={{179.6,0},{174,0},{174,3},{
          171,3}}, color={0,0,127}));
  connect(Exc1.vf0, order3_1.vf0) annotation (Line(points={{-145,91},{-145,94},
          {-128,94},{-128,91}}, color={0,0,127}));
  connect(Exc2.vf0, order3_2.vf0) annotation (Line(points={{165,11},{165,14},{
          150,14},{150,11}}, color={0,0,127}));
  connect(Exc1.vf, order3_1.vf) annotation (Line(points={{-139.5,85},{-134.75,
          85},{-134.75,85},{-130,85}}, color={0,0,127}));
  connect(order3_2.vf, Exc2.vf) annotation (Line(points={{152,5},{156,5},{156,5},
          {159.5,5}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-180,-120},{200,120}},
          preserveAspectRatio=false)),
    Icon(coordinateSystem(extent={{-180,-120},{200,120}})),
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
end ThirdOrder_AVRIII;
