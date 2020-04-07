within N44.Original.Generators;
model Gen2_bus_3245 "Configuration of synchronous generator with regulators: GENSAL, HYGOV, SCRX;
          Nordic 44 model: Buses 3245, 3249, 5600"

  OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
    Tpd0=5.0 "T'do (> 0)",
    Tppd0=0.06 "T''do (> 0)",
    Tppq0=0.1 "T''qo (> 0)",
    H=3.3 "Inertia",
    D=0 "Speed Damping",
    Xd=0.75 "d-axis reactance",
    Xq=0.5 "q-axis reactance",
    Xpd=0.25 "d-axis transient reactance",
    Xppd=0.15385,
    Xppq=0.15385,
    Xl=0.11538,
    V_b=420,
    V_0=PSSE_data.voltages.V3245,
    angle_0=PSSE_data.voltages.A3245,
    P_0=PSSE_data.powers.P3245,
    Q_0=PSSE_data.powers.Q3245,
    M_b=950,
    S10=0.10239,
    S12=0.2742,
    R_a=0) annotation (Placement(transformation(extent={{-62,-24},{1,46}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
    R=0.06 "Permanent droop, p.u",
    r=0.4 "Temporary droop, p.u",
    VELM=0.1 "Gate open/close velosiy limit, p.u/sec",
    T_r=5,
    T_f=0.05,
    T_g=0.2,
    G_MAX=1,
    G_MIN=0,
    T_w=1,
    A_t=1.01,
    D_turb=0.5,
    q_NL=0.1)
    annotation (Placement(transformation(extent={{-58,58},{0,90}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.SCRX sCRX(
    K=31,
    T_AT_B=0.25385,
    T_B=13,
    T_E=0.05,
    E_MIN=0,
    E_MAX=4,
    r_cr_fd=0,
    C_SWITCH=true)
    annotation (Placement(transformation(extent={{31,-84},{85,-26}})));
  Modelica.Blocks.Sources.Constant cte(k=0)
    annotation (Placement(transformation(extent={{-27,-57},{-17,-47}})));
  OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(extent={{100,
            -10},{120,10}})));
  Original.Data.PSSE_data_Original_case PSSE_data
    annotation (Placement(transformation(extent={{88,88},{98,98}})));
equation
  connect(gENSAL.p, p) annotation (Line(points={{1,11},{44,11},{44,0},{110,0}},
                   color={0,0,255}));
  connect(sCRX.EFD, gENSAL.EFD) annotation (Line(points={{86.35,-51.7778},{94,-51.7778},{94,-92},{-74,-92},{-74,-6.5},{-68.3,-6.5}},
                                                                color={0,0,
          127}));
  connect(cte.y, sCRX.VOTHSG) annotation (Line(points={{-16.5,-52},{6,-52},{6,-37.2778},{31,-37.2778}},
                                       color={0,0,127}));
  connect(gENSAL.XADIFD, sCRX.XADIFD) annotation (Line(points={{3.52,-20.5},{12,-20.5},{12,-83.3556},{70.15,-83.3556}},
                                                   color={0,0,127}));
  connect(gENSAL.EFD0, sCRX.EFD0) annotation (Line(points={{4.15,-6.5},{16,-6.5},{16,-72.7222},{31,-72.7222}},
                                               color={0,0,127}));
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{1.20833,75.7778},{10,75.7778},{10,50},{-72,50},{-72,28.5},{-68.3,28.5}},
                                                          color={0,0,127}));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{4.15,35.5},{16,35.5},{16,92},{-64,92},{-64,84.6667},{-55.5833,84.6667}},
                                                            color={0,0,127}));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(points={{4.15,28.5},{24,28.5},{24,94},{-66,94},{-66,65.1111},{-55.5833,65.1111}},
                                                            color={0,0,127}));
  connect(gENSAL.ETERM, sCRX.ECOMP) annotation (Line(points={{4.15,0.5},{26,0.5},{26,-51.7778},{31,-51.7778}},
                                                 color={0,0,127}));
  connect(sCRX.VOEL, cte.y) annotation (Line(points={{48.55,-84},{6,-84},{6,-52},{-16.5,-52}},
                                color={0,0,127}));
  connect(sCRX.VUEL, cte.y) annotation (Line(points={{40.45,-84},{7.6125,-84},{7.6125,-52},{-16.5,-52}},
                                                    color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics={Ellipse(extent={{-100,-100},{101,100}},
          lineColor={0,0,255}),Line(
              points={{-76,-26},{-28,52},{27,-52},{74,23}},
              color={0,0,255},
              smooth=Smooth.Bezier)}));
end Gen2_bus_3245;
