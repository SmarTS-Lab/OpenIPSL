within IEEE9;
model IEEE_9_Buses
  import Modelica.Constants.pi;
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer(
    kT=16.5/230,
    x=0.0576,
    r=0,
    V_b=16.5,
    Vn=16.5) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-66})));
  OpenIPSL.Electrical.Branches.PwLine line_6_4(
    R=0.017,
    X=0.092,
    G=0,
    B=0.079) annotation (Placement(transformation(
        extent={{-9,-6},{9,6}},
        rotation=270,
        origin={86,-21})));
  OpenIPSL.Electrical.Branches.PwLine line_4_5(
    G=0,
    R=0.01,
    X=0.085,
    B=0.088) annotation (Placement(transformation(
        extent={{-9,-6},{9,6}},
        rotation=270,
        origin={-72,-21})));
  OpenIPSL.Electrical.Loads.PSAT.VoltDependant lOADPQ(
    V_b=230,
    V_0=0.995630859628167,
    Sn=100,
    P_0=125,
    Q_0=50,
    angle_0=-3.9888) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=0,
        origin={-99,-11})));
  OpenIPSL.Electrical.Loads.PSAT.VoltDependant PQ1(
    V_b=230,
    V_0=1.012654326639182,
    Sn=100,
    P_0=90,
    Q_0=30,
    angle_0=-3.6874) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=0,
        origin={109,-13})));
  OpenIPSL.Electrical.Branches.PwLine line_9_6(
    G=0,
    R=0.039,
    X=0.170,
    B=0.179) annotation (Placement(transformation(
        extent={{-9,-6},{9,6}},
        rotation=90,
        origin={86,57})));
  OpenIPSL.Electrical.Branches.PwLine line_5_7(
    G=0,
    R=0.032,
    X=0.161,
    B=0.153) annotation (Placement(transformation(
        extent={{-9,-6},{9,6}},
        rotation=90,
        origin={-72,53})));
  OpenIPSL.Electrical.Branches.PwLine line_8_9(
    G=0,
    R=0.0119,
    X=0.1008,
    B=0.1045) annotation (Placement(transformation(
        extent={{-9,-6},{9,6}},
        rotation=180,
        origin={39,90})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer
    twoWindingTransformer1(
    r=0,
    kT=13.8/230,
    x=0.0586,
    V_b=13.8,
    Vn=13.8) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={102,90})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer
    twoWindingTransformer2(
    r=0,
    kT=18/230,
    x=0.0625,
    Sn=100,
    V_b=18,
    Vn=18) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-102,90})));
  OpenIPSL.Electrical.Loads.PSAT.VoltDependant lOADPQ1(
    V_b=230,
    V_0=1.015882581760390,
    Sn=100,
    P_0=100,
    Q_0=35,
    angle_0=0.72754) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=0,
        origin={7,53})));
  OpenIPSL.Electrical.Buses.Bus B2(
    V_0=1.025,
    V_b=18,
    angle_0=9.28)
    annotation (Placement(transformation(extent={{-130,80},{-110,100}})));
  OpenIPSL.Electrical.Buses.Bus B7(
    V_b=230,
    V_0=1.0258,
    angle_0=3.7197)
    annotation (Placement(transformation(extent={{-90,80},{-70,100}})));
  OpenIPSL.Electrical.Buses.Bus B8(
    V_0=1.015882581760390,
    V_b=230,
    angle_0=0.72754) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={0,90})));
  OpenIPSL.Electrical.Buses.Bus B9(
    V_b=230,
    V_0=1.0324,
    angle_0=1.9667)
    annotation (Placement(transformation(extent={{70,80},{90,100}})));
  OpenIPSL.Electrical.Buses.Bus B3(
    V_0=1.025,
    V_b=13.8,
    angle_0=4.6648)
    annotation (Placement(transformation(extent={{110,80},{130,100}})));
  OpenIPSL.Electrical.Buses.Bus B6(
    V_0=1.012654326639182,
    V_b=230,
    angle_0=-3.6874) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={86,20})));
  OpenIPSL.Electrical.Buses.Bus B5(
    V_0=0.995630859628167,
    V_b=230,
    angle_0=-3.9888) annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=90,
        origin={-72,20})));
  OpenIPSL.Electrical.Buses.Bus B4(
    V_0=1.0258,
    V_b=230,
    angle_0=-2.2168) annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=-90,
        origin={0,-46})));
  OpenIPSL.Electrical.Buses.Bus B1(
    angle_0=0,
    V_0=1.04,
    V_b=16.5) annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=-90,
        origin={0,-86})));
  Generation_Groups.Gen1 gen1(
    V_b=18,
    V_0=1.025,
    height_1=0.05,
    tstart_1=2,
    refdisturb_1=false,
    vref0=1.120103884682511,
    vf0=1.789323314329606,
    angle_0=0.161966652912444*180/pi,
    P_0=163,
    Q_0=6.6536560198189)
    annotation (Placement(transformation(extent={{-160,80},{-140,100}})));
  Generation_Groups.Gen2 gen2(
    V_b=13.8,
    V_0=1.025,
    height_2=0.05,
    tstart_2=2,
    refdisturb_2=false,
    vref0=1.097573933623472,
    vf0=1.402994304406186,
    P_0=85,
    Q_0=-10.8597088920594,
    angle_0=4.6648)
    annotation (Placement(transformation(extent={{160,80},{140,100}})));
  Generation_Groups.Gen3 gen3(
    V_0=1.040000000000000,
    angle_0=0,
    height_3=0.05,
    tstart_3=2,
    refdisturb_3=false,
    V_b=16.5,
    vref0=1.095242742681042,
    vf0=1.082148046273888,
    P_0=71.6410214993680,
    Q_0=27.0459279594234) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-104})));
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=100, fn=60)
    annotation (Placement(transformation(extent={{80,-120},{180,-80}})));
  OpenIPSL.Electrical.Events.PwFault pwFault2(
    X=0.01,
    t1=3,
    t2=3.1,
    R=0.01) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=270,
        origin={57,61})));
  OpenIPSL.Electrical.Branches.PwLine pwLine2Openings(
    R=0.0085,
    X=0.072,
    G=0,
    B=0.0745,
    t1=30,
    t2=35,
    opening=1)
    annotation (Placement(transformation(extent={{-50,84},{-32,96}})));
