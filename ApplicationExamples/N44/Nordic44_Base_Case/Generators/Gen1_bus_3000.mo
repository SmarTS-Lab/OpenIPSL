within N44.Nordic44_Base_Case.Generators;
model Gen1_bus_3000 "Configuration of synchronous generator with regulators: GENROU, STAB2A, IEEET2, IEESGO;
   Nordic 44 model: Buses 3000, 7000"
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  OpenIPSL.Electrical.Machines.PSSE.GENROU gENROU(
    Tpd0=5 "d-axis transient open-circuit time constant s",
    Tppd0=0.05 "d-axis sub-transient open-circuit time constant s",
    Tpq0=1 "q-axis transient open-circuit time constant s",
    Tppq0=0.05 "q-axis transient open-circuit time constant s",
    H=5.97 "inertia constant s",
    D=0 "Damping",
    Xd=2.22 "d-axis reactance",
    Xq=2.13 "q-axis reactance",
    Xpd=0.36 "d-axis transient reactance",
    Xpq=0.468 "d-axis transient reactance",
    Xppd=0.225 "d-axis sub-transient reactance",
    Xppq=0.225 "q-axis sub-transient reactance",
    Xl=0.1688 "leakage reactance",
    M_b=1300,
    S10=0.1089,
    S12=0.378,
    R_a=0,
    V_b=V_b,
    V_0=V_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0) annotation (Placement(transformation(extent={{18,-43},{87,43}})));
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
        extent={{-36.5,-12.5},{36.5,12.5}},
        rotation=0,
        origin={-48.5,19.5})));

  OpenIPSL.Electrical.Controls.PSSE.ES.IEEET2 iEEET2(
    T_R=0,
    K_A=729,
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
        extent={{-40,-33.5},{40,33.5}},
        rotation=0,
        origin={-48,-43.5})));
  OpenIPSL.Electrical.Controls.PSSE.PSS.STAB2A sTAB2A(
    H_LIM=0.03,
    K_2=1,
    T_2=2,
    K_3=0,
    T_3=2,
    K_4=0.55,
    K_5=1,
    T_5=0.01) annotation (Placement(transformation(extent={{-33,62},{29,94}})));

  Modelica.Blocks.Sources.Constant cte(k=0) annotation (Placement(transformation(extent={{-114.5,-51},{-103,-39}})));
  OpenIPSL.Interfaces.PwPin pwPin annotation (Placement(transformation(extent={{100,-10},{120,10}})));

equation
  connect(gENROU.p, pwPin) annotation (Line(
      points={{90.45,0},{110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwPin, pwPin) annotation (Line(points={{110,0},{110,0},{110,0}}, color={0,0,255}));
  connect(gENROU.PELEC, sTAB2A.PELEC) annotation (Line(points={{89.76,-21.5},{99,-21.5},{99,-86},{-116,-86},{-116,78},{-32.1545,78}}, color={0,0,127}));
  connect(sTAB2A.VOTHSG, iEEET2.VOTHSG) annotation (Line(points={{31.8182,78},{38,78},{38,72},{38,55},{-107,55},{-107,-23.0278},{-88,-23.0278}},color={0,0,127}));
  connect(gENROU.SPEED, iEESGO.SPEED) annotation (Line(points={{89.76,38.7},{95,38.7},{95,46},{-94,46},{-94,26.6429},{-83.175,26.6429}}, color={0,0,127}));
  connect(iEESGO.PMECH, gENROU.PMECH) annotation (Line(points={{-9.71875,21.2857},{1.6406,21.2857},{1.6406,21.5},{18.69,21.5}}, color={0,0,127}));
  connect(gENROU.PMECH0, iEESGO.PMECH0) annotation (Line(points={{89.76,-12.9},{107,-12.9},{107,-89},{-94,-89},{-94,14.1429},{-83.175,14.1429}}, color={0,0,127}));
  connect(gENROU.ETERM, iEEET2.ECOMP) annotation (Line(points={{89.76,21.5},{99,21.5},{99,50},{-99,50},{-99,-39.7778},{-88,-39.7778}},color={0,0,127}));
  connect(gENROU.EFD0, iEEET2.EFD0) annotation (Line(points={{89.76,-30.1},{96,-30.1},{96,-82},{-92,-82},{-92,-63.9722},{-88,-63.9722}},color={0,0,127}));
  connect(iEEET2.EFD, gENROU.EFD) annotation (Line(points={{-6,-39.7778},{6,-39.7778},{6,-21.5},{18.69,-21.5}}, color={0,0,127}));
  connect(iEEET2.VUEL, cte.y) annotation (Line(points={{-74,-77},{-96,-77},{-96,-45},{-102.425,-45}}, color={0,0,127}));
  connect(iEEET2.VOEL, cte.y) annotation (Line(points={{-62,-77},{-96,-77},{-96,-45},{-102.425,-45}}, color={0,0,127}));
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
end Gen1_bus_3000;
