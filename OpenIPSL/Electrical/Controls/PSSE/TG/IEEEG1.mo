within OpenIPSL.Electrical.Controls.PSSE.TG;
model IEEEG1
  Modelica.Blocks.Interfaces.RealInput SPEED_HP
    "Machine speed deviation from nominal (pu)" annotation (Placement(
        transformation(extent={{-172,2},{-162,14}}), iconTransformation(extent=
            {{-162,-16},{-132,16}})));
  OpenIPSL.NonElectrical.Continuous.LeadLag imLeadLag(
    K=K,
    T1=T_2,
    T2=T_1,
    y_start=0)
    annotation (Placement(transformation(extent={{-144,0},{-128,16}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag imSimpleLag(
    K=1,
    T=T_4,
    y_start=P0) annotation (Placement(transformation(extent={{-20,0},{-4,16}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag imSimpleLag1(
    K=1,
    T=T_5,
    y_start=P0) annotation (Placement(transformation(extent={{22,0},{38,16}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag imSimpleLag2(
    K=1,
    T=T_6,
    y_start=P0) annotation (Placement(transformation(extent={{62,0},{78,16}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag imSimpleLag3(
    K=1,
    T=T_7,
    y_start=P0)
    annotation (Placement(transformation(extent={{102,0},{118,16}})));
  Modelica.Blocks.Math.Gain imGain1(k=K_1) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={10,32})));
  Modelica.Blocks.Math.Gain imGain2(k=K_2) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={10,-16})));
  Modelica.Blocks.Math.Gain imGain3(k=K_3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={50,32})));
  Modelica.Blocks.Math.Gain imGain4(k=K_4) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={50,-16})));
  Modelica.Blocks.Math.Gain imGain5(k=K_5) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={90,32})));
  Modelica.Blocks.Math.Gain imGain6(k=K_6) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={90,-16})));
  Modelica.Blocks.Math.Gain imGain7(k=K_7) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={130,32})));
  Modelica.Blocks.Math.Gain imGain8(k=K_8) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={130,-16})));
  Modelica.Blocks.Interfaces.RealOutput PMECH_HP
    "Turbine mechanical power (pu)" annotation (Placement(transformation(extent
          ={{170,52},{180,64}}), iconTransformation(extent={{160,26},{188,54}})));
  Modelica.Blocks.Interfaces.RealOutput PMECH_LP
    "Turbine mechanical power (pu)" annotation (Placement(transformation(extent
          ={{170,-48},{180,-36}}), iconTransformation(extent={{160,-56},{188,-24}})));
  parameter Real P0 "Power reference of the governor";
  parameter Real K=20 "Governor gain, 1/R (pu)";
  parameter Real T_1=1e-8 "Control time constant (s)";
  parameter Real T_2=1e-8 "Control time constant (s)";
  parameter Real T_3=0.1 "Control time constant (s)";
  parameter Real U_o=0.1 "Max. rate if valve opening (p.u./s)";
  parameter Real U_c=-0.1 "Max. rate if valve closing (p.u./s)";
  parameter Real P_MAX=0.903 "Max. valve position (pu)";
  parameter Real P_MIN=0 "Min. valve position (pu)";
  parameter Real T_4=0.4 "HP section time constant (s)";
  parameter Real K_1=0.3 "Fraction of power from HP (pu)";
  parameter Real K_2=0;
  parameter Real T_5=9 "Reheat+IP time constant (s)";
  parameter Real K_3=0.4 "Fraction of power from IP (pu)";
  parameter Real K_4=0;
  parameter Real T_6=0.5 "Reheat+IP time constant s";
  parameter Real K_5=0.3 "Fraction of power from LP (pu)";
  parameter Real K_6=0;
  parameter Real T_7=1e-8 "LP section time const s";
  parameter Real K_7=0 "Fraction of power from IP  (pu)";
  parameter Real K_8=0;
  Modelica.Blocks.Sources.Constant Pref(k=P0) "Power reference "
    annotation (Placement(transformation(extent={{-144,34},{-128,50}})));
  Modelica.Blocks.Math.Add3 add3_1(k2=-1, k3=-1)
    annotation (Placement(transformation(extent={{-112,0},{-96,16}})));
  Modelica.Blocks.Math.Gain gain(k=1/T_3)
    annotation (Placement(transformation(extent={{-90,0},{-74,16}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=U_o, uMin=U_c)
    annotation (Placement(transformation(extent={{-68,0},{-52,16}})));
  Modelica.Blocks.Continuous.LimIntegrator limIntegrator(
    k=1,
    outMax=P_MAX,
    outMin=P_MIN,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=P0)
    annotation (Placement(transformation(extent={{-46,0},{-30,16}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{58,52},{70,64}})));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{58,-48},{70,-36}})));
  Modelica.Blocks.Math.Add add2
    annotation (Placement(transformation(extent={{98,-48},{110,-36}})));
  Modelica.Blocks.Math.Add add3
    annotation (Placement(transformation(extent={{98,52},{110,64}})));
  Modelica.Blocks.Math.Add add4
    annotation (Placement(transformation(extent={{138,-48},{150,-36}})));
  Modelica.Blocks.Math.Add add5
    annotation (Placement(transformation(extent={{138,52},{150,64}})));
