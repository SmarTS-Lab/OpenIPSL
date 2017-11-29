within PSAT_Systems.TwoAreaOld;
model SixthOrder_AVRI "5-bus system with 6th-order machine and AVR Type I"
  extends PSAT_Systems.TwoAreaOld.BaseClasses.BaseOrder6;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeI aVRTypeI(
    v0=1.05,
    vrmin=0,
    vrmax=7.57,
    Te=0.4,
    Tr=0.05,
    Ae=0,
    Be=0) annotation (Placement(transformation(extent={{-136,-2},{-120,12}})));
equation
  connect(aVRTypeI.vf, order6.vf) annotation (Line(points={{-118.4,5},{-114.6,5},
          {-114,5}}, color={0,0,127}));
  connect(aVRTypeI.v, order6.v) annotation (Line(points={{-137.6,0.8},{-148,0.8},
          {-148,-14},{-88,-14},{-88,3},{-91,3}}, color={0,0,127}));
  connect(aVRTypeI.vf0, order6.vf0) annotation (Line(points={{-128,-3.4},{-136,
          -3.4},{-136,-8},{-144,-8},{-144,24},{-108,24},{-108,20},{-110,20},{-110,
          11}}, color={0,0,127}));
  connect(aVRTypeI.vref0, aVRTypeI.vref) annotation (Line(points={{-128,13.4},{
          -128,18},{-128,16},{-142,16},{-142,9.2},{-137.6,9.2}}, color={0,0,127}));
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
end SixthOrder_AVRI;
