within PSAT_Systems.ThreeArea;
model FourthOrder_AVRI
  "ABC system with 4th-order machines (Syn2) and AVR Type I"
  extends PSAT_Systems.ThreeArea.BaseClasses.BaseOrder4;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeI Exc1(
    Te=0.01,
    v0=1.05,
    K0=25,
    vrmax=5,
    vrmin=-5,
    T1=10,
    T2=6.67,
    Tr=0.001)
    annotation (Placement(transformation(extent={{-156,80},{-146,90}})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeI Exc2(
    Te=0.01,
    v0=1.05,
    K0=25,
    vrmax=5,
    vrmin=-5,
    T1=10,
    T2=6.67,
    Tr=0.001) annotation (Placement(transformation(extent={{166,0},{156,10}})));
equation
  connect(Exc1.vf, order4_1.vf) annotation (Line(points={{-145,85},{-142.75,85},
          {-142.75,86},{-142.4,86}}, color={0,0,127}));
  connect(Exc1.v, order4_1.v) annotation (Line(points={{-157,82},{-166,82},{-166,
          100},{-110,100},{-110,83.6},{-114.8,83.6}}, color={0,0,127}));
  connect(Exc2.vf, order3_2.vf)
    annotation (Line(points={{155,5},{153.75,5},{154,5}}, color={0,0,127}));
  connect(Exc2.v, order3_2.v) annotation (Line(points={{167,2},{178,2},{178,26},
          {128,26},{128,3},{131,3}}, color={0,0,127}));
  connect(Exc1.vref, Exc1.vref0) annotation (Line(points={{-157,88},{-158,88},{
          -158,91},{-151,91}}, color={0,0,127}));
  connect(Exc1.vf0, order4_1.vf0) annotation (Line(points={{-151,79},{-151,74},
          {-164,74},{-164,96},{-158,96},{-137.6,96},{-137.6,93.2}}, color={0,0,
          127}));
  connect(Exc2.vref, Exc2.vref0) annotation (Line(points={{167,8},{170,8},{170,
          10},{170,14},{161,14},{161,11}}, color={0,0,127}));
  connect(Exc2.vf0, order3_2.vf0) annotation (Line(points={{161,-1},{161,-10},{
          170,-10},{170,-8},{176,-8},{176,20},{150,20},{150,11}}, color={0,0,
          127}));
  annotation (
    Diagram(coordinateSystem(extent={{-180,-120},{180,120}},
          preserveAspectRatio=false)),
    Icon(coordinateSystem(extent={{-180,-120},{180,120}})),
    experiment(
      StopTime=20,
      Interval=0.001,
      __Dymola_fixedstepsize=0.0001,
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
end FourthOrder_AVRI;
