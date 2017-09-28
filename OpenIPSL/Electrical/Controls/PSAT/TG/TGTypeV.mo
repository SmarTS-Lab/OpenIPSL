within OpenIPSL.Electrical.Controls.PSAT.TG;
model TGTypeV
  "Hydro Turbine (Nonlinear model) and Governor (PI controller combined with servomotor)- control scheme Type 5"
  parameter Real Tg "Servomotor droop (pu)";
  parameter Real gmax "Maximum gate opening (pu)";
  parameter Real gmin "Minimum gate opening (pu)";
  parameter Real vmax "Maximum gate opening rate (pu)";
  parameter Real vmin "Minimum gate opening rate (pu)";
  parameter Real Tp "Pilot valve time constant (s)";
  parameter Real Tw "Water starting time (s)";
  parameter Real Kp "Proportional droop (p.u./p.u.)";
  parameter Real Ki "Integral droop (p.u./p.u.)";
  parameter Real sigma "Permanent speed droop (p.u./p.u.)";
  parameter Real Pref;
  Real G "Gate opening (pu)";
  Modelica.Blocks.Continuous.Integrator integrator(initType=Modelica.Blocks.Types.Init.NoInit,
      y_start=Pref)
    annotation (Placement(transformation(extent={{68,54},{80,66}})));
  Modelica.Blocks.Math.Gain gain(k=1/Tg, y(start=0))
    annotation (Placement(transformation(extent={{28,54},{40,66}})));
  Modelica.Blocks.Continuous.Integrator integrator3(initType=Modelica.Blocks.Types.Init.SteadyState,
      y_start=Pref) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={218,62})));
  Modelica.Blocks.Math.Gain gain7(k=1/Tw)
    annotation (Placement(transformation(extent={{192,56},{204,68}})));
  Modelica.Blocks.Math.MultiSum multiSum3(k={-1,1}, nu=2)
    annotation (Placement(transformation(extent={{172,56},{184,68}})));
  Modelica.Blocks.Interfaces.RealInput w "Rotor speed (pu)" annotation (
      Placement(transformation(extent={{-54,16},{-44,26}}), iconTransformation(
          extent={{-134,-8},{-100,26}})));
  Modelica.Blocks.Interfaces.RealOutput Pm "Power Pm (pu)" annotation (
      Placement(transformation(extent={{20,14},{32,26}}), iconTransformation(
          extent={{100,6},{126,32}})));
  Modelica.Blocks.Continuous.Integrator integrator4(initType=Modelica.Blocks.Types.Init.SteadyState,
      y_start=Pref)
    annotation (Placement(transformation(extent={{-46,58},{-34,70}})));
  Modelica.Blocks.Math.Gain Integral(k=Ki)
    annotation (Placement(transformation(extent={{-64,58},{-52,70}})));
  Modelica.Blocks.Math.Gain gain9(k=1/Tp)
    annotation (Placement(transformation(extent={{-138,60},{-126,72}})));
  Modelica.Blocks.Math.MultiSum multiSum6(nu=2, k={-1,1})
    annotation (Placement(transformation(extent={{-158,60},{-146,72}})));
  Modelica.Blocks.Math.Gain gain6(k=sigma) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-142,86})));
  Modelica.Blocks.Continuous.Integrator integrator5(initType=Modelica.Blocks.Types.Init.NoInit,
      y_start=0)
    annotation (Placement(transformation(extent={{-94,58},{-82,70}})));
  Modelica.Blocks.Math.Gain Proportional(k=Kp)
    annotation (Placement(transformation(extent={{-54,34},{-42,46}})));
  Modelica.Blocks.Math.Gain gain8(k=1/Tp) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-98,40})));
  Modelica.Blocks.Math.Division division(y(start=1))
    annotation (Placement(transformation(extent={{120,58},{132,70}})));
  Modelica.Blocks.Math.Product product1
    annotation (Placement(transformation(extent={{244,70},{256,82}})));
  Modelica.Blocks.Math.MultiProduct multiProduct(nu=2)
    annotation (Placement(transformation(extent={{146,58},{158,70}})));
  Modelica.Blocks.Sources.Constant const1(k=1) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={168,42})));
  Modelica.Blocks.Interfaces.RealInput w1 "Rotor speed (pu)" annotation (
      Placement(transformation(extent={{-124,110},{-114,120}}),
        iconTransformation(extent={{-136,58},{-100,94}})));
  Modelica.Blocks.Math.Add add(k1=+1, k2=-1) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-94,86})));
  Modelica.Blocks.Nonlinear.Limiter limiter2(uMax=vmax, uMin=vmin)
    annotation (Placement(transformation(extent={{46,54},{58,66}})));
  Modelica.Blocks.Nonlinear.Limiter limiter3(uMax=gmax, uMin=gmin)
    annotation (Placement(transformation(extent={{86,54},{98,66}})));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{-20,56},{-10,66}})));
  Modelica.Blocks.Math.Add add2(k1=+1, k2=-1)
    annotation (Placement(transformation(extent={{6,54},{18,66}})));
  Modelica.Blocks.Math.Add add3(k1=+1, k2=-1)
    annotation (Placement(transformation(extent={{-114,58},{-104,68}})));
  Modelica.Blocks.Interfaces.RealInput wref "Reference rotor speed (pu)"
    annotation (Placement(transformation(extent={{-54,6},{-44,16}}),
        iconTransformation(extent={{-134,-62},{-100,-28}})));
  Modelica.Blocks.Math.Add add4(k1=+1, k2=-1)
    annotation (Placement(transformation(extent={{-182,56},{-168,70}})));
