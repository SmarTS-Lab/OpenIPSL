within PSAT_Systems.TwoArea;
model ThirdOrder_AVRII "31-bus system with 3rd-order machine and AVR Type II"
  extends PSAT_Systems.TwoArea.BaseClasses.BaseOrder3;
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
    Ke=1) annotation (Placement(transformation(extent={{-152,38},{-132,58}})));
equation
  connect(aVRTypeII.vf, order3_1.vf) annotation (Line(points={{-130,48},{-125.75,
          48},{-125.75,35},{-122,35}}, color={0,0,127}));
  connect(aVRTypeII.v, order3_1.v) annotation (Line(points={{-154,42},{-162,42},
          {-162,30},{-164,30},{-164,16},{-92,16},{-92,33},{-99,33}}, color={0,0,
          127}));
  connect(order3_1.vf0, aVRTypeII.vf0) annotation (Line(points={{-118,41},{-120,
          41},{-120,64},{-120,68},{-168,68},{-168,36},{-142,36}}, color={0,0,
          127}));
  connect(aVRTypeII.vref, aVRTypeII.vref0) annotation (Line(points={{-154,54},{
          -158,54},{-158,56},{-160,56},{-160,64},{-142,64},{-142,60}}, color={0,
          0,127}));
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
end ThirdOrder_AVRII;
