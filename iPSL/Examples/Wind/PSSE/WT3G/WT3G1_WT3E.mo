within iPSL.Examples.Wind.PSSE.WT3G;


model WT3G1_WT3E
  constant Real pi=Modelica.Constants.pi;
  parameter Real V1=1.00000;
  parameter Real A1=0.0000;
  // 2,'BUS2        ', 230.0000,1,   1,   1,   1,1.00140,  -0.0589;
  parameter Real V3=1.00201;
  parameter Real A3=-0.0772;
  //  4,'BUS4        ',  34.4000,1,   1,   1,   1,1.00025,  -0.0022;
  parameter Real V5=1.00000;
  parameter Real A5=-0.0013;
  parameter Real P1=-1.468;
  parameter Real Q1=-14.697;
  parameter Real Zr=0.00000E+0;
  parameter Real Zi=2.00000E-1;
  parameter Real Psh=0.000;
  parameter Real Qsh=9.687;
  parameter Real P5=1.500;
  parameter Real Q5=0.000;
  parameter Real R1=2.50000E-2;
  parameter Real X1=2.50000E-2;
  parameter Real B1=0.05000;
  parameter Real R2=1.50000E-2;
  parameter Real X2=2.50000E-2;
  parameter Real B2=0.10000;
  parameter Real Rt1=1.00000E-2;
  parameter Real Xt1=1.00000E-2;
  parameter Real Rt2=0.00000E+0;
  parameter Real Xt2=1.00000E-3;
  parameter Real dyrw[1, 5]=[0.20000, 30.000, 0.0000, 0.10000, 1.5000];
  parameter Real dyrsvg[1, 10]=[100.00, 0.0000, 0.0000, 100.00, 0.0000, 0.0000, 0.0000, 1.1000, 0.0000, 100.00];
  iPSL.Electrical.Branches.PwLine pwLine(
    R=R1,
    X=X1,
    G=0,
    B=B1/2) annotation (Placement(transformation(extent={{-84,4},{-64,24}})));
  iPSL.Electrical.Branches.PwLine pwLine1(
    R=R1,
    X=X1,
    G=0,
    B=B1/2) annotation (Placement(transformation(extent={{-84,-20},{-64,0}})));
  iPSL.Electrical.Branches.PwLine pwLine2(
    R=R2,
    X=X2,
    G=0,
    B=B2/2) annotation (Placement(transformation(extent={{-14,-18},{6,2}})));
  iPSL.Electrical.Branches.PwLine pwLine3(
    R=R2,
    X=X2,
    G=0,
    B=B2/2) annotation (Placement(transformation(extent={{-14,4},{6,24}})));
  iPSL.Electrical.Branches.PwLine pwLine4(
    R=Rt1,
    X=Xt1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-52,-8},{-32,12}})));
  iPSL.Electrical.Branches.PwLine pwLine5(
    R=Rt2,
    X=Xt2,
    G=0,
    B=0) annotation (Placement(transformation(extent={{38,-6},{58,14}})));
  iPSL.Electrical.Machines.PSSE.GENCLS.GENCLS gENCLS2_1(
    V_0=V1,
    angle_0=A1,
    P_0=P1,
    Q_0=Q1,
    R_a=Zr,
    X_d=Zi,
    M_b=100) annotation (Placement(transformation(extent={{-120,-10},{-100,12}})));
  iPSL.Electrical.Banks.PSSE.CSVGN1 cSVGN1_1(
    K=100,
    T1=0,
    T2=0,
    T5=0,
    VMIN=0,
    CBASE=100,
    MBASE=100,
    SBASE=100,
    VMAX=1.1,
    v0=V3,
    anglev0=A3,
    T3=100,
    T4=0,
    Vc0=V5,
    Psh=Psh,
    Qsh=Qsh) annotation (Placement(transformation(extent={{-52,-60},{-18,-26}})));
  iPSL.Electrical.Banks.PSSE.Shunt shunt1(B=-0.25, G=0) annotation (Placement(transformation(extent={{46,-36},{66,-16}})));
  iPSL.Electrical.Events.PwFault pwFault(
    R=0.5,
    X=0.5,
    t1=1,
    t2=1.5) annotation (Placement(transformation(extent={{32,-34},{48,-18}})));
  iPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{-126,48},{-102,68}})));
  iPSL.Electrical.Wind.PSSE.WT3G.WT3G1 wT3G1_pt(
    eterm=V5,
    anglev0=A5,
    pelec=P5,
    qelec=Q5,
    Sbase=100,
    Zs(im=Zi),
    Xeq=dyrw[1, 1],
    Kpll=dyrw[1, 2],
    Kipll=dyrw[1, 3],
    Pllmax=dyrw[1, 4],
    Prated=dyrw[1, 5],
    Mbase=1.5,
    wbase=2*pi*50) annotation (Placement(transformation(
        extent={{-22,23},{22,-23}},
        rotation=180,
        origin={102,7})));
  iPSL.Electrical.Wind.PSSE.WT3G.WT3E1 wT3E1_1(
    VARFLG=1,
    v0=V5,
    p0=P5/1.5,
    q0=Q5/1.5,
    VLRFLG=1,
    Vref=1) annotation (Placement(transformation(extent={{148,-16},{214,30}})));
