within iPSL.Examples.DevelopmentExamples.Electrical.Controls.PSSE.ES;
model SEXS "SMIB model example of GENROU with Excitation System EXST1"
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
  iPSL.Electrical.Controls.PSSE.ES.SEXS.SEXS sEXS(
    T_AT_B=0.1,
    T_B=1,
    K=100,
    T_E=0.1,
    E_MIN=-10,
    E_MAX=10,
    Ec0=1) annotation (Placement(transformation(extent={{-56,-54},{-94,-26}})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(
        extent={{4,-4},{-4,4}},
        rotation=0,
        origin={-36,-40})));
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
  connect(gENROE.EFD0, sEXS.EFD0) annotation (Line(points={{-54.4,-14},{-46,-14},{-46,-48.75},{-57.14,-48.75}}, color={0,0,127}));
  connect(gENROE.ETERM, sEXS.ECOMP) annotation (Line(points={{-54.4,10},{-50,10},{-50,-31.25},{-57.14,-31.25}}, color={0,0,127}));
  connect(sEXS.VOEL, const.y) annotation (Line(points={{-57.14,-40},{-40.4,-40}}, color={0,0,127}));
  connect(sEXS.VOTHSG, const.y) annotation (Line(points={{-57.14,-34.75},{-50,-34.75},{-50,-40},{-40.4,-40}}, color={0,0,127}));
  connect(sEXS.VUEL, const.y) annotation (Line(points={{-57.14,-45.25},{-50,-45.25},{-50,-40},{-40.4,-40}}, color={0,0,127}));
  connect(sEXS.EFD, gENROE.EFD) annotation (Line(points={{-95.14,-40},{-100,-40},{-100,-10},{-95.6,-10}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,-100},{120,100}})),
    Documentation(info="<html>
<p><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"),
    Icon(coordinateSystem(extent={{-120,-100},{120,100}})));
end SEXS;
