within Tutorial.Example_3;
model Example_3
  import Modelica.Constants.pi;
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer(
    kT=16.5/230,
    x=0.0576,
    r=0,
    V_b=16.5,
    Vn=16.5) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-50})));
  OpenIPSL.Electrical.Branches.PwLine line_6_4(
    R=0.017,
    X=0.092,
    G=0,
    B=0.079,
    displayPF=true) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=270,
        origin={80,0})));
  OpenIPSL.Electrical.Branches.PwLine line_4_5(
    G=0,
    R=0.01,
    X=0.085,
    B=0.088,
    displayPF=true) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=270,
        origin={-60,-2})));
  OpenIPSL.Electrical.Loads.PSAT.VoltDependant lOADPQ(
    V_b=230,
    angle_0=-0.069617784448685*180/pi,
    V_0=0.995630859628167,
    Sn=100,
    P_0=1.25*SysData.S_b,
    Q_0=0.5*SysData.S_b) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-90,-10})));
  OpenIPSL.Electrical.Loads.PSAT.VoltDependant PQ1(
    V_b=230,
    P_0=0.9*SysData.S_b,
    Q_0=0.3*SysData.S_b,
    angle_0=-0.064357203188830*180/pi,
    V_0=1.012654326639182,
    Sn=100) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={110,-10})));
  OpenIPSL.Electrical.Branches.PwLine line_9_6(
    G=0,
    R=0.039,
    X=0.170,
    B=0.179,
    displayPF=true) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={80,56})));
  OpenIPSL.Electrical.Branches.PwLine line_5_7(
    G=0,
    R=0.032,
    X=0.161,
    B=0.153,
    displayPF=true) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-60,56})));
  OpenIPSL.Electrical.Branches.PwLine line_8_9(
    G=0,
    R=0.0119,
    X=0.1008,
    B=0.1045,
    displayPF=true) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={30,90})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer
    twoWindingTransformer1(
    r=0,
    kT=13.8/230,
    x=0.0586,
    V_b=13.8,
    Vn=13.8) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={100,90})));
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
        origin={-100,90})));
  OpenIPSL.Electrical.Loads.PSAT.VoltDependant lOADPQ1(
    V_b=230,
    P_0=1*SysData.S_b,
    Q_0=0.35*SysData.S_b,
    angle_0=0.012697901381466*180/pi,
    V_0=1.015882581760390,
    Sn=100) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={10,50})));
  OpenIPSL.Electrical.Buses.Bus B2(
    V_0=1.025,
    angle_0=0.161966652912444*180/pi,
    displayPF=true)
    annotation (Placement(transformation(extent={{-130,80},{-110,100}})));
  OpenIPSL.Electrical.Buses.Bus B7(displayPF=true)
    annotation (Placement(transformation(extent={{-90,80},{-70,100}})));
  OpenIPSL.Electrical.Buses.Bus B8(displayPF=true) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={0,90})));
  OpenIPSL.Electrical.Buses.Bus B9(displayPF=true)
    annotation (Placement(transformation(extent={{50,80},{70,100}})));
  OpenIPSL.Electrical.Buses.Bus B3(displayPF=true)
    annotation (Placement(transformation(extent={{110,80},{130,100}})));
  OpenIPSL.Electrical.Buses.Bus B6(displayPF=true) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={80,30})));
  OpenIPSL.Electrical.Buses.Bus B5(displayPF=true) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-60,30})));
  OpenIPSL.Electrical.Buses.Bus B4(displayPF=true) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-30})));
  OpenIPSL.Electrical.Buses.Bus B1(angle_0=0, displayPF=true) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-70})));
  Tutorial.Example_3.Generation_Groups.Gen1 gen1(
    V_b=18,
    V_0=1.025,
    height=0.05,
    tstart=2,
    refdisturb=false,
    angle_0=0.161966652912444*180/pi,
    vref0=1.120103884682511,
    P_0=1.629999999999999*SysData.S_b,
    Q_0=0.066536560198189*SysData.S_b,
    vf0=1.789323314329606,
    displayPF=true)
    annotation (Placement(transformation(extent={{-160,80},{-140,100}})));
  Generation_Groups.Gen2 gen2(
    V_b=13.8,
    V_0=1.025,
    angle_0=0.081415270775183*180/pi,
    vref0=1.097573933623472,
    P_0=0.850000000000000*SysData.S_b,
    Q_0=-0.108597088920594*SysData.S_b,
    vf0=1.402994304406186,
    height=0.05,
    tstart=2,
    refdisturb=false,
    displayPF=true)
    annotation (Placement(transformation(extent={{160,80},{140,100}})));
  Generation_Groups.Gen3 gen3(
    V_0=1.040000000000000,
    angle_0=0,
    V_b=16.5,
    vref0=1.095242742681042,
    Q_0=0.270459279594234*SysData.S_b,
    vf0=1.082148046273888,
    P_0=0.716410214993680*SysData.S_b,
    height=0.05,
    tstart=2,
    refdisturb=false,
    displayPF=true) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-100})));
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=100, fn=60)
    annotation (Placement(transformation(extent={{100,-120},{180,-80}})));
  OpenIPSL.Electrical.Events.PwFault pwFault2(
    X=0.01,
    t1=3,
    t2=3.1,
    R=0.01) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={50,50})));
  OpenIPSL.Electrical.Branches.PwLine pwLine2Openings(
    R=0.0085,
    X=0.072,
    G=0,
    B=0.0745,
    t1=30,
    t2=35,
    opening=1,
    displayPF=true)
    annotation (Placement(transformation(extent={{-40,80},{-20,100}})));
