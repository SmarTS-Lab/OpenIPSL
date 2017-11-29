within PSAT_Systems.TwoArea;
model FifthOrder_AVRI
  "31-bus system with 5th-order machine Type 2 and AVR Type I"
  extends PSAT_Systems.TwoArea.BaseClasses.BaseOrder5;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeI aVRTypeI(
    v0=1.05,
    vrmin=0,
    vrmax=7.57,
    Te=0.4,
    Tr=0.05,
    Ae=0,
    Be=0) annotation (Placement(transformation(extent={{-150,26},{-130,46}})));
equation
  connect(aVRTypeI.vf, order5.vf) annotation (Line(points={{-128,36},{-124.5,36},
          {-124.5,35},{-122,35}}, color={0,0,127}));
  connect(aVRTypeI.v, order5.v) annotation (Line(points={{-152,30},{-156,30},{-156,
          14},{-96,14},{-96,33},{-99,33}}, color={0,0,127}));
  connect(aVRTypeI.vref, aVRTypeI.vref0) annotation (Line(points={{-152,42},{-158,
          42},{-164,42},{-164,56},{-140,56},{-140,48}}, color={0,0,127}));
  connect(order5.vf0, aVRTypeI.vf0) annotation (Line(points={{-118,41},{-118,64},
          {-172,64},{-172,6},{-140,6},{-140,24}}, color={0,0,127}));
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
end FifthOrder_AVRI;
