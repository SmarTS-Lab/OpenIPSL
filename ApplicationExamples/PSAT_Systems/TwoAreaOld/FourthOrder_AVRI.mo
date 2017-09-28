within PSAT_Systems.TwoAreaOld;
model FourthOrder_AVRI "5-bus system with 4th-order machine and AVR Type I"
  extends PSAT_Systems.TwoAreaOld.BaseClasses.BaseOrder4;
  Modelica.Blocks.Sources.Constant vref2(k=1.198705028536746) annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-149,9})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeI aVRTypeIchange1_1(vrmax=7.57)
    annotation (Placement(transformation(extent={{-132,-2},{-120,12}})));
equation
  connect(vref2.y, aVRTypeIchange1_1.vref) annotation (Line(points={{-143.5,9},
          {-138.75,9},{-138.75,8.92},{-133.32,8.92}}, color={0,0,127}));
  connect(aVRTypeIchange1_1.vf, order4.vf) annotation (Line(points={{-119.4,
          5.14},{-115.7,5.14},{-115.7,5},{-112,5}}, color={0,0,127}));
  connect(aVRTypeIchange1_1.v, order4.v) annotation (Line(points={{-133.44,2.48},
          {-136,2.48},{-136,-14},{-88,-14},{-88,3},{-91,3}}, color={0,0,127}));
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
