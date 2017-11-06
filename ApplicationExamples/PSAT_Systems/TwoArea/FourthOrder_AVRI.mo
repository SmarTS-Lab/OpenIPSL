within PSAT_Systems.TwoArea;
model FourthOrder_AVRI "31-bus system with 4th-order machine and AVR Type I"
  extends PSAT_Systems.TwoArea.BaseClasses.BaseOrder4;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeI aVRTypeI(
    v0=1.05,
    vrmin=0,
    vrmax=7.57,
    Te=0.4,
    Tr=0.05,
    Ae=0,
    Be=0) annotation (Placement(transformation(extent={{-146,26},{-128,44}})));
equation
  connect(aVRTypeI.vf, order4.vf) annotation (Line(points={{-126.2,35},{-123.55,
          35},{-122,35}}, color={0,0,127}));
  connect(aVRTypeI.v, order4.v) annotation (Line(points={{-147.8,29.6},{-152,
          29.6},{-152,16},{-94,16},{-94,33},{-99,33}}, color={0,0,127}));
  connect(aVRTypeI.vf0, order4.vf0) annotation (Line(points={{-137,24.2},{-137,
          18},{-162,18},{-162,26},{-162,58},{-118,58},{-118,41}}, color={0,0,
          127}));
  connect(aVRTypeI.vref0, aVRTypeI.vref) annotation (Line(points={{-137,45.8},{
          -137,52},{-152,52},{-152,38},{-152,40.4},{-147.8,40.4}}, color={0,0,
          127}));
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
end FourthOrder_AVRI;
