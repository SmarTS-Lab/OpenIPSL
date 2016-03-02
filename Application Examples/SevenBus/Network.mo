within SevenBus;
model Network
  import SevenBus;
  parameter Real V_FPAND=1.06959;
  parameter Real angle_FPAND=0.0173;
  parameter Real V_FSSV=1.0696;
  parameter Real angle_FSSV=0.09350001;
  parameter Real V_FSBIS=1.06958;
  parameter Real angle_FSBIS=-0.0035;
  parameter Real V_FTDPRA=1.06959;
  parameter Real angle_FTDPRA=-0.0174;
  parameter Real V_FTILL=1.06957;
  parameter Real angle_FTILL=0.0034;
  parameter Real V_FVALDI=1.0696;
  parameter Real angle_FVALDI=0.0311;
  parameter Real V_FVERGE=1.0696;
  parameter Real angle_FVERGE=0;
  parameter Real V_FSSVG=0.9898801;
  parameter Real angle_FSSVG=7.309099;
  parameter Real V_FVALDIG=1.00595;
  parameter Real angle_FVALDIG=2.5534;
  parameter Real V_FVERGEG=0.9803;
  parameter Real angle_FVERGEG=-0.001;
  SevenBus.Generators.G1 GEN1(
    M_b=1078,
    V_b=24,
    V_0=V_FSSVG,
    angle_0=angle_FSSVG,
    P_0=962.2,
    Q_0=124.763) annotation (Placement(transformation(extent={{-280,-110},{-260,-90}})));
  iPSL.Electrical.Branches.PwLine pwLine(
    R=6e-006,
    X=0.000692,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-164,-110},{-144,-90}})));
  iPSL.Electrical.Branches.PwLine pwLine1(
    R=6e-006,
    X=0.000692,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-164,-130},{-144,-110}})));
  iPSL.Electrical.Branches.PwLine pwLine2(
    R=6e-006,
    X=0.000692,
    G=0,
    B=0) annotation (Placement(transformation(extent={{110,-110},{130,-90}})));
  iPSL.Electrical.Branches.PwLine pwLine3(
    R=6e-006,
    X=0.000692,
    G=0,
    B=0) annotation (Placement(transformation(extent={{110,-130},{130,-110}})));
  iPSL.Electrical.Branches.PwLine pwLine4(
    R=6e-006,
    X=0.000692,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-30,-110},{-10,-90}})));
  iPSL.Electrical.Branches.PwLine pwLine5(
    R=6e-006,
    X=0.000692,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-30,-130},{-10,-110}})));
  iPSL.Electrical.Loads.PSSE.Load load(
    V_b=380,
    P_0=480,
    Q_0=4.8,
    V_0=V_FTILL,
    angle_0=angle_FTILL) annotation (Placement(transformation(extent={{-98,-146},{-88,-136}})));
  iPSL.Electrical.Loads.PSSE.Load load1(
    V_b=380,
    P_0=240,
    Q_0=2.4,
    V_0=V_FSBIS,
    angle_0=angle_FSBIS) annotation (Placement(transformation(extent={{60,-146},{70,-136}})));
  iPSL.Electrical.Branches.PwLine pwLine6(
    R=6e-006,
    X=0.000692,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-162,-38},{-142,-18}})));
  iPSL.Electrical.Branches.PwLine pwLine7(
    R=6e-006,
    X=0.000692,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-162,-58},{-142,-38}})));
  iPSL.Electrical.Buses.BusExt FSSV(
    nu=5,
    V_0=V_FSSV,
    angle_0=angle_FSSV,
    V_b=380,
    no=1) annotation (Placement(transformation(extent={{-200,-136},{-198,-62}})));
  iPSL.Electrical.Buses.BusExt FTILL(
    no=2,
    nu=4,
    V_0=V_FTILL,
    angle_0=angle_FTILL,
    V_b=380) annotation (Placement(transformation(extent={{-100,-130},{-98,-90}})));
  iPSL.Electrical.Buses.BusExt FSBIS(
    no=2,
    nu=3,
    V_0=V_FSBIS,
    angle_0=angle_FSBIS,
    V_b=380) annotation (Placement(transformation(extent={{58,-130},{60,-90}})));
  iPSL.Electrical.Buses.BusExt FVERGE(
    nu=4,
    V_0=V_FVERGE,
    angle_0=angle_FVERGE,
    V_b=380,
    no=1) annotation (Placement(transformation(
        extent={{-1,-39},{1,39}},
        rotation=-90,
        origin={1,123})));
  iPSL.Electrical.Buses.BusExt FPAND(
    nu=4,
    no=2,
    V_0=V_FPAND,
    angle_0=angle_FPAND,
    V_b=380) annotation (Placement(transformation(
        extent={{-1,-39},{1,39}},
        rotation=0,
        origin={-99,19})));
  iPSL.Electrical.Buses.BusExt FTDPRA(
    nu=2,
    no=4,
    V_0=V_FTDPRA,
    angle_0=angle_FTDPRA,
    V_b=380) annotation (Placement(transformation(
        extent={{-1,-39},{1,39}},
        rotation=0,
        origin={99,19})));
  iPSL.Electrical.Branches.PwLine pwLine8(
    R=6e-006,
    X=0.000692,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-60,80},{-40,100}})));
  iPSL.Electrical.Branches.PwLine pwLine9(
    R=6e-006,
    X=0.000692,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-60,60},{-40,80}})));
  iPSL.Electrical.Branches.PwLine pwLine10(
    R=6e-006,
    X=0.000692,
    G=0,
    B=0) annotation (Placement(transformation(extent={{40,80},{60,100}})));
  iPSL.Electrical.Branches.PwLine pwLine11(
    R=6e-006,
    X=0.000692,
    G=0,
    B=0) annotation (Placement(transformation(extent={{40,60},{60,80}})));
  iPSL.Electrical.Loads.PSSE.Load load2(
    V_b=380,
    P_0=240,
    Q_0=2.4,
    V_0=V_FPAND,
    angle_0=angle_FPAND) annotation (Placement(transformation(extent={{-96,-46},{-86,-36}})));
  iPSL.Electrical.Loads.PSSE.Load load3(
    V_b=380,
    P_0=480,
    Q_0=4.8,
    V_0=V_FTDPRA,
    angle_0=angle_FTDPRA) annotation (Placement(transformation(extent={{84,-46},{94,-36}})));
  iPSL.Electrical.Buses.BusExt FVALDI(
    no=5,
    V_0=V_FVALDI,
    angle_0=angle_FVALDI,
    V_b=380,
    nu=1) annotation (Placement(transformation(extent={{198,-136},{200,-62}})));
  iPSL.Electrical.Branches.PwLine pwLine12(
    R=6e-006,
    X=0.000692,
    G=0,
    B=0) annotation (Placement(transformation(extent={{140,-40},{160,-20}})));
  iPSL.Electrical.Branches.PwLine pwLine13(
    R=6e-006,
    X=0.000692,
    G=0,
    B=0) annotation (Placement(transformation(extent={{140,-60},{160,-40}})));
  inner iPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{-180,120},{-92,160}})));
  iPSL.Electrical.Branches.PSSE.TwoWindingTransformer twoWindingTransformer(
    G=0,
    B=0,
    t1=1,
    t2=1,
    R=0.00001,
    X=0.00069,
    CZ=1,
    CW=1,
    VNOM1=380,
    VB1=380,
    VNOM2=380,
    VB2=380,
    ANG1=0) annotation (Placement(transformation(extent={{-12,-8},{8,8}})));
  SevenBus.Generators.G2 GEN2(
    V_b=20,
    V_0=V_FVALDIG,
    angle_0=angle_FVALDIG,
    M_b=1710,
    P_0=480.428,
    Q_0=27.609) annotation (Placement(transformation(extent={{280,-110},{260,-90}})));
  SevenBus.Generators.G3 GEN3(
    M_b=1211,
    V_b=24,
    V_0=V_FVERGEG,
    angle_0=angle_FVERGEG,
    P_0=-0.05358902,
    Q_0=7.038) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,190})));
  iPSL.Electrical.Events.PwFault pwFault(
    R=0.1,
    X=0.1,
    t1=1,
    t2=1.2) annotation (Placement(transformation(extent={{-76,-148},{-64,-136}})));
  iPSL.Electrical.Branches.PSSE.TwoWindingTransformer twoWindingTransformer1(
    G=0,
    B=0,
    CW=1,
    VB2=380,
    VB1=24,
    ANG1=0,
    VNOM2=415,
    CZ=2,
    R=0.0025,
    X=0.137,
    t1=1,
    VNOM1=24,
    t2=415/380,
    S_n=1080) annotation (Placement(transformation(
        extent={{6,-4},{-6,4}},
        rotation=180,
        origin={-230,-100})));
  iPSL.Electrical.Branches.PSSE.TwoWindingTransformer twoWindingTransformer2(
    G=0,
    B=0,
    CW=1,
    VB2=380,
    VB1=20,
    VNOM2=405,
    CZ=2,
    R=0.0029,
    X=0.1583,
    t1=1,
    VNOM1=20,
    t2=405/380,
    S_n=1710,
    ANG1=0) annotation (Placement(transformation(
        extent={{-6,-4},{6,4}},
        rotation=180,
        origin={230,-100})));
  iPSL.Electrical.Branches.PSSE.TwoWindingTransformer twoWindingTransformer3(
    G=0,
    B=0,
    CW=1,
    VB2=380,
    VB1=24,
    VNOM2=415,
    CZ=2,
    R=0.0025,
    X=0.1362,
    t1=1,
    VNOM1=24,
    t2=415/380,
    S_n=1080,
    ANG1=0) annotation (Placement(transformation(
        extent={{6,-4},{-6,4}},
        rotation=90,
        origin={0,150})));
