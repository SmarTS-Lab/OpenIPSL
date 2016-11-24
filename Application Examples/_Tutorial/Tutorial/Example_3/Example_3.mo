within Tutorial.Example_3;


model Example_3
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
    angle_0=-0.069617784448685*180/pi,
    V_0=0.995630859628167,
    Sn=100,
    P_0=1.25*SysData.S_b,
    Q_0=0.5*SysData.S_b) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=0,
        origin={-99,-11})));
  OpenIPSL.Electrical.Loads.PSAT.VoltDependant PQ1(
    V_b=230,
    P_0=0.9*SysData.S_b,
    Q_0=0.3*SysData.S_b,
    angle_0=-0.064357203188830*180/pi,
    V_0=1.012654326639182,
    Sn=100) annotation (Placement(transformation(
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
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer1(
    r=0,
    kT=13.8/230,
    x=0.0586,
    V_b=13.8,
    Vn=13.8) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={102,90})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer2(
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
    P_0=1*SysData.S_b,
    Q_0=0.35*SysData.S_b,
    angle_0=0.012697901381466*180/pi,
    V_0=1.015882581760390,
    Sn=100) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=0,
        origin={7,53})));
  OpenIPSL.Electrical.Buses.Bus B2(V_0=1.025, angle_0=0.161966652912444*180/pi) annotation (Placement(transformation(extent={{-130,80},{-110,100}})));
  OpenIPSL.Electrical.Buses.Bus B7 annotation (Placement(transformation(extent={{-90,80},{-70,100}})));
  OpenIPSL.Electrical.Buses.Bus B8 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={0,90})));
  OpenIPSL.Electrical.Buses.Bus B9 annotation (Placement(transformation(extent={{70,80},{90,100}})));
  OpenIPSL.Electrical.Buses.Bus B3 annotation (Placement(transformation(extent={{110,80},{130,100}})));
  OpenIPSL.Electrical.Buses.Bus B6 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={86,20})));
  OpenIPSL.Electrical.Buses.Bus B5 annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=90,
        origin={-72,20})));
  OpenIPSL.Electrical.Buses.Bus B4 annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=-90,
        origin={0,-46})));
  OpenIPSL.Electrical.Buses.Bus B1(angle_0=0) annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=-90,
        origin={0,-86})));
  Tutorial.Example_3.Generation_Groups.Gen1 gen1(
    V_b=18,
    V_0=1.025,
    height_1=0.05,
    tstart_1=2,
    refdisturb_1=false,
    angle_0=0.161966652912444*180/pi,
    vref0=1.120103884682511,
    P_0=1.629999999999999*SysData.S_b,
    Q_0=0.066536560198189*SysData.S_b,
    vf0=1.789323314329606) annotation (Placement(transformation(extent={{-160,80},{-140,100}})));
  Tutorial.Example_3.Generation_Groups.Gen2 gen2(
    V_b=13.8,
    V_0=1.025,
    height_2=0.05,
    tstart_2=2,
    refdisturb_2=false,
    angle_0=0.081415270775183*180/pi,
    vref0=1.097573933623472,
    P_0=0.850000000000000*SysData.S_b,
    Q_0=-0.108597088920594*SysData.S_b,
    vf0=1.402994304406186) annotation (Placement(transformation(extent={{160,80},{140,100}})));
  Tutorial.Example_3.Generation_Groups.Gen3 gen3(
    V_0=1.040000000000000,
    angle_0=0,
    height_3=0.05,
    tstart_3=2,
    refdisturb_3=false,
    V_b=16.5,
    vref0=1.095242742681042,
    Q_0=0.270459279594234*SysData.S_b,
    vf0=1.082148046273888,
    P_0=0.716410214993680*SysData.S_b) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-104})));
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=100, fn=60) annotation (Placement(transformation(extent={{80,-120},{180,-80}})));
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
    opening=1) annotation (Placement(transformation(extent={{-50,84},{-32,96}})));
