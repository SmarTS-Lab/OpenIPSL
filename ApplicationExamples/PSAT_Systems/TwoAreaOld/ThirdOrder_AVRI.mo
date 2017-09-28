within PSAT_Systems.TwoAreaOld;
model ThirdOrder_AVRI "5-bus system with 3rd-order machine and AVR Type I"
  extends PSAT_Systems.TwoAreaOld.BaseClasses.BaseOrder3;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeI aVRTypeII(
    v0=1.05,
    vf0=1.046883400898693,
    vref0=1.198705028536746,
    vrmin=0,
    vrmax=7.57,
    Te=0.4,
    Tr=0.05,
    Ae=0,
    Be=0) annotation (Placement(transformation(extent={{-136,-2},{-118,12}})));
  Modelica.Blocks.Sources.Constant vref2(k=1.198705028536746) annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-151,9})));
equation
  connect(vref2.y, aVRTypeII.vref) annotation (Line(points={{-145.5,9},{-141.75,
          9},{-141.75,8.92},{-137.98,8.92}}, color={0,0,127}));
  connect(aVRTypeII.vf, order3.vf) annotation (Line(points={{-117.1,5.14},{-114.55,
          5.14},{-114.55,5},{-112,5}}, color={0,0,127}));
  connect(aVRTypeII.v, order3.v) annotation (Line(points={{-138.16,2.48},{-142,
          2.48},{-142,-14},{-86,-14},{-86,3},{-91,3}}, color={0,0,127}));
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
