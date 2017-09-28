within N44.Base_Case.Generators;
model Gen3_bus_7100 "Configuration of synchronous generator with regulators: GENSAL, HYGOV, SCRX, STAB2A;
  Nordic 44 model: Buses 3115, 5300, 6100, 6700, 7100"
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
    D=0 "Speed Damping",
    Tpd0=5,
    Tppd0=0.06,
    Tppq0=0.1,
    H=3.2,
    Xd=0.75,
    Xq=0.5,
    Xpd=0.25,
    Xppd=0.15385,
    Xppq=0.15385,
    Xl=0.11538,
    M_b=1000,
    S10=0.10239,
    S12=0.2742,
    R_a=0,
    V_b=V_b,
    V_0=V_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0) annotation (Placement(transformation(extent={{-56,-20},{4,32}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
    R=0.06 "Permanent droop, p.u",
    r=0.4 "Temporary droop, p.u",
    VELM=0.1,
    T_r=5,
    T_f=0.05,
    T_g=0.2,
    G_MAX=1,
    G_MIN=0,
    T_w=1,
    A_t=1.01,
    D_turb=0.5,
    q_NL=0.1) annotation (Placement(transformation(extent={{-50,50},{0,72}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.SCRX sCRX(
    K=61 "K",
    T_AT_B=0.25385,
    T_B=13,
    T_E=0.05,
    E_MIN=0,
    E_MAX=4,
    r_cr_fd=0,
    C_SWITCH=true)
    annotation (Placement(transformation(extent={{30,-80},{86,-34}})));
  Modelica.Blocks.Sources.Constant cte(k=0)
    annotation (Placement(transformation(extent={{-7,-59},{3,-49}})));
  OpenIPSL.Electrical.Controls.PSSE.PSS.STAB2A sTAB2A(
    H_LIM=0.03,
    K_2=1,
    T_2=4.5,
    K_3=0,
    T_3=2,
    K_4=0.55,
    K_5=1,
    T_5=0.01)
    annotation (Placement(transformation(extent={{-58,-50},{-12,-30}})));
  OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(rotation=0,
          extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{
            120,10}})));
equation
  connect(gENSAL.p, p)
    annotation (Line(points={{7,6},{56,6},{56,0},{110,0}}, color={0,0,255}));
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{1.25,61},{10,61},
          {10,36},{-64,36},{-64,19},{-55.4,19}}, color={0,0,127}));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{6.4,29.4},{16,
          29.4},{16,80},{-58,80},{-58,66.5},{-49.375,66.5}}, color={0,0,127}));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(points={{6.4,-1.8},{22,
          -1.8},{22,88},{-68,88},{-68,55.5},{-49.375,55.5}}, color={0,0,127}));
  connect(sCRX.EFD, gENSAL.EFD) annotation (Line(points={{87.4,-54.4444},{94,-54.4444},
          {94,-86},{-76,-86},{-76,-7},{-55.4,-7}}, color={0,0,127}));
  connect(gENSAL.PELEC, sTAB2A.PELEC) annotation (Line(points={{6.4,-7},{12,-7},
          {12,-26},{-64,-26},{-64,-40},{-57.3727,-40}}, color={0,0,127}));
  connect(sTAB2A.VOTHSG, sCRX.VOTHSG) annotation (Line(points={{-9.90909,-40},{
          4,-40},{4,-42.9444},{30,-42.9444}}, color={0,0,127}));
  connect(cte.y, sCRX.VOEL) annotation (Line(points={{3.5,-54},{6,-54},{6,-80},
          {48.2,-80}}, color={0,0,127}));
  connect(gENSAL.XADIFD, sCRX.XADIFD) annotation (Line(points={{6.4,-17.4},{14,
          -17.4},{14,-63.3889},{30,-63.3889}}, color={0,0,127}));
  connect(gENSAL.EFD0, sCRX.EFD0) annotation (Line(points={{6.4,-12.2},{18,-12.2},
          {18,-71.0556},{30,-71.0556}}, color={0,0,127}));
  connect(gENSAL.ETERM, sCRX.ECOMP) annotation (Line(points={{6.4,19},{24,19},{
          24,-54.4444},{30,-54.4444}}, color={0,0,127}));
  connect(sCRX.VUEL, cte.y) annotation (Line(points={{39.8,-80},{6,-80},{6,-54},
          {3.5,-54}}, color={0,0,127}));
  annotation (
    Icon(graphics={Ellipse(extent={{-100,-100},{101,100}}, lineColor={0,0,255}),
          Line(
          points={{-76,-26},{-28,52},{27,-52},{74,23}},
          color={0,0,255},
          smooth=Smooth.Bezier)}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
    Documentation);
end Gen3_bus_7100;
