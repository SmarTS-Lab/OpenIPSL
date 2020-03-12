within SevenBus;
model SevenBus_Network
  import SevenBus;
  SevenBus.Generators.G1 GEN1(
    M_b=1078,
    V_b=24,
    V_0=powerFlow_Data.voltage.V21,
    angle_0=powerFlow_Data.voltage.A21,
    P_0=powerFlow_Data.power.PG21,
    Q_0=powerFlow_Data.power.QG21)
    annotation (Placement(transformation(extent={{-280,-110},{-260,-90}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine(
    R=0.01,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-164,-110},{-144,-90}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    R=0.01,
    X=0.1,
    G=0,
    B=0)
    annotation (Placement(transformation(extent={{-164,-130},{-144,-110}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine2(
    R=0.01,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{110,-110},{130,-90}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine3(
    R=0.01,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{110,-130},{130,-110}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine4(
    R=0.01,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-30,-110},{-10,-90}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine5(
    R=0.01,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-30,-130},{-10,-110}})));
  OpenIPSL.Electrical.Loads.PSSE.Load load(
    V_b=380,
    V_0=powerFlow_Data.voltage.V5,
    angle_0=powerFlow_Data.voltage.A5,
    P_0=powerFlow_Data.power.PL5,
    Q_0=powerFlow_Data.power.QL5)
    annotation (Placement(transformation(extent={{-98,-146},{-88,-136}})));
  OpenIPSL.Electrical.Loads.PSSE.Load load1(
    V_b=380,
    V_0=powerFlow_Data.voltage.V3,
    angle_0=powerFlow_Data.voltage.A3,
    P_0=powerFlow_Data.power.PL3,
    Q_0=powerFlow_Data.power.QL3)
    annotation (Placement(transformation(extent={{60,-146},{70,-136}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine6(
    R=0.01,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-162,-38},{-142,-18}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine7(
    R=0.01,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-162,-58},{-142,-38}})));
  OpenIPSL.Electrical.Buses.BusExt FSSV(
    np=4,
    V_b=380,
    nn=1,
    V_0=powerFlow_Data.voltage.V2,
    angle_0=powerFlow_Data.voltage.A2)
    annotation (Placement(transformation(extent={{-200,-136},{-198,-62}})));
  OpenIPSL.Electrical.Buses.BusExt FTILL(
    nn=2,
    np=4,
    V_b=380,
    V_0=PF_results.voltages.V5,
    angle_0=PF_results.voltages.A5)
    annotation (Placement(transformation(extent={{-100,-130},{-98,-90}})));
  OpenIPSL.Electrical.Buses.BusExt FSBIS(
    nn=2,
    np=3,
    V_b=380,
    V_0=powerFlow_Data.voltage.V3,
    angle_0=powerFlow_Data.voltage.A3)
    annotation (Placement(transformation(extent={{58,-130},{60,-90}})));
  OpenIPSL.Electrical.Buses.BusExt FVERGE(
    np=4,
    V_b=380,
    nn=1,
    V_0=powerFlow_Data.voltage.V7,
    angle_0=powerFlow_Data.voltage.A7)
                                    annotation (Placement(transformation(
        extent={{-1,-39},{1,39}},
        rotation=-90,
        origin={1,123})));
  OpenIPSL.Electrical.Buses.BusExt FPAND(
    np=4,
    nn=2,
    V_b=380,
    V_0=powerFlow_Data.voltage.V1,
    angle_0=powerFlow_Data.voltage.A1)
                                    annotation (Placement(transformation(
        extent={{-1,-39},{1,39}},
        rotation=0,
        origin={-99,19})));
  OpenIPSL.Electrical.Buses.BusExt FTDPRA(
    np=2,
    nn=4,
    V_b=380,
    V_0=powerFlow_Data.voltage.V4,
    angle_0=powerFlow_Data.voltage.A4)
                                    annotation (Placement(transformation(
        extent={{-1,-39},{1,39}},
        rotation=0,
        origin={99,19})));
  OpenIPSL.Electrical.Branches.PwLine pwLine8(
    R=0.01,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-60,80},{-40,100}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine9(
    R=0.01,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-60,60},{-40,80}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine10(
    R=0.01,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{40,80},{60,100}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine11(
    R=0.01,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{40,60},{60,80}})));
  OpenIPSL.Electrical.Loads.PSSE.Load load2(
    V_b=380,
    V_0=powerFlow_Data.voltage.V1,
    angle_0=powerFlow_Data.voltage.A1,
    P_0=powerFlow_Data.power.PL1,
    Q_0=powerFlow_Data.power.QL1)
    annotation (Placement(transformation(extent={{-96,-46},{-86,-36}})));
  OpenIPSL.Electrical.Loads.PSSE.Load load3(
    V_b=380,
    V_0=powerFlow_Data.voltage.V4,
    angle_0=powerFlow_Data.voltage.A4,
    P_0=powerFlow_Data.power.PL4,
    Q_0=powerFlow_Data.power.QL4)
    annotation (Placement(transformation(extent={{84,-46},{94,-36}})));
  OpenIPSL.Electrical.Buses.BusExt FVALDI(
    nn=4,
    V_b=380,
    np=1,
    V_0=powerFlow_Data.voltage.V6,
    angle_0=powerFlow_Data.voltage.A6)
    annotation (Placement(transformation(extent={{198,-136},{200,-62}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine12(
    R=0.01,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{140,-40},{160,-20}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine13(
    R=0.01,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{140,-60},{160,-40}})));
  inner OpenIPSL.Electrical.SystemBase SysData(fn=60)
    annotation (Placement(transformation(extent={{-180,120},{-92,160}})));
  OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer twoWindingTransformer(
    G=0,
    B=0,
    R=0.01,
    X=0.10,
    CZ=1,
    CW=1,
    VNOM1=380,
    VB1=380,
    VNOM2=380,
    VB2=380,
    ANG1=0,
    t1=PF_results.trafos.t1_1_4,
    t2=PF_results.trafos.t2_1_4)
    annotation (Placement(transformation(extent={{-12,-8},{8,8}})));
  SevenBus.Generators.G2 GEN2(
    V_b=20,
    M_b=1710,
    V_0=powerFlow_Data.voltage.V61,
    angle_0=powerFlow_Data.voltage.A61,
    P_0=powerFlow_Data.power.PG61,
    Q_0=powerFlow_Data.power.QG61)
    annotation (Placement(transformation(extent={{280,-110},{260,-90}})));
  SevenBus.Generators.G3 GEN3(
    M_b=1211,
    V_b=24,
    V_0=powerFlow_Data.voltage.V71,
    angle_0=powerFlow_Data.voltage.A71,
    P_0=powerFlow_Data.power.PS71,
    Q_0=powerFlow_Data.power.QS71) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,190})));
  OpenIPSL.Electrical.Events.PwFault pwFault(
    R=0.1,
    X=0.1,
    t1=Modelica.Constants.inf,
    t2=Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{-76,-148},{-64,-136}})));
  OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer
    twoWindingTransformer1(
    G=0,
    B=0,
    CW=1,
    VB2=380,
    VB1=24,
    ANG1=0,
    CZ=1,
    R=0.000276089,
    X=0.0151296,
    VNOM1=24,
    t2=PF_results.trafos.t2_2_21,
    S_n=1080,
    t1=PF_results.trafos.t1_2_21,
    VNOM2=415)                       annotation (Placement(transformation(
        extent={{6,-4},{-6,4}},
        rotation=180,
        origin={-230,-100})));
  OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer
    twoWindingTransformer2(
    G=0,
    B=0,
    CW=1,
    VB2=380,
    VB1=20,
    VNOM2=405,
    CZ=1,
    R=0.000192639,
    X=0.0105154,
    VNOM1=20,
    S_n=1710,
    ANG1=0,
    t1=PF_results.trafos.t1_6_61,
    t2=PF_results.trafos.t2_6_61) annotation (Placement(transformation(
        extent={{-6,-4},{6,4}},
        rotation=180,
        origin={230,-100})));
  OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer
    twoWindingTransformer3(
    G=0,
    B=0,
    CW=1,
    VB2=380,
    VB1=24,
    VNOM2=415,
    CZ=1,
    R=0.000276089,
    X=0.0150413,
    VNOM1=24,
    S_n=1080,
    ANG1=0,
    t1=PF_results.trafos.t1_7_71,
    t2=PF_results.trafos.t2_7_71) annotation (Placement(transformation(
        extent={{6,-4},{-6,4}},
        rotation=90,
        origin={0,150})));
  SevenBus.Data.PF_results PF_results
    annotation (Placement(transformation(extent={{-256,148},{-236,168}})));
  SevenBus.PF_Data.PowerFlow_Data powerFlow_Data(redeclare record Voltage =
        SevenBus.PF_Data.Voltage_Data.pf_voltage_0, redeclare record Power =
        SevenBus.PF_Data.Power_Data.pf_power_0)
    annotation (Placement(transformation(extent={{-220,148},{-200,168}})));
