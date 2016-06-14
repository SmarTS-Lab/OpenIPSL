within iPSL.Examples.Machines.PSAT;
model Order2test2_perturbation
  iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ1(
    P_0=0.08,
    Q_0=0.06,
    V_0=1,
    angle_0=0) annotation (Placement(visible=true, transformation(
        origin={121.0667,-11.5778},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine1(
    X=0.1,
    R=0.01,
    G=0,
    B=0.001/2) annotation (Placement(visible=true, transformation(
        origin={37.7833,-31.5778},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Events.PwFault pwFault1(
    R=20,
    X=1,
    t1=10,
    t2=10.1) annotation (Placement(visible=true, transformation(
        origin={127.7833,-70.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLinewithOpeningReceiving pwLinewithOpening1(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1,
    t1=14,
    t2=14.1) annotation (Placement(visible=true, transformation(
        origin={82.7833,-21.5778},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine2(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={37.7833,-11.5778},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine3(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={82.7833,-42.7},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine4(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={82.7833,-6.5778},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ2(
    P_0=0.08,
    Q_0=0.06,
    V_0=1,
    angle_0=0) annotation (Placement(visible=true, transformation(
        origin={122.7833,-42.7},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Math.Add3 add31 annotation (Placement(visible=true, transformation(
        origin={-62.2167,17.6329},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Math.Add add1 annotation (Placement(visible=true, transformation(
        origin={-96.3229,38.3121},
        extent={{-6.3229,-6.3229},{6.3229,6.3229}},
        rotation=0)));
  Modelica.Blocks.Sources.Step step1(height=0.0005, startTime=2)
    annotation (Placement(visible=true, transformation(
        origin={-125.0,44.635},
        extent={{-5.0,-5.0},{5.0,5.0}},
        rotation=0)));
  Modelica.Blocks.Sources.Step step2(height=-0.0005, startTime=2.1)
    annotation (Placement(visible=true, transformation(
        origin={-125.0,29.635},
        extent={{-5.0,-5.0},{5.0,5.0}},
        rotation=0)));
  Modelica.Blocks.Sources.Sine sine1(amplitude=0.001, freqHz=0.2)
    annotation (Placement(visible=true, transformation(
        origin={-125.0,14.1152},
        extent={{-4.4802,-4.4802},{4.4802,4.4802}},
        rotation=0)));
  Modelica.Blocks.Math.Add add2(k2=-1) annotation (Placement(visible=true, transformation(
        origin={-96.3229,18.3121},
        extent={{-6.3229,-6.3229},{6.3229,6.3229}},
        rotation=0)));
  Modelica.Blocks.Sources.Sine sine2(
    amplitude=0.001,
    freqHz=0.2,
    startTime=5) annotation (Placement(visible=true, transformation(
        origin={-124.599,-1.8698},
        extent={{-4.4802,-4.4802},{4.4802,4.4802}},
        rotation=0)));
  Modelica.Blocks.Sources.Sine sine3(
    amplitude=0.001,
    freqHz=0.2,
    startTime=10) annotation (Placement(visible=true, transformation(
        origin={-124.599,-72.8548},
        extent={{-4.4802,-4.4802},{4.4802,4.4802}},
        rotation=0)));
  Modelica.Blocks.Math.Add add3(k2=-1) annotation (Placement(visible=true, transformation(
        origin={-96.3229,-52.6729},
        extent={{-6.3229,-6.3229},{6.3229,6.3229}},
        rotation=0)));
  Modelica.Blocks.Sources.Sine sine4(
    amplitude=0.001,
    freqHz=0.2,
    startTime=5) annotation (Placement(visible=true, transformation(
        origin={-125.0,-56.8698},
        extent={{-4.4802,-4.4802},{4.4802,4.4802}},
        rotation=0)));
  Modelica.Blocks.Sources.Step step3(height=-0.0005, startTime=7.1)
    annotation (Placement(visible=true, transformation(
        origin={-125.0,-41.35},
        extent={{-5.0,-5.0},{5.0,5.0}},
        rotation=0)));
  Modelica.Blocks.Sources.Step step4(height=0.0005, startTime=7)
    annotation (Placement(visible=true, transformation(
        origin={-125.0,-26.35},
        extent={{-5.0,-5.0},{5.0,5.0}},
        rotation=0)));
  Modelica.Blocks.Math.Add add4 annotation (Placement(visible=true, transformation(
        origin={-96.3229,-32.6729},
        extent={{-6.3229,-6.3229},{6.3229,6.3229}},
        rotation=0)));
  Modelica.Blocks.Math.Add3 add32 annotation (Placement(visible=true, transformation(
        origin={-62.2167,-53.3521},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Machines.PSAT.SecondOrder.Order2 order2_Inputs_Outputs1(
    D=0,
    V_b=400,
    V_0=1,
    angle_0=0,
    P_0=0.160352698692006,
    Q_0=0.11859436505981,
    Sn=20,
    Vn=400,
    ra=0.001,
    xd1=0.302,
    M=10) annotation (Placement(visible=true, transformation(
        origin={-7.2167,-18.6674},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  inner iPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{100,80},{135,100}})));
equation
  connect(step3.y, add4.u2)
    annotation (Line(
      visible=true,
      origin={-109.3078,-38.9083},
      points={{-10.1922,-2.4417},{2.3974,-2.4417},{2.3974,2.44166},{5.39742,2.44166}},
      color={0,0,127}));
  connect(add3.y, add32.u2) annotation (Line(
      visible=true,
      origin={-79.5045,-53.0125},
      points={{-9.86321,0.3396},{2.2878,0.3396},{2.2878,-0.3396},{5.2878,-0.3396}},
      color={0,0,127}));
  connect(step4.y, add4.u1)
    annotation (Line(
      visible=true,
      origin={-109.3078,-27.6146},
      points={{-10.1922,1.2646},{2.3974,1.2646},{2.3974,-1.26456},{5.39742,-1.26456}},
      color={0,0,127}));
  connect(add4.y, add32.u1) annotation (Line(
      visible=true,
      origin={-79.5045,-39.0125},
      points={{-9.86321,6.3396},{2.2878,6.3396},{2.2878,-6.3396},{5.2878,-6.3396}},
      color={0,0,127}));
  connect(add3.u2, sine3.y)
    annotation (Line(
      visible=true,
      origin={-112.8859,-65.5321},
      points={{8.97552,9.06546},{2.2971,9.06546},{2.2971,-5.4041},{-6.78488,-5.4041},{-6.78488,-7.3227}},
      color={0,0,127}));
  connect(sine4.y, add3.u1)
    annotation (Line(
      visible=true,
      origin={-110.7773,-51.8707},
      points={{-9.29448,-4.9991},{-1.4394,-0.9841},{3.8669,2.9916},{6.86692,2.99154}},
      color={0,0,127}));
  connect(sine1.y, add2.u1)
    annotation (Line(
      visible=true,
      origin={-110.7773,19.1143},
      points={{-9.29448,-4.9991},{-1.4394,-0.9841},{3.8669,2.9916},{6.86692,2.99154}},
      color={0,0,127}));
  connect(add2.u2, sine2.y)
    annotation (Line(
      visible=true,
      origin={-112.8859,5.4529},
      points={{8.97552,9.06546},{2.2971,9.06546},{2.2971,-5.4041},{-6.78488,-5.4041},{-6.78488,-7.3227}},
      color={0,0,127}));
  connect(step2.y, add1.u2)
    annotation (Line(
      visible=true,
      origin={-109.3078,32.0767},
      points={{-10.1922,-2.4417},{2.3974,-2.4417},{2.3974,2.44166},{5.39742,2.44166}},
      color={0,0,127}));
  connect(step1.y, add1.u1)
    annotation (Line(
      visible=true,
      origin={-109.3078,43.3704},
      points={{-10.1922,1.2646},{2.3974,1.2646},{2.3974,-1.26456},{5.39742,-1.26456}},
      color={0,0,127}));
  connect(add1.y, add31.u1) annotation (Line(
      visible=true,
      origin={-79.5045,31.9725},
      points={{-9.86321,6.3396},{2.2878,6.3396},{2.2878,-6.3396},{5.2878,-6.3396}},
      color={0,0,127}));
  connect(add2.y, add31.u2) annotation (Line(
      visible=true,
      origin={-79.5045,17.9725},
      points={{-9.86321,0.3396},{2.2878,0.3396},{2.2878,-0.3396},{5.2878,-0.3396}},
      color={0,0,127}));
  connect(pwFault1.p, pwLine3.n) annotation (Line(
      visible=true,
      origin={100.5333,-55.85},
      points={{15.5833,-14.15},{-4.75,-14.15},{-4.75,13.15},{-10.75,13.15}}));
  connect(pwLine3.n, pwLoadPQ2.p) annotation (Line(
      visible=true,
      origin={106.2833,-42.2},
      points={{-16.5,-0.5},{3.5,-0.5},{3.5,10.5},{16.5,10.5}}));
  connect(pwLine4.n, pwLoadPQ1.p) annotation (Line(
      visible=true,
      origin={104.9958,-8.5778},
      points={{-15.2125,2},{3.0709,2},{3.0709,8},{16.0709,8}}));
  connect(pwLinewithOpening1.n, pwLine4.n) annotation (Line(
      visible=true,
      origin={89.7833,-14.0778},
      points={{0.0,-7.5},{0.0,7.5}}));
  connect(pwLine4.p, pwLinewithOpening1.p) annotation (Line(
      visible=true,
      origin={75.7833,-14.0778},
      points={{-0.0,7.5},{-0.0,-7.5}}));
  connect(pwLine2.n, pwLine4.p) annotation (Line(
      visible=true,
      origin={65.0333,-9.0778},
      points={{-20.25,-2.5},{4.75,-2.5},{4.75,2.5},{10.75,2.5}}));
  connect(pwLine1.n, pwLine2.n) annotation (Line(
      visible=true,
      origin={44.7833,-21.5778},
      points={{0,-10},{0,10}}));
  connect(pwLine2.p, pwLine1.p) annotation (Line(
      visible=true,
      origin={30.7833,-21.5778},
      points={{-0.00000000000000355271,10},{-0.00000000000000355271,5},{-0.00000000000000710542,5},{-0.00000000000000710542,0.00000000000000355271},{-0.00000000000000355271,0.00000000000000355271},{-0.00000000000000355271,
          -10}}));
  connect(order2_Inputs_Outputs1.p, pwLine2.p) annotation (Line(
      visible=true,
      origin={21.0333,-15.1977},
      points={{-17.25,-3.42006},{3.75,-3.42006},{3.75,3.6199},{9.75,3.6199}}));
  connect(pwLine1.n, pwLine3.p) annotation (Line(
      visible=true,
      origin={65.0333,-37.1389},
      points={{-20.25,5.5611},{4.75,5.5611},{4.75,-5.5611},{10.75,-5.5611}}));
  connect(order2_Inputs_Outputs1.pm0, add32.u3)
    annotation (Line(
      visible=true,
      origin={-23.8167,-45.8774},
      points={{8.6,16.21},{36.6,16.21},{36.6,-25.4726},{-50.4,-25.4726},{-50.4,-15.4747}},
      color={0,0,127}));
  connect(order2_Inputs_Outputs1.vf0, add31.u3) annotation (Line(
      visible=true,
      origin={-34.4439,0.1797},
      points={{19.2272,-7.8471},{41.2272,-7.8471},{41.2272,0.3938},{-40.4545,0.3938},{-40.4545,9.4532},{-39.7728,9.4532}},
      color={0,0,127}));
  connect(add31.y, order2_Inputs_Outputs1.vf)
    annotation (Line(
      visible=true,
      origin={-34.8167,-1.2348},
      points={{-16.4,18.8677},{-7.4,18.8677},{-7.4,-12.6515},{17.6,-12.6515},{17.6,-12.4326}},
      color={0,0,127}));
  connect(add32.y, order2_Inputs_Outputs1.pm) annotation (Line(
      visible=true,
      origin={-44.2655,-33.481},
      points={{-6.9512,-19.8711},{-3.9512,-19.8711},{-3.9512,10.0574},{-5.0975,10.0574},{-5.0975,9.8136},{27.0488,9.8136}},
      color={0,0,127}));
  annotation (Diagram(coordinateSystem(
        extent={{-148.5,-105},{148.5,105}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={5,5})), Documentation(revisions="<html>
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
end Order2test2_perturbation;
