within OpenIPSL.Examples.Controls.PSSE.ES;
model ESST4B "SMIB model example of GENROU with Excitation System ESST4B"
  extends OpenIPSL.Examples.SMIBpartial;
  OpenIPSL.Electrical.Machines.PSSE.GENROU generator(
    Xppd=0.2,
    Xppq=0.2,
    Xpp=0.2,
    Xl=0.12,
    V_0=1,
    P_0=100*0.399999529123306,
    angle_0=4.04626655578613,
    Q_0=100*0.0541657134890556,
    M_b=100,
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
    Tpq0=0.7)
    annotation (Placement(transformation(extent={{-120,-16},{-92,18}})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=0,
        origin={-98,-52})));
  Modelica.Blocks.Sources.Constant const2(k=0)
    annotation (Placement(transformation(extent={{-110,166},{-94,182}})));
  Modelica.Blocks.Sources.Constant const5(k=0) annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-97,-37})));
  OpenIPSL.Electrical.Controls.PSSE.ES.ESST4B eSST4B annotation (Placement(
        transformation(
        extent={{-14,-10},{14,10}},
        rotation=0,
        origin={-64,-4})));
  inner Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{-100,80},{-40,100}})));
  Modelica.Blocks.Sources.Constant const1(k=Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{-40,-48},{-56,-32}})));
equation
  connect(generator.p, eSST4B.Gen_terminal) annotation (Line(
      points={{-92,1},{-66.7,1},{-66.7,4.33333},{-75.9,4.33333}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const.y, eSST4B.VOTHSG) annotation (Line(
      points={{-93.6,-52},{-86,-52},{-86,2.11111},{-78,2.11111}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(generator.EFD0, eSST4B.EFD0) annotation (Line(
      points={{-90.6,-7.5},{-90,-7.5},{-90,-10.1111},{-78,-10.1111}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const5.y, eSST4B.VUEL) annotation (Line(
      points={{-91.5,-37},{-84,-37},{-84,-14},{-73.1,-14}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(generator.PMECH0, generator.PMECH) annotation (Line(
      points={{-90.6,9.5},{-70,9.5},{-70,22},{-102,22},{-102,9.5},{-122.8,9.5}},

      color={0,0,127},
      smooth=Smooth.None));

  connect(eSST4B.EFD, generator.EFD) annotation (Line(
      points={{-49.3,-2.88889},{-48,-2.88889},{-48,-24},{-124,-24},{-124,-7.5},
          {-122.8,-7.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(generator.XADIFD, eSST4B.XADIFD) annotation (Line(
      points={{-90.88,-14.3},{-90.88,-20},{-94,-20},{-94,-6.77778},{-78,-6.77778}},

      color={0,0,127},
      smooth=Smooth.None));

  connect(generator.PELEC, eSST4B.ECOMP) annotation (Line(
      points={{-90.6,6.1},{-68,6.1},{-68,-2.88889},{-78,-2.88889}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(eSST4B.Bus, GEN1.p) annotation (Line(points={{-52.1,4.33333},{-47.5818,
          4.33333},{-47.5818,0},{-40,0}}, color={0,0,255}));
  connect(const1.y, eSST4B.VOEL) annotation (Line(points={{-56.8,-40},{-68.9,-40},
          {-68.9,-14}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
    Documentation,
    experiment(StopTime=10));
end ESST4B;
