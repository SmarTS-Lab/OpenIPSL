within PSAT_Systems.ThreeArea;
model FourthOrder_AVRII
  "ABC system with 4th-order machines (Syn2) and AVR Type II"
  extends PSAT_Systems.ThreeArea.BaseClasses.BaseOrder4;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII Exc1(
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
    Be=0) annotation (Placement(transformation(extent={{-156,80},{-146,90}})));
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
    Be=0) annotation (Placement(transformation(extent={{166,-2},{156,8}})));
equation
  connect(Exc2.vf, order3_2.vf) annotation (Line(points={{155,3},{154.375,3},{
          154.375,5},{154,5}}, color={0,0,127}));
  connect(Exc2.v, order3_2.v) annotation (Line(points={{167,0},{174,0},{174,18},
          {128,18},{128,3},{131,3}}, color={0,0,127}));
  connect(Exc1.vf, order4_1.vf) annotation (Line(points={{-145,85},{-143.375,85},
          {-143.375,86},{-142.4,86}}, color={0,0,127}));
  connect(Exc1.v, order4_1.v) annotation (Line(points={{-157,82},{-166,82},{-166,
          98},{-112,98},{-112,83.6},{-114.8,83.6}}, color={0,0,127}));
  connect(Exc1.vref, Exc1.vref0) annotation (Line(points={{-157,88},{-158,88},{
          -158,90},{-158,91},{-151,91}}, color={0,0,127}));
  connect(Exc1.vf0, order4_1.vf0) annotation (Line(points={{-151,79},{-151,62},
          {-162,62},{-162,68},{-162,96},{-137.6,96},{-137.6,93.2}}, color={0,0,
          127}));
  connect(Exc2.vf0, order3_2.vf0) annotation (Line(points={{161,-3},{161,-12},{
          178,-12},{178,28},{148,28},{148,11},{150,11}}, color={0,0,127}));
  connect(Exc2.vref0, Exc2.vref) annotation (Line(points={{161,9},{161,14},{170,
          14},{170,6},{167,6}}, color={0,0,127}));
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
end FourthOrder_AVRII;
