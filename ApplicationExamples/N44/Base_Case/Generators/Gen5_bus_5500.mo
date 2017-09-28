within N44.Base_Case.Generators;
model Gen5_bus_5500 "Configuration of synchronous generator with regulators: GENSAL, SEXS, HYGOV;
  Nordic 44 model: Buses 5100, 5400, 5500, 6000, 6500"
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
    Tppd0=0.05 "T''do (> 0)",
    Tppq0=0.15 "T''qo (> 0)",
    D=0 "Speed Damping",
    Tpd0=7.198,
    H=3,
    Xd=1.2364,
    Xq=0.65567,
    Xpd=0.37415,
    Xppd=0.22825,
    Xppq=0.22825,
    Xl=0.16194,
    M_b=1450,
    S10=0.1,
    S12=0.3,
    R_a=0,
    V_b=V_b,
    V_0=V_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0) annotation (Placement(transformation(extent={{-68,-20},{-6,32}})));
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
    q_NL=0.1) annotation (Placement(transformation(extent={{-62,50},{-10,81}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.SEXS sEXS(
    K=200,
    T_AT_B=0.05,
    T_B=100,
    T_E=0.5,
    E_MIN=0,
    E_MAX=4) annotation (Placement(transformation(extent={{10,-82},{80,-36}})));
  Modelica.Blocks.Sources.Constant cte(k=0)
    annotation (Placement(transformation(extent={{-30,-66},{-16,-52}})));
  OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(rotation=0,
          extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{
            120,10}})));
equation
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{-8.7,65.5},{-2,
          65.5},{-2,40},{-76,40},{-76,19},{-67.38,19}}, color={0,0,127}));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{-3.52,29.4},{4,
          29.4},{4,88},{-66,88},{-66,73.25},{-61.35,73.25}}, color={0,0,127}));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(points={{-3.52,-1.8},{
          12,-1.8},{12,92},{-74,92},{-74,57.75},{-61.35,57.75}}, color={0,0,127}));
  connect(sEXS.EFD, gENSAL.EFD) annotation (Line(points={{81.75,-56.4444},{90,-56.4444},
          {90,-92},{90,-90},{-84,-90},{-84,-7},{-67.38,-7}}, color={0,0,127}));
  connect(cte.y, sEXS.VOEL) annotation (Line(points={{-15.3,-59},{32.75,-59},{
          32.75,-82}}, color={0,0,127}));
  connect(gENSAL.EFD0, sEXS.EFD0) annotation (Line(points={{-3.52,-12.2},{0,-12.2},
          {0,-73.0556},{10,-73.0556}}, color={0,0,127}));
  connect(gENSAL.ETERM, sEXS.ECOMP) annotation (Line(points={{-3.52,19},{6,19},
          {6,-56.4444},{10,-56.4444}}, color={0,0,127}));
  connect(gENSAL.p, p) annotation (Line(points={{-2.9,6},{22,6},{50,6},{50,0},{
          110,0}}, color={0,0,255}));
  connect(sEXS.VOTHSG, cte.y) annotation (Line(points={{10,-44.9444},{-6,-44.9444},
          {-6,-59},{-15.3,-59}}, color={0,0,127}));
  connect(sEXS.VUEL, cte.y) annotation (Line(points={{22.25,-82},{-6,-82},{-6,-59},
          {-15.3,-59}}, color={0,0,127}));
  annotation (
    Icon(graphics={Ellipse(extent={{-100,-100},{101,100}}, lineColor={0,0,255}),
          Line(
          points={{-76,-26},{-28,52},{27,-52},{74,23}},
          color={0,0,255},
          smooth=Smooth.Bezier)}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
    Documentation);
end Gen5_bus_5500;
