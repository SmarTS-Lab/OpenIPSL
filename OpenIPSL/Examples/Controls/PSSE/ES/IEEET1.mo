within OpenIPSL.Examples.Controls.PSSE.ES;
model IEEET1 "SMIB system with one load and GENROE model"
  import iPSL = OpenIPSL;
  extends iPSL.Examples.SMIBpartial;
  iPSL.Electrical.Machines.PSSE.GENROE gENROE(
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
    annotation (Placement(transformation(extent={{-108,-20},{-68,20}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-28,-50},{-48,-30}})));
  iPSL.Electrical.Controls.PSSE.ES.IEEET1 iEEET2_1(
    T_R=0.02,
    K_A=200,
    T_A=0.001,
    T_E=0.55,
    K_F=0.06,
    E_1=2.85,
    S_EE_1=0.3,
    E_2=3.8,
    S_EE_2=0.6,
    V_RMAX=2,
    V_RMIN=-2,
    K_E=0.1)
    annotation (Placement(transformation(extent={{-74,-58},{-106,-32}})));
  inner iPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{-100,80},{-40,100}})));
equation
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-112,10},{-118,
          10},{-118,26},{-56,26},{-56,10},{-66,10}}, color={0,0,127}));
  connect(iEEET2_1.EFD, gENROE.EFD) annotation (Line(points={{-106.8,-43.5556},
          {-118,-43.5556},{-118,-10},{-112,-10}},color={0,0,127}));
  connect(iEEET2_1.ECOMP, gENROE.ETERM) annotation (Line(points={{-74,-43.5556},
          {-58,-43.5556},{-58,-6},{-66,-6}}, color={0,0,127}));
  connect(iEEET2_1.EFD0, gENROE.EFD0) annotation (Line(points={{-74,-52.9444},{
          -56,-52.9444},{-56,-10},{-66,-10}}, color={0,0,127}));
  connect(iEEET2_1.VOTHSG, const.y) annotation (Line(points={{-74,-37.0556},{-55.3333,
          -37.0556},{-55.3333,-40},{-49,-40}}, color={0,0,127}));
  connect(iEEET2_1.VOEL, const.y) annotation (Line(points={{-84.4,-58},{-50,-58},
          {-50,-40},{-49,-40}}, color={0,0,127}));
  connect(iEEET2_1.VUEL, const.y) annotation (Line(points={{-79.6,-58},{-50,-58},
          {-50,-40},{-49,-40}}, color={0,0,127}));
  connect(gENROE.p, GEN1.p)
    annotation (Line(points={{-68,0},{-68,0},{-40,0}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
    Documentation,
    experiment(StopTime=10));
end IEEET1;
