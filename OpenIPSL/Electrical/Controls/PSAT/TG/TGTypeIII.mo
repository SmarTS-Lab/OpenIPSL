within OpenIPSL.Electrical.Controls.PSAT.TG;
model TGTypeIII
  "Hydro Turbine (Linear model) and Governor (Standard model)- control scheme Type 3"
  parameter Real P_0 "Active power (pu)"
    annotation (Dialog(group="Power flow data"));
  parameter Real wref=1 "Reference speed (pu)";
  parameter Real Tg "Pilot valve droop (pu)";
  parameter Real gmax "Maximum gate opening (pu)";
  parameter Real gmin "Minimum gate opening (pu)";
  parameter Real vmax "Maximum gate opening rate (pu)";
  parameter Real vmin "Minimum gate opening rate (pu)";
  parameter Real Tp "Pilot valve time constant (s)";
  parameter Real Tr "Dashpot time constant (s)";
  parameter Real delta "Transient speed droop (p.u./p.u.)";
  parameter Real sigma "Permanent speed droop (p.u./p.u.)";
  parameter Real Tw "Water starting time (s)";
  parameter Real a11 "Deriv. of flow rate vs. turbine head";
  parameter Real a13 "Deriv. of flow rate vs. gate position";
  parameter Real a21 "Deriv. of torque vs. turbine head";
  parameter Real a23 "Deriv. of torque vs. gate position";
  parameter Real int3;
  Real deltaG "Gate position variation (pu)";
  Real G "Gate position (pu)";
  Modelica.Blocks.Continuous.Integrator integrator(initType=Modelica.Blocks.Types.Init.NoInit,
      y_start=0) annotation (Placement(transformation(extent={{-8,56},{4,68}})));
  Modelica.Blocks.Math.Gain gain(k=1/(Tg*Tp))
    annotation (Placement(transformation(extent={{-88,56},{-76,68}})));
  Modelica.Blocks.Math.Gain gain1(k=1/Tp) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-54,42})));
  Modelica.Blocks.Continuous.Integrator integrator1(initType=Modelica.Blocks.Types.Init.NoInit,
      y_start=0)
    annotation (Placement(transformation(extent={{-56,56},{-44,68}})));
  Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent={{-72,56},{-60,68}})));
  Modelica.Blocks.Math.Gain gain2(k=delta + sigma) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-42,82})));
  Modelica.Blocks.Math.Gain gain3(k=sigma/Tr) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-82,26})));
  Modelica.Blocks.Math.Gain gain5(k=1/Tr) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-14,8})));
  Modelica.Blocks.Continuous.Integrator integrator2(initType=Modelica.Blocks.Types.Init.NoInit,
      y_start=0) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-10,26})));
  Modelica.Blocks.Math.Feedback feedback1 annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=180,
        origin={10,26})));
  Modelica.Blocks.Math.Gain gain4(k=1/(a11*Tw)) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={104,10})));
  Modelica.Blocks.Continuous.Integrator integrator3(initType=Modelica.Blocks.Types.Init.NoInit,
      y_start=int3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={104,30})));
  Modelica.Blocks.Math.Feedback feedback2 annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={86,30})));
  Modelica.Blocks.Math.Gain G6(k=(a11*a23 - a13*a21)/a11)
    annotation (Placement(transformation(extent={{80,58},{92,70}})));
  Modelica.Blocks.Math.Gain gain7(k=a13*a21/(a11*a11*Tw))
    annotation (Placement(transformation(extent={{66,24},{78,36}})));
  Modelica.Blocks.Interfaces.RealInput w "Rotor speed (pu)" annotation (
      Placement(transformation(extent={{-52,-6},{-40,6}}), iconTransformation(
          extent={{-116,-18},{-80,18}})));
  Modelica.Blocks.Interfaces.RealOutput Pm "Mechanical power (pu)" annotation (
      Placement(transformation(extent={{100,-6},{112,6}}), iconTransformation(
          extent={{100,-10},{128,18}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=vmax, uMin=vmin)
    annotation (Placement(transformation(extent={{-28,56},{-16,68}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=gmax, uMin=gmin)
    annotation (Placement(transformation(extent={{14,56},{26,68}})));
  Modelica.Blocks.Math.Add add(k1=+1, k2=-1)
    annotation (Placement(transformation(extent={{-140,56},{-128,68}})));
  Modelica.Blocks.Math.Add3 add3_1(
    k1=-1,
    k2=1,
    k3=1) annotation (Placement(transformation(extent={{-110,56},{-98,68}})));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{46,58},{58,70}})));
  Modelica.Blocks.Math.Add add2
    annotation (Placement(transformation(extent={{126,56},{138,68}})));
  Modelica.Blocks.Sources.Constant const(k=P_0)
    annotation (Placement(transformation(extent={{0,78},{12,90}})));
  Modelica.Blocks.Sources.Constant const1(k=wref)
    annotation (Placement(transformation(extent={{-160,60},{-148,72}})));
equation
  deltaG = limiter1.y;
  G = add1.y;
  connect(gain1.y, feedback.u2) annotation (Line(
      points={{-60.6,42},{-66,42},{-66,57.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(feedback.y, integrator1.u) annotation (Line(
      points={{-60.6,62},{-57.2,62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain.y, feedback.u1) annotation (Line(
      points={{-75.4,62},{-70.8,62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain5.y, feedback1.u2) annotation (Line(
      points={{-7.4,8},{10,8},{10,21.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(feedback1.y, integrator2.u) annotation (Line(
      points={{4.6,26},{-2.8,26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator2.y, gain3.u) annotation (Line(
      points={{-16.6,26},{-74.8,26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain4.y, feedback2.u2) annotation (Line(
      points={{97.4,10},{86,10},{86,25.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(feedback2.y, integrator3.u) annotation (Line(
      points={{91.4,30},{96.8,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain7.y, feedback2.u1) annotation (Line(
      points={{78.6,30},{81.2,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain1.u, integrator1.y) annotation (Line(
      points={{-46.8,42},{-36,42},{-36,62},{-43.4,62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator2.y, gain5.u) annotation (Line(
      points={{-16.6,26},{-28,26},{-28,8},{-21.2,8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator3.y, gain4.u) annotation (Line(
      points={{110.6,30},{120,30},{120,10},{111.2,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator1.y, limiter.u) annotation (Line(
      points={{-43.4,62},{-29.2,62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limiter.y, integrator.u) annotation (Line(
      points={{-15.4,62},{-9.2,62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator.y, limiter1.u) annotation (Line(
      points={{4.6,62},{12.8,62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(feedback1.u1, limiter1.y) annotation (Line(
      points={{14.8,26},{32,26},{32,62},{26.6,62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limiter1.y, gain2.u) annotation (Line(
      points={{26.6,62},{32,62},{32,82},{-34.8,82}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(w, add.u2) annotation (Line(
      points={{-46,0},{-144,0},{-144,58.4},{-141.2,58.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain2.y, add3_1.u1) annotation (Line(
      points={{-48.6,82},{-120,82},{-120,66.8},{-111.2,66.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add.y, add3_1.u2) annotation (Line(
      points={{-127.4,62},{-111.2,62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain3.y, add3_1.u3) annotation (Line(
      points={{-88.6,26},{-122,26},{-122,57.2},{-111.2,57.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add3_1.y, gain.u) annotation (Line(
      points={{-97.4,62},{-89.2,62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limiter1.y, add1.u2) annotation (Line(
      points={{26.6,62},{34,62},{34,60.4},{44.8,60.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add1.y, G6.u) annotation (Line(
      points={{58.6,64},{78.8,64}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add1.y, gain7.u) annotation (Line(
      points={{58.6,64},{62,64},{62,30},{64.8,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(G6.y, add2.u1) annotation (Line(
      points={{92.6,64},{123.6,64},{123.6,65.6},{124.8,65.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator3.y, add2.u2) annotation (Line(
      points={{110.6,30},{122,30},{122,58.4},{124.8,58.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add2.y, Pm) annotation (Line(
      points={{138.6,62},{144,62},{144,0},{106,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Pm, Pm) annotation (Line(
      points={{106,0},{106,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, add1.u1) annotation (Line(points={{12.6,84},{26,84},{40,84},
          {40,67.6},{44.8,67.6}}, color={0,0,127}));
  connect(const1.y, add.u1) annotation (Line(points={{-147.4,66},{-141.2,66},{-141.2,
          65.6}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(extent={{-100,100},{100,-100}},
          lineColor={0,0,255}),Text(
          extent={{-44,38},{34,-30}},
          lineColor={0,0,255},
          textString="TGTypeIII"),Text(
          visible=true,
          origin={-71,-1},
          fillPattern=FillPattern.Solid,
          extent={{-19,-11},{19,11}},
          textString="W",
          fontName="Arial"),Text(
          visible=true,
          origin={83.0002,5},
          fillPattern=FillPattern.Solid,
          extent={{-15.0002,-11},{15.0002,11}},
          fontName="Arial",
          textString="Pm",
          lineColor={0,0,0})}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Hydro Turbine (Linear model) and Governor (Standard model) - control scheme Type 3, PSAT Manual</td>
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
end TGTypeIII;
