model GAST "Gas Turbine-Governor"
  extends BaseClasses.BaseGovernor;
  parameter SI.PerUnit R=0.05 "Speed droop gain";
  parameter SI.Time T_1=0.4 "Valve response time constant";
  parameter SI.Time T_2=0.1 "Turbine response time constant";
  parameter SI.Time T_3=3.0 "Load limit response time constant";
  parameter SI.PerUnit AT=0.9 "Ambient temperature load limit";
  parameter SI.PerUnit K_T=2.0 "Load-limited feedback path adjustment gain";
  parameter SI.PerUnit V_MAX=1.0 "Operational control high limit on fuel valve opening";
  parameter SI.PerUnit V_MIN=-0.05 "Low output control limit on fuel valve opening";
  parameter SI.PerUnit D_turb=0.0 "Turbine damping";
  Modelica.Blocks.Math.Add add(k1=-1)
    annotation (Placement(transformation(extent={{-78,-12},{-68,-22}})));
  Modelica.Blocks.Math.Add add1(k2=-1) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={25,-47})));
  Modelica.Blocks.Math.Add add2(k2=+1) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={-37,-47})));
  Modelica.Blocks.Math.Add add3(k1=-1)
    annotation (Placement(transformation(extent={{80,-5},{90,5}})));
  Modelica.Blocks.Math.Gain gDturb(k=D_turb)
    annotation (Placement(transformation(extent={{-54,55},{-44,65}})));
  Modelica.Blocks.Math.Gain gKt(k=K_T) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={-11,-45})));
  Modelica.Blocks.Math.Gain g1_R(k=1/R) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-133,-19})));
  NonElectrical.Logical.LV_GATE lV_Gate
    annotation (Placement(transformation(extent={{-46,-10},{-26,10}})));
  Modelica.Blocks.Continuous.TransferFunction transferFunction1(a={T_2,1},
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=pm0)
    annotation (Placement(transformation(extent={{48,-6},{60,6}})));
  Modelica.Blocks.Continuous.TransferFunction transferFunction2(a={T_3,1},
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=pm0)
    annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={54,-40})));
  Modelica.Blocks.Sources.Constant const(k=AT)
    annotation (Placement(transformation(extent={{-48,-94},{-28,-74}})));
  NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    outMax=V_MAX,
    outMin=V_MIN,
    K=1,
    T=T_1,
    y_start=pm0) annotation (Placement(transformation(extent={{-4,-4},{6,6}})));
protected 
  parameter SI.PerUnit pm0(fixed=false);
initial algorithm 
  pm0 := PMECH0;
equation 
  connect(gDturb.y, add3.u1) annotation (Line(
      points={{-43.5,60},{72,60},{72,3},{79,3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(g1_R.y, add.u1) annotation (Line(
      points={{-127.5,-19},{-127.5,-20},{-79,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add1.y, gKt.u) annotation (Line(
      points={{19.5,-47},{-5,-47},{-5,-45}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gKt.y, add2.u2) annotation (Line(
      points={{-16.5,-45},{-31,-45},{-31,-44}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(transferFunction2.y, add1.u2) annotation (Line(
      points={{47.4,-40},{40,-40},{40,-44},{31,-44}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(transferFunction1.y, add3.u2) annotation (Line(
      points={{60.6,0},{70,0},{70,-3},{79,-3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(transferFunction1.y, transferFunction2.u) annotation (Line(
      points={{60.6,0},{68,0},{68,-40},{61.2,-40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add.y, lV_Gate.n1) annotation (Line(
      points={{-67.5,-17},{-55.75,-17},{-55.75,5},{-47.25,5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(lV_Gate.n2, add2.y) annotation (Line(
      points={{-47.25,-5},{-47.25,-25.3},{-42.5,-25.3},{-42.5,-47}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, add2.u1) annotation (Line(points={{-27,-84},{-8,-84},{-8,-50},
          {-31,-50}}, color={0,0,127}));
  connect(add1.u1, add2.u1) annotation (Line(points={{31,-50},{38,-50},{38,-84},
          {-8,-84},{-8,-50},{-31,-50}}, color={0,0,127}));
  connect(simpleLagLim.u, lV_Gate.p) annotation (Line(points={{-5,1},{-17.5,1},
          {-17.5,0},{-27.25,0}}, color={0,0,127}));
  connect(simpleLagLim.y, transferFunction1.u) annotation (Line(points={{6.5,1},
          {26.25,1},{26.25,0},{46.8,0}}, color={0,0,127}));
  connect(add3.y, PMECH)
    annotation (Line(points={{90.5,0},{250,0}}, color={0,0,127}));
  connect(SPEED, g1_R.u) annotation (Line(points={{-240,-120},{-152,-120},{-152,
          -19},{-139,-19}}, color={0,0,127}));
  connect(gDturb.u, g1_R.u) annotation (Line(points={{-55,60},{-152,60},{-152,-19},
          {-139,-19}}, color={0,0,127}));
  connect(add.u2, PMECH0) annotation (Line(points={{-79,-14},{-96,-14},{-96,80},
          {-240,80}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(
        extent={{-240,-200},{240,180}},
        preserveAspectRatio=false,
        grid={2,2})),
    Icon(coordinateSystem(
        extent={{-240,-200},{240,180}},
        preserveAspectRatio=false,
        grid={2,2}),
        graphics={Text(
          extent={{-60,26},{58,-18}},
          lineColor={28,108,200},
          textString="GAST")}));
end GAST;