equation
  connect(pwLine.n, FTILL.o[1]) annotation (Line(points={{-142.333,-100},{-100,-100},{-100,-116}}, color={0,0,255}));
  connect(pwLine1.n, FTILL.o[2]) annotation (Line(points={{-142.333,-120},{-100,-120},{-100,-104}}, color={0,0,255}));
  connect(pwLine4.p, FTILL.u[1]) annotation (Line(points={{-31.6667,-100},{-98,-100},{-98,-119}}, color={0,0,255}));
  connect(pwLine5.p, FTILL.u[2]) annotation (Line(points={{-31.6667,-120},{-98,-120},{-98,-113}}, color={0,0,255}));
  connect(load.p, FTILL.u[3]) annotation (Line(points={{-93,-135.5},{-93,-128},{-93,-122},{-98,-122},{-98,-107}}, color={0,0,255}));
  connect(pwLine2.p, FSBIS.u[1]) annotation (Line(points={{108.333,-100},{60,-100},{60,-118}}, color={0,0,255}));
  connect(pwLine3.p, FSBIS.u[2]) annotation (Line(points={{108.333,-120},{60,-120},{60,-110}}, color={0,0,255}));
  connect(load1.p, FSBIS.u[3]) annotation (Line(points={{65,-135.5},{65,-135.5},{65,-122},{60,-122},{60,-102}}, color={0,0,255}));
  connect(pwLine4.n, FSBIS.o[1]) annotation (Line(points={{-8.33333,-100},{58,-100},{58,-116}}, color={0,0,255}));
  connect(pwLine5.n, FSBIS.o[2]) annotation (Line(points={{-8.33333,-120},{58,-120},{58,-104}}, color={0,0,255}));
  connect(pwLine.p, FSSV.u[1]) annotation (Line(points={{-165.667,-100},{-198,-100},{-198,-116.76}}, color={0,0,255}));
  connect(pwLine1.p, FSSV.u[2]) annotation (Line(points={{-165.667,-120},{-198,-120},{-198,-107.88}}, color={0,0,255}));
  connect(pwLine7.p, FSSV.u[3]) annotation (Line(points={{-163.667,-48},{-172,-48},{-172,-98},{-198,-98},{-198,-99}}, color={0,0,255}));
  connect(pwLine6.p, FSSV.u[4]) annotation (Line(points={{-163.667,-28},{-190,-28},{-190,-90.12},{-198,-90.12}}, color={0,0,255}));
  connect(pwLine6.n, FPAND.o[1]) annotation (Line(points={{-140.333,-28},{-140,-28},{-140,30},{-100,30},{-100,7.3}}, color={0,0,255}));
  connect(pwLine7.n, FPAND.o[2]) annotation (Line(points={{-140.333,-48},{-120,-48},{-120,6},{-120,10},{-100,10},{-100,30},{-100,30.7}}, color={0,0,255}));
  connect(pwLine9.p, FPAND.u[1]) annotation (Line(points={{-61.6667,70},{-70,70},{-70,1.45},{-98,1.45}}, color={0,0,255}));
  connect(pwLine8.p, FPAND.u[2]) annotation (Line(points={{-61.6667,90},{-90,90},{-90,40},{-98,40},{-98,13.15}}, color={0,0,255}));
  connect(pwLine8.n, FVERGE.u[1]) annotation (Line(points={{-38.3333,90},{-20,90},{-20,122},{-17.55,122},{-17.55,121}}, color={0,0,255}));
  connect(pwLine9.n, FVERGE.u[2]) annotation (Line(points={{-38.3333,70},{-2,70},{-2,122},{-5.85,122},{-5.85,121}}, color={0,0,255}));
  connect(pwLine11.n, FTDPRA.o[1]) annotation (Line(points={{61.6667,70},{64,70},{64,1.45},{98,1.45}}, color={0,0,255}));
  connect(pwLine10.n, FTDPRA.o[2]) annotation (Line(points={{61.6667,90},{80,90},{80,28},{98,28},{98,13.15},{98,13.15}}, color={0,0,255}));
  connect(pwLine11.p, FVERGE.u[3]) annotation (Line(points={{38.3333,70},{2,70},{2,122},{6,122},{5.85,122},{5.85,121}}, color={0,0,255}));
  connect(pwLine10.p, FVERGE.u[4]) annotation (Line(points={{38.3333,90},{20,90},{20,122},{17.55,122},{17.55,121}}, color={0,0,255}));
  connect(load2.p, FPAND.u[3]) annotation (Line(points={{-91,-35.5},{-91,-4},{-98,-4},{-98,24.85}}, color={0,0,255}));
  connect(load3.p, FTDPRA.o[3]) annotation (Line(points={{89,-35.5},{89,-18},{89,-4},{98,-4},{98,24.85}}, color={0,0,255}));
  connect(pwLine3.n, FVALDI.o[1]) annotation (Line(points={{131.667,-120},{198,-120},{198,-116.76}}, color={0,0,255}));
  connect(pwLine2.n, FVALDI.o[2]) annotation (Line(points={{131.667,-100},{198,-100},{198,-107.88}}, color={0,0,255}));
  connect(pwLine13.n, FVALDI.o[3]) annotation (Line(points={{161.667,-50},{164,-50},{164,-98},{198,-98},{198,-99}}, color={0,0,255}));
  connect(pwLine12.n, FVALDI.o[4]) annotation (Line(points={{161.667,-30},{180,-30},{180,-90.12},{198,-90.12}}, color={0,0,255}));
  connect(pwLine13.p, FTDPRA.u[1]) annotation (Line(points={{138.333,-50},{104,-50},{104,7.3},{100,7.3}}, color={0,0,255}));
  connect(pwLine12.p, FTDPRA.u[2]) annotation (Line(points={{138.333,-30},{120,-30},{120,30.7},{100,30.7}}, color={0,0,255}));
  connect(twoWindingTransformer.n, FTDPRA.o[4]) annotation (Line(points={{9.66667,0},{98,0},{98,36},{98,36.55}}, color={0,0,255}));
  connect(twoWindingTransformer.p, FPAND.u[4]) annotation (Line(points={{-13.6667,0},{-98,0},{-98,36},{-98,36.55}}, color={0,0,255}));
  connect(pwFault.p, FTILL.u[4]) annotation (Line(points={{-77,-142},{-82,-142},{-82,-101},{-98,-101}}, color={0,0,255}));
  connect(twoWindingTransformer2.n, FVALDI.u[1]) annotation (Line(points={{223,-100},{200,-100},{200,-99}}, color={0,0,255}));
  connect(twoWindingTransformer2.p, GEN2.pwPin) annotation (Line(points={{237,-100},{259,-100}}, color={0,0,255}));
  connect(GEN3.pwPin, twoWindingTransformer3.p) annotation (Line(points={{0,179},{0,157}}, color={0,0,255}));
  connect(twoWindingTransformer3.n, FVERGE.o[1]) annotation (Line(points={{0,143},{0,123}}, color={0,0,255}));
  connect(twoWindingTransformer1.p, GEN1.pwPin) annotation (Line(points={{-237,-100},{-259,-100}}, color={0,0,255}));
  connect(twoWindingTransformer1.n, FSSV.o[1]) annotation (Line(points={{-223,-100},{-200,-100},{-200,-99}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(extent={{-280,-200},{280,180}}, preserveAspectRatio=false), graphics={
        Text(
          extent={{-222,-50},{-198,-60}},
          lineColor={28,108,200},
          textString="FSSV"),
        Text(
          extent={{204,-50},{236,-60}},
          lineColor={28,108,200},
          textString="FVALDI"),
        Text(
          extent={{100,70},{138,60}},
          lineColor={28,108,200},
          textString="FTDPRA"),
        Text(
          extent={{-132,70},{-102,60}},
          lineColor={28,108,200},
          textString="FPAND"),
        Text(
          extent={{46,126},{84,116}},
          lineColor={28,108,200},
          textString="FVERGE"),
        Text(
          extent={{44,-76},{74,-86}},
          lineColor={28,108,200},
          textString="FSBIS"),
        Text(
          extent={{-114,-78},{-84,-88}},
          lineColor={28,108,200},
          textString="FTILL5")}),
    Icon(coordinateSystem(extent={{-280,-200},{280,180}})),
    Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>"));
end Network;
