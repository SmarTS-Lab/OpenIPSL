within PSAT_Systems.TwoAreaOld;
model FifthOrder_AVRII "5-bus system with 5th-order machine and AVR Type II"
  extends PSAT_Systems.TwoAreaOld.BaseClasses.BaseOrder5;
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
    Be=0) annotation (Placement(transformation(extent={{-140,8},{-120,28}})));
equation
  connect(aVRTypeII.vf, order5.vf) annotation (Line(points={{-118,18},{-113.75,
          18},{-113.75,5},{-114,5}}, color={0,0,127}));
  connect(aVRTypeII.v, order5.v) annotation (Line(points={{-142,12},{-148,12},{
          -148,2},{-148,-14},{-86,-14},{-86,3},{-91,3}}, color={0,0,127}));
  connect(aVRTypeII.vf0, order5.vf0) annotation (Line(points={{-130,6},{-132,6},
          {-132,-4},{-132,-8},{-156,-8},{-156,40},{-144,40},{-144,34},{-110,34},
          {-110,11}}, color={0,0,127}));
  connect(aVRTypeII.vref0, aVRTypeII.vref) annotation (Line(points={{-130,30},{
          -134,30},{-134,32},{-148,32},{-148,24},{-142,24}}, color={0,0,127}));
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
end FifthOrder_AVRII;
