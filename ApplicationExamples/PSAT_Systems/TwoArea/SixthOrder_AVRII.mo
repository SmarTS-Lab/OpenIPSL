within PSAT_Systems.TwoArea;
model SixthOrder_AVRII "31-bus system with 6th-order machine and AVR Type II"
  extends PSAT_Systems.TwoArea.BaseClasses.BaseOrder6;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVRTypeII(
    v0=1.05,
    vrmin=0,
    vrmax=7.57,
    Te=0.4,
    Tr=0.05,
    Ae=0,
    Be=0,
    Ka=7.04,
    Ta=0.4,
    Kf=1,
    Tf=0.05,
    Ke=1) annotation (Placement(transformation(extent={{-150,24},{-130,44}})));
equation
  connect(aVRTypeII.vf, order6.vf) annotation (Line(points={{-128,34},{-125.75,
          34},{-125.75,35},{-122,35}}, color={0,0,127}));
  connect(aVRTypeII.v, order6.v) annotation (Line(points={{-152,28},{-152,28},{
          -152,18},{-152,16},{-96,16},{-96,33},{-99,33}}, color={0,0,127}));
  connect(aVRTypeII.vref, aVRTypeII.vref0) annotation (Line(points={{-152,40},{
          -156,40},{-156,42},{-158,42},{-158,54},{-140,54},{-140,46}}, color={0,
          0,127}));
  connect(aVRTypeII.vf0, order6.vf0) annotation (Line(points={{-140,22},{-140,
          22},{-140,8},{-140,4},{-140,10},{-166,10},{-166,60},{-118,60},{-118,
          41}}, color={0,0,127}));
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
end SixthOrder_AVRII;
