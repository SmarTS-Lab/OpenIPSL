within PSAT_Systems.TwoAreaOld;
model ThirdOrder_AVRI "5-bus system with 3rd-order machine and AVR Type I"
  extends PSAT_Systems.TwoAreaOld.BaseClasses.BaseOrder3;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeI aVRTypeII(
    v0=1.05,
    vrmin=0,
    vrmax=7.57,
    Te=0.4,
    Tr=0.05,
    Ae=0,
    Be=0) annotation (Placement(transformation(extent={{-136,10},{-118,24}})));
equation
  connect(aVRTypeII.vf, order3.vf) annotation (Line(points={{-116.2,17},{-114.55,
          17},{-114.55,5},{-114,5}}, color={0,0,127}));
  connect(aVRTypeII.v, order3.v) annotation (Line(points={{-137.8,12.8},{-142,
          12.8},{-142,-14},{-86,-14},{-86,3},{-91,3}}, color={0,0,127}));
  connect(aVRTypeII.vf0, order3.vf0) annotation (Line(points={{-127,8.6},{-127,
          2},{-127,0},{-152,0},{-152,36},{-106,36},{-106,38},{-110,38},{-110,11}},
        color={0,0,127}));
  connect(aVRTypeII.vref0, aVRTypeII.vref) annotation (Line(points={{-127,25.4},
          {-126,25.4},{-126,28},{-140,28},{-140,21.2},{-137.8,21.2}}, color={0,
          0,127}));
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
end ThirdOrder_AVRI;