equation
  G = limiter3.y;
  connect(multiSum3.y, gain7.u) annotation (Line(
      points={{185.02,62},{190.8,62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain6.y, multiSum6.u[1]) annotation (Line(
      points={{-148.6,86},{-160,86},{-160,68.1},{-158,68.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(multiSum6.y, gain9.u) annotation (Line(
      points={{-144.98,66},{-139.2,66}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator5.y, Integral.u) annotation (Line(
      points={{-81.4,64},{-65.2,64}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Integral.y, integrator4.u) annotation (Line(
      points={{-51.4,64},{-47.2,64}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Proportional.u, Integral.u) annotation (Line(
      points={{-55.2,40},{-71.2,40},{-71.2,64},{-65.2,64}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain8.u, integrator5.y) annotation (Line(
      points={{-90.8,40},{-76,40},{-76,64},{-81.4,64}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(division.y, multiProduct.u[1]) annotation (Line(
      points={{132.6,64},{139.3,64},{139.3,66.1},{146,66.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(division.y, multiProduct.u[2]) annotation (Line(
      points={{132.6,64},{140,64},{140,61.9},{146,61.9}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(multiProduct.y, product1.u1) annotation (Line(
      points={{159.02,64},{164,64},{164,79.6},{242.8,79.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(multiProduct.y, multiSum3.u[1]) annotation (Line(
      points={{159.02,64},{165.51,64},{165.51,64.1},{172,64.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, multiSum3.u[2]) annotation (Line(
      points={{168,48.6},{168,59.9},{172,59.9}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain7.y, integrator3.u) annotation (Line(
      points={{204.6,62},{210.8,62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(product1.u2, integrator3.y) annotation (Line(
      points={{242.8,72.4},{240,72},{236,72},{236,62},{224.6,62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(product1.y, Pm) annotation (Line(
      points={{256.6,76},{260,76},{260,20},{26,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator3.y, division.u1) annotation (Line(
      points={{224.6,62},{232,62},{232,32},{112,32},{112,67.6},{118.8,67.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(w1, add.u2) annotation (Line(
      points={{-119,115},{-78,115},{-78,89.6},{-86.8,89.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add.y, gain6.u) annotation (Line(
      points={{-100.6,86},{-134.8,86}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain.y, limiter2.u) annotation (Line(
      points={{40.6,60},{44.8,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limiter2.y, integrator.u) annotation (Line(
      points={{58.6,60},{66.8,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator.y, limiter3.u) annotation (Line(
      points={{80.6,60},{84.8,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limiter3.y, division.u2) annotation (Line(
      points={{98.6,60},{108.7,60},{108.7,60.4},{118.8,60.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add2.y, gain.u) annotation (Line(
      points={{18.6,60},{26.8,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limiter3.y, add2.u2) annotation (Line(
      points={{98.6,60},{100,60},{100,34},{-2,34},{-2,56.4},{4.8,56.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add1.y, add2.u1) annotation (Line(
      points={{-9.5,61},{-4,61},{-4,63.6},{4.8,63.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add1.y, add.u1) annotation (Line(
      points={{-9.5,61},{-4,61},{-4,82},{-86.8,82.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Proportional.y, add1.u2) annotation (Line(
      points={{-41.4,40},{-28,40},{-28,58},{-21,58}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator4.y, add1.u1) annotation (Line(
      points={{-33.4,64},{-21,64}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain8.y, add3.u2) annotation (Line(
      points={{-104.6,40},{-124,40},{-124,60},{-115,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain9.y, add3.u1) annotation (Line(
      points={{-125.4,66},{-115,66}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add3.y, integrator5.u) annotation (Line(
      points={{-103.5,63},{-102.75,63},{-102.75,64},{-95.2,64}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add4.y, multiSum6.u[2]) annotation (Line(
      points={{-167.3,63},{-162.65,63},{-162.65,63.9},{-158,63.9}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add4.u1, wref) annotation (Line(
      points={{-183.4,67.2},{-200,67.2},{-200,11},{-49,11}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add4.u2, w) annotation (Line(
      points={{-183.4,58.8},{-194,58.8},{-194,21},{-49,21}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Icon(coordinateSystem(extent={{-100,-80},{100,120}}, preserveAspectRatio=
            false), graphics={Rectangle(extent={{-100,120},{100,-80}},
          lineColor={0,0,255}),Text(
          extent={{-32,44},{34,-4}},
          lineColor={0,0,255},
          textString="TGTypeV"),Text(
          visible=true,
          origin={-82,9},
          fillPattern=FillPattern.Solid,
          extent={{-18,-13},{18,13}},
          textString="W",
          fontName="Arial"),Text(
          visible=true,
          origin={80.0002,20},
          fillPattern=FillPattern.Solid,
          extent={{-18.0002,-14},{18.0002,14}},
          fontName="Arial",
          textString="Pm",
          lineColor={0,0,0}),Text(
          visible=true,
          origin={-78,76},
          fillPattern=FillPattern.Solid,
          extent={{-22,-14},{22,14}},
          fontName="Arial",
          textString="P0",
          lineColor={0,0,0}),Text(
          visible=true,
          origin={-74,-47},
          fillPattern=FillPattern.Solid,
          extent={{-18,-13},{18,13}},
          fontName="Arial",
          textString="Wref",
          lineColor={0,0,0})}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-80},{100,
            120}})),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Hydro Turbine (Linear model) and Governor (Standard model) - control scheme Type 5, PSAT Manual</td>
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
end TGTypeV;
