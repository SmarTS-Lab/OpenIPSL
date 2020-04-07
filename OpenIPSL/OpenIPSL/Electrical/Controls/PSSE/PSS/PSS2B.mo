within OpenIPSL.Electrical.Controls.PSSE.PSS;
model PSS2B
  extends BaseClasses.BasePSS;
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
  parameter Integer M = 5 "Ramp tracking filter coefficient";
  parameter Integer N = 1 "Ramp tracking filter coefficient";
  OpenIPSL.NonElectrical.Continuous.LeadLag Leadlag1(
    K=1,
    T1=T_1,
    T2=T_2,
    y_start=0) annotation (Placement(transformation(extent={{106,-10},{126,10}})));
  OpenIPSL.NonElectrical.Continuous.LeadLag Leadlag2(
    K=1,
    T1=T_3,
    T2=T_4,
    y_start=0) annotation (Placement(transformation(extent={{134,-10},{154,10}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag SimpleLag1(
    K=1,
    T=T_6,
    y_start=0) annotation (Placement(transformation(extent={{-50,10},{-30,30}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag SimpleLag2(
    K=K_S2,
    T=T_7,
    y_start=0) annotation (Placement(transformation(extent={{-50,-30},{-30,-10}})));
  OpenIPSL.NonElectrical.Continuous.LeadLag Leadlag3(
    K=1,
    T1=T_10,
    T2=T_11,
    y_start=0) annotation (Placement(transformation(extent={{164,-10},{184,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_STMAX, uMin=V_STMIN) annotation (Placement(transformation(extent={{194,-10},
            {214,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=V_S1MAX, uMin=V_S1MIN) annotation (Placement(transformation(extent={{-148,10},
            {-128,30}})));
  Modelica.Blocks.Nonlinear.Limiter limiter2(uMax=V_S2MAX, uMin=V_S2MIN) annotation (Placement(transformation(extent={{-148,
            -30},{-128,-10}})));
  Modelica.Blocks.Math.Add add(k2=+K_S3) annotation (Placement(transformation(extent={{-18,4},
            {2,24}})));
  Modelica.Blocks.Math.Add add1(k2=-1) annotation (Placement(transformation(extent={{48,-10},
            {68,10}})));
  Modelica.Blocks.Math.Gain gain(k=K_S1) annotation (Placement(transformation(extent={{76,-10},
            {96,10}})));
  NonElectrical.Continuous.DerivativeLag derivativeLag(
    K=T_w1,
    T=T_w1,
    y_start=0,
    x_start=V_S10) annotation (Placement(transformation(extent={{-114,10},{-94,
            30}})));
  NonElectrical.Continuous.DerivativeLag derivativeLag1(
    y_start=0,
    K=T_w2,
    T=T_w2) annotation (Placement(transformation(extent={{-82,10},{-62,30}})));
  NonElectrical.Continuous.DerivativeLag derivativeLag2(
    y_start=0,
    K=T_w3,
    T=T_w3,
    x_start=V_S20) annotation (Placement(transformation(extent={{-114,-30},{-94,
            -10}})));
  NonElectrical.Continuous.DerivativeLag derivativeLag3(
    y_start=0,
    K=T_w4,
    T=T_w4) annotation (Placement(transformation(extent={{-82,-30},{-62,-10}})));
  NonElectrical.Continuous.RampTrackingFilter rampTrackingFilter(
    M=M,
    N=N,
    T_1=T_8,
    T_2=T_9) annotation (Placement(transformation(extent={{12,4},{32,24}})));
protected
  parameter Real V_S10(fixed=false);
  parameter Real V_S20(fixed=false);
initial equation
  V_S10 = V_S1;
  V_S20 = V_S2;

equation
  connect(Leadlag3.y, limiter.u) annotation (Line(points={{185,0},{192,0}}, color={0,0,127}));
  connect(Leadlag2.y, Leadlag3.u) annotation (Line(points={{155,0},{162,0}}, color={0,0,127}));
  connect(Leadlag2.u, Leadlag1.y) annotation (Line(points={{132,0},{127,0}}, color={0,0,127}));
  connect(SimpleLag1.y, add.u1) annotation (Line(points={{-29,20},{-20,20}}, color={0,0,127}));
  connect(SimpleLag2.y, add.u2) annotation (Line(points={{-29,-20},{-26,-20},{
          -26,8},{-20,8}},                                                                     color={0,0,127}));
  connect(add1.y, gain.u) annotation (Line(points={{69,0},{69,0},{74,0}}, color={0,0,127}));
  connect(gain.y, Leadlag1.u) annotation (Line(points={{97,0},{100.5,0},{104,0}},
                                                                                color={0,0,127}));
  connect(derivativeLag.y, derivativeLag1.u) annotation (Line(points={{-93,20},
          {-84,20}},                                                                        color={0,0,127}));
  connect(derivativeLag3.u, derivativeLag2.y) annotation (Line(points={{-84,-20},
          {-93,-20}},                                                                          color={0,0,127}));
  connect(derivativeLag1.y, SimpleLag1.u) annotation (Line(points={{-61,20},{
          -61,20},{-52,20}},                                                                    color={0,0,127}));
  connect(derivativeLag3.y, SimpleLag2.u) annotation (Line(points={{-61,-20},{
          -52,-20}},                                                                     color={0,0,127}));
  connect(derivativeLag2.u, limiter2.y) annotation (Line(points={{-116,-20},{
          -127,-20}},                                                                    color={0,0,127}));
  connect(derivativeLag.u, limiter1.y) annotation (Line(points={{-116,20},{-127,
          20}},                                                                       color={0,0,127}));
  connect(add.y, rampTrackingFilter.u) annotation (Line(points={{3,14},{10,14}},   color={0,0,127}));
  connect(rampTrackingFilter.y, add1.u1) annotation (Line(points={{33,14},{38,
          14},{38,6},{46,6}},                                                                     color={0,0,127}));
  connect(add1.u2, add.u2) annotation (Line(points={{46,-6},{38,-6},{38,-20},{
          -26,-20},{-26,8},{-20,8}},                                                                     color={0,0,127}));
  connect(V_S1, limiter1.u)
    annotation (Line(points={{-160,40},{-150,40},{-150,20}}, color={0,0,127}));
  connect(V_S2, limiter2.u) annotation (Line(points={{-160,-40},{-150,-40},{
          -150,-20}}, color={0,0,127}));
  connect(limiter.y, VOTHSG)
    annotation (Line(points={{215,0},{226,0},{226,0}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-160,-80},{220,
            80}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-160,-80},{220,80}}), graphics={                                                             Text(
          extent={{-34,14},{32,-16}},
          lineColor={28,108,200},
          textString="PSS2B"),Text(
          extent={{-146,46},{-106,32}},
          lineColor={28,108,200},
          textString="V_S1"),Text(
          extent={{164,16},{210,-14}},
          lineColor={28,108,200},
          textString="VOTHSG"),Text(
          extent={{-146,-34},{-106,-48}},
          lineColor={28,108,200},
          textString="V_S2")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>IEEE Power System Stabilizer Type 2B (PSS2B), PSSE manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2020-02-18</td>
</tr>
<tr>
<td><p>Authors</p></td>
<td><p>Le Qi, SmarTS Lab, KTH Royal Institute of Technology</p></td>
<td><p>Giuseppe Laera, ALSETLab, RPI Rensselaer Polytechnic Institute</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end PSS2B;
