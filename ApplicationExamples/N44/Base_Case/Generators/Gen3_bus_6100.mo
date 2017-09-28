within N44.Base_Case.Generators;
model Gen3_bus_6100 "Configuration of synchronous generator with regulators: GENSAL, HYGOV, SCRX, STAB2A;
  Nordic 44 model: Buses 3115, 5300, 6100, 6700, 7100"
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
    Tppd0=0.05 "T''do (> 0)",
    Tppq0=0.15 "T''qo (> 0)",
    D=0 "Speed Damping",
    Tpd0=9.9,
    H=3,
    Xd=1.2,
    Xq=0.73,
    Xpd=0.37,
    Xppd=0.18,
    Xppq=0.18,
    Xl=0.15,
    M_b=1240,
    S10=0.1,
    S12=0.3,
    R_a=0,
    V_b=V_b,
    V_0=V_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0) annotation (Placement(transformation(extent={{-66,-8},{-2,52}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
    R=0.06 "Permanent droop, p.u",
    r=0.4 "Temporary droop, p.u",
    VELM=0.2 "Gate open/close velosiy limit, p.u/sec",
    T_r=5,
    T_f=0.05,
    T_g=0.2,
    G_MAX=1,
    G_MIN=0,
    T_w=1,
    A_t=1.1,
    D_turb=0.5,
    q_NL=0.1) annotation (Placement(transformation(extent={{-58,68},{-8,90}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.SCRX sCRX(
    K=61 "K",
    T_AT_B=0.25385,
    T_B=13,
    T_E=0.05,
    E_MIN=0,
    E_MAX=4,
    r_cr_fd=0,
    C_SWITCH=true)
    annotation (Placement(transformation(extent={{20,-70},{76,-24}})));
  Modelica.Blocks.Sources.Constant cte(k=0)
    annotation (Placement(transformation(extent={{-29,-61},{-19,-51}})));
  OpenIPSL.Electrical.Controls.PSSE.PSS.STAB2A sTAB2A(
    H_LIM=0.03,
    K_2=1,
    T_2=4.5,
    K_3=0,
    T_3=2,
    K_4=0.55,
    K_5=1,
    T_5=0.01)
    annotation (Placement(transformation(extent={{-60,-46},{-22,-20}})));
  OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(rotation=0,
          extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{
            120,10}})));
equation
  connect(gENSAL.p, p) annotation (Line(points={{1.2,22},{30,22},{30,20},{64,20},
          {64,0},{110,0}}, color={0,0,255}));
  connect(sCRX.EFD, gENSAL.EFD) annotation (Line(points={{77.4,-44.4444},{82,-44.4444},
          {82,-80},{-76,-80},{-76,7},{-65.36,7}}, color={0,0,127}));
  connect(sTAB2A.VOTHSG, sCRX.VOTHSG) annotation (Line(points={{-20.2727,-33},{
          -0.13635,-33},{-0.13635,-32.9444},{20,-32.9444}}, color={0,0,127}));
  connect(cte.y, sCRX.VOEL) annotation (Line(points={{-18.5,-56},{0,-56},{0,-70},
          {38.2,-70}}, color={0,0,127}));
  connect(gENSAL.PELEC, sTAB2A.PELEC) annotation (Line(points={{0.56,7},{12,7},
          {12,-18},{-68,-18},{-68,-33},{-59.4818,-33}}, color={0,0,127}));
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{-6.75,79},{0,79},
          {0,56},{-76,56},{-76,37},{-65.36,37}}, color={0,0,127}));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{0.56,49},{10,49},
          {10,92},{-62,92},{-62,84.5},{-57.375,84.5}}, color={0,0,127}));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(points={{0.56,13},{16,
          13},{16,96},{-66,96},{-66,73.5},{-57.375,73.5}}, color={0,0,127}));
  connect(gENSAL.XADIFD, sCRX.XADIFD) annotation (Line(points={{0.56,-5},{6,-5},
          {6,-53.3889},{20,-53.3889}}, color={0,0,127}));
  connect(gENSAL.EFD0, sCRX.EFD0) annotation (Line(points={{0.56,1},{10,1},{10,
          -61.0556},{20,-61.0556}}, color={0,0,127}));
  connect(gENSAL.ETERM, sCRX.ECOMP) annotation (Line(points={{0.56,37},{14,37},
          {14,-44.4444},{20,-44.4444}}, color={0,0,127}));
  connect(sCRX.VUEL, cte.y) annotation (Line(points={{29.8,-70},{0,-70},{0,-56},
          {-18.5,-56}}, color={0,0,127}));
  annotation (
    Icon(graphics={Ellipse(extent={{-100,-100},{101,100}}, lineColor={0,0,255}),
          Line(
          points={{-76,-26},{-28,52},{27,-52},{74,23}},
          color={0,0,255},
          smooth=Smooth.Bezier)}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
    Documentation);
end Gen3_bus_6100;
