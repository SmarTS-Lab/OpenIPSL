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
    Be=0,
    vref0=1.198316846325759,
    vf0=1.044150598133340)
    annotation (Placement(transformation(extent={{-134,-8},{-114,12}})));
  Modelica.Blocks.Sources.Constant vref2(k=1.198316846325759) annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-147,7})));
equation
  connect(vref2.y, aVRTypeII.vref) annotation (Line(points={{-141.5,7},{-138,7},
          {-138,7.4},{-132,7.4}}, color={0,0,127}));
  connect(aVRTypeII.vf, order5.vf) annotation (Line(points={{-115.5,4.6},{-113.75,
          4.6},{-113.75,5},{-112,5}}, color={0,0,127}));
  connect(aVRTypeII.v, order5.v) annotation (Line(points={{-132,1},{-134,1},{-134,
          2},{-136,2},{-136,-14},{-88,-14},{-88,3},{-91,3}}, color={0,0,127}));
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
