within PSAT_Systems.ThreeArea;
model FourthOrder_AVRI
  "ABC system with 4th-order machines (Syn2) and AVR Type I"
  extends PSAT_Systems.ThreeArea.BaseClasses.BaseOrder4;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeI Exc1(
    Te=0.01,
    v0=1.05,
    K0=25,
    vrmax=5,
    vrmin=-5,
    T1=10,
    T2=6.67,
    Tr=0.001,
    vf0=1.091853765980820,
    vref0=1.093674150639233,
    v(start=1.091853765980820))
    annotation (Placement(transformation(extent={{-156,80},{-146,90}})));
  Modelica.Blocks.Sources.Constant vref(k=1.093674150639233) annotation (
      Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=0,
        origin={-170,88})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeI Exc2(
    Te=0.01,
    v0=1.05,
    K0=25,
    vrmax=5,
    vrmin=-5,
    T1=10,
    T2=6.67,
    Tr=0.001,
    vref0=1.093835147859700,
    vf0=1.095878696492499,
    v(start=1.095878696492499))
    annotation (Placement(transformation(extent={{166,0},{156,10}})));
  Modelica.Blocks.Sources.Constant vref1(k=1.093835147859700) annotation (
      Placement(transformation(
        extent={{3,-3},{-3,3}},
        rotation=0,
        origin={175,17})));
equation
  connect(Exc1.vf, order4_1.vf) annotation (Line(points={{-145.5,85.1},{-142.75,
          85.1},{-142.75,86},{-140,86}}, color={0,0,127}));
  connect(vref.y, Exc1.vref) annotation (Line(points={{-165.6,88},{-157.1,88},{
          -157.1,87.8}}, color={0,0,127}));
  connect(Exc1.v, order4_1.v) annotation (Line(points={{-157.2,83.2},{-162,83.2},
          {-162,96},{-110,96},{-110,83.6},{-114.8,83.6}}, color={0,0,127}));
  connect(Exc2.vf, order3_2.vf) annotation (Line(points={{155.5,5.1},{153.75,
          5.1},{153.75,5},{152,5}}, color={0,0,127}));
  connect(vref1.y, Exc2.vref) annotation (Line(points={{171.7,17},{170,17},{170,
          7.8},{167.1,7.8}}, color={0,0,127}));
  connect(Exc2.v, order3_2.v) annotation (Line(points={{167.2,3.2},{172,3.2},{
          172,12},{128,12},{128,3},{131,3}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-180,-120},{180,120}},
          preserveAspectRatio=false)),
    Icon(coordinateSystem(extent={{-180,-120},{180,120}})),
    experiment(
      StopTime=20,
      Interval=0.001,
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
end FourthOrder_AVRI;
