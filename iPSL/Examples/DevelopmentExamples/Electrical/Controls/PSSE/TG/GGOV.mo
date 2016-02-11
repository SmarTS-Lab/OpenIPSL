within iPSL.Examples.DevelopmentExamples.Electrical.Controls.PSSE.TG;
model GGOV "three phase to ground fault test of GGOV"
  iPSL.Electrical.Machines.PSSE.GENROU.GENROU generator(
    Xppd=0.2,
    Xppq=0.2,
    Xpp=0.2,
    Xl=0.12,
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
    Tpq0=0.7,
    V_0=1,
    angle_0=4.05,
    P_0=39.99995,
    Q_0=5.416571) annotation (Placement(transformation(extent={{-84,-4},{-44,30}})));
  iPSL.Electrical.Branches.PwLine pwLine(
    R=0.001,
    X=0.2,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-40,2},{-20,22}})));
  iPSL.Electrical.Branches.PwLine pwLine1(
    R=0.001,
    X=0.2,
    G=0,
    B=0) annotation (Placement(transformation(extent={{2,8},{22,28}})));
  iPSL.Electrical.Machines.PSSE.GENCLS.GENCLS gENCLS(
    X_d=0.2,
    P_0=10.01716,
    Q_0=8.006525,
    H=0,
    D=0,
    M_b=100,
    V_0=1,
    angle_0=0) annotation (Placement(transformation(extent={{84,-6},{62,16}})));
  iPSL.Electrical.Controls.PSSE.TG.GGOV1.GGOV1 gGOV1pele(
    R=0.04,
    T_pelec=1,
    maxerr=0.05,
    minerr=-0.05,
    Kpgov=10,
    Kigov=2,
    Kdgov=0,
    Tdgov=1,
    Vmax=1,
    Vmin=0.15,
    Tact=0.5,
    Kturb=1.5,
    Wfnl=0.2,
    Tb=0.1,
    Tc=0,
    Teng=0,
    Tfload=3,
    Kpload=2,
    Kiload=0.67,
    Ldref=1,
    Dm=0,
    Ropen=0.1,
    Rclose=-0.1,
    Kimw=0,
    Aset=0.1,
    Ka=10,
    Ta=0.1,
    Trate=0,
    db=0,
    Tsa=4,
    Tsb=5,
    Rup=99,
    Rdown=-99,
    DELT=0.005,
    Flag=0) annotation (Placement(transformation(
        extent={{-20,-18},{20,18}},
        rotation=180,
        origin={-52,52})));
  iPSL.Electrical.Branches.PwLine2Openings pwLine3(
    t2=100,
    t1=10.15 - 0.005,
    R=0.0005,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-6,-16},{14,4}})));
  iPSL.Electrical.Branches.PwLine2Openings pwLine4(
    t2=100,
    t1=10.15 - 0.005,
    R=0.0005,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{20,-16},{40,4}})));
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
    t1=2 - 0.005) annotation (Placement(transformation(extent={{-8,-28},{-28,-6}})));
  iPSL.Electrical.Events.PwFault pwFault(
    R=0,
    X=-2e-9,
    t1=10 - 0.005,
    t2=10.15 - 0.005) annotation (Placement(transformation(extent={{34,-26},{54,-6}})));
equation
  connect(generator.p, pwLine.p) annotation (Line(
      points={{-42,13},{-50.6,13},{-50.6,12},{-37,12}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine.n, pwLine1.p) annotation (Line(
      points={{-23,12},{-16.5,12},{-16.5,18},{5,18}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1.n, gENCLS.p) annotation (Line(
      points={{19,18},{52,18},{52,4.8346},{59.8,4.8346}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gGOV1pele.PELEC, generator.PELEC) annotation (Line(
      points={{-27.2414,60.5304},{-18,60.5304},{-18,4.5},{-42.4,4.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(generator.EFD0, generator.EFD) annotation (Line(
      points={{-42.4,1.1},{-36,1.1},{-36,-18},{-86,-18},{-86,4.5},{-83.6,4.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pwLine3.p, pwLine.n) annotation (Line(
      points={{-3,-6},{-17.5,-6},{-17.5,12},{-23,12}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.n, pwLine4.p) annotation (Line(
      points={{11,-6},{23,-6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine4.n, gENCLS.p) annotation (Line(
      points={{37,-6},{52,-6},{52,4.8346},{59.8,4.8346}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(constantLoad.p, pwLine3.p) annotation (Line(
      points={{-18,-4.9},{-18,-15.5},{-3,-15.5},{-3,-6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwFault.p, pwLine4.p) annotation (Line(
      points={{32.3333,-16},{23,-16},{23,-6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gGOV1pele.PMECH, generator.PMECH) annotation (Line(points={{-68.5517,52.7826},{-90,52.7826},{-90,21.5},{-83.6,21.5}}, color={0,0,127}));
  connect(generator.SPEED, gGOV1pele.SPEED) annotation (Line(points={{-42.4,28.3},{-24,28.3},{-24,43.3913},{-27.3103,43.3913}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})), Documentation(revisions="<html>
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
end GGOV;