equation
  connect(line_5_7.n, B7.p) annotation (Line(
      points={{-72,61.1},{-72,90},{-80,90}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWindingTransformer1.n, B9.p) annotation (Line(
      points={{91,90},{80,90}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(line_9_6.n, B9.p) annotation (Line(
      points={{86,65.1},{86,90},{80,90}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWindingTransformer1.p, B3.p) annotation (Line(
      points={{113,90},{120,90}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B6.p, line_9_6.p) annotation (Line(
      points={{86,20},{86,48.9}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(line_5_7.p, B5.p) annotation (Line(
      points={{-72,44.9},{-72,20}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWindingTransformer.p, B1.p) annotation (Line(
      points={{0,-77},{0,-86}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B2.p, gen1.pwPin)
    annotation (Line(points={{-120,90},{-139,90}}, color={0,0,255}));
  connect(B2.p, twoWindingTransformer2.p)
    annotation (Line(points={{-120,90},{-110,90},{-113,90}}, color={0,0,255}));
  connect(twoWindingTransformer2.n, B7.p)
    annotation (Line(points={{-91,90},{-91,90},{-80,90}}, color={0,0,255}));
  connect(gen2.pwPin, B3.p)
    annotation (Line(points={{139,90},{129.5,90},{120,90}}, color={0,0,255}));
  connect(lOADPQ.p, B5.p) annotation (Line(points={{-99,-4},{-99,4},{-72,4},{-72,
          20}}, color={0,0,255}));
  connect(B4.p, twoWindingTransformer.n)
    annotation (Line(points={{0,-46},{0,-55}}, color={0,0,255}));
  connect(gen3.pwPin, B1.p)
    annotation (Line(points={{0,-93},{0,-86}}, color={0,0,255}));
  connect(B8.p, lOADPQ1.p) annotation (Line(points={{0,90},{6,90},{6,88},{7,88},
          {7,60}}, color={0,0,255}));
  connect(line_8_9.p, B9.p)
    annotation (Line(points={{47.1,90},{47.1,90},{80,90}}, color={0,0,255}));
  connect(B8.p, line_8_9.n)
    annotation (Line(points={{0,90},{30.9,90}}, color={0,0,255}));
  connect(B5.p, line_4_5.p)
    annotation (Line(points={{-72,20},{-72,-12.9}}, color={0,0,255}));
  connect(B4.p, line_4_5.n) annotation (Line(points={{0,-46},{0,-42},{-72,-42},
          {-72,-29.1}}, color={0,0,255}));
  connect(B6.p, line_6_4.p)
    annotation (Line(points={{86,20},{86,-12.9}}, color={0,0,255}));
  connect(B4.p, line_6_4.n) annotation (Line(points={{0,-46},{-2,-46},{-2,-42},
          {86,-42},{86,-29.1}}, color={0,0,255}));
  connect(B6.p, PQ1.p) annotation (Line(points={{86,20},{86,20},{86,2},{86,4},{
          109,4},{109,-6}}, color={0,0,255}));
  connect(B9.p, pwFault2.p)
    annotation (Line(points={{80,90},{57,90},{57,69.1667}}, color={0,0,255}));
  connect(B7.p, pwLine2Openings.p)
    annotation (Line(points={{-80,90},{-49.1,90}}, color={0,0,255}));
  connect(B8.p, pwLine2Openings.n)
    annotation (Line(points={{0,90},{-32.9,90}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-180,-120},{
            180,120}})),
    Icon(coordinateSystem(extent={{-180,-120},{180,120}})),
    Documentation(info="<html>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"<tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>15/07/2015</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"),
    experiment(
      StopTime=20,
      Interval=0.001,
      Tolerance=1e-006,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Rkfix2"),
    __Dymola_experimentSetupOutput);
end IEEE_9_Buses;
