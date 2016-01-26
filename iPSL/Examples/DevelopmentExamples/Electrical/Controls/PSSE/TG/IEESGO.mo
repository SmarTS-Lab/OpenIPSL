within iPSL.Examples.DevelopmentExamples.Electrical.Controls.PSSE.TG;


model IEESGO "Simple Machine Infinite Bus with Machine, Governor and Excitation system"
  import iPSL;

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
    Tppd0=0.028,
    Tppq0=0.0358,
    H=4.4100,
    D=0,
    Xd=1.2200,
    Xq=0.76000,
    Xpd=0.29700,
    S10=0.18600,
    S12=0.802) annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
  iPSL.Electrical.Branches.PwLine2Openings pwLine(
    t1=100,
    t2=100,
    G=0,
    B=0,
    R=0.001,
    X=0.2) annotation (Placement(transformation(extent={{-34,0},{-14,20}})));
  iPSL.Electrical.Branches.PwLine2Openings pwLine1(
    t1=100,
    t2=100,
    G=0,
    B=0,
    R=0.001,
    X=0.2) annotation (Placement(transformation(extent={{10,14},{30,34}})));
  iPSL.Electrical.Branches.PwLine2Openings pwLine3(
    t2=100,
    t1=100,
    G=0,
    B=0,
    R=0.0005,
    X=0.1) annotation (Placement(transformation(extent={{-6,-20},{14,0}})));
  iPSL.Electrical.Branches.PwLine2Openings pwLine4(
    t2=100,
    t1=100,
    G=0,
    B=0,
    R=0.0005,
    X=0.1) annotation (Placement(transformation(extent={{20,-20},{40,0}})));
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
    d_t=0) annotation (Placement(transformation(extent={{-10,-42},{6,-28}})));
  iPSL.Electrical.Controls.PSSE.ES.SCRX.SCRX SCRX(
    V_0=1,
    V_c0=1,
    T_B=10,
    K=100,
    T_E=0.05,
    E_MIN=0,
    E_MAX=5,
    r_cr_fd=0,
    C_SWITCH=false,
    T_AT_B=0.1) annotation (Placement(transformation(
        extent={{-18,-16},{18,16}},
        rotation=180,
        origin={-70,-24})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(
        extent={{-2,-2},{2,2}},
        rotation=180,
        origin={-40,-24})));
  iPSL.Electrical.Events.PwFault pwFault(
    R=0,
    t1=2,
    t2=2.15,
    X=0) annotation (Placement(transformation(extent={{38,-36},{48,-26}})));
  iPSL.Electrical.Controls.PSSE.TG.IEESGO iEESGO(
    T_1=0.01,
    T_2=0.0,
    T_3=0.15,
    T_4=0.3,
    T_5=8.0,
    T_6=0.4,
    K_1=0.0,
    K_2=0.7,
    K_3=0.43,
    P_MAX=1.0,
    P_MIN=0.0) annotation (Placement(transformation(extent={{-54,34},{-86,48}})));
equation
  connect(generator.p, pwLine.p) annotation (Line(
      points={{-59,10},{-31,10}},
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
      points={{-2,-27.3},{-2,-27.5},{-3,-27.5},{-3,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(SCRX.VUEL, const.y) annotation (Line(
      points={{-52.15,-19.04},{-43.67,-19.04},{-43.67,-24},{-42.2,-24}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(SCRX.VOEL, const.y) annotation (Line(
      points={{-52.15,-23.2},{-43.67,-23.2},{-43.67,-24},{-42.2,-24}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(SCRX.VOTHSG, const.y) annotation (Line(
      points={{-52.15,-27.04},{-43.67,-27.04},{-43.67,-24},{-42.2,-24}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(generator.EFD0, SCRX.EFD0) annotation (Line(
      points={{-59.2,3},{-59.2,-4.64},{-52.15,-4.64}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(SCRX.EFD, generator.EFD) annotation (Line(points={{-88.6,-17.76},{-94,-17.76},{-94,5},{-79.8,5}}, color={0,0,127}));
  connect(generator.ETERM, SCRX.ECOMP) annotation (Line(points={{-59.2,15},{-34,15},{-34,-31.52},{-52.15,-31.52}}, color={0,0,127}));
  connect(SCRX.ETERM, SCRX.ECOMP) annotation (Line(points={{-51.85,-10.24},{-34,-10.24},{-34,-31.52},{-52.15,-31.52}}, color={0,0,127}));
  connect(generator.XADIFD, SCRX.XADIFD) annotation (Line(points={{-59.2,1},{-42,1},{-42,-15.52},{-51.85,-15.52}}, color={0,0,127}));
  connect(pwFault.p, pwLine4.p) annotation (Line(points={{37.1667,-31},{23,-31},{23,-10}}, color={0,0,255}));
  connect(iEESGO.SPEED, generator.SPEED) annotation (Line(points={{-54.8,45},{-52,45},{-52,19},{-59.2,19}}, color={0,0,127}));
  connect(iEESGO.PMECH, generator.PMECH) annotation (Line(points={{-87,42},{-94,42},{-94,15},{-79.8,15}}, color={0,0,127}));
  connect(iEESGO.PMECH0, generator.PMECH0) annotation (Line(points={{-54.8,38},{-52,38},{-52,7},{-59.2,7}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-120},{100,80}})),
    Icon(coordinateSystem(extent={{-100,-120},{100,80}})),
    Documentation(info="<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
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
</html>"));
end IEESGO;
