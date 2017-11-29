within OpenIPSL.Examples.Controls.PSSE.ES;
model EXST1 "SMIB system with one load and GENROE model"
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
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-20,-56},{-40,-36}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.EXST1 eXST1_1(
    V_IMAX=10,
    V_IMIN=-10,
    T_R=0.02,
    T_B=1,
    K_A=80,
    T_A=0.05,
    V_RMAX=8,
    V_RMIN=-3,
    K_C=0.2,
    K_F=0.1,
    T_F=1,
    T_C=0.1)
    annotation (Placement(transformation(extent={{-58,-58},{-100,-28}})));
equation
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-104,10},{-110,
          10},{-110,26},{-48,26},{-48,10},{-58,10}}, color={0,0,127}));
  connect(eXST1_1.EFD, gENROE.EFD) annotation (Line(points={{-101.05,-41.3333},
          {-110,-41.3333},{-110,-10},{-104,-10}},color={0,0,127}));
  connect(eXST1_1.ECOMP, gENROE.ETERM) annotation (Line(points={{-58,-41.3333},
          {-50,-41.3333},{-50,-6},{-58,-6}},color={0,0,127}));
  connect(const.y, eXST1_1.VOEL) annotation (Line(points={{-41,-46},{-71.65,-46},
          {-71.65,-58}}, color={0,0,127}));
  connect(eXST1_1.VOTHSG, eXST1_1.VOEL) annotation (Line(points={{-58,-33.8333},
          {-50,-33.8333},{-50,-46},{-71.65,-46},{-71.65,-58}}, color={0,0,127}));
  connect(eXST1_1.VUEL, eXST1_1.VOEL) annotation (Line(points={{-65.35,-58},{-50,
          -58},{-50,-46},{-71.65,-46},{-71.65,-58}}, color={0,0,127}));
  connect(eXST1_1.XADIFD, gENROE.XADIFD) annotation (Line(points={{-58,-47.1667},
          {-54,-47.1667},{-54,-18},{-58.4,-18}}, color={0,0,127}));
  connect(eXST1_1.EFD0, gENROE.EFD0) annotation (Line(points={{-58,-52.1667},{-58,
          -60},{-48,-60},{-48,-10},{-58,-10}}, color={0,0,127}));
  connect(gENROE.p, GEN1.p)
    annotation (Line(points={{-60,0},{-60,0},{-40,0}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
    Documentation,
    experiment(StopTime=10));
end EXST1;