equation
  connect(pwLine.n, FTILL.n[1]) annotation (Line(points={{-145,-100},{-100,-100},
          {-100,-116}}, color={0,0,255}));
  connect(pwLine1.n, FTILL.n[2]) annotation (Line(points={{-145,-120},{-100,-120},
          {-100,-104}}, color={0,0,255}));
  connect(pwLine4.p, FTILL.p[1]) annotation (Line(points={{-29,-100},{-98,-100},
          {-98,-119}}, color={0,0,255}));
  connect(pwLine5.p, FTILL.p[2]) annotation (Line(points={{-29,-120},{-98,-120},
          {-98,-113}}, color={0,0,255}));
  connect(load.p, FTILL.p[3]) annotation (Line(points={{-93,-136},{-93,-136},{-93,
          -122},{-98,-122},{-98,-107}}, color={0,0,255}));
  connect(pwLine2.p, FSBIS.p[1]) annotation (Line(points={{111,-100},{60,-100},
          {60,-118}},color={0,0,255}));
  connect(pwLine3.p, FSBIS.p[2]) annotation (Line(points={{111,-120},{60,-120},
          {60,-110}},color={0,0,255}));
  connect(load1.p, FSBIS.p[3]) annotation (Line(points={{65,-136},{65,-136},{65,
          -122},{60,-122},{60,-102}}, color={0,0,255}));
  connect(pwLine4.n, FSBIS.n[1]) annotation (Line(points={{-11,-100},{58,-100},
          {58,-116}},color={0,0,255}));
  connect(pwLine5.n, FSBIS.n[2]) annotation (Line(points={{-11,-120},{58,-120},
          {58,-104}},color={0,0,255}));
  connect(pwLine.p, FSSV.p[1]) annotation (Line(points={{-163,-100},{-198,-100},
          {-198,-115.65}}, color={0,0,255}));
  connect(pwLine1.p, FSSV.p[2]) annotation (Line(points={{-163,-120},{-198,-120},
          {-198,-104.55}}, color={0,0,255}));
  connect(pwLine7.p, FSSV.p[3]) annotation (Line(points={{-161,-48},{-172,-48},
          {-172,-98},{-198,-98},{-198,-93.45}}, color={0,0,255}));
  connect(pwLine6.p, FSSV.p[4]) annotation (Line(points={{-161,-28},{-190,-28},
          {-190,-82.35},{-198,-82.35}},color={0,0,255}));
  connect(pwLine6.n, FPAND.n[1]) annotation (Line(points={{-143,-28},{-140,-28},
          {-140,30},{-100,30},{-100,7.3}}, color={0,0,255}));
  connect(pwLine7.n, FPAND.n[2]) annotation (Line(points={{-143,-48},{-120,-48},
          {-120,6},{-120,10},{-100,10},{-100,30},{-100,30.7}}, color={0,0,255}));
  connect(pwLine9.p, FPAND.p[1]) annotation (Line(points={{-59,70},{-70,70},{-70,
          1.45},{-98,1.45}}, color={0,0,255}));
  connect(pwLine8.p, FPAND.p[2]) annotation (Line(points={{-59,90},{-90,90},{-90,
          40},{-98,40},{-98,13.15}}, color={0,0,255}));
  connect(pwLine8.n, FVERGE.p[1]) annotation (Line(points={{-41,90},{-20,90},{
          -20,122},{-16.55,122},{-16.55,122}},
                                           color={0,0,255}));
  connect(pwLine9.n, FVERGE.p[2]) annotation (Line(points={{-41,70},{-2,70},{-2,
          122},{-4.85,122},{-4.85,122}}, color={0,0,255}));
  connect(pwLine11.n, FTDPRA.n[1]) annotation (Line(points={{59,70},{64,70},{64,
          1.45},{98,1.45}}, color={0,0,255}));
  connect(pwLine10.n, FTDPRA.n[2]) annotation (Line(points={{59,90},{80,90},{80,
          28},{98,28},{98,13.15}}, color={0,0,255}));
  connect(pwLine11.p, FVERGE.p[3]) annotation (Line(points={{41,70},{2,70},{2,
          122},{6,122},{6.85,122},{6.85,122}}, color={0,0,255}));
  connect(pwLine10.p, FVERGE.p[4]) annotation (Line(points={{41,90},{20,90},{20,
          122},{18.55,122},{18.55,122}}, color={0,0,255}));
  connect(load2.p, FPAND.p[3]) annotation (Line(points={{-91,-36},{-91,-4},{-98,
          -4},{-98,24.85}}, color={0,0,255}));
  connect(load3.p, FTDPRA.n[3]) annotation (Line(points={{89,-36},{89,-36},{89,
          -4},{98,-4},{98,24.85}}, color={0,0,255}));
  connect(pwLine3.n, FVALDI.n[1]) annotation (Line(points={{129,-120},{198,-120},
          {198,-115.65}}, color={0,0,255}));
  connect(pwLine2.n, FVALDI.n[2]) annotation (Line(points={{129,-100},{198,-100},
          {198,-104.55}}, color={0,0,255}));
  connect(pwLine13.n, FVALDI.n[3]) annotation (Line(points={{159,-50},{164,-50},
          {164,-98},{198,-98},{198,-93.45}}, color={0,0,255}));
  connect(pwLine12.n, FVALDI.n[4]) annotation (Line(points={{159,-30},{180,-30},
          {180,-82.35},{198,-82.35}}, color={0,0,255}));
  connect(pwLine13.p, FTDPRA.p[1]) annotation (Line(points={{141,-50},{104,-50},
          {104,7.3},{100,7.3}}, color={0,0,255}));
  connect(pwLine12.p, FTDPRA.p[2]) annotation (Line(points={{141,-30},{120,-30},
          {120,30.7},{100,30.7}}, color={0,0,255}));
  connect(twoWindingTransformer.n, FTDPRA.n[4]) annotation (Line(points={{
          9.66667,0},{98,0},{98,36},{98,36.55}}, color={0,0,255}));
  connect(twoWindingTransformer.p, FPAND.p[4]) annotation (Line(points={{
          -13.6667,0},{-98,0},{-98,36},{-98,36.55}},
                                            color={0,0,255}));
  connect(pwFault.p, FTILL.p[4]) annotation (Line(points={{-77,-142},{-82,-142},
          {-82,-101},{-98,-101}}, color={0,0,255}));
  connect(twoWindingTransformer2.n, FVALDI.p[1]) annotation (Line(points={{223,
          -100},{200,-100},{200,-99}}, color={0,0,255}));
  connect(twoWindingTransformer2.p, GEN2.pwPin)
    annotation (Line(points={{237,-100},{259,-100}}, color={0,0,255}));
  connect(GEN3.pwPin, twoWindingTransformer3.p)
    annotation (Line(points={{0,179},{0,157}}, color={0,0,255}));
  connect(twoWindingTransformer3.n, FVERGE.n[1])
    annotation (Line(points={{0,143},{0,134},{0,124},{1,124}},
                                               color={0,0,255}));
  connect(twoWindingTransformer1.p, GEN1.pwPin)
    annotation (Line(points={{-237,-100},{-259,-100}}, color={0,0,255}));
  connect(twoWindingTransformer1.n, FSSV.n[1]) annotation (Line(points={{-223,-100},
          {-200,-100},{-200,-99}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(extent={{-280,-160},{280,220}},
          preserveAspectRatio=false), graphics={Text(
          extent={{-222,-50},{-198,-60}},
          lineColor={28,108,200},
          textString="FSSV"),Text(
          extent={{204,-50},{236,-60}},
          lineColor={28,108,200},
          textString="FVALDI"),Text(
          extent={{100,70},{138,60}},
          lineColor={28,108,200},
          textString="FTDPRA"),Text(
          extent={{-132,70},{-102,60}},
          lineColor={28,108,200},
          textString="FPAND"),Text(
          extent={{46,126},{84,116}},
          lineColor={28,108,200},
          textString="FVERGE"),Text(
          extent={{44,-76},{74,-86}},
          lineColor={28,108,200},
          textString="FSBIS"),Text(
          extent={{-114,-78},{-84,-88}},
          lineColor={28,108,200},
          textString="FTILL5")}),
    Icon(coordinateSystem(extent={{-280,-160},{280,220}})),
    Documentation,
    experiment(
      StopTime=2,
      __Dymola_NumberOfIntervals=5000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end SevenBus_Network;
