within N44.DAEMode_TestCases.N44_Base_Case_Systems.Generators;
model GenEventTest "Configuration of synchronous generator with regulators: GENSAL, HYGOV, SCRX, STAB2A;
  Nordic 44 model: Buses 3115, 5300, 6100, 6700, 7100"
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
    Tppd0=0.05,
    Tppq0=0.15,
    D=0,
    Tpd0=6.4,
    H=3.5,
    Xd=1.14,
    Xq=0.84,
    Xpd=0.34,
    Xppd=0.26,
    Xppq=0.26,
    Xl=0.2,
    M_b=1200,
    S10=0.1,
    S12=0.3,
    R_a=0,
    V_b=V_b,
    V_0=V_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0) annotation (Placement(transformation(extent={{-64,-24},{-2,40}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
    R=0.06,
    r=0.4,
    VELM=0.2,
    T_r=5,
    T_f=0.05,
    T_g=0.2,
    G_MAX=1,
    G_MIN=0,
    T_w=1,
    A_t=1.1,
    D_turb=0.5,
    q_NL=0.1) annotation (Placement(transformation(extent={{-62,62},{10,90}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.EXST1 eXST1_1(
    T_B=13, K_C=1)
    annotation (Placement(transformation(extent={{22,-82},{80,-34}})));
  Modelica.Blocks.Sources.Constant cte(k=0)
    annotation (Placement(transformation(extent={{-22,-70},{-10,-58}})));
  OpenIPSL.Electrical.Controls.PSSE.PSS.STAB2A sTAB2A(
    H_LIM=0.03,
    K_2=1,
    T_2=4.5,
    K_3=0,
    T_3=2,
    K_4=0.55,
    K_5=1,
    T_5=0.01)
    annotation (Placement(transformation(extent={{-66,-54},{-20,-34}})));
  OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{
            120,10}})));
equation
  connect(gENSAL.p, p)
    annotation (Line(points={{-2,8},{82,8},{82,0},{110,0}},  color={0,0,255}));
  connect(sTAB2A.VOTHSG, eXST1_1.VOTHSG) annotation (Line(points={{-17.9091,-44},
          {-17.9091,-43.3333},{22,-43.3333}},               color={0,0,
          127}));
  connect(cte.y, eXST1_1.VOEL) annotation (Line(points={{-9.4,-64},{-6,-64},
          {-2,-64},{-2,-82},{40.85,-82}}, color={0,0,127}));
  connect(eXST1_1.EFD, gENSAL.EFD) annotation (Line(points={{81.45,-55.3333},{
          84,-55.3333},{84,-86},{-78,-86},{-78,-8},{-70.2,-8}},
        color={0,0,127}));
  connect(gENSAL.PELEC, sTAB2A.PELEC) annotation (Line(points={{1.1,17.6},{10,
          17.6},{10,-30},{-72,-30},{-72,-44},{-65.3727,-44}},
                                                        color={0,0,127}));
  connect(gENSAL.XADIFD, eXST1_1.XADIFD) annotation (Line(points={{0.48,-20.8},
          {8,-20.8},{8,-64.6667},{22,-64.6667}},        color={0,0,127}));
  connect(gENSAL.EFD0, eXST1_1.EFD0) annotation (Line(points={{1.1,-8},{12,-8},
          {12,-72.6667},{22,-72.6667}},        color={0,0,127}));
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{11.8,76},{
          18,76},{18,46},{-76,46},{-76,24},{-70.2,24}},
                                                  color={0,0,127}));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{1.1,30.4},
          {24,30.4},{24,92},{-66,92},{-66,83},{-61.1,83}},
                                                       color={0,0,127}));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(points={{1.1,24},
          {32,24},{32,96},{-78,96},{-78,69},{-61.1,69}},
                                                       color={0,0,127}));
  connect(gENSAL.ETERM, eXST1_1.ECOMP) annotation (Line(points={{1.1,-1.6},{16,
          -1.6},{16,-55.3333},{22,-55.3333}},     color={0,0,127}));
  connect(eXST1_1.VUEL, cte.y) annotation (Line(points={{32.15,-82},{-2,-82},
          {-2,-64},{-9.4,-64}}, color={0,0,127}));
  annotation (
    Icon(graphics={Ellipse(extent={{-100,-100},{101,100}}, lineColor={0,0,255}),
          Line(
          points={{-76,-26},{-28,52},{27,-52},{74,23}},
          color={0,0,255},
          smooth=Smooth.Bezier)}));
end GenEventTest;
