within iPSL.Examples.DevelopmentExamples.Electrical.Controls.PSSE.ES;
model URST5T "SMIB model example of GENROU with Excitation System URST5T"
  iPSL.Electrical.Machines.PSSE.GENROU.GENROU generator(
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
    Tpq0=0.7) annotation (Placement(transformation(extent={{-90,-4},{-62,30}})));
  iPSL.Electrical.Branches.PwLine pwLine(
    R=0.001,
    X=0.2,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-8,4},{12,24}})));
  iPSL.Electrical.Branches.PwLine pwLine1(
    R=0.001,
    X=0.2,
    G=0,
    B=0) annotation (Placement(transformation(extent={{34,10},{54,30}})));
  iPSL.Electrical.Branches.PwLine2Openings pwLine3(
    t2=100,
    t1=10.15 - 0.005,
    R=0.0005,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{26,-4},{46,16}})));
  iPSL.Electrical.Branches.PwLine2Openings pwLine4(
    t2=100,
    t1=10.15 - 0.005,
    R=0.0005,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{52,-4},{72,16}})));
  iPSL.Electrical.Machines.PSSE.GENCLS.GENCLS gENCLS(
    X_d=0.2,
    P_0=10.01716,
    Q_0=8.006525,
    H=0,
    D=0,
    M_b=100,
    V_0=1,
    angle_0=0) annotation (Placement(transformation(extent={{116,-4},{94,18}})));
  iPSL.Electrical.Loads.PSSE.Load_variation constantLoad(
    angle_0=-0.57627,
    S_p(re=0.5, im=0.1),
    S_i(im=0, re=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    PQBRAK=0.7,
    V_0=0.991992,
    d_P=5*0.01,
    d_t=0.1,
    t1=2 - 0.005) annotation (Placement(transformation(extent={{26,-14},{6,8}})));
  iPSL.Electrical.Events.PwFault pwFault(
    R=0,
    X=-2e-9,
    t1=10 - 0.005,
    t2=10.15 - 0.005) annotation (Placement(transformation(extent={{66,-14},{86,6}})));
  Modelica.Blocks.Sources.Constant const2(k=0) annotation (Placement(transformation(extent={{-110,166},{-94,182}})));
  Modelica.Blocks.Sources.Constant VOEL(k=1000) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-73,-55})));
  iPSL.Electrical.Controls.PSSE.ES.URST5T.URST5T uRST5T annotation (Placement(transformation(extent={{-42,-16},{2,10}})));
  Modelica.Blocks.Sources.Constant VUEL(k=-1000) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-59,-69})));
  Modelica.Blocks.Sources.Constant VOTHSG(k=0) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-59,-43})));
  Modelica.Blocks.Sources.Constant VREF(k=0) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-69,-21})));
equation
  connect(pwLine.n, pwLine1.p) annotation (Line(
      points={{9,14},{15.5,14},{15.5,20},{37,20}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1.n, gENCLS.p) annotation (Line(
      points={{51,20},{84,20},{84,6.8346},{91.8,6.8346}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.p, pwLine.n) annotation (Line(
      points={{29,6},{14.5,6},{14.5,14},{9,14}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.n, pwLine4.p) annotation (Line(
      points={{43,6},{55,6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine4.n, gENCLS.p) annotation (Line(
      points={{69,6},{84,6},{84,6.8346},{91.8,6.8346}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(constantLoad.p, pwLine3.p) annotation (Line(
      points={{16,9.1},{16,-3.5},{29,-3.5},{29,6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwFault.p, pwLine4.p) annotation (Line(
      points={{64.3333,-4},{55,-4},{55,6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(generator.p, pwLine.p) annotation (Line(
      points={{-60.6,13},{-30.7,13},{-30.7,14},{-5,14}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(VUEL.y, uRST5T.VUEL) annotation (Line(
      points={{-53.5,-69},{-44.25,-69},{-44.25,1.95625},{-41.2667,1.95625}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VOEL.y, uRST5T.VOEL) annotation (Line(
      points={{-67.5,-55},{-46,-55},{-46,-1.45625},{-41.2667,-1.45625}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VOTHSG.y, uRST5T.VOTHSG) annotation (Line(
      points={{-53.5,-43},{-48,-43},{-48,-5.51875},{-41.9185,-5.51875}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(generator.XADIFD, uRST5T.XADIFD) annotation (Line(
      points={{-60.88,-2.3},{-60.88,-10.0688},{-41.2667,-10.0688}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(generator.EFD0, uRST5T.EFD0) annotation (Line(
      points={{-60.88,1.1},{-50,1.1},{-50,-14.2938},{-41.2667,-14.2938}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(generator.PMECH0, generator.PMECH) annotation (Line(
      points={{-60.88,7.9},{-56,7.9},{-56,34},{-90,34},{-90,21.5},{-89.72,21.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(generator.PELEC, uRST5T.ECOMP) annotation (Line(
      points={{-60.88,4.5},{-52,4.5},{-52,8.29375},{-41.2667,8.29375}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(uRST5T.EFD, generator.EFD) annotation (Line(
      points={{2,-2.1875},{0,-2.1875},{0,-32},{-90,-32},{-90,4.5},{-89.72,4.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VREF.y, uRST5T.V_REF) annotation (Line(
      points={{-63.5,-21},{-52,-21},{-52,5.04375},{-41.2667,5.04375}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics), Documentation(revisions="<html>
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
end URST5T;
