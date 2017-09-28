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
    Be=0,
    vref0=1.198480294896434,
    vf0=1.045301276070898)
    annotation (Placement(transformation(extent={{-146,26},{-128,44}})));
  Modelica.Blocks.Sources.Constant vref2(k=1.198480294896434) annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-163,51})));
equation
  connect(vref2.y, aVRTypeI.vref) annotation (Line(points={{-157.5,51},{-154,51},
          {-154,40.04},{-147.98,40.04}}, color={0,0,127}));
  connect(aVRTypeI.vf, order4.vf) annotation (Line(points={{-127.1,35.18},{-123.55,
          35.18},{-123.55,35},{-120,35}}, color={0,0,127}));
  connect(aVRTypeI.v, order4.v) annotation (Line(points={{-148.16,31.76},{-152,
          31.76},{-152,16},{-94,16},{-94,33},{-99,33}}, color={0,0,127}));
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
