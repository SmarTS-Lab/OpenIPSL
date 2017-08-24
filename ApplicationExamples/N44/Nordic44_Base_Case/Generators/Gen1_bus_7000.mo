within N44.Nordic44_Base_Case.Generators;
model Gen1_bus_7000 "Configuration of synchronous generator with regulators: GENROU, STAB2A, IEEET2, IEESGO;
  Nordic 44 model: Buses 3000, 7000"
  extends OpenIPSL.Electrical.Essentials.pfComponent;

  OpenIPSL.Electrical.Machines.PSSE.GENROU gENROU(
    Tppd0=0.05 "d-axis sub-transient open-circuit time constant s",
    Tpq0=1 "q-axis transient open-circuit time constant s",
    Tppq0=0.05 "q-axis transient open-circuit time constant s",
    D=0 "Damping",
    Xd=2.22 "d-axis reactance",
    Xq=2.13 "q-axis reactance",
    Xpd=0.36 "d-axis transient reactance",
    Xpq=0.468 "d-axis transient reactance",
    Xppd=0.225 "d-axis sub-transient reactance",
    Xppq=0.225 "q-axis sub-transient reactance",
    Xl=0.1688 "leakage reactance",
    Tpd0=10,
    H=5.5,
    V_b=V_b,
    M_b=1278,
    S10=0.1089,
    S12=0.378,
    R_a=0,
    V_0=V_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0) annotation (Placement(transformation(extent={{24,-38},{84,39}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.IEESGO iEESGO(
    T_1=0.01,
    T_2=0,
    T_3=0.15,
    T_4=0.3,
    T_5=8,
    T_6=0.4,
    K_1=0,
    K_2=0.7,
    K_3=0.43,
    P_MAX=1,
    P_MIN=0) annotation (Placement(transformation(
        extent={{-21,-11},{21,11}},
        rotation=0,
        origin={-27,23})));

  OpenIPSL.Electrical.Controls.PSSE.ES.IEEET2 iEEET2(
    T_R=0,
    K_A=800,
    T_A=0.04,
    V_RMAX=5.32,
    V_RMIN=-4.05,
    K_E=1,
    T_E=0.44,
    K_F=0.0667,
    T_F1=2,
    T_F2=0.44,
    E_1=6.5,
    S_EE_1=0.054,
    E_2=8,
    S_EE_2=0.2020) annotation (Placement(transformation(
        extent={{-35,-29},{35,29}},
        rotation=0,
        origin={-28,-30})));
  OpenIPSL.Electrical.Controls.PSSE.PSS.STAB2A sTAB2A(
    H_LIM=0.03,
    K_2=1,
    T_2=1,
    K_3=0,
    T_3=2,
    K_4=0.55,
    K_5=1,
    T_5=0.01) annotation (Placement(transformation(extent={{-23,69},{35,91}})));

  Modelica.Blocks.Sources.Constant cte(k=0) annotation (Placement(transformation(extent={{-90,-35},{-80,-25}})));

  OpenIPSL.Interfaces.PwPin pwPin annotation (Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
equation

  connect(gENROU.p, pwPin) annotation (Line(points={{87,0.5},{95.675,0.5},{95.675,0},{110,0}}, color={0,0,255}));
  connect(iEEET2.EFD, gENROU.EFD) annotation (Line(points={{8.75,-26.7778},{15.3125,-26.7778},{15.3125,-18.75},{24.6,-18.75}}, color={0,0,127}));
  connect(cte.y, iEEET2.VOEL) annotation (Line(points={{-79.5,-30},{-60,-30},{-60,-59},{-40.25,-59}}, color={0,0,127}));
  connect(gENROU.EFD0, iEEET2.EFD0) annotation (Line(points={{86.4,-26.45},{91,-26.45},{91,-62},{-67,-62},{-67,-47.7222},{-63,-47.7222}},color={0,0,127}));
  connect(gENROU.PMECH0, iEESGO.PMECH0) annotation (Line(points={{86.4,-11.05},{93,-11.05},{93,-67},{-92,-67},{-92,18.2857},{-46.95,18.2857}}, color={0,0,127}));
  connect(gENROU.PELEC, sTAB2A.PELEC) annotation (Line(points={{86.4,-18.75},{96,-18.75},{96,-75},{-96,-75},{-96,80},{-22.2091,80}}, color={0,0,127}));
  connect(sTAB2A.VOTHSG, iEEET2.VOTHSG) annotation (Line(points={{37.6364,80},{37.6364,80},{50,80},{50,50},{-80,50},{-80,-12.2778},{-63,-12.2778}},color={0,0,127}));
  connect(gENROU.SPEED, iEESGO.SPEED) annotation (Line(points={{86.4,35.15},{91,35.15},{91,42},{-53,42},{-53,29.2857},{-46.95,29.2857}}, color={0,0,127}));
  connect(gENROU.ETERM, iEEET2.ECOMP) annotation (Line(points={{86.4,19.75},{94,19.75},{94,45},{-73,45},{-73,-26.7778},{-63,-26.7778}}, color={0,0,127}));
  connect(iEESGO.PMECH, gENROU.PMECH) annotation (Line(points={{-4.6875,24.5714},{9.15625,24.5714},{9.15625,19.75},{24.6,19.75}}, color={0,0,127}));
  connect(iEEET2.VUEL, cte.y) annotation (Line(points={{-50.75,-59},{-73,-59},{-73,-30},{-79.5,-30}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={1,1})), Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={1,1}), graphics={Line(
          points={{-76,-26},{-28,52},{27,-52},{74,23}},
          color={0,0,255},
          smooth=Smooth.Bezier), Ellipse(extent={{-100,-100},{101,100}}, lineColor={0,0,255})}));
end Gen1_bus_7000;
