within PSAT_Systems.TwoArea;
model FifthOrder_AVRII
  "31-bus system with 5th-order machine Type 2 and AVR Type II"
  extends PSAT_Systems.TwoArea.BaseClasses.BaseOrder5;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVRTypeII(
    v0=1.05,
    vrmin=0,
    vrmax=7.57,
    Ka=7.04,
    Ta=0.4,
    Kf=1,
    Tf=0.05,
    Ke=1,
    Te=0.4,
    Tr=0.05,
    Ae=0,
    Be=0) annotation (Placement(transformation(extent={{-152,36},{-132,56}})));
equation
  connect(aVRTypeII.vf, order5.vf) annotation (Line(points={{-130,46},{-124.75,
          46},{-124.75,35},{-122,35}}, color={0,0,127}));
  connect(aVRTypeII.v, order5.v) annotation (Line(points={{-154,40},{-152,40},{
          -152,18},{-94,18},{-94,33},{-99,33}}, color={0,0,127}));
  connect(aVRTypeII.vf0, order5.vf0) annotation (Line(points={{-142,34},{-142,
          24},{-168,24},{-168,68},{-118,68},{-118,41}}, color={0,0,127}));
  connect(aVRTypeII.vref0, aVRTypeII.vref) annotation (Line(points={{-142,58},{
          -144,58},{-144,62},{-162,62},{-162,52},{-154,52}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-180,-100},{180,100}},
          preserveAspectRatio=false)),
    Icon(coordinateSystem(extent={{-180,-100},{180,100}})),
    experiment(
      StopTime=20,
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
end FifthOrder_AVRII;
