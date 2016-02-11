within iPSL.Examples.DevelopmentExamples.Electrical.Controls.PSSE.ES;
model SCRX "SMIB model example of GENROU with Excitation System EXST1"
  import iPSL;
  iPSL.Electrical.Branches.PwLine pwLine(
    R=0.001,
    X=0.2,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-26,-10},{-6,10}})));
  iPSL.Electrical.Branches.PwLine pwLine1(
    R=0.001,
    X=0.2,
    G=0,
    B=0) annotation (Placement(transformation(extent={{34,30},{54,50}})));
  iPSL.Electrical.Branches.PwLine2Openings pwLine3(
    t2=100,
    R=0.0005,
    X=0.1,
    G=0,
    B=0,
    t1=100) annotation (Placement(transformation(extent={{16,-50},{36,-30}})));
  iPSL.Electrical.Branches.PwLine2Openings pwLine4(
    t2=100,
    R=0.0005,
    X=0.1,
    G=0,
    B=0,
    t1=100) annotation (Placement(transformation(extent={{52,-50},{72,-30}})));
  iPSL.Electrical.Machines.PSSE.GENCLS.GENCLS gENCLS(
    X_d=0.2,
    H=0,
    D=0,
    V_b=100,
    V_0=1,
    angle_0=0,
    M_b=100,
    P_0=10.01711,
    Q_0=8.006544) annotation (Placement(transformation(extent={{102,-10},{92,14}})));
  iPSL.Electrical.Loads.PSSE.Load_variation constantLoad(
    S_p(re=0.5, im=0.1),
    S_i(im=0, re=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    PQBRAK=0.7,
    V_0=0.9919935,
    angle_0=-0.5762684,
    d_P=0,
    t1=0,
    d_t=0,
    characteristic=2) annotation (Placement(transformation(extent={{12,-60},{0,-48}})));
  iPSL.Electrical.Events.PwFault pwFault(
    t1=2,
    t2=2.15,
    R=0,
    X=0) annotation (Placement(transformation(extent={{56,-66},{68,-54}})));
  Modelica.Blocks.Sources.Constant const2(k=0) annotation (Placement(transformation(extent={{-110,166},{-94,182}})));
  iPSL.Electrical.Buses.Bus GEN01 annotation (Placement(transformation(extent={{-46,-10},{-26,10}})));
  iPSL.Electrical.Buses.Bus LOAD annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
  iPSL.Electrical.Buses.Bus FAULT annotation (Placement(transformation(extent={{34,-50},{54,-30}})));
  iPSL.Electrical.Buses.Bus GEN02 annotation (Placement(transformation(extent={{74,-8},{94,12}})));
  inner iPSL.Electrical.SystemBase SysData(S_b=100, fn=50) annotation (Placement(transformation(extent={{60,84},{120,100}})));
  iPSL.Electrical.Machines.PSSE.GENROU.GENROU gENROE(
    M_b=100,
    Tpd0=5,
    Tppd0=0.07,
    Tpq0=0.9,
    Tppq0=0.09,
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
    Xppq=0.2,
    R_a=0,
    Xpp=0.2,
    H=4.28) annotation (Placement(transformation(extent={{-96,-20},{-56,20}})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(
        extent={{4,-4},{-4,4}},
        rotation=0,
        origin={-36,-36})));
  iPSL.Electrical.Controls.PSSE.ES.SCRX.SCRX sCRX(
    T_AT_B=0.1,
    T_B=1,
    K=100,
    E_MIN=-10,
    E_MAX=10,
    C_SWITCH=false,
    r_cr_fd=0,
    V_c0=1,
    V_0=1,
    T_E=0.005) annotation (Placement(transformation(extent={{-58,-58},{-92,-30}})));
equation
  connect(GEN01.p, pwLine.p) annotation (Line(points={{-36,0},{-23,0}}, color={0,0,255}));
  connect(pwLine.n, LOAD.p) annotation (Line(points={{-9,0},{-3.5,0},{2,0}}, color={0,0,255}));
  connect(LOAD.p, pwLine1.p) annotation (Line(points={{2,0},{12,0},{12,40},{37,40}}, color={0,0,255}));
  connect(pwLine3.p, pwLine1.p) annotation (Line(points={{19,-40},{12,-40},{12,40},{37,40}}, color={0,0,255}));
  connect(pwLine3.n, FAULT.p) annotation (Line(points={{33,-40},{38.5,-40},{44,-40}},color={0,0,255}));
  connect(FAULT.p, pwLine4.p) annotation (Line(points={{44,-40},{55,-40}}, color={0,0,255}));
  connect(pwLine1.n, GEN02.p) annotation (Line(points={{51,40},{51,40},{76,40},{76,2},{84,2}}, color={0,0,255}));
  connect(pwLine4.n, GEN02.p) annotation (Line(points={{69,-40},{76,-40},{76,2},{84,2}}, color={0,0,255}));
  connect(GEN02.p, gENCLS.p) annotation (Line(points={{84,2},{91,2},{91,1.81957}}, color={0,0,255}));
  connect(constantLoad.p, pwLine1.p) annotation (Line(points={{6,-47.4},{5,-47.4},{5,0},{12,0},{12,40},{37,40}}, color={0,0,255}));
  connect(pwFault.p, pwLine4.p) annotation (Line(points={{55,-60},{48,-60},{48,-40},{55,-40}}, color={0,0,255}));
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-95.6,10},{-100,10},{-100,26},{-46,26},{-46,-6},{-54.4,-6}}, color={0,0,127}));
  connect(gENROE.p, GEN01.p) annotation (Line(points={{-54,0},{-45,0},{-36,0}}, color={0,0,255}));
  connect(sCRX.EFD, gENROE.EFD) annotation (Line(points={{-92.5667,-43.86},{-100,-43.86},{-100,-10},{-95.6,-10}}, color={0,0,127}));
  connect(gENROE.ETERM, sCRX.ECOMP) annotation (Line(points={{-54.4,10},{-50,10},{-50,-31.82},{-58.1417,-31.82}}, color={0,0,127}));
  connect(const.y, sCRX.VOTHSG) annotation (Line(points={{-40.4,-36},{-58.1417,-36},{-58.1417,-35.74}}, color={0,0,127}));
  connect(sCRX.VOEL, sCRX.VOTHSG) annotation (Line(points={{-58.1417,-39.1},{-54,-39.1},{-54,-36},{-58.1417,-36},{-58.1417,-35.74}}, color={0,0,127}));
  connect(sCRX.VUEL, sCRX.VOTHSG) annotation (Line(points={{-58.1417,-42.74},{-54,-42.74},{-54,-36},{-58.1417,-36},{-58.1417,-35.74}}, color={0,0,127}));
  connect(sCRX.XADIFD, gENROE.XADIFD) annotation (Line(points={{-57.8583,-45.82},{-48,-45.82},{-48,-18},{-54.4,-18}}, color={0,0,127}));
  connect(sCRX.EFD0, gENROE.EFD0) annotation (Line(points={{-58.1417,-55.34},{-46,-55.34},{-46,-14},{-54.4,-14}}, color={0,0,127}));
  connect(sCRX.ETERM, sCRX.ECOMP) annotation (Line(points={{-57.8583,-50.44},{-50,-50.44},{-50,-31.82},{-58.1417,-31.82}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,-100},{120,100}})),
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
</html>"),
    Icon(coordinateSystem(extent={{-120,-100},{120,100}})));
end SCRX;
