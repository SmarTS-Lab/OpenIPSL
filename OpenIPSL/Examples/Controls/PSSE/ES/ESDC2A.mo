within OpenIPSL.Examples.Controls.PSSE.ES;
model ESDC2A "SMIB system with one load and GENROE model"
  extends OpenIPSL.Examples.SMIBpartial;
  OpenIPSL.Electrical.Machines.PSSE.GENROE gENROE(
    M_b=100,
    Tpd0=5,
    Tppd0=0.07,
    Tpq0=0.9,
    Tppq0=0.09,
    H=4.28,
    D=0,
    Xd=1.84,
    Xq=1.75,
    Xpd=0.41,
    Xpq=0.6,
    Xppd=0.2,
    Xl=0.12,
    S10=0.11,
    S12=0.39,
    V_0=1,
    P_0=40,
    angle_0=4.046276,
    Q_0=5.416582,
    Xppq=0.2)
    annotation (Placement(transformation(extent={{-104,-20},{-64,20}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-32,-46},{-42,-36}})));
  Modelica.Blocks.Sources.Constant const1(k=-Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{-32,-60},{-42,-50}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.ESDC2A eSDC2A(
    T_R=0.04,
    T_F1=1,
    E_1=2.47,
    S_EE_1=0.035,
    E_2=4.5,
    S_EE_2=0.47,
    K_A=75,
    T_A=0.05,
    T_B=1,
    T_C=1,
    V_RMIN=-3.9,
    T_E=0.5,
    K_F=0.07,
    V_RMAX=0,
    K_E=0) annotation (Placement(transformation(extent={{-62,-50},{-104,-32}})));
equation
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-108,10},{-114,
          10},{-114,26},{-52,26},{-52,10},{-62,10}}, color={0,0,127}));
  connect(eSDC2A.EFD, gENROE.EFD) annotation (Line(points={{-105.05,-40},{-112,
          -40},{-112,-10},{-108,-10}}, color={0,0,127}));
  connect(gENROE.ETERM, eSDC2A.ECOMP) annotation (Line(points={{-62,-6},{-56,-6},
          {-56,-40},{-62,-40}}, color={0,0,127}));
  connect(eSDC2A.VOTHSG, const.y) annotation (Line(points={{-62,-35.5},{-46,-35.5},
          {-46,-41},{-42.5,-41}}, color={0,0,127}));
  connect(eSDC2A.VT, eSDC2A.ECOMP) annotation (Line(points={{-62,-43.5},{-62,-56},
          {-56,-56},{-56,-40},{-62,-40}}, color={0,0,127}));
  connect(eSDC2A.EFD0, gENROE.EFD0) annotation (Line(points={{-62,-46.5},{-62,-54},
          {-58,-54},{-58,-10},{-62,-10}}, color={0,0,127}));
  connect(eSDC2A.VOEL, const.y) annotation (Line(points={{-75.65,-50},{-46,-50},
          {-46,-41},{-42.5,-41}}, color={0,0,127}));
  connect(const1.y, eSDC2A.VUEL) annotation (Line(points={{-42.5,-55},{-50,-55},
          {-50,-50},{-69.35,-50}}, color={0,0,127}));
  connect(gENROE.p, GEN1.p)
    annotation (Line(points={{-64,0},{-64,0},{-40,0}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
    Documentation,
    experiment(StopTime=10));
end ESDC2A;
