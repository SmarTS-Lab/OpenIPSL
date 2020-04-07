within PSAT_Systems.TwoAreaOld;
model ThirdOrder_AVRII "5-bus system with 3rd-order machine and AVR Type II"
  extends PSAT_Systems.TwoAreaOld.BaseClasses.BaseOrder3;
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
    Be=0) annotation (Placement(transformation(extent={{-142,4},{-122,24}})));
equation
  connect(aVRTypeII.vf, order3.vf) annotation (Line(points={{-120,14},{-117.75,
          14},{-117.75,5},{-114,5}}, color={0,0,127}));
  connect(aVRTypeII.v, order3.v) annotation (Line(points={{-144,8},{-140,8},{-140,
          2},{-142,2},{-142,-14},{-88,-14},{-88,3},{-91,3}}, color={0,0,127}));
  connect(order3.vf0, aVRTypeII.vf0) annotation (Line(points={{-110,11},{-110,
          42},{-154,42},{-154,-4},{-132,-4},{-132,2}}, color={0,0,127}));
  connect(aVRTypeII.vref0, aVRTypeII.vref) annotation (Line(points={{-132,26},{
          -132,32},{-150,32},{-150,20},{-144,20}}, color={0,0,127}));
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
end ThirdOrder_AVRII;
