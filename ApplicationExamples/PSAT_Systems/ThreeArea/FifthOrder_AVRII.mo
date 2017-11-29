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
    Be=0) annotation (Placement(transformation(extent={{168,0},{158,10}})));
equation
  connect(Exc1.vf, Syn2.vf) annotation (Line(points={{-145,85},{-144.375,85},{-144.375,
          86},{-142.4,86}}, color={0,0,127}));
  connect(Exc1.v, Syn2.v) annotation (Line(points={{-157,82},{-168,82},{-168,
          100},{-112,100},{-112,83.6},{-114.8,83.6}}, color={0,0,127}));
  connect(Exc2.vf, order3_2.vf)
    annotation (Line(points={{157,5},{156.375,5},{154,5}}, color={0,0,127}));
  connect(Exc2.v, order3_2.v) annotation (Line(points={{169,2},{176,2},{176,22},
          {128,22},{128,3},{131,3}}, color={0,0,127}));
  connect(Exc1.vf0, Syn2.vf0) annotation (Line(points={{-151,79},{-151,66},{-166,
          66},{-166,96},{-166,98},{-137.6,98},{-137.6,93.2}}, color={0,0,127}));
  connect(Exc1.vref0, Exc1.vref) annotation (Line(points={{-151,91},{-151,94},{
          -162,94},{-162,88},{-157,88}}, color={0,0,127}));
  connect(Exc2.vref, Exc2.vref0) annotation (Line(points={{169,8},{174,8},{174,
          16},{163,16},{163,11}}, color={0,0,127}));
  connect(Exc2.vf0, order3_2.vf0) annotation (Line(points={{163,-1},{163,-10},{
          174,-10},{178,-10},{178,28},{150,28},{150,11}}, color={0,0,127}));
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
