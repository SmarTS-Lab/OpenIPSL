within OpenIPSL.Examples.Controls.PSSE.ES;
model ESAC1A "SMIB system with one load and GENROE model"
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
    annotation (Placement(transformation(extent={{-28,-58},{-38,-48}})));
  Modelica.Blocks.Sources.Constant const1(k=-Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{-28,-80},{-38,-70}})));
  Modelica.Blocks.Sources.Constant const2(k=Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{-28,-100},{-38,-90}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.ESAC1A eSAC1A(
    T_R=0.04,
    T_B=2,
    T_C=10,
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
    V_RMAX=3,
    V_RMIN=-3)
    annotation (Placement(transformation(extent={{-52,-58},{-106,-38}})));
  inner OpenIPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{-100,80},{-40,100}})));
equation
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-104,10},{-110,
          10},{-110,26},{-48,26},{-48,10},{-58,10}}, color={0,0,127}));
  connect(eSAC1A.VOTHSG, const.y) annotation (Line(points={{-52,-41.8889},{-52,
          -53},{-38.5,-53}}, color={0,0,127}));
  connect(gENROE.ETERM, eSAC1A.ECOMP) annotation (Line(points={{-58,-6},{-32,-6},
          {-32,-46.8889},{-52,-46.8889}}, color={0,0,127}));
  connect(eSAC1A.EFD0, gENROE.EFD0) annotation (Line(points={{-52,-54.1111},{-52,
          -62},{-46,-62},{-46,-10},{-58,-10}}, color={0,0,127}));
  connect(gENROE.XADIFD, eSAC1A.XADIFD) annotation (Line(points={{-58.4,-18},{-44,
          -18},{-44,-64},{-52,-64},{-52,-50.7778}}, color={0,0,127}));
  connect(eSAC1A.EFD, gENROE.EFD) annotation (Line(points={{-107.35,-46.8889},{
          -110,-46.8889},{-110,-10},{-104,-10}}, color={0,0,127}));
  connect(const1.y, eSAC1A.VUEL) annotation (Line(points={{-38.5,-75},{-61.45,-75},
          {-61.45,-58}}, color={0,0,127}));
  connect(const2.y, eSAC1A.VOEL) annotation (Line(points={{-38.5,-95},{-38.5,-95},
          {-69.55,-95},{-69.55,-58}}, color={0,0,127}));
  connect(gENROE.p, GEN1.p)
    annotation (Line(points={{-60,0},{-60,0},{-40,0}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
    Documentation,
    experiment(StopTime=10));
end ESAC1A;