equation
  connect(gENCLS2_1.p, pwLine.p) annotation (Line(
      points={{-98,0.834604},{-89.5,0.834604},{-89.5,14},{-81,14}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1.p, gENCLS2_1.p) annotation (Line(
      points={{-81,-10},{-88,-10},{-88,0.834604},{-98,0.834604}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine.n, pwLine4.p) annotation (Line(
      points={{-67,14},{-52,14},{-52,2},{-49,2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1.n, pwLine4.p) annotation (Line(
      points={{-67,-10},{-52,-10},{-52,2},{-49,2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.p, pwLine4.n) annotation (Line(
      points={{-11,14},{-28,14},{-28,2},{-35,2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine2.p, pwLine4.n) annotation (Line(
      points={{-11,-8},{-28,-8},{-28,2},{-35,2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(cSVGN1_1.p, pwLine4.n) annotation (Line(
      points={{-35,-34.16},{-35,2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.n, pwLine2.n) annotation (Line(
      points={{3,14},{24,14},{24,-8},{3,-8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine5.p, pwLine2.n) annotation (Line(
      points={{41,4},{24,4},{24,-8},{3,-8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(shunt1.p, pwLine5.n) annotation (Line(
      points={{55.6,-18.4},{55.6,-7.2},{55,-7.2},{55,4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwFault.p, pwLine2.n) annotation (Line(
      points={{30.6667,-26},{30.6667,4},{24,4},{24,-8},{3,-8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(wT3G1_pt.Ipcmd, wT3E1_1.WIPCMD) annotation (Line(
      points={{121.8,13.9},{132.78,13.9},{132.78,15.2143},{146.35,15.2143}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pwLine5.n, wT3G1_pt.p) annotation (Line(
      points={{55,4},{70,4},{70,7},{77.8,7}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(wT3G1_pt.ipcmd0, wT3E1_1.WIPCMD0) annotation (Line(points={{104.2,32.3},{104.2,40},{156.25,40},{156.25,28.3571}}, color={0,0,127}));
  connect(wT3G1_pt.eqcmd0, wT3E1_1.WEQCMD0) annotation (Line(points={{113,32.3},{113,46},{162.85,46},{162.85,28.3571}}, color={0,0,127}));
  connect(wT3G1_pt.Eqcmd, wT3E1_1.WEQCMD) annotation (Line(points={{121.8,23.1},{133.9,23.1},{133.9,21.7857},{146.35,21.7857}}, color={0,0,127}));
  connect(wT3E1_1.ITERM, wT3G1_pt.V) annotation (Line(points={{149.65,7},{134,7},{134,-9.1},{126.2,-9.1}}, color={0,0,127}));
  connect(wT3E1_1.VTERM, wT3G1_pt.Iterm) annotation (Line(points={{149.65,0.428571},{137.825,0.428571},{137.825,0.1},{126.2,0.1}}, color={0,0,127}));
  connect(wT3E1_1.Qelec, wT3G1_pt.Q) annotation (Line(points={{149.65,-6.14286},{136,-6.14286},{136,-20},{72,-20},{72,13.9},{77.8,13.9}}, color={0,0,127}));
  connect(wT3E1_1.PELEC, wT3G1_pt.P) annotation (Line(points={{149.65,-12.7143},{140,-12.7143},{140,-26},{68,-26},{68,23.1},{77.8,23.1}}, color={0,0,127}));
  connect(cSVGN1_1.V, wT3G1_pt.Iterm) annotation (Line(points={{-28.37,-38.07},{132,-38.07},{132,0},{126.2,0.1}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,-80},{160,100}})),
    Icon(coordinateSystem(extent={{-140,-80},{160,100}})),
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
end WT3G1_WT3E;
