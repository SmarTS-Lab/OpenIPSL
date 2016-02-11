within iPSL.Examples.DevelopmentExamples.Electrical.Machines.PSAT;
model Order4test2_perturbation
  iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ1(
    P_0=0.08,
    Q_0=0.06,
    V_0=1,
    angle_0=0) annotation (Placement(visible=true, transformation(
        origin={123.1468,-15.6714},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine1(
    X=0.1,
    R=0.01,
    G=0,
    B=0.001/2) annotation (Placement(visible=true, transformation(
        origin={39.8634,-35.6714},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Events.PwFault pwFault1(
    R=20,
    X=1,
    t1=10,
    t2=10.1) annotation (Placement(visible=true, transformation(
        origin={132.5,-77.3},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLinewithOpeningReceiving pwLinewithOpening1(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1,
    t1=14,
    t2=14.1) annotation (Placement(visible=true, transformation(
        origin={84.8634,-25.6714},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine2(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={39.8634,-15.6714},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine3(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={87.5,-50.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine4(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={84.8634,-10.6714},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ2(
    P_0=0.08,
    Q_0=0.06,
    V_0=1,
    angle_0=0) annotation (Placement(visible=true, transformation(
        origin={127.5,-50.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Math.Add3 add31 annotation (Placement(visible=true, transformation(
        origin={-45.0,13.9829},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Math.Add add1 annotation (Placement(visible=true, transformation(
        origin={-79.1062,34.6621},
        extent={{-6.3229,-6.3229},{6.3229,6.3229}},
        rotation=0)));
  Modelica.Blocks.Sources.Step step1(height=0.0005, startTime=2)
    annotation (Placement(visible=true, transformation(
        origin={-107.7833,40.985},
        extent={{-5.0,-5.0},{5.0,5.0}},
        rotation=0)));
  Modelica.Blocks.Sources.Step step2(height=-0.0005, startTime=2.1)
    annotation (Placement(visible=true, transformation(
        origin={-107.7833,25.985},
        extent={{-5.0,-5.0},{5.0,5.0}},
        rotation=0)));
  Modelica.Blocks.Sources.Sine sine1(amplitude=0.001, freqHz=0.2)
    annotation (Placement(visible=true, transformation(
        origin={-107.7833,10.4652},
        extent={{-4.4802,-4.4802},{4.4802,4.4802}},
        rotation=0)));
  Modelica.Blocks.Math.Add add2(k2=-1) annotation (Placement(visible=true, transformation(
        origin={-79.1062,14.6621},
        extent={{-6.3229,-6.3229},{6.3229,6.3229}},
        rotation=0)));
  Modelica.Blocks.Sources.Sine sine2(
    amplitude=0.001,
    freqHz=0.2,
    startTime=5) annotation (Placement(visible=true, transformation(
        origin={-107.3823,-5.5198},
        extent={{-4.4802,-4.4802},{4.4802,4.4802}},
        rotation=0)));
  Modelica.Blocks.Sources.Sine sine3(
    amplitude=0.001,
    freqHz=0.2,
    startTime=10) annotation (Placement(visible=true, transformation(
        origin={-107.3823,-76.5048},
        extent={{-4.4802,-4.4802},{4.4802,4.4802}},
        rotation=0)));
  Modelica.Blocks.Math.Add add3(k2=-1) annotation (Placement(visible=true, transformation(
        origin={-79.1062,-56.3229},
        extent={{-6.3229,-6.3229},{6.3229,6.3229}},
        rotation=0)));
  Modelica.Blocks.Sources.Sine sine4(
    amplitude=0.001,
    freqHz=0.2,
    startTime=5) annotation (Placement(visible=true, transformation(
        origin={-107.7833,-60.5198},
        extent={{-4.4802,-4.4802},{4.4802,4.4802}},
        rotation=0)));
  Modelica.Blocks.Sources.Step step3(height=-0.0005, startTime=7.1)
    annotation (Placement(visible=true, transformation(
        origin={-107.7833,-45.0},
        extent={{-5.0,-5.0},{5.0,5.0}},
        rotation=0)));
  Modelica.Blocks.Sources.Step step4(height=0.0005, startTime=7)
    annotation (Placement(visible=true, transformation(
        origin={-107.7833,-30.0},
        extent={{-5.0,-5.0},{5.0,5.0}},
        rotation=0)));
  Modelica.Blocks.Math.Add add4 annotation (Placement(visible=true, transformation(
        origin={-79.1062,-36.3229},
        extent={{-6.3229,-6.3229},{6.3229,6.3229}},
        rotation=0)));
  Modelica.Blocks.Math.Add3 add32 annotation (Placement(visible=true, transformation(
        origin={-45.0,-57.0021},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Machines.PSAT.FourthOrder.Order4 order4_Inputs_Outputs(
    V_b=200,
    V_0=1,
    angle_0=0,
    P_0=0.160352698692006,
    Q_0=0.11859436505981,
    ra=0.001,
    xd1=0.302,
    M=10,
    D=0,
    Sn=370,
    Vn=200) annotation (Placement(transformation(extent={{-15,-25},{5,-5}})));
  inner iPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{50,80},{75,100}})));
equation
  connect(step3.y, add4.u2)
    annotation (Line(
      visible=true,
      origin={-92.0911,-42.5583},
      points={{-10.1922,-2.4417},{2.3974,-2.4417},{2.3974,2.44166},{5.39742,2.44166}},
      color={0,0,127}));
  connect(add3.y, add32.u2) annotation (Line(
      visible=true,
      origin={-62.2878,-56.6625},
      points={{-9.86321,0.3396},{2.2878,0.3396},{2.2878,-0.3396},{5.2878,-0.3396}},
      color={0,0,127}));
  connect(step4.y, add4.u1)
    annotation (Line(
      visible=true,
      origin={-92.0911,-31.2646},
      points={{-10.1922,1.2646},{2.3974,1.2646},{2.3974,-1.26456},{5.39742,-1.26456}},
      color={0,0,127}));
  connect(add4.y, add32.u1) annotation (Line(
      visible=true,
      origin={-62.2878,-42.6625},
      points={{-9.86321,6.3396},{2.2878,6.3396},{2.2878,-6.3396},{5.2878,-6.3396}},
      color={0,0,127}));
  connect(add3.u2, sine3.y)
    annotation (Line(
      visible=true,
      origin={-95.6692,-69.1821},
      points={{8.97552,9.06546},{2.2971,9.06546},{2.2971,-5.4041},{-6.78488,-5.4041},{-6.78488,-7.3227}},
      color={0,0,127}));
  connect(sine4.y, add3.u1)
    annotation (Line(
      visible=true,
      origin={-93.5606,-55.5207},
      points={{-9.29448,-4.9991},{-1.4394,-0.9841},{3.8669,2.9916},{6.86692,2.99154}},
      color={0,0,127}));
  connect(sine1.y, add2.u1)
    annotation (Line(
      visible=true,
      origin={-93.5606,15.4643},
      points={{-9.29448,-4.9991},{-1.4394,-0.9841},{3.8669,2.9916},{6.86692,2.99154}},
      color={0,0,127}));
  connect(add2.u2, sine2.y)
    annotation (Line(
      visible=true,
      origin={-95.6692,1.8029},
      points={{8.97552,9.06546},{2.2971,9.06546},{2.2971,-5.4041},{-6.78488,-5.4041},{-6.78488,-7.3227}},
      color={0,0,127}));
  connect(step2.y, add1.u2)
    annotation (Line(
      visible=true,
      origin={-92.0911,28.4267},
      points={{-10.1922,-2.4417},{2.3974,-2.4417},{2.3974,2.44166},{5.39742,2.44166}},
      color={0,0,127}));
  connect(step1.y, add1.u1)
    annotation (Line(
      visible=true,
      origin={-92.0911,39.7204},
      points={{-10.1922,1.2646},{2.3974,1.2646},{2.3974,-1.26456},{5.39742,-1.26456}},
      color={0,0,127}));
  connect(add1.y, add31.u1) annotation (Line(
      visible=true,
      origin={-62.2878,28.3225},
      points={{-9.86321,6.3396},{2.2878,6.3396},{2.2878,-6.3396},{5.2878,-6.3396}},
      color={0,0,127}));
  connect(add2.y, add31.u2) annotation (Line(
      visible=true,
      origin={-62.2878,14.3225},
      points={{-9.86321,0.3396},{2.2878,0.3396},{2.2878,-0.3396},{5.2878,-0.3396}},
      color={0,0,127}));
  connect(pwLine1.n, pwLine3.p) annotation (Line(
      visible=true,
      origin={69.0909,-42.8357},
      points={{-22.2275,7.1643},{5.4091,7.1643},{5.4091,-7.1643},{11.4091,-7.1643}}));
  connect(pwFault1.p, pwLine3.n) annotation (Line(
      visible=true,
      origin={105.25,-63.15},
      points={{15.5833,-14.15},{-4.75,-14.15},{-4.75,13.15},{-10.75,13.15}}));
  connect(pwLine3.n, pwLoadPQ2.p) annotation (Line(
      visible=true,
      origin={111.0,-49.5},
      points={{-16.5,-0.5},{3.5,-0.5},{3.5,10.5},{16.5,10.5}}));
  connect(pwLine4.n, pwLoadPQ1.p) annotation (Line(
      visible=true,
      origin={107.0759,-12.6714},
      points={{-15.2125,2},{3.0709,2},{3.0709,8},{16.0709,8}}));
  connect(pwLinewithOpening1.n, pwLine4.n) annotation (Line(
      visible=true,
      origin={91.8634,-18.1714},
      points={{0.0,-7.5},{0.0,7.5}}));
  connect(pwLine4.p, pwLinewithOpening1.p) annotation (Line(
      visible=true,
      origin={77.8634,-18.1714},
      points={{0.0,7.5},{0.0,-7.5}}));
  connect(pwLine2.n, pwLine4.p) annotation (Line(
      visible=true,
      origin={67.1134,-13.1714},
      points={{-20.25,-2.5},{4.75,-2.5},{4.75,2.5},{10.75,2.5}}));
  connect(pwLine1.n, pwLine2.n) annotation (Line(
      visible=true,
      origin={46.8634,-25.6714},
      points={{-0.0,-10.0},{-0.0,10.0}}));
  connect(pwLine2.p, pwLine1.p) annotation (Line(
      visible=true,
      origin={32.8634,-25.6714},
      points={{0.0,10.0},{0.0,-10.0}}));
  connect(order4_Inputs_Outputs.p, pwLine2.p) annotation (Line(
      points={{6,-14.9504},{20.5,-14.9504},{20.5,-15.6714},{32.8634,-15.6714}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(order4_Inputs_Outputs.vf0, add31.u3) annotation (Line(
      points={{-13,-4},{10,-4},{10,0},{-65,0},{-65,5.9829},{-57,5.9829}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(order4_Inputs_Outputs.pm0, add32.u3) annotation (Line(
      points={{-13,-26},{10,-26},{10,-75},{-65,-75},{-65,-65.0021},{-57,-65.0021}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add32.y, order4_Inputs_Outputs.pm) annotation (Line(
      points={{-34,-57.0021},{-30,-57.0021},{-30,-20},{-15,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add31.y, order4_Inputs_Outputs.vf) annotation (Line(
      points={{-34,13.9829},{-30,13.9829},{-30,-10},{-15,-10}},
      color={0,0,127},
      smooth=Smooth.None));
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
end Order4test2_perturbation;