equation
  connect(line_5_7.n, B7.p) annotation (Line(
      points={{-72,63.5},{-72,90},{-80,90}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWindingTransformer1.n, B9.p) annotation (Line(
      points={{91,90},{80,90}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(line_9_6.n, B9.p) annotation (Line(
      points={{86,67.5},{86,90},{80,90}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWindingTransformer1.p, B3.p) annotation (Line(
      points={{113,90},{120,90}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B6.p, line_9_6.p) annotation (Line(
      points={{86,20},{86,46.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(line_5_7.p, B5.p) annotation (Line(
      points={{-72,42.5},{-72,20}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWindingTransformer.p, B1.p) annotation (Line(
      points={{0,-77},{0,-86}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B2.p, gen1.pwPin) annotation (Line(points={{-120,90},{-139,90}}, color={0,0,255}));
  connect(B2.p, twoWindingTransformer2.p) annotation (Line(points={{-120,90},{-110,90},{-113,90}}, color={0,0,255}));
  connect(twoWindingTransformer2.n, B7.p) annotation (Line(points={{-91,90},{-91,90},{-80,90}}, color={0,0,255}));
  connect(gen2.pwPin, B3.p) annotation (Line(points={{139,90},{129.5,90},{120,90}}, color={0,0,255}));
  connect(lOADPQ.p, B5.p) annotation (Line(points={{-99,-3.3},{-99,4},{-72,4},{-72,20}}, color={0,0,255}));
  connect(B4.p, twoWindingTransformer.n) annotation (Line(points={{0,-46},{0,-55}}, color={0,0,255}));
  connect(gen3.pwPin, B1.p) annotation (Line(points={{0,-93},{0,-86}}, color={0,0,255}));
  connect(B8.p, lOADPQ1.p) annotation (Line(points={{0,90},{6,90},{6,88},{7,88},{7,60.7}}, color={0,0,255}));
  connect(line_8_9.p, B9.p) annotation (Line(points={{49.5,90},{64,90},{80,90}}, color={0,0,255}));
  connect(B8.p, line_8_9.n) annotation (Line(points={{0,90},{14,90},{28.5,90}}, color={0,0,255}));
  connect(B5.p, line_4_5.p) annotation (Line(points={{-72,20},{-72,4},{-72,-10.5}}, color={0,0,255}));
  connect(B4.p, line_4_5.n) annotation (Line(points={{0,-46},{0,-42},{-72,-42},{-72,-31.5}}, color={0,0,255}));
  connect(B6.p, line_6_4.p) annotation (Line(points={{86,20},{86,6},{86,-10.5}}, color={0,0,255}));
  connect(B4.p, line_6_4.n) annotation (Line(points={{0,-46},{-2,-46},{-2,-42},{86,-42},{86,-31.5}}, color={0,0,255}));
  connect(B6.p, PQ1.p) annotation (Line(points={{86,20},{86,20},{86,2},{86,4},{109,4},{109,-5.3}}, color={0,0,255}));
  connect(B9.p, pwFault2.p) annotation (Line(points={{80,90},{57,90},{57,69.1667}}, color={0,0,255}));
  connect(B7.p, pwLine2Openings.p) annotation (Line(points={{-80,90},{-66,90},{-51.5,90}}, color={0,0,255}));
  connect(B8.p, pwLine2Openings.n) annotation (Line(points={{0,90},{-16,90},{-30.5,90}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-180,-120},{180,120}})),
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
</html>", revisions="<html>
<!--DISCLAIMER-->
<p>OpenIPSL:</p>
<p>Copyright 2016 SmarTS Lab (Sweden)</p>
<ul>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>

<p></p>
<p>iPSL:</p>
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
</html>
"),
    experiment(
      StopTime=20,
      Interval=0.001,
      Tolerance=1e-006,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Rkfix2"),
    __Dymola_experimentSetupOutput);
end Example_3;
