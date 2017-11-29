within OpenIPSL.Examples.Controls.PSSE.PSS;
model STABNI
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
    Tppd0=0.28000E-01,
    Tppq0=0.35000E-01,
    H=4.4100,
    D=0,
    Xd=1.2200,
    Xq=0.76000,
    Xpd=0.29700,
    S10=0.18600,
    S12=0.802)
    annotation (Placement(transformation(extent={{-98,-14},{-70,12}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.HYGOV HYGOV(VELM=0.02, G_MAX=0.415)
    annotation (Placement(transformation(
        extent={{-19,-14},{19,14}},
        rotation=180,
        origin={-75,28})));
  OpenIPSL.Electrical.Controls.PSSE.ES.SCRX SCRX(
    T_AT_B=0.01,
    T_B=10,
    K=100,
    T_E=0.05,
    E_MIN=0,
    E_MAX=5,
    r_cr_fd=0,
    C_SWITCH=false) annotation (Placement(transformation(
        extent={{-18,-16},{18,16}},
        rotation=180,
        origin={-86,-38})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(
        transformation(
        extent={{-2,-2},{2,2}},
        rotation=180,
        origin={-60,-36})));
equation
  connect(SCRX.VUEL, const.y) annotation (Line(
      points={{-74.3,-22},{-63.67,-22},{-63.67,-36},{-62.2,-36}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(SCRX.VOEL, const.y) annotation (Line(
      points={{-79.7,-22},{-63.67,-22},{-63.67,-36},{-62.2,-36}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(generator.EFD0, SCRX.EFD0) annotation (Line(
      points={{-68.6,-7.5},{-66,-7.5},{-66,-28.2222},{-68,-28.2222}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(generator.PMECH0, HYGOV.PMECH0) annotation (Line(points={{-68.6,5.5},
          {-58,5.5},{-58,8},{-48,8},{-48,35},{-56.475,35}},color={0,0,127}));
  connect(generator.SPEED, HYGOV.SPEED) annotation (Line(points={{-68.6,8.1},{-56,
          8.1},{-52,8.1},{-52,22},{-52,21},{-56.475,21}}, color={0,0,127}));
  connect(generator.XADIFD, SCRX.XADIFD) annotation (Line(points={{-68.88,-12.7},
          {-62,-12.7},{-62,-33.5556},{-68,-33.5556}}, color={0,0,127}));
  connect(SCRX.VOTHSG, const.y) annotation (Line(points={{-68,-47.7778},{-64,-47.7778},
          {-64,-38},{-64,-37.2},{-64,-36},{-62.2,-36}}, color={0,0,127}));
  connect(generator.PMECH, HYGOV.PMECH0) annotation (Line(points={{-100.8,5.5},
          {-110,5.5},{-110,14},{-48,14},{-48,35},{-56.475,35}},color={0,0,127}));
  connect(SCRX.EFD, generator.EFD) annotation (Line(points={{-104.9,-39.7778},{
          -110,-39.7778},{-110,-7.5},{-100.8,-7.5}}, color={0,0,127}));
  connect(generator.p, GEN1.p) annotation (Line(points={{-70,-1},{-53.3,-1},{-53.3,
          0},{-40,0}}, color={0,0,255}));
  connect(SCRX.ECOMP, generator.ETERM) annotation (Line(points={{-68,-39.7778},
          {-66,-39.7778},{-66,-4.9},{-68.6,-4.9}},color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-120},{
            100,80}})),
    Icon(coordinateSystem(extent={{-100,-120},{100,80}})),
    Documentation,
    experiment(StopTime=10));
end STABNI;
