within OpenIPSL.Electrical.Controls.PSAT.TG;
model TGTypeVI
  "Hydro Turbine (Nonlinear model) and Governor (PID controller combined with servomotor)- control scheme Type 6"
  parameter Real gmax "Maximum gate opening (pu)";
  parameter Real gmin "Minimum gate opening (pu)";
  parameter Real vmax "Maximum gate opening rate (pu)";
  parameter Real vmin "Minimum gate opening rate (pu)";
  parameter Real Ta "Pilot valve time constant (s)";
  parameter Real Tw "Water starting time (s)";
  parameter Real beta "Transient speed droop (p.u./p.u.)";
  parameter Real Kp "Proportional droop (p.u./p.u.)";
  parameter Real Ki "Integral droop (p.u./p.u.)";
  parameter Real Kd "Derivative droop (p.u./p.u.)";
  parameter Real Td "Derivative droop time constant (s)";
  parameter Real Rp "Permanent droop (p.u./p.u.)";
  parameter Real Ka;
  parameter Real dref;
  parameter Real po;
  Real G "Gate opening (pu)";
  Modelica.Blocks.Continuous.Integrator integrator(initType=Modelica.Blocks.Types.Init.NoInit,
      y_start=po*(gmax - gmin))
    annotation (Placement(transformation(extent={{50,52},{62,64}})));
  Modelica.Blocks.Sources.Step step(
    height=1,
    offset=0,
    startTime=0) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={258,-2})));
  Modelica.Blocks.Math.MultiSum multiSum1(k={-1,1}, nu=2)
    annotation (Placement(transformation(extent={{-152,-26},{-140,-14}})));
  Modelica.Blocks.Continuous.Integrator integrator3(initType=Modelica.Blocks.Types.Init.NoInit,
      y_start=po) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={166,-2})));
  Modelica.Blocks.Math.MultiSum multiSum3(nu=2, k={1,-1})
    annotation (Placement(transformation(extent={{212,52},{224,64}})));
  Modelica.Blocks.Interfaces.RealOutput Pm "Mechanical power (pu)" annotation (
      Placement(transformation(extent={{88,14},{100,26}}), iconTransformation(
          extent={{100,24},{126,50}})));
  Modelica.Blocks.Math.Gain gain9(k=Kp)
    annotation (Placement(transformation(extent={{-98,74},{-86,86}})));
  Modelica.Blocks.Math.MultiSum multiSum5(nu=3, k={1,1,1})
    annotation (Placement(transformation(extent={{-52,54},{-40,66}})));
  Modelica.Blocks.Math.MultiSum multiSum6(k={1,-1}, nu=2)
    annotation (Placement(transformation(extent={{-130,54},{-118,66}})));
  Modelica.Blocks.Math.Gain gain6(k=Rp) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-120,18})));
  Modelica.Blocks.Math.MultiSum multiSum7(k={1,-1}, nu=2) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-148,84})));
  Modelica.Blocks.Continuous.Integrator integrator5(initType=Modelica.Blocks.Types.Init.NoInit,
      y_start=po*(gmax - gmin))
    annotation (Placement(transformation(extent={{-76,54},{-64,66}})));
  Modelica.Blocks.Math.Gain Proportional(k=beta)
    annotation (Placement(transformation(extent={{80,96},{92,108}})));
  Modelica.Blocks.Math.Gain gain8(k=Ki) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-92,60})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=vmax, uMin=vmin)
    annotation (Placement(transformation(extent={{26,52},{38,64}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=gmax, uMin=gmin)
    annotation (Placement(transformation(extent={{74,52},{86,64}})));
  Modelica.Blocks.Math.Division division
    annotation (Placement(transformation(extent={{158,56},{170,68}})));
  Modelica.Blocks.Math.Product product1
    annotation (Placement(transformation(extent={{262,64},{274,76}})));
  Modelica.Blocks.Math.MultiProduct multiProduct(nu=2)
    annotation (Placement(transformation(extent={{184,56},{196,68}})));
  Modelica.Blocks.Interfaces.RealInput Pe "Active power (pu)" annotation (
      Placement(transformation(extent={{-54,-46},{-44,-36}}),
        iconTransformation(extent={{-132,-18},{-100,14}})));
  Modelica.Blocks.Continuous.Derivative derivative(k=Kd, T=Td)
    annotation (Placement(transformation(extent={{-90,30},{-78,42}})));
  Modelica.Blocks.Continuous.TransferFunction transferFunction(a={Ta,1}, b={Ka})
    annotation (Placement(transformation(extent={{0,52},{12,64}})));
  Modelica.Blocks.Math.MultiSum multiSum2(nu=2, k={1,-1})
    annotation (Placement(transformation(extent={{-28,52},{-16,64}})));
  Modelica.Blocks.Math.Gain Gain10(k=1/(gmax - gmin))
    annotation (Placement(transformation(extent={{114,52},{126,64}})));
  Modelica.Blocks.Math.MultiSum multiSum4(nu=2, k={-1,1}) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={224,-2})));
  Modelica.Blocks.Math.Gain gain7(k=1/Tw) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={192,-2})));
  Modelica.Blocks.Logical.Switch switch1 annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=180,
        origin={-6,-32})));
  Modelica.Blocks.Math.RealToBoolean realToBoolean(threshold=0.5) annotation (
      Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=180,
        origin={38,-32})));
  Modelica.Blocks.Sources.Constant const(k=dref) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={68,-32})));
  Modelica.Blocks.Interfaces.RealInput Pref "Active power reference (pu)"
    annotation (Placement(transformation(extent={{-54,-36},{-44,-26}}),
        iconTransformation(extent={{-132,-60},{-100,-28}})));
  Modelica.Blocks.Interfaces.RealInput wref "Rotor speed reference (pu)"
    annotation (Placement(transformation(extent={{-54,0},{-44,10}}),
        iconTransformation(extent={{-132,62},{-100,94}})));
  Modelica.Blocks.Interfaces.RealInput we "Rotor speed (pu)" annotation (
      Placement(transformation(extent={{-54,-12},{-44,-2}}), iconTransformation(
          extent={{-132,20},{-100,52}})));
