within PSAT_Systems.TwoAreaOld;
model FourthOrder_AVRI "5-bus system with 4th-order machine and AVR Type I"
  extends PSAT_Systems.TwoAreaOld.BaseClasses.BaseOrder4;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeI aVRTypeIchange1_1(vrmax=7.57)
    annotation (Placement(transformation(extent={{-132,4},{-120,18}})));
equation
  connect(aVRTypeIchange1_1.vf, order4.vf) annotation (Line(points={{-118.8,11},
          {-115.7,11},{-115.7,5},{-114,5}}, color={0,0,127}));
  connect(aVRTypeIchange1_1.v, order4.v) annotation (Line(points={{-133.2,6.8},
          {-136,6.8},{-136,-14},{-88,-14},{-88,3},{-91,3}}, color={0,0,127}));
  connect(aVRTypeIchange1_1.vf0, order4.vf0) annotation (Line(points={{-126,2.6},
          {-126,-6},{-150,-6},{-150,32},{-110,32},{-110,11}}, color={0,0,127}));
  connect(aVRTypeIchange1_1.vref0, aVRTypeIchange1_1.vref) annotation (Line(
        points={{-126,19.4},{-126,26},{-140,26},{-140,15.2},{-133.2,15.2}},
        color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-160,-80},{160,80}}, preserveAspectRatio=
            false)),
    Icon(coordinateSystem(extent={{-160,-80},{160,80}})),
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
