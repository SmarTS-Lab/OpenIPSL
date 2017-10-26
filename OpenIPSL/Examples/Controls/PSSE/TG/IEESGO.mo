within OpenIPSL.Examples.Controls.PSSE.TG;
model IEESGO
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
    annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
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
        origin={-80,-34})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(
        transformation(
        extent={{-2,-2},{2,2}},
        rotation=180,
        origin={-50,-34})));
  OpenIPSL.Electrical.Controls.PSSE.TG.IEESGO iEESGO(
    T_1=0.01,
    T_2=0.0,
    T_3=0.15,
    T_4=0.3,
    T_5=8.0,
    T_6=0.4,
    K_2=0.7,
    K_3=0.43,
    P_MAX=1.0,
    P_MIN=0.0,
    K_1=0.1) annotation (Placement(transformation(extent={{-64,24},{-96,38}})));
equation
  connect(SCRX.VUEL, const.y) annotation (Line(
      points={{-68.3,-18},{-53.67,-18},{-53.67,-34},{-52.2,-34}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(SCRX.VOEL, const.y) annotation (Line(
      points={{-73.7,-18},{-53.67,-18},{-53.67,-34},{-52.2,-34}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(SCRX.VOTHSG, const.y) annotation (Line(
      points={{-62,-43.7778},{-53.67,-43.7778},{-53.67,-34},{-52.2,-34}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(generator.EFD0, SCRX.EFD0) annotation (Line(
      points={{-69,-5},{-69,-24.2222},{-62,-24.2222}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(SCRX.EFD, generator.EFD) annotation (Line(points={{-98.9,-35.7778},{-104,
          -35.7778},{-104,-5},{-92,-5}}, color={0,0,127}));
  connect(generator.ETERM, SCRX.ECOMP) annotation (Line(points={{-69,-3},{-44,-3},
          {-44,-35.7778},{-62,-35.7778}}, color={0,0,127}));
  connect(generator.XADIFD, SCRX.XADIFD) annotation (Line(points={{-69.2,-9},{-52,
          -9},{-52,-29.5556},{-62,-29.5556}}, color={0,0,127}));
  connect(iEESGO.SPEED, generator.SPEED) annotation (Line(points={{-64.8,35},{-62,
          35},{-62,7},{-69,7}}, color={0,0,127}));
  connect(iEESGO.PMECH, generator.PMECH) annotation (Line(points={{-97,32},{-104,
          32},{-104,5},{-92,5}}, color={0,0,127}));
  connect(iEESGO.PMECH0, generator.PMECH0) annotation (Line(points={{-64.8,28},
          {-62,28},{-62,5},{-69,5}},color={0,0,127}));
  connect(generator.p, GEN1.p)
    annotation (Line(points={{-70,0},{-70,0},{-40,0}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-120},{
            100,80}})),
    Icon(coordinateSystem(extent={{-100,-120},{100,80}})),
    Documentation,
    experiment(StopTime=10));
end IEESGO;
