within OpenIPSL.Examples.Controls.PSSE.ES;
model EXAC2 "SMIB system with one load and GENROE model"
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
    annotation (Placement(transformation(extent={{-100,-20},{-60,20}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.EXAC2 eXAC2_1(
    K_B=2,
    K_H=2,
    K_A=400,
    T_A=0.02,
    V_AMAX=9,
    V_AMIN=-5.34,
    T_E=0.8,
    K_F=0.03,
    T_F=1,
    K_C=0.2,
    K_D=0.48,
    K_E=1,
    E_1=5.25,
    E_2=7,
    S_EE_1=0.03,
    S_EE_2=0.1,
    T_R=0.005,
    T_B=0.005,
    T_C=0.005,
    V_RMAX=4,
    V_RMIN=-4,
    K_L=1,
    V_LR=10)
    annotation (Placement(transformation(extent={{-54,-52},{-100,-30}})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=180,
        origin={-44,-44})));
equation
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-104,10},{-110,
          10},{-110,26},{-48,26},{-48,10},{-58,10}}, color={0,0,127}));
  connect(gENROE.EFD0, eXAC2_1.EFD0) annotation (Line(points={{-58,-10},{-48,-10},
          {-48,-47.7222},{-54,-47.7222}}, color={0,0,127}));
  connect(gENROE.XADIFD, eXAC2_1.XADIFD) annotation (Line(points={{-58.4,-18},{
          -50,-18},{-50,-44.0556},{-54.23,-44.0556}}, color={0,0,127}));
  connect(gENROE.ETERM, eXAC2_1.ECOMP) annotation (Line(points={{-58,-6},{-46,-6},
          {-46,-39.7778},{-54,-39.7778}}, color={0,0,127}));
  connect(eXAC2_1.EFD, gENROE.EFD) annotation (Line(points={{-101.15,-39.7778},
          {-110,-39.7778},{-110,-10},{-104,-10}},color={0,0,127}));
  connect(gENROE.p, GEN1.p)
    annotation (Line(points={{-60,0},{-60,0},{-40,0}}, color={0,0,255}));
  connect(eXAC2_1.VOTHSG, const.y) annotation (Line(points={{-54,-34.2778},{-51.1437,
          -34.2778},{-51.1437,-44},{-48.4,-44}}, color={0,0,127}));
  connect(eXAC2_1.VUEL, const.y) annotation (Line(points={{-62.05,-52},{-50,-52},
          {-50,-44},{-48.4,-44}}, color={0,0,127}));
  connect(eXAC2_1.VOEL, const.y) annotation (Line(points={{-68.95,-52},{-50,-52},
          {-50,-44},{-48.4,-44}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
    Documentation,
    experiment(StopTime=10));
end EXAC2;
