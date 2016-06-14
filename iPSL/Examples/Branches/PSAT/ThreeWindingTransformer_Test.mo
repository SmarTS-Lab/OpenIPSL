within iPSL.Examples.Branches.PSAT;


model ThreeWindingTransformer_Test
  iPSL.Electrical.Branches.PwLine pwLine3(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={40,0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine4(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={40,20},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Sources.Sine sine1(amplitude=0.001, freqHz=0.2)
    annotation (Placement(visible=true, transformation(
        origin={-107.783,15.4652},
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
  iPSL.Electrical.Machines.PSAT.SecondOrder.Order2 Gen1(
    Sn=370,
    D=5,
    P_0=0.080124489663871,
    Q_0=0.059251697676828,
    V_b=400,
    V_0=1,
    angle_0=0,
    Vn=400,
    ra=0.001,
    xd1=0.302,
    M=10) annotation (Placement(transformation(extent={{-20,0},{0,20}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
  iPSL.Electrical.Loads.PSAT.LOADPQ_variation lOADPQ(
    t1=5,
    t2=8,
    t3=8,
    t4=12,
    P2=0,
    P3=0,
    P_0=0.04,
    Q_0=0.02,
    Q2=0.01,
    Q3=-0.01) annotation (Placement(transformation(extent={{115,15},{135,35}})));
  iPSL.Electrical.Loads.PSAT.LOADPQ_variation lOADPQ1(
    P_0=0.04,
    Q_0=0.04,
    t1=0,
    t2=0,
    t3=0,
    t4=0,
    P2=0,
    Q2=0,
    P3=0,
    Q3=0) annotation (Placement(transformation(extent={{115,-20},{135,0}})));
  iPSL.Electrical.Branches.PSAT.ThreeWindingTransformer.ThreeWindingTransformer threeWindingTransformer annotation (Placement(transformation(extent={{70,0},{90,20}})));
  iPSL.Electrical.Buses.Bus Bus1 annotation (Placement(transformation(extent={{10,0},{30,20}})));
  iPSL.Electrical.Buses.Bus Bus2 annotation (Placement(transformation(extent={{50,0},{70,20}})));
  iPSL.Electrical.Buses.Bus Bus3 annotation (Placement(transformation(extent={{95,15},{115,35}})));
  iPSL.Electrical.Buses.Bus Bus4 annotation (Placement(transformation(extent={{95,-20},{115,0}})));
  inner iPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{-50,50},{-5,70}})));
equation
  connect(sine1.y, add2.u1)
    annotation (Line(
      visible=true,
      origin={-93.5606,15.4643},
      points={{-9.29418,0.0009},{-1.4394,0.0009},{6.86692,0.0009},{6.86692,2.99154}},
      color={0,0,127}));
  connect(add2.u2, sine2.y)
    annotation (Line(
      visible=true,
      origin={-95.6692,1.8029},
      points={{8.97552,9.06546},{2.2971,9.06546},{2.2971,-5.4041},{-6.78488,-5.4041},{-6.78488,-7.3227}},
      color={0,0,127}));
  connect(add2.y, add.u1) annotation (Line(
      points={{-72.151,14.6621},{-66.0755,14.6621},{-66.0755,16},{-62,16}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add.y, Gen1.vf) annotation (Line(
      points={{-39,10},{-30,10},{-30,15},{-20,15}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen1.vf0, add.u2) annotation (Line(
      points={{-18,21},{5,21},{5,-15},{-70,-15},{-70,4},{-62,4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen1.pm0, Gen1.pm) annotation (Line(
      points={{-18,-1},{15,-1},{15,-30},{-30,-30},{-30,5},{-20,5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pwLine4.n, pwLine3.n) annotation (Line(
      points={{47,20},{55,20},{55,0},{47,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine4.p, pwLine3.p) annotation (Line(
      points={{33,20},{25,20},{25,0},{33,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Gen1.p, Bus1.p) annotation (Line(
      points={{1,10.0496},{10.5,10.0496},{10.5,10},{20,10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Bus1.p, pwLine3.p) annotation (Line(
      points={{20,10},{25,10},{25,0},{33,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Bus2.p, pwLine3.n) annotation (Line(
      points={{60,10},{55,10},{55,0},{47,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Bus2.p, threeWindingTransformer.b1) annotation (Line(
      points={{60,10},{69,10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(threeWindingTransformer.b2, Bus3.p) annotation (Line(
      points={{91,13},{95,13},{95,25},{105,25}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(lOADPQ.p, Bus3.p) annotation (Line(
      points={{125,36},{115,36},{115,25},{105,25}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(threeWindingTransformer.b3, Bus4.p) annotation (Line(
      points={{91,7},{95,7},{95,-10},{105,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Bus4.p, lOADPQ1.p) annotation (Line(
      points={{105,-10},{115,-10},{115,1},{125,1}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(
        extent={{-148.5,-105},{148.5,105}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={5,5}), graphics), Documentation(info="<html>
<table cellspacing=\"2\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>KTH own Model, PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>29/09/2015</p></td>
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
end ThreeWindingTransformer_Test;
