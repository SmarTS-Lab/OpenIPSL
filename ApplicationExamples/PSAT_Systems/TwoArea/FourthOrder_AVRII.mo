within PSAT_Systems.TwoArea;
model FourthOrder_AVRII "31-bus system with 4th-order machine and AVR Type II"
  extends PSAT_Systems.TwoArea.BaseClasses.BaseOrder4;
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
    Be=0) annotation (Placement(transformation(extent={{-148,22},{-128,42}})));
equation
  connect(aVRTypeII.vf, order4.vf) annotation (Line(points={{-126,32},{-124.75,
          32},{-124.75,35},{-122,35}}, color={0,0,127}));
  connect(aVRTypeII.v, order4.v) annotation (Line(points={{-150,26},{-148,26},{
          -148,30},{-150,30},{-150,14},{-94,14},{-94,33},{-99,33}}, color={0,0,
          127}));
  connect(aVRTypeII.vref0, aVRTypeII.vref) annotation (Line(points={{-138,44},{
          -138,50},{-156,50},{-156,38},{-150,38}}, color={0,0,127}));
  connect(order4.vf0, aVRTypeII.vf0) annotation (Line(points={{-118,41},{-118,
          56},{-118,52},{-166,52},{-166,10},{-138,10},{-138,20}}, color={0,0,
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
end FourthOrder_AVRII;
