within N44.Base_Case.Generators;
model Gen2_bus_5600 "Configuration of synchronous generator with regulators: GENSAL, HYGOV, SCRX;
  Nordic 44 model: Buses 3245, 3249, 5600"
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
    D=0 "Speed Damping",
    Tpd0=7.85,
    Tppd0=0.05,
    Tppq0=0.15,
    H=3.5,
    Xd=1,
    Xq=0.51325,
    Xpd=0.38,
    Xppd=0.28,
    Xppq=0.28,
    Xl=0.21,
    M_b=1650,
    S10=0.1,
    S12=0.3,
    R_a=0,
    V_b=V_b,
    V_0=V_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0) annotation (Placement(transformation(extent={{-62,-28},{0,34}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
    R=0.06 "Permanent droop, p.u",
    r=0.3,
    VELM=0.2,
    T_r=5,
    T_f=0.05,
    T_g=0.2,
    G_MAX=1,
    G_MIN=0,
    T_w=1,
    A_t=1.1,
    D_turb=0.5,
    q_NL=0.1) annotation (Placement(transformation(extent={{-60,48},{2,76}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.SCRX sCRX(
    K=61,
    T_AT_B=0.25385,
    T_B=13,
    T_E=0.05,
    E_MIN=0,
    E_MAX=4,
    r_cr_fd=0,
    C_SWITCH=true)
    annotation (Placement(transformation(extent={{26,-90},{84,-28}})));
  Modelica.Blocks.Sources.Constant cte(k=0)
    annotation (Placement(transformation(extent={{-17,-53},{-7,-43}})));
  OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(rotation=0,
          extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{
            120,10}})));
equation
  connect(p, p) annotation (Line(
      points={{110,0},{104,0},{104,0},{110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gENSAL.p, p) annotation (Line(points={{3.1,3},{54.55,3},{54.55,0},{
          110,0}}, color={0,0,255}));
  connect(cte.y, sCRX.VOEL) annotation (Line(points={{-6.5,-48},{44.85,-48},{
          44.85,-90}}, color={0,0,127}));
  connect(gENSAL.EFD0, sCRX.EFD0) annotation (Line(points={{2.48,-18.7},{10,-18.7},
          {10,-77.9444},{26,-77.9444}}, color={0,0,127}));
  connect(gENSAL.XADIFD, sCRX.XADIFD) annotation (Line(points={{2.48,-24.9},{14,
          -24.9},{14,-67.6111},{26,-67.6111}}, color={0,0,127}));
  connect(gENSAL.ETERM, sCRX.ECOMP) annotation (Line(points={{2.48,18.5},{22,
          18.5},{22,-55.5556},{26,-55.5556}}, color={0,0,127}));
  connect(sCRX.EFD, gENSAL.EFD) annotation (Line(points={{85.45,-55.5556},{92,-55.5556},
          {92,-94},{-72,-94},{-72,-12.5},{-61.38,-12.5}}, color={0,0,127}));
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{3.55,62},{8,62},
          {8,60},{8,40},{-68,40},{-68,18.5},{-61.38,18.5}}, color={0,0,127}));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{2.48,30.9},{12,
          30.9},{12,82},{-66,82},{-66,69},{-59.225,69}}, color={0,0,127}));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(points={{2.48,-6.3},{18,
          -6.3},{18,88},{-72,88},{-72,55},{-59.225,55}}, color={0,0,127}));
  connect(sCRX.VOTHSG, cte.y) annotation (Line(points={{26,-40.0556},{4,-40.0556},
          {4,-48},{-6.5,-48}}, color={0,0,127}));
  connect(sCRX.VUEL, cte.y) annotation (Line(points={{36.15,-90},{4,-90},{4,-48},
          {-6.5,-48}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Ellipse(extent={{-100,-100},{101,100}}, lineColor
          ={0,0,255}),Line(
          points={{-76,-26},{-28,52},{27,-52},{74,23}},
          color={0,0,255},
          smooth=Smooth.Bezier)}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
    Documentation);
end Gen2_bus_5600;
