within iPSL.Electrical.Wind.PSSE.WT3G.Test;


model WT3G1_test
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
    B=0) annotation (Placement(transformation(extent={{32,-6},{52,14}})));
  iPSL.Electrical.Machines.PSSE.GENCLS.GENCLS gENCLS2_1(
    V_0=V1,
    angle_0=A1,
    P_0=P1,
    Q_0=Q1,
    R_a=Zr,
    X_d=Zi,
    M_b=100) annotation (Placement(transformation(extent={{-120,-10},{-100,12}})));
  CSVGN1 cSVGN1_1(
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
  WT3G1_pt wT3G1_pt(
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
    wbase=2*pi*60,
    Mbase=1.5) annotation (Placement(transformation(
        extent={{-17,17},{17,-17}},
        rotation=180,
        origin={85,1})));
  Electrical.Wind.PSSE.WT3G.shunt1 shunt1(B=-0.25, v0=V5) annotation (Placement(transformation(extent={{46,-32},{66,-12}})));
  Events.PwFault pwFault(
    R=0.5,
    X=0.5,
    t1=1,
    t2=1.5) annotation (Placement(transformation(extent={{32,-34},{48,-18}})));
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
      points={{35,4},{24,4},{24,-8},{3,-8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(wT3G1_pt.p, pwLine5.n) annotation (Line(
      points={{73.44,3.72},{66,3.72},{66,4},{49,4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(wT3G1_pt.V, cSVGN1_1.V) annotation (Line(
      points={{65.11,-2.57},{64,-2.57},{64,-38.07},{-28.37,-38.07}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(shunt1.p, pwLine5.n) annotation (Line(
      points={{55.6,-14.4},{55.6,-7.2},{49,-7.2},{49,4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwFault.p, pwLine2.n) annotation (Line(
      points={{30.6667,-26},{30.6667,4},{24,4},{24,-8},{3,-8}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-80},{160,100}}), graphics={Text(
          extent={{-134,98},{-54,74}},
          lineColor={0,0,255},
          textString="100 60HZ

The B in Pwline stands for half charging B in PSSE transmission line",
          fontSize=10),Text(
          extent={{144,22},{146,12}},
          lineColor={0,0,255},
          textString=" ** BASE FREQUENCY option setting set to 60.0
Successfully cleaned Diagram
 Out of file data--switch to terminal input mode

 Generator models use:
  CONS        1-    12
  STATES      1-     5
  VARS        1-     1
  ICONS       1-     1

 Wind Generator models use:
  CONS       13-    17
  STATES      6-     9
  VARS        2-     5
  ICONS       2-     2


 SUMMARY OF MODELS READ:

 GENS:  GENCLS           CSVGN1
           1                1

 WGENS: WT3G1
           1

 NEXT AVAILABLE ADDRESSES ARE:
    CON  STATE    VAR   ICON
     18     10      6      3
"),Text(  extent={{-166,52},{-114,48}},
          lineColor={0,0,255},
          textString=" INITIAL CONDITION LOAD FLOW USED 1 ITERATIONS

 ----------------------------- MACHINE INITIAL CONDITIONS -----------------------------
   BUS# X-- NAME --X BASKV ID  ETERM   EFD    POWER    VARS   P.F.  ANGLE   ID     IQ
      1 INFINITE BUS230.00 1  1.0000 0.9706   -1.47  -14.70-0.0994  -0.17-0.1469-0.0151
      3 BUS3        34.400 1  1.0020 0.0000    0.00    9.69 0.0000   0.00 0.0967-0.0001
      5 WT3G        0.6000 1  1.0000 0.0000    1.50    0.00 1.0000  -0.00 0.0000 1.0000",
          horizontalAlignment=TextAlignment.Left),Text(
          extent={{-166,-78},{-140,-82}},
          lineColor={0,0,255},
          textString="    TIME X- VALUE --X X--------- IDENTIFIER ---------X X- VALUE --X X--------- IDENTIFIER ---------X
 -0.0200 -3.02475E-03 S2                                0.90351     S3
     3     0.0000     S4                                0.90351     S5
     5     1.0000     S6                                 1.0000     S7
     7     0.0000     S8                               -2.19253E-05 S9
     9     0.0000     S10                              -0.14698     QINF
    11    9.68810E-02 QSH                                1.0000     V5
    13   -1.25630E-03 A5",
          horizontalAlignment=TextAlignment.Left),Text(
          extent={{-24,64},{96,40}},
          lineColor={0,0,255},
          fontSize=18,
          textStyle={TextStyle.Bold},
          textString="0.5*(34.4^2/100)=5.9186")}),
    Icon(coordinateSystem(extent={{-100,-80},{160,100}})),
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
end WT3G1_test;
