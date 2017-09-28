within OpenIPSL.Electrical.Controls.PSAT.TG;
model TGTypeIV
  "Hydro Turbine (Linear model) and Governor (Standard model with PI controller)- control scheme Type 4"
  parameter Real wref "Reference speed (pu)";
  parameter Real Tg "Pilot valve droop (pu)";
  parameter Real gmax "Maximum gate opening (pu)";
  parameter Real gmin "Minimum gate opening (pu)";
  parameter Real vmax "Maxmimum gate opening rate (pu)";
  parameter Real vmin "Maximum gate opening rate (pu)";
  parameter Real Tp "Pilot valve time constant (s)";
  parameter Real Tr "Dashpot time constant (s)";
  parameter Real sigma "Permanent speed droop (p.u./p.u.)";
  parameter Real delta "Transient speed droop (p.u./p.u.)";
  parameter Real Tw "Water starting time (s)";
  parameter Real a11 "Deriv. of flow rate vs. turbine head";
  parameter Real a13 "Deriv. of flow rate vs. gate position";
  parameter Real a21 "Deriv. of torque vs. turbine head";
  parameter Real a23 "Deriv. of torque vs. gate position";
  parameter Real Kp "Proportional droop";
  parameter Real Ki "Integral droop";
  parameter Real Pref;
  Real deltaG "Gate position variation (pu)";
  Real v "Gate opening rate (pu)";
  Modelica.Blocks.Continuous.Integrator integrator3(initType=Modelica.Blocks.Types.Init.NoInit,
      y_start=int3)
    annotation (Placement(transformation(extent={{34,56},{46,68}})));
  Modelica.Blocks.Math.Gain gain(k=1/(Tg*Tp))
    annotation (Placement(transformation(extent={{-50,56},{-38,68}})));
  Modelica.Blocks.Math.Gain gain1(k=1/Tp) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-16,42})));
  Modelica.Blocks.Continuous.Integrator integrator2(initType=Modelica.Blocks.Types.Init.NoInit,
      y_start=int2)
    annotation (Placement(transformation(extent={{-18,56},{-6,68}})));
  Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent={{-34,56},{-22,68}})));
  Modelica.Blocks.Math.Gain gain2(k=delta + sigma) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-4,82})));
  Modelica.Blocks.Math.Gain gain3(k=delta/Tr) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-44,26})));
  Modelica.Blocks.Math.Gain gain5(k=1/Tr) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={24,8})));
  Modelica.Blocks.Continuous.Integrator integrator4(initType=Modelica.Blocks.Types.Init.NoInit,
      y_start=int4) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={22,26})));
  Modelica.Blocks.Math.Feedback feedback1 annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=180,
        origin={48,26})));
  Modelica.Blocks.Math.Gain gain4(k=1/(a11*Tw)) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={138,8})));
  Modelica.Blocks.Continuous.Integrator integrator5(initType=Modelica.Blocks.Types.Init.NoInit,
      y_start=int5) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={142,28})));
  Modelica.Blocks.Math.Feedback feedback2 annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={124,28})));
  Modelica.Blocks.Math.Gain G6(k=(a11*a23 - a13*a21)/a11)
    annotation (Placement(transformation(extent={{116,56},{128,68}})));
  Modelica.Blocks.Math.Gain gain7(k=a13*a21/(a11*a11*Tw))
    annotation (Placement(transformation(extent={{104,22},{116,34}})));
  Modelica.Blocks.Interfaces.RealInput w "Rotor speed (pu)" annotation (
      Placement(transformation(extent={{-12,4},{-2,14}}), iconTransformation(
          extent={{-136,-20},{-100,16}})));
  Modelica.Blocks.Interfaces.RealOutput Pm "Mechanical power (pu)" annotation (
      Placement(transformation(extent={{78,-8},{90,4}}), iconTransformation(
          extent={{100,-10},{120,10}})));
  Modelica.Blocks.Continuous.Integrator integrator1(initType=Modelica.Blocks.Types.Init.NoInit,
      y_start=int1)
    annotation (Placement(transformation(extent={{-122,56},{-110,68}})));
  Modelica.Blocks.Math.Gain gain6(k=Ki)
    annotation (Placement(transformation(extent={{-144,56},{-132,68}})));
  Modelica.Blocks.Math.Gain gain8(k=Kp)
    annotation (Placement(transformation(extent={{-144,82},{-132,94}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=vmax, uMin=vmin)
    annotation (Placement(transformation(extent={{12,56},{24,68}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=gmax, uMin=gmin)
    annotation (Placement(transformation(extent={{56,56},{68,68}})));
  Modelica.Blocks.Math.Add add1(k1=+1, k2=-1)
    annotation (Placement(transformation(extent={{-172,54},{-158,68}})));
  Modelica.Blocks.Math.Add add2
    annotation (Placement(transformation(extent={{-102,60},{-88,74}})));
  Modelica.Blocks.Math.Add3 add3_1(
    k1=-1,
    k2=+1,
    k3=+1) annotation (Placement(transformation(extent={{-72,60},{-58,74}})));
  Modelica.Blocks.Math.Add add3
    annotation (Placement(transformation(extent={{172,52},{184,64}})));
  Modelica.Blocks.Sources.Constant const1(k=wref)
    annotation (Placement(transformation(extent={{-210,60},{-198,72}})));
protected
  parameter Real int1=sigma*Pref;
  parameter Real int2=0;
  parameter Real int3=Pref;
  parameter Real int4=Tr*Pref;
  parameter Real int5=a13*a21/a11*Pref;
equation
  deltaG = limiter1.y;
  v = limiter.y;
  connect(gain1.y, feedback.u2) annotation (Line(
      points={{-22.6,42},{-28,42},{-28,57.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(feedback.y, integrator2.u) annotation (Line(
      points={{-22.6,62},{-19.2,62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain.y, feedback.u1) annotation (Line(
      points={{-37.4,62},{-32.8,62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain5.y, feedback1.u2) annotation (Line(
      points={{30.6,8},{48,8},{48,21.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(feedback1.y, integrator4.u) annotation (Line(
      points={{42.6,26},{29.2,26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator4.y, gain3.u) annotation (Line(
      points={{15.4,26},{-36.8,26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain4.y, feedback2.u2) annotation (Line(
      points={{131.4,8},{124,8},{124,23.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(feedback2.y, integrator5.u) annotation (Line(
      points={{129.4,28},{134.8,28}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain7.y, feedback2.u1) annotation (Line(
      points={{116.6,28},{119.2,28}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain1.u, integrator2.y) annotation (Line(
      points={{-8.8,42},{2,42},{2,62},{-5.4,62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator4.y, gain5.u) annotation (Line(
      points={{15.4,26},{10,26},{10,8},{16.8,8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator5.y, gain4.u) annotation (Line(
      points={{148.6,28},{156,28},{156,8},{145.2,8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain6.y, integrator1.u) annotation (Line(
      points={{-131.4,62},{-123.2,62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limiter.y, integrator3.u) annotation (Line(
      points={{24.6,62},{32.8,62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator2.y, limiter.u) annotation (Line(
      points={{-5.4,62},{10.8,62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator3.y, limiter1.u) annotation (Line(
      points={{46.6,62},{54.8,62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limiter1.y, gain2.u) annotation (Line(
      points={{68.6,62},{70,62},{70,82},{3.2,82}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limiter1.y, feedback1.u1) annotation (Line(
      points={{68.6,62},{70,62},{70,26},{52.8,26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add1.y, gain8.u) annotation (Line(
      points={{-157.3,61},{-151.65,61},{-151.65,88},{-145.2,88}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add1.y, gain6.u) annotation (Line(
      points={{-157.3,61},{-145.2,61.5},{-145.2,62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add1.u2, w) annotation (Line(
      points={{-173.4,56.8},{-180,56.8},{-180,9},{-7,9}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator1.y, add2.u2) annotation (Line(
      points={{-109.4,62},{-105.4,62},{-105.4,62.8},{-103.4,62.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add2.u1, gain8.y) annotation (Line(
      points={{-103.4,71.2},{-106,71.2},{-106,88},{-131.4,88}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain2.y, add3_1.u1) annotation (Line(
      points={{-10.6,82},{-78,82},{-78,72.6},{-73.4,72.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add2.y, add3_1.u2) annotation (Line(
      points={{-87.3,67},{-73.4,67}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add3_1.u3, gain3.y) annotation (Line(
      points={{-73.4,61.4},{-78,61.4},{-78,26},{-50.6,26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add3_1.y, gain.u) annotation (Line(
      points={{-57.3,67},{-54,67},{-54,62},{-51.2,62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(G6.y, add3.u1) annotation (Line(
      points={{128.6,62},{164,62},{164,61.6},{170.8,61.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator5.y, add3.u2) annotation (Line(
      points={{148.6,28},{164,28},{164,54.4},{170.8,54.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add3.y, Pm) annotation (Line(
      points={{184.6,58},{188,58},{188,-2},{84,-2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limiter1.y, G6.u) annotation (Line(
      points={{68.6,62},{114.8,62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limiter1.y, gain7.u) annotation (Line(
      points={{68.6,62},{92,62},{92,28},{102.8,28}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, add1.u1) annotation (Line(points={{-197.4,66},{-173.4,66},{
          -173.4,65.2}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(extent={{-100,100},{100,-100}},
          lineColor={0,0,255}),Text(
          extent={{-34,20},{32,-18}},
          lineColor={0,0,255},
          textString="TGTypeIV"),Text(
          visible=true,
          origin={-81,-1},
          fillPattern=FillPattern.Solid,
          extent={{-23,-13},{23,13}},
          textString="W",
          fontName="Arial"),Text(
          visible=true,
          origin={81.0002,1},
          fillPattern=FillPattern.Solid,
          extent={{-25.0002,-13},{25.0002,13}},
          fontName="Arial",
          textString="Pm",
          lineColor={0,0,0}),Text(
          visible=true,
          origin={-69,-57},
          fillPattern=FillPattern.Solid,
          extent={{-23,-13},{23,13}},
          fontName="Arial",
          textString="Wref",
          lineColor={0,0,0})}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Hydro Turbine (Linear model) and Governor (Standard model) - control scheme Type 4, PSAT Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-10-02</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Tetiana Bogodorova, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end TGTypeIV;
