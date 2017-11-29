within OpenIPSL.Examples.Controls.PSSE.TG;
model HYGOV
  "Simple Machine Infinite Bus with Machine, Governor and Excitation system"
  extends OpenIPSL.Examples.SMIBpartial;
  OpenIPSL.Electrical.Machines.PSSE.GENSAL generator(
    Xppd=0.2,
    Xppq=0.2,
    Xl=0.12,
    V_0=1,
    angle_0=4.05,
    P_0=39.99995,
    Q_0=5.416571,
    M_b=100,
    Tpd0=6.7000,
    Tppd0=0.028,
    Tppq0=0.0358,
    H=4.4100,
    D=0,
    Xd=1.2200,
    Xq=0.76000,
    Xpd=0.29700,
    S10=0.18600,
    S12=0.802)
    annotation (Placement(transformation(extent={{-96,-10},{-76,10}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.HYGOV HYGOV(
    VELM=0.02,
    G_MAX=0.415,
    R=0.05,
    r=0.3,
    T_r=5,
    T_f=0.05,
    T_g=0.5,
    G_MIN=0,
    T_w=1.25,
    A_t=1.2,
    D_turb=0.2,
    q_NL=0.08) annotation (Placement(transformation(
        extent={{-19,-14},{19,14}},
        rotation=180,
        origin={-81,38})));
  OpenIPSL.Electrical.Controls.PSSE.ES.SCRX SCRX(
    T_B=10,
    K=100,
    T_E=0.05,
    E_MIN=0,
    E_MAX=5,
    r_cr_fd=0,
    C_SWITCH=false,
    T_AT_B=0.1) annotation (Placement(transformation(
        extent={{-18,-16},{18,16}},
        rotation=180,
        origin={-86,-34})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(
        transformation(
        extent={{-2,-2},{2,2}},
        rotation=180,
        origin={-56,-34})));
equation
  connect(SCRX.VUEL, const.y) annotation (Line(
      points={{-74.3,-18},{-59.67,-18},{-59.67,-34},{-58.2,-34}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(SCRX.VOEL, const.y) annotation (Line(
      points={{-79.7,-18},{-59.67,-18},{-59.67,-34},{-58.2,-34}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(SCRX.VOTHSG, const.y) annotation (Line(
      points={{-68,-43.7778},{-59.67,-43.7778},{-59.67,-34},{-58.2,-34}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(generator.EFD0, SCRX.EFD0) annotation (Line(
      points={{-75,-5},{-75,-24.2222},{-68,-24.2222}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(generator.PMECH0, HYGOV.PMECH0) annotation (Line(points={{-75,5},{-52,
          5},{-52,45},{-62.475,45}}, color={0,0,127}));
  connect(generator.SPEED, HYGOV.SPEED) annotation (Line(points={{-75,7},{-58,7},
          {-58,31},{-62.475,31}}, color={0,0,127}));
  connect(HYGOV.PMECH, generator.PMECH) annotation (Line(points={{-100.95,38},{
          -110,38},{-110,5},{-98,5}}, color={0,0,127}));
  connect(SCRX.EFD, generator.EFD) annotation (Line(points={{-104.9,-35.7778},{
          -110,-35.7778},{-110,-5},{-98,-5}}, color={0,0,127}));
  connect(generator.ETERM, SCRX.ECOMP) annotation (Line(points={{-75,-3},{-50,-3},
          {-50,-35.7778},{-68,-35.7778}}, color={0,0,127}));
  connect(generator.XADIFD, SCRX.XADIFD) annotation (Line(points={{-75.2,-9},{-58,
          -9},{-58,-29.5556},{-68,-29.5556}}, color={0,0,127}));
  connect(generator.p, GEN1.p)
    annotation (Line(points={{-76,0},{-76,0},{-40,0}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-120},{
            100,80}})),
    Icon(coordinateSystem(extent={{-100,-120},{100,80}})),
    Documentation,
    experiment(StopTime=10));
end HYGOV;
