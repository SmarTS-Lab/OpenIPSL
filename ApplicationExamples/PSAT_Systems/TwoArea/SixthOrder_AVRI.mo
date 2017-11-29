within PSAT_Systems.TwoArea;
model SixthOrder_AVRI "31-bus system with 6th-order machine and AVR Type I"
  extends PSAT_Systems.TwoArea.BaseClasses.BaseOrder6;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeI aVRTypeI(
    v0=1.05,
    vrmin=0,
    vrmax=7.57,
    Te=0.4,
    Tr=0.05,
    Ae=0,
    Be=0) annotation (Placement(transformation(extent={{-148,24},{-128,44}})));
equation
  connect(aVRTypeI.vf, order6.vf) annotation (Line(points={{-126,34},{-123.5,34},
          {-123.5,35},{-122,35}}, color={0,0,127}));
  connect(aVRTypeI.v, order6.v) annotation (Line(points={{-150,28},{-154,28},{-154,
          16},{-94,16},{-94,33},{-99,33}}, color={0,0,127}));
  connect(aVRTypeI.vf0, order6.vf0) annotation (Line(points={{-138,22},{-140,22},
          {-140,12},{-140,2},{-140,4},{-168,4},{-168,60},{-118,60},{-118,41}},
        color={0,0,127}));
  connect(aVRTypeI.vref0, aVRTypeI.vref) annotation (Line(points={{-138,46},{-138,
          52},{-158,52},{-158,40},{-150,40}}, color={0,0,127}));
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
end SixthOrder_AVRI;
