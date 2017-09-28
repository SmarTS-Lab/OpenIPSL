within N44.Nordic44_Base_Case.Generators;
model Gen2_bus_3249 "Configuration of synchronous generator with regulators: GENSAL, HYGOV, SCRX;
  Nordic 44 model: Buses 3245, 3249, 5600"
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
    Tppd0=0.06 "T''do (> 0)",
    Tppq0=0.1 "T''qo (> 0)",
    D=0 "Speed Damping",
    Tpd0=10.13,
    H=4.543,
    Xd=1.036,
    Xq=0.63,
    Xpd=0.28,
    Xppd=0.21,
    Xppq=0.21,
    Xl=0.11538,
    M_b=1357,
    S10=0.10239,
    S12=0.2742,
    R_a=0,
    V_b=V_b,
    V_0=V_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0) annotation (Placement(transformation(extent={{-60,-20},{6,48}})));
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
    A_t=1.1,
    D_turb=0.5,
    q_NL=0.1) annotation (Placement(transformation(extent={{-62,62},{-2,88}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.SCRX sCRX(
    K=31,
    T_AT_B=0.25385,
    T_B=13,
    T_E=0.05,
    E_MIN=0,
    E_MAX=4,
    r_cr_fd=0,
    C_SWITCH=true) annotation (Placement(transformation(extent={{26,-90},{81,-30}})));
  Modelica.Blocks.Sources.Constant cte(k=0) annotation (Placement(transformation(extent={{-21,-55},{-11,-45}})));
  OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(rotation=0, extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
equation

  connect(p, p) annotation (Line(
      points={{110,0},{104,0},{104,0},{110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(cte.y, sCRX.VOEL) annotation (Line(points={{-10.5,-50},{8,-50},{8,-90},{43.875,-90}}, color={0,0,127}));
  connect(sCRX.VOTHSG, cte.y) annotation (Line(points={{26,-41.6667},{8,-41.6667},{8,-50},{-10.5,-50}},color={0,0,127}));
  connect(gENSAL.XADIFD, sCRX.XADIFD) annotation (Line(points={{8.64,-16.6},{14,-16.6},{14,-68.3333},{26,-68.3333}},color={0,0,127}));
  connect(gENSAL.EFD0, sCRX.EFD0) annotation (Line(points={{8.64,-9.8},{18,-9.8},{18,-78.3333},{26,-78.3333}},color={0,0,127}));
  connect(sCRX.EFD, gENSAL.EFD) annotation (Line(points={{82.375,-56.6667},{86,-56.6667},{86,-94},{-72,-94},{-72,-3},{-59.34,-3}}, color={0,0,127}));
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{-0.5,75},{8,75},{8,50},{-70,50},{-70,31},{-59.34,31}}, color={0,0,127}));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{8.64,44.6},{16,44.6},{16,92},{-68,92},{-68,81.5},{-61.25,81.5}}, color={0,0,127}));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(points={{8.64,3.8},{30,3.8},{30,96},{-72,96},{-72,68.5},{-61.25,68.5}}, color={0,0,127}));
  connect(gENSAL.p, p) annotation (Line(points={{9.3,14},{54,14},{54,0},{110,0}}, color={0,0,255}));
  connect(sCRX.VUEL, cte.y) annotation (Line(points={{35.625,-90},{8,-90},{8,-50},{-10.5,-50}}, color={0,0,127}));

  connect(sCRX.ECOMP, gENSAL.ETERM) annotation (Line(points={{26,-56.6667},{22,-56.6667},{22,31},{8.64,31}},color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Ellipse(extent={{-100,-100},{101,100}}, lineColor={0,0,255}),Line(
          points={{-76,-26},{-28,52},{27,-52},{74,23}},
          color={0,0,255},
          smooth=Smooth.Bezier)}), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
end Gen2_bus_3249;