equation
  connect(SPEED_HP, imLeadLag.u)
    annotation (Line(points={{-167,8},{-145.6,8}}, color={0,0,127}));
  connect(Pref.y, add3_1.u1) annotation (Line(points={{-127.2,42},{-122,42},{-122,
          14.4},{-113.6,14.4}}, color={0,0,127}));
  connect(add3_1.u2, imLeadLag.y) annotation (Line(points={{-113.6,8},{-113.6,8},
          {-127.2,8}}, color={0,0,127}));
  connect(add3_1.y, gain.u)
    annotation (Line(points={{-95.2,8},{-91.6,8}}, color={0,0,127}));
  connect(gain.y, limiter.u)
    annotation (Line(points={{-73.2,8},{-69.6,8}}, color={0,0,127}));
  connect(limiter.y, limIntegrator.u)
    annotation (Line(points={{-51.2,8},{-47.6,8}}, color={0,0,127}));
  connect(imSimpleLag1.u, imSimpleLag.y)
    annotation (Line(points={{20.4,8},{20.4,8},{-3.2,8}}, color={0,0,127}));
  connect(limIntegrator.y, imSimpleLag.u)
    annotation (Line(points={{-29.2,8},{-21.6,8}}, color={0,0,127}));
  connect(add3_1.u3, imSimpleLag.u) annotation (Line(points={{-113.6,1.6},{-122,
          1.6},{-122,-22},{-26,-22},{-26,8},{-21.6,8}}, color={0,0,127}));
  connect(imGain1.u, imSimpleLag.y)
    annotation (Line(points={{10,24.8},{10,8},{-3.2,8}}, color={0,0,127}));
  connect(imGain2.u, imSimpleLag.y)
    annotation (Line(points={{10,-8.8},{10,8},{-3.2,8}}, color={0,0,127}));
  connect(imSimpleLag1.y, imSimpleLag2.u)
    annotation (Line(points={{38.8,8},{60.4,8}}, color={0,0,127}));
  connect(imGain3.u, imSimpleLag2.u)
    annotation (Line(points={{50,24.8},{50,8},{60.4,8}}, color={0,0,127}));
  connect(imGain4.u, imSimpleLag2.u)
    annotation (Line(points={{50,-8.8},{50,8},{60.4,8}}, color={0,0,127}));
  connect(add.u2, imGain3.y) annotation (Line(points={{56.8,54.4},{50,54.4},{50,
          38.6}}, color={0,0,127}));
  connect(imGain1.y, add.u1) annotation (Line(points={{10,38.6},{10,61.6},{56.8,
          61.6}}, color={0,0,127}));
  connect(add1.u1, imGain4.y) annotation (Line(points={{56.8,-38.4},{50,-38.4},
          {50,-22.6}}, color={0,0,127}));
  connect(imGain2.y, add1.u2) annotation (Line(points={{10,-22.6},{10,-45.6},{
          56.8,-45.6}}, color={0,0,127}));
  connect(imSimpleLag2.y, imSimpleLag3.u)
    annotation (Line(points={{78.8,8},{100.4,8}}, color={0,0,127}));
  connect(imGain5.u, imSimpleLag3.u)
    annotation (Line(points={{90,24.8},{90,8},{100.4,8}}, color={0,0,127}));
  connect(imGain6.u, imSimpleLag3.u)
    annotation (Line(points={{90,-8.8},{90,8},{100.4,8}}, color={0,0,127}));
  connect(imGain6.y, add2.u1) annotation (Line(points={{90,-22.6},{90,-38.4},{
          96.8,-38.4}}, color={0,0,127}));
  connect(add1.y, add2.u2) annotation (Line(points={{70.6,-42},{90,-42},{90,-45.6},
          {96.8,-45.6}}, color={0,0,127}));
  connect(add.y, add3.u1) annotation (Line(points={{70.6,58},{90,58},{90,61.6},
          {96.8,61.6}}, color={0,0,127}));
  connect(imGain5.y, add3.u2) annotation (Line(points={{90,38.6},{90,54.4},{
          96.8,54.4}}, color={0,0,127}));
  connect(imSimpleLag3.y, imGain7.u)
    annotation (Line(points={{118.8,8},{130,8},{130,24.8}}, color={0,0,127}));
  connect(imGain8.u, imGain7.u)
    annotation (Line(points={{130,-8.8},{130,24.8}}, color={0,0,127}));
  connect(add4.y, PMECH_LP) annotation (Line(points={{150.6,-42},{152,-42},{175,
          -42}}, color={0,0,127}));
  connect(imGain8.y, add4.u1) annotation (Line(points={{130,-22.6},{130,-38.4},
          {136.8,-38.4}}, color={0,0,127}));
  connect(add2.y, add4.u2) annotation (Line(points={{110.6,-42},{130,-42},{130,
          -45.6},{136.8,-45.6}}, color={0,0,127}));
  connect(add3.y, add5.u1) annotation (Line(points={{110.6,58},{130,58},{130,
          61.6},{136.8,61.6}}, color={0,0,127}));
  connect(imGain7.y, add5.u2) annotation (Line(points={{130,38.6},{130,54.4},{
          136.8,54.4}}, color={0,0,127}));
  connect(add5.y, PMECH_HP)
    annotation (Line(points={{150.6,58},{152,58},{175,58}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-140,-80},{160,80}}, preserveAspectRatio=
            false)),
    Icon(coordinateSystem(extent={{-140,-80},{160,80}}, preserveAspectRatio=
            true), graphics={Rectangle(extent={{-140,80},{160,-80}}, lineColor=
          {0,0,255}),Text(
          extent={{-122,18},{-68,-18}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="SPEED_HP"),Text(
          extent={{84,56},{158,26}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="PMECH_HP"),Text(
          extent={{86,-10},{158,-48}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="PMECH_LP"),Text(
          extent={{-68,40},{88,-46}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="IEEEG1")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Turbine and Governor (IEEEG1), PSSE manual</td>
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
end IEEEG1;
