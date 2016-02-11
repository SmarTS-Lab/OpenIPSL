within iPSL.Examples.DevelopmentExamples.Electrical.Controls.PSSE.PSS;
model IEEEST "SMIB system with one load and GENROE model"
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
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(extent={{-2,-76},{-22,-56}})));
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
    T_R=0.1) annotation (Placement(transformation(extent={{-38,-80},{-90,-50}})));
  Modelica.Blocks.Sources.Constant const1(k=-Modelica.Constants.inf) annotation (Placement(transformation(extent={{-2,-110},{-22,-90}})));
  Modelica.Blocks.Sources.Constant const2(k=Modelica.Constants.inf) annotation (Placement(transformation(extent={{0,-140},{-20,-120}})));
  iPSL.Electrical.Controls.PSSE.PSS.IEEEST.IEEEST iEEEST(
    A_1=48.7435,
    A_2=4.7488,
    A_3=0.0,
    A_4=0.0,
    A_5=-85.7761,
    A_6=0.0459,
    T_1=0.7361,
    T_2=1.5868,
    T_3=0.0,
    T_4=0.02,
    T_5=13.8921,
    T_6=0.1057,
    K_S=0.0099,
    L_SMAX=0.1,
    L_SMIN=-0.1,
    V_CU=0.0,
    V_CL=0.0) annotation (Placement(transformation(extent={{-76,-34},{-48,-22}})));
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
  connect(eSST1A.ECOMP, gENROE.ETERM) annotation (Line(points={{-39.0833,-65},{-34,-65},{-34,20},{-40.4,20}}, color={0,0,127}));
  connect(const1.y, eSST1A.VUEL2) annotation (Line(points={{-23,-100},{-60.7717,-100},{-60.7717,-79.0438}}, color={0,0,127}));
  connect(eSST1A.VUEL1, const.y) annotation (Line(points={{-54.2175,-79.0625},{-54.2175,-84},{-28,-84},{-28,-66},{-23,-66}}, color={0,0,127}));
  connect(eSST1A.VUEL3, eSST1A.VUEL2) annotation (Line(points={{-67.2175,-79.0531},{-67.2175,-100},{-60.7717,-100},{-60.7717,-79.0438}}, color={0,0,127}));
  connect(const2.y, eSST1A.VOEL) annotation (Line(points={{-21,-130},{-73.75,-130},{-73.75,-79.0625}}, color={0,0,127}));
  connect(eSST1A.EFD, gENROE.EFD) annotation (Line(points={{-91.0833,-65.0375},{-96,-65.0375},{-96,0},{-81.6,0}}, color={0,0,127}));
  connect(eSST1A.VT, gENROE.ETERM) annotation (Line(points={{-39.2458,-69.7344},{-34,-69.7344},{-34,20},{-40.4,20}}, color={0,0,127}));
  connect(eSST1A.EFD0, gENROE.EFD0) annotation (Line(points={{-39.0833,-73.4094},{-32,-73.4094},{-32,-4},{-40.4,-4}}, color={0,0,127}));
  connect(eSST1A.XADIFD, gENROE.XADIFD) annotation (Line(points={{-39.0833,-77.1875},{-30,-77.1875},{-30,-8},{-40.4,-8}}, color={0,0,127}));
  connect(iEEEST.V_CT, gENROE.ETERM) annotation (Line(points={{-75.7667,-25},{-82,-25},{-82,-18},{-34,-18},{-34,20},{-40.4,20}}, color={0,0,127}));
  connect(iEEEST.V_S, gENROE.PELEC) annotation (Line(points={{-75.7667,-31},{-82,-31},{-82,-42},{-36,-42},{-36,0},{-40.4,0}}, color={0,0,127}));
  connect(eSST1A.VOTHSG2, const.y) annotation (Line(points={{-39.0833,-56.5625},{-26,-56.5625},{-26,-66},{-23,-66}}, color={0,0,127}));
  connect(iEEEST.VOTHSG, eSST1A.VOTHSG) annotation (Line(points={{-46.8333,-28},{-28,-28},{-28,-52.8125},{-39.0833,-52.8125}}, color={0,0,127}));
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
end IEEEST;
