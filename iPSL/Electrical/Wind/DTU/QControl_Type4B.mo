within iPSL.Electrical.Wind.DTU;
model QControl_Type4B "Developed by DTU"
  iPSL.NonElectrical.Logical.Relay4 imReal4in annotation (Placement(transformation(extent={{-58,20},{-48,30}})));
  Modelica.Blocks.Interfaces.RealInput Uref annotation (Placement(transformation(extent={{-88,16},{-80,24}})));
  Modelica.Blocks.Interfaces.RealInput Qref annotation (Placement(transformation(extent={{-88,-4},{-80,4}})));
  Modelica.Blocks.Interfaces.RealInput Qwtt annotation (Placement(transformation(extent={{-88,36},{-80,44}})));
  Modelica.Blocks.Interfaces.RealInput Pwtt annotation (Placement(transformation(extent={{-88,-24},{-80,-16}})));
  Modelica.Blocks.Interfaces.RealInput Uwtt annotation (Placement(transformation(extent={{-88,-44},{-80,-36}})));
  iPSL.NonElectrical.Continuous.SimpleLag imSimpleLag(
    y_start=ini_Pwtt,
    K=1,
    T=Tpfilt) annotation (Placement(transformation(extent={{-70,-24},{-60,-14}})));
  parameter Real Tpfilt "Power measurement filter time constant";
  parameter Real MwttPF "Power factor control mode";
  parameter Real MwttU "Voltage control mode";
  parameter Real MwttOL "Open loop mode";
  parameter Real Uref0 "User defined voltage reference";
  parameter Real Tangent_phi "Calculated from power factor setpoint";
  parameter Real Qmax "Maximum reactive power";
  parameter Real Qmin "Minimum reactive power";
  parameter Real Tufilt "Voltage measurement filter time constant";
  parameter Real Uqdip "Voltage threshold value for LVRT detection";
  parameter Real Tpost "Length of time period where post fault reactive power is injected";
  parameter Real Udb1 "Voltage dead band lower limit";
  parameter Real Udb2 "Voltage dead band upper limit";
  parameter Real Kqv "Voltage scaling factor for LVRT current";
  parameter Real iqh1 "Maximum reactive current injection during dip";
  parameter Real iqmin "Minimum reactive current injection";
  parameter Real iqmax "Maximum reactive current injection";
  parameter Real iq_post "Post fault reactive current injection";
  parameter Real Umax "Maximum voltage in voltage PI controller integral term";
  parameter Real Umin "Minimum voltage in voltage PI controller integral term";
  parameter Real KiQ "Reactive power PI controller integration gain";
  parameter Real KpQ "Reactive power PI controller proportional gain";
  parameter Real Tqord "Time constant in reactive power order lag";
  parameter Real KiU "Voltage PI controller integration gain";
  parameter Real KpU "Voltage PI controller proportional gain";
  parameter Real Tiq "Time constant in reactive current lag";
  parameter Real ini_Pwtt(fixed=false) "Initial value of the state (Active power order lag)";
  parameter Real ini_Uwtt(fixed=false) "Initial value of the state (Voltage order lag)";
  parameter Real ini_Qpi(fixed=false) "Initial value of the state (Reactive power PI controller)";
  parameter Real ini_Qwtt(fixed=false) "Initial value of the state (Reactive power order lag)";
  parameter Real ini_Iqwtt(fixed=false) "Initial reactive current";
  parameter Real Rdroop "Resistive component of voltage drop impedance";
  parameter Real Xdroop "Inductive component of voltage drop impedance";
  Modelica.Blocks.Sources.Constant imSetPoint1(k=MwttPF) annotation (Placement(transformation(extent={{-92,40},{-74,60}})));
  Modelica.Blocks.Sources.Constant imSetPoint4(k=MwttOL) annotation (Placement(transformation(extent={{-92,64},{-74,84}})));
  Modelica.Blocks.Sources.Constant imSetPoint3(k=Uref0) annotation (Placement(transformation(extent={{-92,56},{-74,76}})));
  Modelica.Blocks.Sources.Constant imSetPoint2(k=MwttU) annotation (Placement(transformation(extent={{-92,48},{-74,68}})));
  Modelica.Blocks.Sources.Constant imSetPoint(k=Tangent_phi) annotation (Placement(transformation(extent={{-72,-40},{-64,-32}})));
  iPSL.NonElectrical.Logical.Relay imRelay annotation (Placement(transformation(extent={{-32,24},{-24,32}})));
  Modelica.Blocks.Nonlinear.Limiter imLimiter(uMin=Qmin, uMax=Qmax) annotation (Placement(transformation(extent={{-10,26},{-2,34}})));
  iPSL.NonElectrical.Continuous.SimpleLag imSimpleLag1(
    K=1,
    T=Tufilt,
    y_start=ini_Uwtt) annotation (Placement(transformation(extent={{-76,-52},{-70,-46}})));
  iPSL.NonElectrical.Logical.Relay imRelay1 annotation (Placement(transformation(extent={{30,34},{40,44}})));
  Modelica.Blocks.Sources.Constant imSetPoint5(k=0) annotation (Placement(transformation(extent={{7,41},{18,52}})));
  iPSL.Electrical.Wind.DTU.LVRT lVRT(Uqdip=Uqdip, Tpost=Tpost) annotation (Placement(transformation(extent={{-54,-74},{2,-32}})));
  Modelica.Blocks.Nonlinear.Limiter imLimiter1(uMin=0.01, uMax=999) annotation (Placement(transformation(extent={{-40,-46},{-28,-34}})));
  iPSL.Electrical.Wind.DTU.VoltageDepCurrent voltageDepCurrent(
    Udb1=Udb1,
    Udb2=Udb2,
    Kqv=Kqv) annotation (Placement(transformation(extent={{-52,-98},{0,-62}})));
  Modelica.Blocks.Nonlinear.Limiter imLimiter2(uMin=iqmin, uMax=iqh1) annotation (Placement(transformation(extent={{-4,-86},{8,-74}})));
  Modelica.Blocks.Sources.Constant imSetPoint6(k=iq_post) annotation (Placement(transformation(extent={{12,-74},{24,-62}})));
  Modelica.Blocks.Math.Gain imGain(k=KpQ) annotation (Placement(transformation(extent={{50,18},{62,30}})));
  iPSL.NonElectrical.Logical.Relay imRelay2 annotation (Placement(transformation(extent={{84,44},{92,52}})));
  Modelica.Blocks.Nonlinear.Limiter imLimiter3(uMin=Umin, uMax=Umax) annotation (Placement(transformation(extent={{100,48},{108,56}})));
  Modelica.Blocks.Sources.Constant imSetPoint8(k=0) annotation (Placement(transformation(extent={{137,54},{148,66}})));
  iPSL.NonElectrical.Logical.Relay imRelay4 annotation (Placement(transformation(extent={{160,56},{170,66}})));
  Modelica.Blocks.Math.Gain imGain1(k=KpU) annotation (Placement(transformation(extent={{178,36},{190,48}})));
  iPSL.NonElectrical.Logical.Relay imRelay5 annotation (Placement(transformation(extent={{225,53},{236,64}})));
  Modelica.Blocks.Interfaces.RealOutput Iqcmd annotation (Placement(transformation(extent={{120,-24},{128,-16}}), iconTransformation(extent={{120,-24},{128,-16}})));
  Modelica.Blocks.Interfaces.RealOutput F_LVRT annotation (Placement(transformation(extent={{120,16},{128,24}}), iconTransformation(extent={{120,16},{128,24}})));
  iPSL.Electrical.Wind.DTU.IQLVRT iQLVRT1 annotation (Placement(transformation(extent={{30,-96},{78,-52}})));
  iPSL.Electrical.Wind.DTU.VoltageDrop voltageDrop(Rdroop=Rdroop, Xdroop=Xdroop) annotation (Placement(transformation(extent={{-28,-36},{20,2}})));
  Modelica.Blocks.Continuous.LimIntegrator ImIntegratornonwindup(
    outMin=Umin,
    outMax=Umax,
    k=KiQ,
    y_start=ini_Qpi,
    initType=Modelica.Blocks.Types.Init.InitialOutput) annotation (Placement(transformation(extent={{50,34},{60,44}})));
  Modelica.Blocks.Continuous.LimIntegrator ImIntegratornonwindup1(
    outMin=iqmin,
    outMax=iqmax,
    k=KiU,
    y_start=ini_Iqwtt,
    initType=Modelica.Blocks.Types.Init.InitialOutput) annotation (Placement(transformation(extent={{186,56},{196,66}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{68,26},{80,38}})));
  Modelica.Blocks.Math.Add add1(k2=-1) annotation (Placement(transformation(extent={{8,28},{18,38}})));
  Modelica.Blocks.Math.Add add2 annotation (Placement(transformation(extent={{32,60},{44,72}})));
  Modelica.Blocks.Math.Division division annotation (Placement(transformation(extent={{94,0},{108,14}})));
  Modelica.Blocks.Math.Product product annotation (Placement(transformation(extent={{-50,-28},{-40,-18}})));
  Modelica.Blocks.Math.Add add3(k1=-1) annotation (Placement(transformation(extent={{116,46},{128,58}})));
  Modelica.Blocks.Math.Add add4 annotation (Placement(transformation(extent={{202,46},{214,58}})));
  NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=1,
    T=Tqord,
    outMax=Qmax,
    outMin=Qmin,
    y_start=ini_Qwtt) annotation (Placement(transformation(extent={{28,6},{40,18}})));
  NonElectrical.Continuous.SimpleLagRateLimBlock simpleLagLimBlock(
    K=1,
    T=Tiq,
    outMax=iqmin,
    outMin=iqmax,
    y_start=ini_Iqwtt,
    rmin=-999,
    rmax=+999) annotation (Placement(transformation(extent={{176,-2},{196,18}})));
