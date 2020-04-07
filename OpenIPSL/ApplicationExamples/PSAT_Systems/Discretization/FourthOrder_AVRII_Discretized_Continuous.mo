within PSAT_Systems.Discretization;
model FourthOrder_AVRII_Discretized_Continuous
  "5-bus system with 4th-order machine and AVR Type II + Sample and Hold"
  extends PSAT_Systems.TwoAreaOld.BaseClasses.BaseOrder4;
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
    Be=0) annotation (Placement(transformation(extent={{-158,-6},{-138,14}})));
  Modelica_Synchronous.RealSignals.Sampler.Sample sample1
    annotation (Placement(transformation(extent={{-178,4},{-166,16}})));
  Modelica_Synchronous.RealSignals.Sampler.SampleClocked sample2
    annotation (Placement(transformation(extent={{-178,-6},{-166,6}})));
  Modelica_Synchronous.RealSignals.Sampler.Hold hold1(y_start=1.046883400898693)
    annotation (Placement(transformation(extent={{-132,0},{-120,12}})));
  Modelica_Synchronous.ClockSignals.Clocks.PeriodicRealClock periodicClock1(
    period=0.01,
    useSolver=true,
    solverMethod="ImplicitEuler")
    annotation (Placement(transformation(extent={{-194,-52},{-182,-40}})));
equation
  connect(sample1.y, aVRTypeII.vref) annotation (Line(
      points={{-165.4,10},{-160,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sample2.y, aVRTypeII.v) annotation (Line(
      points={{-165.4,0},{-160,0},{-160,-2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(periodicClock1.y, sample2.clock) annotation (Line(
      points={{-181.4,-46},{-172,-46},{-172,-7.2}},
      color={175,175,175},
      pattern=LinePattern.Dot,
      thickness=0.5,
      smooth=Smooth.None));
  connect(aVRTypeII.vf, hold1.u) annotation (Line(points={{-136,4},{-136.75,4},
          {-136.75,6},{-133.2,6}}, color={0,0,127}));
  connect(hold1.y, order4.vf) annotation (Line(points={{-119.4,6},{-116,6},{-116,
          5},{-114,5}}, color={0,0,127}));
  connect(sample2.u, order4.v) annotation (Line(points={{-179.2,0},{-188,0},{-188,
          -16},{-88,-16},{-88,3},{-91,3}}, color={0,0,127}));
  connect(aVRTypeII.vref0, sample1.u) annotation (Line(points={{-148,16},{-148,
          28},{-148,30},{-190,30},{-190,12},{-179.2,12},{-179.2,10}}, color={0,
          0,127}));
  connect(aVRTypeII.vf0, order4.vf0) annotation (Line(points={{-148,-8},{-150,-8},
          {-150,-26},{-204,-26},{-204,40},{-110,40},{-110,11}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-220,-100},{160,100}},
          preserveAspectRatio=false)),
    Icon(coordinateSystem(extent={{-220,-100},{160,100}})),
    experiment(
      StopTime=20,
      Interval=0.01,
      __Dymola_fixedstepsize=0.01,
      __Dymola_Algorithm="Euler"),
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
end FourthOrder_AVRII_Discretized_Continuous;
