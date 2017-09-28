within OpenIPSL.Electrical.Controls.PSSE.PSS;
model PSS2B
  parameter Real T_w1=10 "Washout time constant 1";
  parameter Real T_w2=10 "Washout time constant 2";
  parameter Real T_6=1e-9 "Lag time constant 6";
  parameter Real T_w3=10 "Washout time constant 3";
  parameter Real T_w4=1e-9 "Washout time constant 4";
  parameter Real T_7=10 "Lag time constant 7";
  parameter Real K_S2=0.99 "Lag gain 2, T_7/H";
  parameter Real K_S3=1 "Lag gain 3";
  parameter Real T_8=0.5 "Ramp-tracking filter time constant";
  parameter Real T_9=0.1 "Ramp-tracking filter time constant";
  parameter Real K_S1=20 "PSS gain";
  parameter Real T_1=0.15 "Lead-lag time constant 1";
  parameter Real T_2=0.025 "Lead-lag time constant 2";
  parameter Real T_3=0.15 "Lead-lag time constant 3";
  parameter Real T_4=0.025 "Lead-lag time constant 4";
  parameter Real T_10=1e-9 "Lead-lag time constant 10";
  parameter Real T_11=0.033 "Lead-lag time constant 11";
  parameter Real V_S1MAX=0.08 "PSS input 1 max. limit";
  parameter Real V_S1MIN=-0.08 "PSS input 1 min. limit";
  parameter Real V_S2MAX=1.25 "PSS input 2 max. limit";
  parameter Real V_S2MIN=-1.25 "PSS input 2 min. limit";
  parameter Real V_STMAX=0.1 "PSS output max. limit, 0.1 ~ 0.2";
  parameter Real V_STMIN=-0.1 "PSS output min. limit, -0.05 ~ -0.1";
  parameter Real M "Ramp tracking filter coefficient";
  parameter Real N "Ramp tracking filter coefficient";
  Modelica.Blocks.Interfaces.RealInput V_S1 "PSS input signal 1"
    annotation (Placement(transformation(extent={{-186,14},{-174,26}})));
  OpenIPSL.NonElectrical.Continuous.LeadLag Leadlag1(
    K=1,
    T1=T_1,
    T2=T_2,
    y_start=0)
    annotation (Placement(transformation(extent={{88,-10},{108,10}})));
  OpenIPSL.NonElectrical.Continuous.LeadLag Leadlag2(
    K=1,
    T1=T_3,
    T2=T_4,
    y_start=0)
    annotation (Placement(transformation(extent={{116,-10},{136,10}})));
  Modelica.Blocks.Interfaces.RealOutput VOTHSG "PSS output signal" annotation (
      Placement(transformation(extent={{208,-6},{220,6}}), iconTransformation(
          extent={{180,-6},{192,6}})));
  Modelica.Blocks.Interfaces.RealInput V_S2 "PSS input signal 2"
    annotation (Placement(transformation(extent={{-186,-26},{-174,-14}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag SimpleLag1(
    K=1,
    T=T_6,
    y_start=0)
    annotation (Placement(transformation(extent={{-68,10},{-48,30}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag SimpleLag2(
    K=K_S2,
    T=T_7,
    y_start=0)
    annotation (Placement(transformation(extent={{-68,-30},{-48,-10}})));
  OpenIPSL.NonElectrical.Continuous.LeadLag Leadlag3(
    K=1,
    T1=T_10,
    T2=T_11,
    y_start=0)
    annotation (Placement(transformation(extent={{146,-10},{166,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_STMAX, uMin=V_STMIN)
    annotation (Placement(transformation(extent={{176,-10},{196,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=V_S1MAX, uMin=V_S1MIN)
    annotation (Placement(transformation(extent={{-166,10},{-146,30}})));
  Modelica.Blocks.Nonlinear.Limiter limiter2(uMax=V_S2MAX, uMin=V_S2MIN)
    annotation (Placement(transformation(extent={{-166,-30},{-146,-10}})));
  Modelica.Blocks.Math.Add add(k2=+K_S3)
    annotation (Placement(transformation(extent={{-36,4},{-16,24}})));
  Modelica.Blocks.Math.Add add1(k2=-1)
    annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  Modelica.Blocks.Math.Gain gain(k=K_S1)
    annotation (Placement(transformation(extent={{58,-10},{78,10}})));
  NonElectrical.Continuous.DerivativeLag derivativeLag(
    K=T_w1,
    T=T_w1,
    y_start=0,
    x_start=V_S10)
    annotation (Placement(transformation(extent={{-132,10},{-112,30}})));
  NonElectrical.Continuous.DerivativeLag derivativeLag1(
    y_start=0,
    K=T_w2,
    T=T_w2) annotation (Placement(transformation(extent={{-100,10},{-80,30}})));
  NonElectrical.Continuous.DerivativeLag derivativeLag2(
    y_start=0,
    K=T_w3,
    T=T_w3,
    x_start=V_S20)
    annotation (Placement(transformation(extent={{-132,-30},{-112,-10}})));
  NonElectrical.Continuous.DerivativeLag derivativeLag3(
    y_start=0,
    K=T_w4,
    T=T_w4)
    annotation (Placement(transformation(extent={{-100,-30},{-80,-10}})));
  NonElectrical.Continuous.RampTrackingFilter rampTrackingFilter(
    M=M,
    N=N,
    startValue=0,
    T_1=T_8,
    T_2=T_9) annotation (Placement(transformation(extent={{-6,4},{14,24}})));
protected
  parameter Real V_S10(fixed=false);
  parameter Real V_S20(fixed=false);
initial equation
  V_S10 = V_S1;
  V_S20 = V_S2;
equation
  connect(limiter.y, VOTHSG)
    annotation (Line(points={{197,0},{214,0}}, color={0,0,127}));
  connect(Leadlag3.y, limiter.u)
    annotation (Line(points={{167,0},{174,0}}, color={0,0,127}));
  connect(Leadlag2.y, Leadlag3.u)
    annotation (Line(points={{137,0},{144,0}}, color={0,0,127}));
  connect(Leadlag2.u, Leadlag1.y)
    annotation (Line(points={{114,0},{109,0}}, color={0,0,127}));
  connect(V_S2, limiter2.u)
    annotation (Line(points={{-180,-20},{-168,-20}}, color={0,0,127}));
  connect(V_S1, limiter1.u)
    annotation (Line(points={{-180,20},{-168,20}}, color={0,0,127}));
  connect(SimpleLag1.y, add.u1)
    annotation (Line(points={{-47,20},{-38,20}}, color={0,0,127}));
  connect(SimpleLag2.y, add.u2) annotation (Line(points={{-47,-20},{-44,-20},{-44,
          8},{-38,8}}, color={0,0,127}));
  connect(add1.y, gain.u)
    annotation (Line(points={{51,0},{51,0},{56,0}}, color={0,0,127}));
  connect(gain.y, Leadlag1.u)
    annotation (Line(points={{79,0},{82.5,0},{86,0}}, color={0,0,127}));
  connect(derivativeLag.y, derivativeLag1.u)
    annotation (Line(points={{-111,20},{-102,20}}, color={0,0,127}));
  connect(derivativeLag3.u, derivativeLag2.y)
    annotation (Line(points={{-102,-20},{-111,-20}}, color={0,0,127}));
  connect(derivativeLag1.y, SimpleLag1.u)
    annotation (Line(points={{-79,20},{-79,20},{-70,20}}, color={0,0,127}));
  connect(derivativeLag3.y, SimpleLag2.u)
    annotation (Line(points={{-79,-20},{-70,-20}}, color={0,0,127}));
  connect(derivativeLag2.u, limiter2.y)
    annotation (Line(points={{-134,-20},{-145,-20}}, color={0,0,127}));
  connect(derivativeLag.u, limiter1.y)
    annotation (Line(points={{-134,20},{-145,20}}, color={0,0,127}));
  connect(add.y, rampTrackingFilter.u)
    annotation (Line(points={{-15,14},{-8,14}}, color={0,0,127}));
  connect(rampTrackingFilter.y, add1.u1)
    annotation (Line(points={{15,14},{20,14},{20,6},{28,6}}, color={0,0,127}));
  connect(add1.u2, add.u2) annotation (Line(points={{28,-6},{20,-6},{20,-20},{-44,
          -20},{-44,8},{-38,8}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-180,-40},{180,
            40}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-180,-40},{180,40}}),
        graphics={Rectangle(extent={{-180,40},{180,-40}}, lineColor={0,0,255}),
          Text(
          extent={{-34,14},{32,-16}},
          lineColor={0,0,255},
          textString="PSS2B"),Text(
          extent={{-172,26},{-132,12}},
          lineColor={0,0,255},
          textString="V_S1"),Text(
          extent={{130,14},{176,-16}},
          lineColor={0,0,255},
          textString="VOTHSG"),Text(
          extent={{-174,-14},{-134,-28}},
          lineColor={0,0,255},
          textString="V_S2")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>IEEE Power System Stabilizer Type 2B (PSS2B), PSSE manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-10-02</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Le Qi, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end PSS2B;
