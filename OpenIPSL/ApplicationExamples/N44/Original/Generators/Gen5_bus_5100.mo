within N44.Original.Generators;
model Gen5_bus_5100 "Configuration of synchronous generator with regulators: GENSAL, SEXS, HYGOV;
          Nordic 44 model: Buses 5100, 5400, 5500, 6000, 6500"

  OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
    Tpd0=4.9629 "T'do (> 0)",
    Tppd0=0.05 "T''do (> 0)",
    Tppq0=0.15 "T''qo (> 0)",
    H=3.9871 "Inertia",
    D=0 "Speed Damping",
    Xd=1.1332 "d-axis reactance",
    Xq=0.68315,
    Xpd=0.24302,
    Xppd=0.15135,
    Xppq=0.15135,
    Xl=0.13405,
    V_b=300,
    V_0=PSSE_data.voltages.V5100,
    angle_0=PSSE_data.voltages.A5100,
    P_0=PSSE_data.powers.P5100,
    Q_0=PSSE_data.powers.Q5100,
    M_b=1200,
    S10=0.1,
    S12=0.3,
    R_a=0)
    annotation (Placement(transformation(extent={{-68,-20},{-6,30}})));
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
    q_NL=0.1)
    annotation (Placement(transformation(extent={{-62,46},{-10,74}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.SEXS sEXS(
    K=200,
    T_AT_B=0.05,
    T_B=100,
    T_E=0.5,
    E_MIN=0,
    E_MAX=4)
    annotation (Placement(transformation(extent={{16,-88},{86,-33}})));
  Modelica.Blocks.Sources.Constant cte(k=0)
    annotation (Placement(transformation(extent={{-33,-65},{-23,-55}})));
  OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(extent={{100,
            -10},{120,10}})));
  Original.Data.PSSE_data_Original_case PSSE_data
    annotation (Placement(transformation(extent={{88,88},{98,98}})));
equation
  connect(cte.y, sEXS.VOEL) annotation (Line(points={{-22.5,-60},{38.75,-60},
          {38.75,-88}}, color={0,0,127}));
  connect(sEXS.EFD, gENSAL.EFD) annotation (Line(points={{87.75,-57.4444},{94,-57.4444},{94,-98},{-78,-98},{-78,-7.5},{-74.2,-7.5}},
                                                                     color=
          {0,0,127}));
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{-8.91667,61.5556},{0,61.5556},{0,38},{-76,38},{-76,17.5},{-74.2,17.5}},
                                                         color={0,0,127}));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{-2.9,22.5},{4,22.5},{4,76},{-70,76},{-70,69.3333},{-59.8333,69.3333}},
                                                          color={0,0,127}));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(points={{-2.9,17.5},{12,17.5},{12,84},{-76,84},{-76,52.2222},{-59.8333,52.2222}},
                                                            color={0,0,127}));
  connect(gENSAL.EFD0, sEXS.EFD0) annotation (Line(points={{-2.9,-7.5},{4,-7.5},{4,-77.3056},{16,-77.3056}},
                                              color={0,0,127}));
  connect(gENSAL.ETERM, sEXS.ECOMP) annotation (Line(points={{-2.9,-2.5},{8,-2.5},{8,-57.4444},{16,-57.4444}},
                                               color={0,0,127}));
  connect(gENSAL.p, p) annotation (Line(points={{-6,5},{46,5},{46,0},{110,0}},
               color={0,0,255}));
  connect(sEXS.VOTHSG, cte.y) annotation (Line(points={{16,-43.6944},{-8,-43.6944},{-8,-60},{-22.5,-60}},
                                 color={0,0,127}));
  connect(sEXS.VUEL, cte.y) annotation (Line(points={{28.25,-88},{-8,-88},{-8,-60},{-22.5,-60}},
                                color={0,0,127}));
  connect(gENSAL.XADIFD, sEXS.XADIFD) annotation (Line(points={{-3.52,-17.5},{2,-17.5},{2,-94},{66.75,-94},{66.75,-87.3889}}, color={0,0,127}));
  annotation (
    Icon(graphics={Ellipse(extent={{-100,-100},{101,100}}, lineColor={0,0,
          255}),Line(
              points={{-76,-26},{-28,52},{27,-52},{74,23}},
              color={0,0,255},
              smooth=Smooth.Bezier)}));
end Gen5_bus_5100;
