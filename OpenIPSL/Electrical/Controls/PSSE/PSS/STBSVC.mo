within OpenIPSL.Electrical.Controls.PSSE.PSS;
model STBSVC "WECC Supplementary Signal for Static var Compensator"
  parameter Real K_S1 ">0";
  parameter Real T_S7 "(s)";
  parameter Real T_S8 "(s)";
  parameter Real T_S9 ">0 (s)";
  parameter Real T_S13 ">0 (s)";
  parameter Real T_S14 ">0 (s)";
  parameter Real K_S3 ">0";
  parameter Real V_SCS;
  parameter Real K_S2;
  parameter Real T_S10 "(s)";
  parameter Real T_S11 "(s)";
  parameter Real T_S12 ">0, if K_S2 != 0 (s)";
  NonElectrical.Continuous.SimpleLag imSimpleLag(
    K=K_S1,
    y_start=V_S10,
    T=T_S7) annotation (Placement(transformation(extent={{-100,40},{-80,60}})));
  NonElectrical.Continuous.SimpleLag imSimpleLag1(
    y_start=V_S10,
    K=K_S2,
    T=T_S10)
    annotation (Placement(transformation(extent={{-100,-60},{-80,-40}})));
  NonElectrical.Continuous.LeadLag imLeadLag(
    K=1,
    T1=T_S8,
    T2=T_S9,
    y_start=V_S10)
    annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
  NonElectrical.Continuous.LeadLag imLeadLag1(
    K=1,
    T1=T_S11,
    T2=T_S12,
    y_start=V_S20)
    annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-12,-10},{8,10}})));
  Modelica.Blocks.Continuous.Derivative imDerivativeLag(
    k=T_S13,
    T=T_S14,
    y_start=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{18,-10},{38,10}})));
  Modelica.Blocks.Math.Gain gain(k=K_S3)
    annotation (Placement(transformation(extent={{46,-10},{66,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_SCS, uMin=-V_SCS)
    annotation (Placement(transformation(extent={{74,-10},{94,10}})));
  Modelica.Blocks.Interfaces.RealInput V_S1 "PSS input signal 1"
    annotation (Placement(transformation(extent={{-150,30},{-110,70}})));
  Modelica.Blocks.Interfaces.RealInput V_S2 "PSS input signal 2"
    annotation (Placement(transformation(extent={{-150,-70},{-110,-30}})));
  Modelica.Blocks.Interfaces.RealOutput VOTHSG "Stabilizer signal (pu)"
    annotation (Placement(transformation(extent={{120,-10},{140,10}})));
protected
  parameter Real V_S10(fixed=false);
  parameter Real V_S20(fixed=false);
initial equation
  V_S10 = V_S1;
  V_S20 = V_S2;
equation
  connect(gain.y, limiter.u)
    annotation (Line(points={{67,0},{67,0},{72,0}}, color={0,0,127}));
  connect(limiter.y, VOTHSG)
    annotation (Line(points={{95,0},{130,0}}, color={0,0,127}));
  connect(V_S1, imSimpleLag.u)
    annotation (Line(points={{-130,50},{-116,50},{-102,50}}, color={0,0,127}));
  connect(imSimpleLag.y, imLeadLag.u)
    annotation (Line(points={{-79,50},{-70.5,50},{-62,50}}, color={0,0,127}));
  connect(imLeadLag.y, add.u1) annotation (Line(points={{-39,50},{-30,50},{-30,
          6},{-14,6}}, color={0,0,127}));
  connect(V_S2, imSimpleLag1.u) annotation (Line(points={{-130,-50},{-116,-50},
          {-102,-50}}, color={0,0,127}));
  connect(imSimpleLag1.y, imLeadLag1.u) annotation (Line(points={{-79,-50},{-70.5,
          -50},{-62,-50}}, color={0,0,127}));
  connect(imLeadLag1.y, add.u2) annotation (Line(points={{-39,-50},{-30,-50},{-30,
          -6},{-14,-6}}, color={0,0,127}));
  connect(imDerivativeLag.y, gain.u)
    annotation (Line(points={{39,0},{41.5,0},{44,0}}, color={0,0,127}));
  connect(add.y, imDerivativeLag.u)
    annotation (Line(points={{9,0},{12.5,0},{16,0}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,-100},{
            120,100}})),
    Icon(coordinateSystem(extent={{-120,-100},{120,100}}, preserveAspectRatio=
            true), graphics={Rectangle(extent={{-120,100},{120,-100}},
          lineColor={28,108,200}),Text(
          extent={{-112,58},{-66,44}},
          lineColor={28,108,200},
          textString="V_S1"),Text(
          extent={{-120,-42},{-58,-56}},
          lineColor={28,108,200},
          textString="V_S2"),Text(
          extent={{70,10},{118,-6}},
          lineColor={28,108,200},
          textString="VOTHSG"),Text(
          extent={{-62,30},{66,-32}},
          lineColor={28,108,200},
          textString="STBSVC")}),
    Documentation);
end STBSVC;
