within iPSL.Examples.DevelopmentExamples.Electrical.Controls.PSSE.ES;
model ESST1A "SMIB system with one load and GENROE model"
  import iPSL;
  iPSL.Electrical.Branches.PwLine pwLine(
    R=0.001,
    X=0.2,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-26,0},{-6,20}})));
  iPSL.Electrical.Branches.PwLine pwLine1(
    R=0.001,
    X=0.2,
    G=0,
    B=0) annotation (Placement(transformation(extent={{26,14},{46,34}})));
  iPSL.Electrical.Branches.PwLine2Openings pwLine3(
    t2=100,
    R=0.0005,
    X=0.1,
    G=0,
    B=0,
    t1=100) annotation (Placement(transformation(extent={{16,-20},{36,0}})));
  iPSL.Electrical.Branches.PwLine2Openings pwLine4(
    t2=100,
    t1=100,
    R=0.0005,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{42,-20},{62,0}})));
  iPSL.Electrical.Machines.PSSE.GENCLS.GENCLS gENCLS(
    M_b=100,
    D=0,
    V_0=1,
    angle_0=0,
    X_d=0.2,
    P_0=10.01711,
    Q_0=8.006544,
    H=0) annotation (Placement(transformation(extent={{108,0},{86,22}})));
  iPSL.Electrical.Loads.PSSE.Load_variation constantLoad(
    S_p(re=0.5, im=0.1),
    S_i(im=0, re=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    PQBRAK=0.7,
    d_t=0,
    d_P=0,
    V_0=0.9919935,
    angle_0=-0.5762684,
    t1=0) annotation (Placement(transformation(extent={{8,-50},{30,-26}})));
  iPSL.Electrical.Events.PwFault pwFault(
    R=0,
    X=0,
    t1=2,
    t2=2.15) annotation (Placement(transformation(extent={{56,-38},{76,-16}})));
  iPSL.Electrical.Machines.PSSE.GENROE.GENROE gENROE(
    M_b=100,
    Tpd0=5,
    Tppd0=0.07,
    Tpq0=0.9,
    Tppq0=0.09,
    H=4.28,
    D=0,
    Xd=1.84,
    Xq=1.75,
    Xpd=0.41,
    Xpq=0.6,
    Xppd=0.2,
    Xl=0.12,
    S10=0.11,
    S12=0.39,
    V_0=1,
    P_0=40,
    angle_0=4.046276,
    Q_0=5.416582,
    Xppq=0.2) annotation (Placement(transformation(extent={{-82,-10},{-42,30}})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(extent={{-2,-46},{-22,-26}})));
  iPSL.Electrical.Controls.PSSE.ES.ESST1A.ESST1A eSST1A(
    V_IMAX=0.3,
    V_IMIN=-0.3,
    T_C=2,
    T_B=10,
    T_C1=0.08,
    T_B1=0.083,
    K_A=300,
    V_AMAX=7,
    V_AMIN=-7,
    V_RMAX=5.2,
    V_RMIN=-5.2,
    K_C=0.38,
    K_F=1,
    T_F=1,
    K_LR=1,
    I_LR=0,
    T_A=0.1,
    T_R=0.1) annotation (Placement(transformation(extent={{-38,-50},{-90,-20}})));
  Modelica.Blocks.Sources.Constant const1(k=-Modelica.Constants.inf) annotation (Placement(transformation(extent={{-2,-80},{-22,-60}})));
  Modelica.Blocks.Sources.Constant const2(k=Modelica.Constants.inf) annotation (Placement(transformation(extent={{0,-110},{-20,-90}})));
equation
  connect(pwLine.n, pwLine1.p) annotation (Line(
      points={{-9,10},{3.5,10},{3.5,24},{29,24}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1.n, gENCLS.p) annotation (Line(
      points={{43,24},{74,24},{74,10.8346},{83.8,10.8346}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.p, pwLine.n) annotation (Line(
      points={{19,-10},{2.5,-10},{2.5,10},{-9,10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.n, pwLine4.p) annotation (Line(
      points={{33,-10},{45,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine4.n, gENCLS.p) annotation (Line(
      points={{59,-10},{74,-10},{74,10.8346},{83.8,10.8346}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(constantLoad.p, pwLine3.p) annotation (Line(
      points={{19,-24.8},{19,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwFault.p, pwLine4.p) annotation (Line(
      points={{54.3333,-27},{54.3333,-25.5},{45,-25.5},{45,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gENROE.p, pwLine.p) annotation (Line(points={{-40,10},{-23,10}}, color={0,0,255}));
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-81.6,20},{-92,20},{-92,36},{-30,36},{-30,4},{-40.4,4}}, color={0,0,127}));
  connect(const1.y, eSST1A.VUEL2) annotation (Line(points={{-23,-70},{-60.7717,-70},{-60.7717,-49.0438}}, color={0,0,127}));
  connect(eSST1A.VUEL3, eSST1A.VUEL2) annotation (Line(points={{-67.2175,-49.0531},{-67.2175,-70},{-60.7717,-70},{-60.7717,-49.0438}}, color={0,0,127}));
  connect(const2.y, eSST1A.VOEL) annotation (Line(points={{-21,-100},{-73.75,-100},{-73.75,-49.0625}}, color={0,0,127}));
  connect(eSST1A.EFD, gENROE.EFD) annotation (Line(points={{-91.0833,-35.0375},{-94,-35.0375},{-94,0},{-81.6,0}}, color={0,0,127}));
  connect(const.y, eSST1A.VUEL1) annotation (Line(points={{-23,-36},{-28,-36},{-28,-58},{-54.2175,-58},{-54.2175,-49.0625}}, color={0,0,127}));
  connect(eSST1A.VOTHSG, eSST1A.VUEL1) annotation (Line(points={{-39.0833,-22.8125},{-28,-22.8125},{-28,-58},{-54.2175,-58},{-54.2175,-49.0625}}, color={0,0,127}));
  connect(eSST1A.VOTHSG2, eSST1A.VUEL1) annotation (Line(points={{-39.0833,-26.5625},{-28,-26.5625},{-28,-58},{-54.2175,-58},{-54.2175,-49.0625}}, color={0,0,127}));
  connect(gENROE.ETERM, eSST1A.ECOMP) annotation (Line(points={{-40.4,20},{-34,20},{-34,-35},{-39.0833,-35}}, color={0,0,127}));
  connect(eSST1A.VT, eSST1A.ECOMP) annotation (Line(points={{-39.2458,-39.7344},{-34,-39.7344},{-34,-35},{-39.0833,-35}}, color={0,0,127}));
  connect(eSST1A.EFD0, gENROE.EFD0) annotation (Line(points={{-39.0833,-43.4094},{-32,-43.4094},{-32,-4},{-40.4,-4}}, color={0,0,127}));
  connect(eSST1A.XADIFD, gENROE.XADIFD) annotation (Line(points={{-39.0833,-47.1875},{-30,-47.1875},{-30,-8},{-40.4,-8}}, color={0,0,127}));
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
end ESST1A;
