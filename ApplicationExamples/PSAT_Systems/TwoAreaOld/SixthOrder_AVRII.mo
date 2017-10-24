within PSAT_Systems.TwoAreaOld;
model SixthOrder_AVRII "5-bus system with 6th-order machine and AVR Type II"
  extends PSAT_Systems.TwoAreaOld.BaseClasses.BaseOrder6;
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
    Ke=1) annotation (Placement(transformation(extent={{-138,6},{-118,26}})));
equation
  connect(aVRTypeII.vf, order6.vf) annotation (Line(points={{-116,16},{-114.75,
          16},{-114.75,5},{-114,5}}, color={0,0,127}));
  connect(aVRTypeII.v, order6.v) annotation (Line(points={{-140,10},{-142,10},{
          -146,10},{-146,-16},{-88,-16},{-88,3},{-91,3}}, color={0,0,127}));
  connect(aVRTypeII.vf0, order6.vf0) annotation (Line(points={{-128,4},{-130,4},
          {-130,-8},{-152,-8},{-152,34},{-110,34},{-110,11}}, color={0,0,127}));
  connect(aVRTypeII.vref0, aVRTypeII.vref) annotation (Line(points={{-128,28},{
          -136,28},{-136,30},{-140,30},{-140,22}}, color={0,0,127}));
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
end SixthOrder_AVRII;
