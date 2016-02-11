within iPSL.Examples.DevelopmentExamples.Electrical.Controls.PSSE.ES;
model ESST4B "SMIB model example of GENROU with Excitation System ESST4B"
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
    Tpq0=0.7) annotation (Placement(transformation(extent={{-82,-4},{-54,30}})));
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
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=0,
        origin={-60,-40})));
  Modelica.Blocks.Sources.Constant const2(k=0) annotation (Placement(transformation(extent={{-110,166},{-94,182}})));
  Modelica.Blocks.Sources.Constant const5(k=0) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-59,-25})));
  iPSL.Electrical.Controls.PSSE.ES.ESST4B.ESST4B eSST4B annotation (Placement(transformation(
        extent={{-16,-11},{16,11}},
        rotation=0,
        origin={-24,5})));
initial equation
  eSST4B.Vr0 = generator.vr0;
  eSST4B.Vi0 = generator.vi0;
  eSST4B.Ir0 = generator.ir0;
  eSST4B.Ii0 = generator.ii0;
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
  connect(generator.p, eSST4B.Gen_terminal) annotation (Line(
      points={{-52.6,13},{-48.7,13},{-48.7,8.3},{-38.8364,8.3}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(eSST4B.Bus, pwLine.p) annotation (Line(
      points={{-17.1636,8.3},{-9.63635,8.3},{-9.63635,14},{-5,14}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const.y, eSST4B.VOTHSG) annotation (Line(
      points={{-55.6,-40},{-48,-40},{-48,5.89375},{-41.3818,5.89375}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(generator.EFD0, eSST4B.EFD0) annotation (Line(
      points={{-52.88,1.1},{-52,1.1},{-52,-6.06875},{-41.5273,-6.06875}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const5.y, eSST4B.VUEL) annotation (Line(
      points={{-53.5,-25},{-46,-25},{-46,-0.15625},{-41.5273,-0.15625}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(generator.PMECH0, generator.PMECH) annotation (Line(
      points={{-52.88,7.9},{-52,7.9},{-52,34},{-84,34},{-84,21.5},{-81.72,21.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(eSST4B.EFD, generator.EFD) annotation (Line(
      points={{-15.2727,-1.1875},{-10,-1.1875},{-10,-12},{-86,-12},{-86,4.5},{-81.72,4.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(generator.XADIFD, eSST4B.XADIFD) annotation (Line(
      points={{-52.88,-2.3},{-52.88,-8},{-56,-8},{-56,-3.04375},{-41.3818,-3.04375}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(generator.PELEC, eSST4B.ECOMP) annotation (Line(
      points={{-52.88,4.5},{-50,4.5},{-50,2.59375},{-41.3818,2.59375}},
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
end ESST4B;
