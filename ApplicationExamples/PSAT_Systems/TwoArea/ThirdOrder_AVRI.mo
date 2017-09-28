within PSAT_Systems.TwoArea;
model ThirdOrder_AVRI "31-bus system with 3rd-order machine and AVR Type I"
  extends PSAT_Systems.TwoArea.BaseClasses.BaseOrder3;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeI aVRTypeI(
    v0=1.05,
    vrmin=0,
    vrmax=7.57,
    Te=0.4,
    Tr=0.05,
    Ae=0,
    Be=0,
    vref0=1.198480294896434,
    vf0=1.045152426011381)
    annotation (Placement(transformation(extent={{-146,24},{-126,44}})));
  Modelica.Blocks.Sources.Constant vref2(k=1.198480294896434) annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-163,41})));
equation
  connect(aVRTypeI.vf, order3_1.vf) annotation (Line(points={{-125,34.2},{-122.5,
          34.2},{-122.5,35},{-120,35}}, color={0,0,127}));
  connect(vref2.y, aVRTypeI.vref) annotation (Line(points={{-157.5,41},{-153.75,
          41},{-153.75,39.6},{-148.2,39.6}}, color={0,0,127}));
  connect(aVRTypeI.v, order3_1.v) annotation (Line(points={{-148.4,30.4},{-154,
          30.4},{-154,14},{-96,14},{-96,33},{-99,33}}, color={0,0,127}));
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
end ThirdOrder_AVRI;
