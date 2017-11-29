within OpenIPSL.Examples.Controls.PSSE.ES;
model SEXS "SMIB model example of GENROU with Excitation System EXST1"
  extends OpenIPSL.Examples.SMIBpartial;
  Modelica.Blocks.Sources.Constant const2(k=0)
    annotation (Placement(transformation(extent={{-110,166},{-94,182}})));
  OpenIPSL.Electrical.Machines.PSSE.GENROU gENROE(
    M_b=100,
    Tpd0=5,
    Tppd0=0.07,
    Tpq0=0.9,
    Tppq0=0.09,
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
    Xppq=0.2,
    R_a=0,
    Xpp=0.2,
    H=4.28) annotation (Placement(transformation(extent={{-110,-20},{-70,20}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.SEXS sEXS(
    T_AT_B=0.1,
    T_B=1,
    K=100,
    T_E=0.1,
    E_MIN=-10,
    E_MAX=10)
    annotation (Placement(transformation(extent={{-70,-54},{-108,-26}})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(
        transformation(
        extent={{4,-4},{-4,4}},
        rotation=0,
        origin={-50,-40})));
equation
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-114,10},{-114,
          10},{-114,26},{-60,26},{-60,10},{-68,10}}, color={0,0,127}));
  connect(gENROE.EFD0, sEXS.EFD0) annotation (Line(points={{-68,-10},{-60,-10},
          {-60,-48.5556},{-70,-48.5556}},color={0,0,127}));
  connect(gENROE.ETERM, sEXS.ECOMP) annotation (Line(points={{-68,-6},{-64,-6},
          {-64,-38.4444},{-70,-38.4444}},color={0,0,127}));
  connect(sEXS.VOEL, const.y) annotation (Line(points={{-82.35,-54},{-68,-54},{
          -68,-40},{-54.4,-40}}, color={0,0,127}));
  connect(sEXS.VOTHSG, const.y) annotation (Line(points={{-70,-31.4444},{-64,-31.4444},
          {-64,-40},{-54.4,-40}}, color={0,0,127}));
  connect(sEXS.VUEL, const.y) annotation (Line(points={{-76.65,-54},{-64,-54},{
          -64,-40},{-54.4,-40}}, color={0,0,127}));
  connect(sEXS.EFD, gENROE.EFD) annotation (Line(points={{-108.95,-38.4444},{-114,
          -38.4444},{-114,-10},{-114,-10}}, color={0,0,127}));
  connect(gENROE.p, GEN1.p)
    annotation (Line(points={{-70,0},{-40,0},{-40,0}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,-100},{
            120,100}})),
    Documentation,
    Icon(coordinateSystem(extent={{-120,-100},{120,100}})),
    experiment(StopTime=10));
end SEXS;