equation
  connect(line_5_7.n, B7.p) annotation (Line(
      points={{-60,65},{-60,90},{-80,90}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWindingTransformer1.n, B9.p) annotation (Line(
      points={{89,90},{60,90}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(line_9_6.n, B9.p) annotation (Line(
      points={{80,65},{80,90},{60,90}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWindingTransformer1.p, B3.p) annotation (Line(
      points={{111,90},{120,90}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B6.p, line_9_6.p) annotation (Line(
      points={{80,30},{80,47}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(line_5_7.p, B5.p) annotation (Line(
      points={{-60,47},{-60,30}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B2.p, gen1.pwPin)
    annotation (Line(points={{-120,90},{-139,90}}, color={0,0,255}));
  connect(B2.p, twoWindingTransformer2.p)
    annotation (Line(points={{-120,90},{-111,90}}, color={0,0,255}));
  connect(twoWindingTransformer2.n, B7.p)
    annotation (Line(points={{-89,90},{-89,90},{-80,90}}, color={0,0,255}));
  connect(gen2.pwPin, B3.p)
    annotation (Line(points={{139,90},{129.5,90},{120,90}}, color={0,0,255}));
  connect(lOADPQ.p, B5.p) annotation (Line(points={{-90,1},{-90,20},{-60,20},{-60,
          30}}, color={0,0,255}));
  connect(B4.p, twoWindingTransformer.n) annotation (Line(points={{0,-30},{0,-39},
          {6.66134e-16,-39}}, color={0,0,255}));
  connect(B8.p, lOADPQ1.p)
    annotation (Line(points={{0,90},{10,90},{10,61}}, color={0,0,255}));
  connect(line_8_9.p, B9.p)
    annotation (Line(points={{39,90},{39,90},{60,90}}, color={0,0,255}));
  connect(B8.p, line_8_9.n)
    annotation (Line(points={{0,90},{16,90},{21,90}}, color={0,0,255}));
  connect(B9.p, pwFault2.p)
    annotation (Line(points={{60,90},{50,90},{50,61.6667}}, color={0,0,255}));
  connect(B7.p, pwLine2Openings.p)
    annotation (Line(points={{-80,90},{-39,90}}, color={0,0,255}));
  connect(B8.p, pwLine2Openings.n)
    annotation (Line(points={{0,90},{-21,90}}, color={0,0,255}));
  connect(PQ1.p, B6.p) annotation (Line(points={{110,1},{110,20},{80,20},{80,30}},
        color={0,0,255}));
  connect(gen3.pwPin, B1.p)
    annotation (Line(points={{0,-89},{0,-89},{0,-70}}, color={0,0,255}));
  connect(twoWindingTransformer.p, B1.p)
    annotation (Line(points={{0,-61},{0,-65.5},{0,-70}}, color={0,0,255}));
  connect(line_6_4.p, B4.p) annotation (Line(points={{80,-9},{80,-20},{80,-20},
          {80,-20},{0,-20},{0,-30},{0,-30}}, color={0,0,255}));
  connect(line_6_4.n, B6.p)
    annotation (Line(points={{80,9},{80,19.5},{80,30}}, color={0,0,255}));
  connect(line_4_5.n, B5.p)
    annotation (Line(points={{-60,7},{-60,7},{-60,30}}, color={0,0,255}));
  connect(line_4_5.p, B4.p) annotation (Line(points={{-60,-11},{-60,-20},{0,-20},
          {0,-30},{0,-30}}, color={0,0,255}));
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
end Example_3;
