within OpenIPSL.Electrical.Controls.PSAT.AVR;
model AVRTypeI "PSAT AVR Type 1"

  Modelica.Blocks.Interfaces.RealInput v "Generator termminal voltage (pu)"
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}}),
        iconTransformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Interfaces.RealOutput vf "Filed voltage (pu)" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={110,0}), iconTransformation(extent={{100,-20},{140,20}})));
  Modelica.Blocks.Interfaces.RealInput vref
    "Reference generator terminal voltage (pu)" annotation (Placement(
        transformation(extent={{-140,40},{-100,80}}), iconTransformation(extent
          ={{-140,40},{-100,80}})));
  parameter Real vrmax=7.57 "Maximum regulator voltage (pu)";
  parameter Real vrmin=0 "Minimum regulator voltage (pu)";
  parameter Real K0=7.04 "Regulator gain, (pu/pu)";
  parameter Real T1=6.67 "First pole (s)";
  parameter Real T2=1 "First zero (s)";
  parameter Real T3=1 "Second pole (s";
  parameter Real T4=1 "Second pole (s)";
  parameter Real Te=0.4 "Field circuit time constant (s)";
  parameter Real Tr=0.05 "Measurement time constant (s)";
  parameter Real Ae=0.0006 "1st ceiling coefficient";
  parameter Real Be=0.9 "2nd ceiling coefficient";
  parameter Real v0=1 "Initialization (pu)";
protected
  parameter Real vf00(fixed=false) "Initialization";
  parameter Real vr0=vf00 - Ae*Modelica.Math.exp(Be*abs(vf00)) "Initialization";
public
  Modelica.Blocks.Interfaces.RealOutput vref0 "Voltage reference at t=0 (pu)"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,110}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,120})));
  Modelica.Blocks.Interfaces.RealInput vf0
    "Reference generator terminal voltage (pu)" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-112}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120})));
  Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent={{26,10},{46,-10}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(
    y_start=vf00,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    k=1,
    T=Te) annotation (Placement(transformation(extent={{52,-10},{72,10}})));
  NonElectrical.Nonlinear.CeilingBlock ceilingBlock
    annotation (Placement(transformation(extent={{70,30},{50,50}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder2(
    k=1,
    T=Tr,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=v0)
    annotation (Placement(transformation(extent={{-90,-70},{-70,-50}})));
  Modelica.Blocks.Math.Feedback feedback2
    annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  Modelica.Blocks.Continuous.TransferFunction transferFunction(
    b={(K0*T2*T4),K0*(T2 + T4),K0},
    a={(T1*T3),(T1 + T3),1},
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=vr0)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=vrmax, uMin=vrmin)
    annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
initial algorithm
  vf00 := vf0;
algorithm
  vref0 := v0 + (vr0/K0);

equation
  connect(firstOrder.y, vf)
    annotation (Line(points={{73,0},{88,0},{110,0}}, color={0,0,127}));
  connect(ceilingBlock.u, vf) annotation (Line(points={{72,40},{80,40},{80,0},{
          110,0}}, color={0,0,127}));
  connect(ceilingBlock.y, feedback.u2)
    annotation (Line(points={{49,40},{36,40},{36,8}}, color={0,0,127}));
  connect(v, firstOrder2.u) annotation (Line(points={{-120,-60},{-106,-60},{-92,
          -60}}, color={0,0,127}));
  connect(feedback2.u2, firstOrder2.y) annotation (Line(points={{-60,-8},{-60,-8},
          {-60,-60},{-69,-60}}, color={0,0,127}));
  connect(feedback2.u1, vref) annotation (Line(points={{-68,0},{-80,0},{-80,60},
          {-120,60}}, color={0,0,127}));
  connect(feedback.y, firstOrder.u)
    annotation (Line(points={{45,0},{47.5,0},{50,0}}, color={0,0,127}));
  connect(feedback2.y, transferFunction.u)
    annotation (Line(points={{-51,0},{-46.5,0},{-42,0}}, color={0,0,127}));
  connect(transferFunction.y, limiter.u)
    annotation (Line(points={{-19,0},{-14.5,0},{-10,0}}, color={0,0,127}));
  connect(limiter.y, feedback.u1)
    annotation (Line(points={{13,0},{28,0}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(
        extent={{-100,-100},{100,100}},
        initialScale=0.1,
        preserveAspectRatio=false)),
    Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        initialScale=0.1,
        preserveAspectRatio=false), graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-90,80},{-50,40}},
          lineColor={0,0,255},
          textString="vref"),Text(
          extent={{-100,-40},{-60,-70}},
          lineColor={0,0,255},
          textString="v"),Text(
          extent={{60,20},{100,-20}},
          lineColor={0,0,255},
          textString="vf"),Text(
          extent={{-40,40},{40,-40}},
          lineColor={0,0,255},
          textString="AVR1"),Text(
          extent={{16,-60},{56,-100}},
          lineColor={0,0,255},
          textString="vf0
"),Text(  extent={{2,102},{42,62}},
          lineColor={0,0,255},
          textString="vref0")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>AVR Type II, PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>September 2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end AVRTypeI;
