within OpenIPSL.Examples.Controls.PSSE.TG;
model IEEEG1
  "Simple Machine Infinite Bus with Machine, Governor and Excitation system"
  extends OpenIPSL.Examples.SMIBpartial;
  OpenIPSL.Electrical.Machines.PSSE.GENROU gENROU(
    Xppd=0.2,
    Xppq=0.2,
    Xpp=0.2,
    Xl=0.12,
    Tpd0=5,
    Tppd0=0.50000E-01,
    Tppq0=0.1,
    H=4.0000,
    D=0,
    Xd=1.41,
    Xq=1.3500,
    Xpd=0.3,
    S10=0.1,
    S12=0.5,
    Xpq=0.6,
    Tpq0=0.7,
    angle_0=4.05,
    M_b=100000000,
    P_0=39999950,
    Q_0=5416571,
    v_0=1) annotation (Placement(transformation(extent={{-100,-16},{-60,18}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-14,-50},{-34,-30}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.IEEET1 iEEET1(
    T_R=0.06,
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
  Electrical.Controls.PSSE.TG.IEEEG1 iEEEG1(
    P0=0.4,
    K=20,
    T_1=0.15,
    T_3=0.2,
    T_4=0.25,
    K_1=0.25,
    T_5=7.5,
    K_3=0.25,
    T_6=0.4,
    K_5=0.5,
    T_7=9999) annotation (Placement(transformation(extent={{-58,46},{-98,68}})));
equation 
  connect(iEEET1.EFD, gENROU.EFD) annotation (Line(points={{-106.8,-43.5556},{-118,
          -43.5556},{-118,-7.5},{-104,-7.5}},    color={0,0,127}));
  connect(iEEET1.ECOMP, gENROU.ETERM) annotation (Line(points={{-74,-43.5556},{-58,
          -43.5556},{-58,-4.1},{-58,-4.1}},  color={0,0,127}));
  connect(iEEET1.EFD0, gENROU.EFD0) annotation (Line(points={{-74,-52.9444},{-56,
          -52.9444},{-56,-7.5},{-58,-7.5}},   color={0,0,127}));
  connect(iEEET1.VOTHSG, const.y) annotation (Line(points={{-74,-37.0556},{-55.3333,
          -37.0556},{-55.3333,-40},{-35,-40}}, color={0,0,127}));
  connect(iEEET1.VOEL, const.y) annotation (Line(points={{-84.4,-58},{-50,-58},{
          -50,-40},{-35,-40}},  color={0,0,127}));
  connect(iEEET1.VUEL, const.y) annotation (Line(points={{-79.6,-58},{-50,-58},{
          -50,-40},{-35,-40}},  color={0,0,127}));
  connect(gENROU.p, GEN1.p) annotation (Line(points={{-60,1},{-60,0},{-40,0}}, color={0,0,255}));
  connect(gENROU.XADIFD, iEEET1.XADIFD) annotation (Line(points={{-58.4,-14.3},{
          -58,-14.3},{-58,-57.7111},{-97.2,-57.7111}},
                                              color={0,0,127}));
  connect(iEEEG1.PMECH_HP, gENROU.PMECH) annotation (Line(points={{-99.8667,62.5},
          {-118,62.5},{-118,9.5},{-104,9.5}}, color={0,0,127}));
  connect(gENROU.SPEED, iEEEG1.SPEED_HP) annotation (Line(points={{-58,12.9},{
          -54,12.9},{-54,12},{-48,12},{-48,57},{-57.0667,57}}, color={0,0,127}));
annotation (experiment(StopTime=10));
end IEEEG1;