initial equation
  ini_Pwtt = Pwtt;
  ini_Qpi = imLimiter1.y;
  ini_Uwtt = Uwtt;
  ini_Qwtt = -Qwtt;
equation
  connect(imReal4in.p1, Uref) annotation (Line(
      points={{-58.625,27.5},{-69.75,27.5},{-69.75,20},{-84,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imReal4in.p2, Qref) annotation (Line(
      points={{-58.625,22.5},{-68.75,22.5},{-68.75,0},{-84,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Pwtt, imSimpleLag.u) annotation (Line(
      points={{-84,-20},{-84,-19},{-71,-19}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSetPoint1.y, imReal4in.in1) annotation (Line(
      points={{-73.1,50},{-56.75,50},{-56.75,30.6875}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSetPoint2.y, imReal4in.in2) annotation (Line(
      points={{-73.1,58},{-54.5,58},{-54.5,30.6875}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSetPoint3.y, imReal4in.in3) annotation (Line(
      points={{-73.1,66},{-51.75,66},{-51.75,30.6875}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSetPoint4.y, imReal4in.in4) annotation (Line(
      points={{-73.1,74},{-49.25,74},{-49.25,30.6875}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imReal4in.n, imRelay.u3) annotation (Line(
      points={{-47.5,25},{-33,25}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imRelay.u1, imReal4in.in1) annotation (Line(
      points={{-33,31},{-38,31},{-38,50},{-56.75,50},{-56.75,30.6875}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imRelay.y, imLimiter.u) annotation (Line(
      points={{-23.2,28},{-8,28},{-8,30},{-10.8,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Uwtt, imSimpleLag1.u) annotation (Line(
      points={{-84,-40},{-84,-49},{-76.6,-49}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(lVRT.Uwtt, imSimpleLag1.y) annotation (Line(
      points={{-38.88,-53},{-46.44,-53},{-46.44,-49},{-69.7,-49}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSimpleLag1.u, imLimiter1.u) annotation (Line(
      points={{-76.6,-49},{-62,-49},{-62,-40},{-41.2,-40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(lVRT.F_LVRT, imRelay1.u1) annotation (Line(
      points={{-13.68,-48.8},{2,-48.8},{2,42.75},{28.75,42.75}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(voltageDepCurrent.Uwtt, imSimpleLag1.y) annotation (Line(
      points={{-40.04,-80},{-46,-80},{-46,-49},{-69.7,-49}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(voltageDepCurrent.iqv, imLimiter2.u) annotation (Line(
      points={{-12.22,-80},{-5.2,-80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imRelay2.u1, imReal4in.in2) annotation (Line(
      points={{83,51},{-54.5,51},{-54.5,30.6875}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imRelay4.u1, imRelay1.u1) annotation (Line(
      points={{158.75,64.75},{136,64.75},{136,-4},{2,-4},{2,42.75},{28.75,42.75}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imRelay5.u1, imReal4in.in4) annotation (Line(
      points={{223.625,62.625},{208,62.625},{208,74},{-49.25,74},{-49.25,30.6875}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(F_LVRT, imRelay1.u1) annotation (Line(
      points={{124,20},{80,20},{80,-28},{2,-28},{2,42.75},{28.75,42.75}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(lVRT.Fpost, iQLVRT1.Fpost) annotation (Line(
      points={{-13.68,-57.2},{16,-57.2},{16,-46},{64,-46},{64,-61.68},{63.6,-61.68}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imRelay5.y, iQLVRT1.iQstate) annotation (Line(
      points={{237.1,58.5},{246,58.5},{246,-30},{30,-30},{30,-67.4},{42.96,-67.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(iQLVRT1.iQcmd, Iqcmd) annotation (Line(
      points={{64.56,-74},{94,-74},{94,-20},{124,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSetPoint6.y, iQLVRT1.iQpost) annotation (Line(
      points={{24.6,-68},{32,-68},{32,-74},{42.96,-74}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imLimiter2.y, iQLVRT1.iqv) annotation (Line(
      points={{8.6,-80},{24,-80},{24,-80.6},{42.96,-80.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(voltageDrop.Pwt, imSimpleLag.u) annotation (Line(
      points={{-19.6,-9.4},{-76,-9.4},{-76,-19},{-71,-19}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(voltageDrop.Uwt, imLimiter1.u) annotation (Line(
      points={{-19.6,-24.6},{-34,-24.6},{-34,-32},{-42,-32},{-42,-40},{-41.2,-40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imRelay1.y, ImIntegratornonwindup.u) annotation (Line(
      points={{41,39},{49,39}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(iQLVRT1.F_LVRT, imRelay1.u1) annotation (Line(
      points={{44.4,-61.68},{44.4,-42},{2,-42},{2,42.75},{28.75,42.75}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ImIntegratornonwindup.y, add.u1) annotation (Line(points={{60.5,39},{62,39},{62,35.6},{66.8,35.6}}, color={0,0,127}));
  connect(imGain.y, add.u2) annotation (Line(points={{62.6,24},{66.8,24},{66.8,28.4}}, color={0,0,127}));
  connect(add.y, imRelay2.u3) annotation (Line(points={{80.6,32},{82,32},{82,42},{76,42},{76,45},{83,45}}, color={0,0,127}));
  connect(imSetPoint5.y, imRelay1.u2) annotation (Line(points={{18.55,46.5},{22,46.5},{22,39},{28.75,39}}, color={0,0,127}));
  connect(add1.y, imRelay1.u3) annotation (Line(points={{18.5,33},{20,33},{20,35.25},{28.75,35.25}}, color={0,0,127}));
  connect(add1.u2, imLimiter.y) annotation (Line(points={{7,30},{-1.6,30}}, color={0,0,127}));
  connect(imGain.u, imRelay1.u3) annotation (Line(points={{48.8,24},{22,24},{22,35.25},{28.75,35.25}}, color={0,0,127}));
  connect(Qwtt, add1.u1) annotation (Line(points={{-84,40},{0,40},{0,36},{7,36}}, color={0,0,127}));
  connect(add2.y, imRelay2.u2) annotation (Line(points={{44.6,66},{76,66},{76,48},{83,48}}, color={0,0,127}));
  connect(add2.u2, imRelay.y) annotation (Line(points={{30.8,62.4},{-23.2,62.4},{-23.2,28}}, color={0,0,127}));
  connect(add2.u1, imReal4in.in3) annotation (Line(points={{30.8,69.6},{-10,69.6},{-10,70},{-49.2,70},{-49.2,30.6875},{-51.75,30.6875}}, color={0,0,127}));
  connect(imLimiter1.y, division.u2) annotation (Line(points={{-27.4,-40},{-26,-40},{-26,2.8},{92.6,2.8}}, color={0,0,127}));
  connect(imSimpleLag.y, product.u1) annotation (Line(points={{-59.5,-19},{-55.75,-19},{-55.75,-20},{-51,-20}}, color={0,0,127}));
  connect(imSetPoint.y, product.u2) annotation (Line(points={{-63.6,-36},{-56,-36},{-56,-26},{-51,-26}}, color={0,0,127}));
  connect(product.y, imRelay.u2) annotation (Line(points={{-39.5,-23},{-38,-23},{-38,28},{-33,28}}, color={0,0,127}));
  connect(voltageDrop.Qwt, add1.u1) annotation (Line(points={{-19.6,-17},{-34,-17},{-34,12},{-74,12},{-74,40},{0,40},{0,36},{7,36}}, color={0,0,127}));
  connect(imRelay2.y, imLimiter3.u) annotation (Line(points={{92.8,48},{99.2,48},{99.2,52}}, color={0,0,127}));
  connect(imLimiter3.y, add3.u1) annotation (Line(points={{108.4,52},{110,52},{110,55.6},{114.8,55.6}}, color={0,0,127}));
  connect(voltageDrop.deltaU, add3.u2) annotation (Line(points={{11.6,-17},{84,-17},{84,28},{112,28},{112,48.4},{114.8,48.4}}, color={0,0,127}));
  connect(imSetPoint8.y, imRelay4.u2) annotation (Line(points={{148.55,60},{158.75,60},{158.75,61}}, color={0,0,127}));
  connect(add3.y, imGain1.u) annotation (Line(points={{128.6,52},{134,52},{134,42},{176.8,42}}, color={0,0,127}));
  connect(imRelay4.y, ImIntegratornonwindup1.u) annotation (Line(points={{171,61},{171,61},{185,61}}, color={0,0,127}));
  connect(imRelay4.u3, imGain1.u) annotation (Line(points={{158.75,57.25},{156,57.25},{156,42},{176.8,42}}, color={0,0,127}));
  connect(ImIntegratornonwindup1.y, add4.u1) annotation (Line(points={{196.5,61},{200.8,61},{200.8,55.6}}, color={0,0,127}));
  connect(imGain1.y, add4.u2) annotation (Line(points={{190.6,42},{200.8,42},{200.8,48.4}}, color={0,0,127}));
  connect(add4.y, imRelay5.u3) annotation (Line(points={{214.6,52},{220,52},{220,54.375},{223.625,54.375}}, color={0,0,127}));
  connect(simpleLagLim.y, division.u1) annotation (Line(points={{40.6,12},{92.6,12},{92.6,11.2}}, color={0,0,127}));
  connect(simpleLagLim.u, imLimiter.u) annotation (Line(points={{26.8,12},{-14,12},{-14,30},{-10.8,30}}, color={0,0,127}));
  connect(simpleLagLimBlock.y, imRelay5.u2) annotation (Line(points={{197,8},{218,8},{218,58.5},{223.625,58.5}}, color={0,0,127}));
  connect(simpleLagLimBlock.Block, imRelay1.u1) annotation (Line(points={{174,16},{136,16},{136,-4},{2,-4},{2,42.75},{28.75,42.75}}, color={0,0,127}));
  connect(division.y, simpleLagLimBlock.u) annotation (Line(points={{108.7,7},{140.35,7},{140.35,8},{174,8}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(extent={{-100,-100},{260,80}}, preserveAspectRatio=false), graphics={Rectangle(
          extent={{-80,40},{120,-40}},
          lineColor={0,0,255},
          lineThickness=0.5),Text(
          extent={{-25,26},{52,-22}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillPattern=FillPattern.Solid,
          textString="Type 4B
Q Control"),Text(
          extent={{-74,36},{-54,30}},
          lineColor={0,0,255},
          textString="Qwtt"),Text(
          extent={{-74,22},{-54,16}},
          lineColor={0,0,255},
          textString="Uref"),Text(
          extent={{-74,3},{-54,-3}},
          lineColor={0,0,255},
          textString="Qref"),Text(
          extent={{-74,-17},{-54,-23}},
          lineColor={0,0,255},
          textString="Pwtt"),Text(
          extent={{-74,-32},{-54,-38}},
          lineColor={0,0,255},
          textString="Uwtt"),Text(
          extent={{96,22},{116,16}},
          lineColor={0,0,255},
          textString="LVRT"),Text(
          extent={{96,-16},{116,-22}},
          lineColor={0,0,255},
          textString="iQcmd")}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{260,80}})),
    Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>"));
end QControl_Type4B;
