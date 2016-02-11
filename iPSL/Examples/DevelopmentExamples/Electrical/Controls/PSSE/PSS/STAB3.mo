within iPSL.Examples.DevelopmentExamples.Electrical.Controls.PSSE.PSS;
model STAB3 "Simple Machine Infinite Bus with Machine, Governor and Excitation system"
  iPSL.Electrical.Machines.PSSE.GENSAL.GENSAL generator(
    Xppd=0.2,
    Xppq=0.2,
    Xl=0.12,
    V_0=1,
    angle_0=4.05,
    P_0=39.99995,
    Q_0=5.416571,
    M_b=100,
    Tpd0=6.7000,
    Tppd0=0.28000E-01,
    Tppq0=0.35000E-01,
    H=4.4100,
    D=0,
    Xd=1.2200,
    Xq=0.76000,
    Xpd=0.29700,
    S10=0.18600,
    S12=0.802) annotation (Placement(transformation(extent={{-78,-2},{-50,24}})));
  iPSL.Electrical.Branches.PwLine2Openings pwLine(
    t1=100,
    t2=100,
    R=0.001,
    X=0.2,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-34,0},{-14,20}})));
  iPSL.Electrical.Branches.PwLine2Openings pwLine1(
    t1=100,
    t2=100,
    R=0.001,
    X=0.2,
    G=0,
    B=0) annotation (Placement(transformation(extent={{10,14},{30,34}})));
  iPSL.Electrical.Branches.PwLine2Openings pwLine3(
    t2=100,
    t1=100,
    R=0.0005,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-6,-20},{14,0}})));
  iPSL.Electrical.Branches.PwLine2Openings pwLine4(
    t2=100,
    t1=100,
    R=0.0005,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{20,-20},{40,0}})));
  iPSL.Electrical.Machines.PSSE.GENCLS.GENCLS gENCLS(
    X_d=0.2,
    P_0=10.01716,
    Q_0=8.006525,
    V_0=1,
    H=0,
    D=0,
    angle_0=-3.00563e-7,
    M_b=100) annotation (Placement(transformation(extent={{92,-10},{70,12}})));
  iPSL.Electrical.Loads.PSSE.Load_variation constantLoad(
    angle_0=-0.57627,
    S_p(re=0.5, im=0.1),
    S_i(im=0, re=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    PQBRAK=0.7,
    V_0=0.991992,
    t1=2,
    d_P=5*0.01,
    d_t=0) annotation (Placement(transformation(extent={{0,-40},{24,-16}})));
  iPSL.Electrical.Controls.PSSE.TG.HYGOV HYGOV(VELM=0.02, G_MAX=0.415) annotation (Placement(transformation(
        extent={{-19,-14},{19,14}},
        rotation=180,
        origin={-55,40})));
  iPSL.Electrical.Controls.PSSE.ES.SCRX.SCRX SCRX(
    V_0=1,
    V_c0=1,
    T_AT_B=0.01,
    T_B=10,
    K=100,
    T_E=0.05,
    E_MIN=0,
    E_MAX=5,
    r_cr_fd=0,
    C_SWITCH=false) annotation (Placement(transformation(
        extent={{-18,-16},{18,16}},
        rotation=180,
        origin={-66,-26})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(
        extent={{-2,-2},{2,2}},
        rotation=180,
        origin={-40,-24})));
  iPSL.Electrical.Events.PwFault pwFault(
    R=0,
    t1=2,
    t2=2.15,
    X=-0.5) annotation (Placement(transformation(extent={{-32,-12},{-12,8}})));
equation
  connect(generator.p, pwLine.p) annotation (Line(
      points={{-48.6,11},{-50.6,11},{-50.6,10},{-31,10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine.n, pwLine1.p) annotation (Line(
      points={{-17,10},{-8.5,10},{-8.5,24},{13,24}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1.n, gENCLS.p) annotation (Line(
      points={{27,24},{58,24},{58,0.834604},{67.8,0.834604}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.p, pwLine.n) annotation (Line(
      points={{-3,-10},{-9.5,-10},{-9.5,10},{-17,10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.n, pwLine4.p) annotation (Line(
      points={{11,-10},{23,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine4.n, gENCLS.p) annotation (Line(
      points={{37,-10},{58,-10},{58,0.834604},{67.8,0.834604}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(constantLoad.p, pwLine3.p) annotation (Line(
      points={{12,-14.8},{12,-27.5},{-3,-27.5},{-3,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(SCRX.VUEL, const.y) annotation (Line(
      points={{-48.15,-21.04},{-43.67,-21.04},{-43.67,-24},{-42.2,-24}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(SCRX.VOEL, const.y) annotation (Line(
      points={{-48.15,-25.2},{-43.67,-25.2},{-43.67,-24},{-42.2,-24}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pwFault.p, pwLine.p) annotation (Line(
      points={{-33.6667,-2},{-33.6667,0.5},{-31,0.5},{-31,10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(generator.EFD0, SCRX.EFD0) annotation (Line(
      points={{-48.88,1.9},{-46,1.9},{-46,-6.64},{-48.15,-6.64}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(generator.XADIFD, SCRX.XADIFD) annotation (Line(points={{-48.88,-0.7},{-42,-0.7},{-42,-17.52},{-47.85,-17.52}}, color={0,0,127}));
  connect(SCRX.ECOMP, generator.ETERM) annotation (Line(points={{-48.15,-33.52},{-38,-33.52},{-38,17.5},{-48.88,17.5}}, color={0,0,127}));
  connect(generator.SPEED, HYGOV.SPEED) annotation (Line(points={{-48.88,22.7},{-30,22.7},{-30,33},{-36.475,33}}, color={0,0,127}));
  connect(generator.PMECH0, HYGOV.PMECH0) annotation (Line(points={{-48.88,7.1},{-36,7.1},{-36,20},{-20,20},{-20,47},{-36.475,47}}, color={0,0,127}));
  connect(HYGOV.PMECH, generator.PMECH) annotation (Line(points={{-74.95,40},{-84,40},{-84,17.5},{-77.72,17.5}}, color={0,0,127}));
  connect(generator.EFD, SCRX.EFD) annotation (Line(points={{-77.72,4.5},{-88,4.5},{-88,-19.76},{-84.6,-19.76}}, color={0,0,127}));
  connect(SCRX.VOTHSG, const.y) annotation (Line(points={{-48.15,-29.04},{-46,-29.04},{-46,-26},{-43.67,-25.2},{-43.67,-24},{-42.2,-24}}, color={0,0,127}));
  connect(SCRX.ETERM, generator.ETERM) annotation (Line(points={{-47.85,-12.24},{-38,-12},{-38,17.5},{-48.88,17.5}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-120},{100,80}})),
    Icon(coordinateSystem(extent={{-100,-120},{100,80}})),
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
end STAB3;
