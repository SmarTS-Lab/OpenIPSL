within OpenIPSL.Examples.Controls.PSSE.ES;
model ST5B "SMIB system with one load and GENROE model"
  extends OpenIPSL.Examples.SMIBpartial;
  OpenIPSL.Electrical.Controls.PSSE.ES.ST5B sT5B(
    T_R=0,
    T_C1=0.8,
    T_B1=6,
    T_C2=0.08,
    T_B2=0.01,
    T_UC1=2,
    T_UB1=10,
    T_UC2=0.1,
    T_UB2=0.05,
    T_OC1=0.1,
    T_OB1=2,
    T_OC2=0.08,
    T_OB2=0.08,
    K_C=0.004,
    T_1=0.001,
    K_R=200,
    V_RMAX=5,
    V_RMIN=-4)
    annotation (Placement(transformation(extent={{-64,-76},{-124,-44}})));
  Modelica.Blocks.Sources.Constant PSS_off(k=0)
    annotation (Placement(transformation(extent={{-140,-102},{-128,-90}})));
  Modelica.Blocks.Sources.Constant VOEL(k=100)
    annotation (Placement(transformation(extent={{-140,-122},{-128,-110}})));
  Modelica.Blocks.Sources.Constant VUEL(k=-100)
    annotation (Placement(transformation(extent={{-140,-142},{-128,-130}})));
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
    annotation (Placement(transformation(extent={{-112,-20},{-72,20}})));
equation
  connect(PSS_off.y, sT5B.VOTHSG) annotation (Line(points={{-127.4,-96},{-64,-96},
          {-64,-50.2222}}, color={0,0,127}));
  connect(VOEL.y, sT5B.VOEL) annotation (Line(points={{-127.4,-116},{-83.5,-116},
          {-83.5,-76}}, color={0,0,127}));
  connect(VUEL.y, sT5B.VUEL) annotation (Line(points={{-127.4,-136},{-74.5,-136},
          {-74.5,-76}}, color={0,0,127}));
  connect(gENROE.ETERM, sT5B.ECOMP) annotation (Line(points={{-70,-6},{-50,-6},
          {-50,-58.2222},{-64,-58.2222}},color={0,0,127}));
  connect(sT5B.XADIFD, gENROE.XADIFD) annotation (Line(points={{-64,-63.5556},{
          -60,-63.5556},{-60,-18},{-70.4,-18}}, color={0,0,127}));
  connect(sT5B.EFD0, gENROE.EFD0) annotation (Line(points={{-64,-69.7778},{-56,
          -69.7778},{-56,-10},{-70,-10}}, color={0,0,127}));
  connect(sT5B.EFD, gENROE.EFD) annotation (Line(points={{-125.5,-58.2222},{-128,
          -58.2222},{-128,-10},{-116,-10}}, color={0,0,127}));
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-116,10},{-128,
          10},{-128,30},{-60,30},{-60,10},{-70,10}}, color={0,0,127}));
  connect(gENROE.p, GEN1.p)
    annotation (Line(points={{-72,0},{-72,0},{-40,0}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
    Documentation,
    experiment(StopTime=10));
end ST5B;