equation
  G = Gain10.y;
  connect(gain9.y, multiSum5.u[1]) annotation (Line(
      points={{-85.4,80},{-57.7,80},{-57.7,62.8},{-52,62.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limiter.y, integrator.u) annotation (Line(
      points={{38.6,58},{48.8,58}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator.y, limiter1.u) annotation (Line(
      points={{62.6,58},{72.8,58}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(division.y, multiProduct.u[1]) annotation (Line(
      points={{170.6,62},{177.3,62},{177.3,64.1},{184,64.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(division.y, multiProduct.u[2]) annotation (Line(
      points={{170.6,62},{178,62},{178,59.9},{184,59.9}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(multiProduct.y, multiSum3.u[1]) annotation (Line(
      points={{197.02,62},{203.51,62},{203.51,60.1},{212,60.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(product1.y, Pm) annotation (Line(
      points={{274.6,70},{282,70},{282,20},{94,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain8.y, integrator5.u) annotation (Line(
      points={{-85.4,60},{-77.2,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator5.y, multiSum5.u[2]) annotation (Line(
      points={{-63.4,60},{-52,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(derivative.y, multiSum5.u[3]) annotation (Line(
      points={{-77.4,36},{-58,36},{-58,58},{-52,58},{-52,57.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(multiSum6.y, gain9.u) annotation (Line(
      points={{-116.98,60},{-108,60},{-108,80},{-99.2,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(multiSum6.y, gain8.u) annotation (Line(
      points={{-116.98,60},{-99.2,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(multiSum6.y, derivative.u) annotation (Line(
      points={{-116.98,60},{-108,60},{-108,36},{-91.2,36}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(multiSum5.y, multiSum2.u[1]) annotation (Line(
      points={{-38.98,60},{-27.49,60},{-27.49,60.1},{-28,60.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(multiSum2.y, transferFunction.u) annotation (Line(
      points={{-14.98,58},{-1.2,58}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(transferFunction.y, limiter.u) annotation (Line(
      points={{12.6,58},{24.8,58}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gain10.y, division.u2) annotation (Line(
      points={{126.6,58},{144,58},{144,58.4},{156.8,58.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limiter1.y, Gain10.u) annotation (Line(
      points={{86.6,58},{112.8,58}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(multiSum2.u[2], limiter1.y) annotation (Line(
      points={{-28,55.9},{-36,55.9},{-36,40},{96,40},{96,58},{86.6,58}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Proportional.y, multiSum3.u[2]) annotation (Line(
      points={{92.6,102},{138,102},{138,34},{206,34},{206,58},{212,58},{212,
          55.9}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(multiSum3.y, multiSum4.u[1]) annotation (Line(
      points={{225.02,58},{238,58},{238,4},{230,4},{230,-4.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(step.y, multiSum4.u[2]) annotation (Line(
      points={{251.4,-2},{230,-2},{230,0.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(multiSum4.y, gain7.u) annotation (Line(
      points={{216.98,-2},{199.2,-2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain7.y, integrator3.u) annotation (Line(
      points={{185.4,-2},{173.2,-2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator3.y, division.u1) annotation (Line(
      points={{159.4,-2},{148,-2},{148,66},{156.8,65.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(multiSum3.y, product1.u1) annotation (Line(
      points={{225.02,58},{237.51,58},{237.51,73.6},{260.8,73.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator3.y, product1.u2) annotation (Line(
      points={{159.4,-2},{158,-2},{158,32},{250,32},{250,66.4},{260.8,66.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch1.y, gain6.u) annotation (Line(
      points={{-14.8,-32},{-24,-32},{-24,18},{-112.8,18}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(multiSum7.y, multiSum6.u[1]) annotation (Line(
      points={{-140.98,84},{-136,84},{-136,62.1},{-130,62.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain6.y, multiSum6.u[2]) annotation (Line(
      points={{-126.6,18},{-136,18},{-136,57.9},{-130,57.9}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch1.u3, multiSum1.y) annotation (Line(
      points={{3.6,-25.6},{8,-25.6},{8,-20},{-138.98,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limiter1.y, switch1.u1) annotation (Line(
      points={{86.6,58},{102,58},{102,-48},{4,-48},{4,-38.4},{3.6,-38.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, realToBoolean.u) annotation (Line(
      points={{61.4,-32},{47.6,-32}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(realToBoolean.y, switch1.u2) annotation (Line(
      points={{29.2,-32},{3.6,-32}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(wref, multiSum7.u[1]) annotation (Line(
      points={{-49,5},{-168,5},{-168,86.1},{-154,86.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(we, multiSum7.u[2]) annotation (Line(
      points={{-49,-7},{-162,-7},{-162,81.9},{-154,81.9}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Pref, multiSum1.u[1]) annotation (Line(
      points={{-49,-31},{-162,-31},{-162,-17.9},{-152,-17.9}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Pe, multiSum1.u[2]) annotation (Line(
      points={{-49,-41},{-158,-41},{-158,-22.1},{-152,-22.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(multiSum7.y, Proportional.u) annotation (Line(
      points={{-140.98,84},{-136,84},{-136,102},{78.8,102}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Icon(coordinateSystem(extent={{-100,-80},{100,120}}, preserveAspectRatio=
            false), graphics={Rectangle(extent={{-100,120},{100,-80}},
          lineColor={0,0,255}),Text(
          extent={{-38,46},{36,0}},
          lineColor={0,0,255},
          textString="TGTypeVI"),Text(
          visible=true,
          origin={-73,78},
          fillPattern=FillPattern.Solid,
          extent={{-29,-10},{29,10}},
          fontName="Arial",
          lineColor={0,0,0},
          textString="wref"),Text(
          visible=true,
          origin={-76,37},
          fillPattern=FillPattern.Solid,
          extent={{-28,-11},{28,11}},
          fontName="Arial",
          lineColor={0,0,0},
          textString="we"),Text(
          visible=true,
          origin={-73,-7},
          fillPattern=FillPattern.Solid,
          extent={{-21,-13},{21,13}},
          fontName="Arial",
          textString="Pe",
          lineColor={0,0,0}),Text(
          visible=true,
          origin={-71,-42},
          fillPattern=FillPattern.Solid,
          extent={{-17,-12},{17,12}},
          fontName="Arial",
          textString="Pref",
          lineColor={0,0,0}),Text(
          visible=true,
          origin={79.0002,37},
          fillPattern=FillPattern.Solid,
          extent={{-21.0002,-13},{21.0002,13}},
          fontName="Arial",
          textString="Pm",
          lineColor={0,0,0})}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-80},{100,
            120}}), graphics),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Hydro Turbine (Linear model) and Governor (Standard model) - control scheme Type 6, PSAT Manual</td>
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
end TGTypeVI;
