within OpenIPSL.Electrical.Controls.PSSE.ES;
model ESST4B " IEEE type ST4B potential or compounded
source-controlled rectifier exciter "
  parameter Real T_R=0.3;
  parameter Real K_PR=2.97;
  parameter Real K_IR=2.97;
  parameter Real V_RMAX=1;
  parameter Real V_RMIN=-0.87;
  parameter Real T_A=0.01;
  parameter Real K_PM=1;
  parameter Real K_IM=0.2;
  parameter Real V_MMAX=1;
  parameter Real V_MMIN=-0.87;
  parameter Real K_G=0.1;
  parameter Real K_P=6.73;
  parameter Real K_I=0.1;
  parameter Real V_BMAX=8.41;
  parameter Real K_C=0.1;
  parameter Real X_L=0;
  parameter Real THETAP=0;
  NonElectrical.Continuous.SimpleLag Vm(
    y_start=V0,
    K=1,
    T=T_R) annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=0,
        origin={-81,15})));
  Modelica.Blocks.Interfaces.RealInput ECOMP annotation (Placement(transformation(extent={{-138,-4},{-100,34}}), iconTransformation(extent={{-138,-54},{-100,-16}})));
  Modelica.Blocks.Interfaces.RealInput VOTHSG annotation (Placement(transformation(extent={{-138,44},{-100,82}}), iconTransformation(extent={{-138,-6},{-100,32}})));
  Modelica.Blocks.Sources.Constant V_REF(k=VREF) annotation (Placement(transformation(extent={{-100,-12},{-88,0}})));
  NonElectrical.Logical.LV_GATE lV_Gate annotation (Placement(transformation(extent={{264,46},{286,68}})));
  Modelica.Blocks.Sources.Constant V_OEL(k=1000) annotation (Placement(transformation(extent={{232,22},{244,34}})));
  Modelica.Blocks.Interfaces.RealInput XADIFD
    annotation (Placement(transformation(
        extent={{-19,-19},{19,19}},
        rotation=0,
        origin={-119,-91}), iconTransformation(extent={{-17,-17},{17,17}}, origin={-119,-117})));
  NonElectrical.Nonlinear.FEX fEX annotation (Placement(transformation(extent={{90,-98},{116,-72}})));
  Modelica.Blocks.Math.Product product annotation (Placement(transformation(extent={{292,46},{306,60}})));
  Modelica.Blocks.Interfaces.RealOutput EFD annotation (Placement(transformation(extent={{340,42},{360,62}}), iconTransformation(extent={{230,-100},{250,-80}})));
  Modelica.Blocks.Interfaces.RealInput EFD0
    annotation (Placement(transformation(
        extent={{-17,-17},{17,17}},
        rotation=90,
        origin={-59,-135}), iconTransformation(extent={{-17,-17},{17,17}}, origin={-121,-161})));
  Modelica.Blocks.Interfaces.RealInput VUEL
    annotation (Placement(transformation(
        extent={{-19,-19},{19,19}},
        rotation=0,
        origin={-123,-27}), iconTransformation(extent={{-17,-17},{17,17}}, origin={-121,-75})));
  NonElectrical.Continuous.SimpleLag VA(
    K=1,
    T=T_A,
    y_start=Efd0*K_G) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={104,54})));
  Modelica.Blocks.Continuous.LimIntegrator VR1(
    outMax=V_RMAX/K_PR,
    outMin=V_RMIN/K_PR,
    k=K_IR,
    y_start=Efd0*K_G,
    initType=Modelica.Blocks.Types.Init.InitialOutput) annotation (Placement(transformation(extent={{-12,28},{6,46}})));
  Modelica.Blocks.Math.Gain Gain1(k=K_PR) annotation (Placement(transformation(extent={{-12,62},{8,82}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_RMAX, uMin=V_RMIN) annotation (Placement(transformation(extent={{54,44},{74,64}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{34,48},{46,60}})));
  Modelica.Blocks.Math.Add add1(k1=-1) annotation (Placement(transformation(extent={{128,52},{138,62}})));
  Modelica.Blocks.Math.Gain gain(k=K_G) annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=180,
        origin={195,109})));
  Modelica.Blocks.Continuous.LimIntegrator VM1(
    y_start=Efd0/VB0,
    outMax=V_MMAX/K_PM,
    outMin=V_MMIN/K_PM,
    k=K_IR,
    initType=Modelica.Blocks.Types.Init.InitialOutput) annotation (Placement(transformation(extent={{162,22},{180,40}})));
  Modelica.Blocks.Math.Gain Gain2(k=K_PM) annotation (Placement(transformation(extent={{164,62},{184,82}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=V_RMAX, uMin=V_RMIN) annotation (Placement(transformation(extent={{230,52},{250,72}})));
  Modelica.Blocks.Math.Add add2 annotation (Placement(transformation(extent={{210,56},{222,68}})));
  BaseClasses.VE vE
    annotation (Placement(transformation(extent={{-14,-44},{50,-8}})));
  Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(extent={{146,-36},{160,-22}})));
  Modelica.Blocks.Nonlinear.Limiter maxLimiter(uMin=-Modelica.Constants.inf, uMax=V_BMAX) annotation (Placement(transformation(extent={{176,-40},{198,-18}})));
  Sensors.PwVoltageCurrent pwVoltageCurrent annotation (Placement(transformation(extent={{-98,-68},{-34,32}})));
  OpenIPSL.Connectors.PwPin Gen_terminal(
    vr(start=Vr0),
    vi(start=Vi0),
    ir(start=Ir0),
    ii(start=Ii0)) annotation (Placement(transformation(extent={{-94,88},{-74,108}}), iconTransformation(extent={{-94,38},{-74,58}})));
  OpenIPSL.Connectors.PwPin Bus annotation (Placement(transformation(extent={{204,88},{224,108}}), iconTransformation(extent={{204,38},{224,58}})));
  Modelica.Blocks.Math.Add3 add3_1 annotation (Placement(transformation(extent={{-46,46},{-26,66}})));
  Modelica.Blocks.Math.Add add3(k1=-1) annotation (Placement(transformation(extent={{-58,8},{-44,22}})));
  Modelica.Blocks.Math.Gain gain2(k=K_C) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=0,
        origin={45,-81})));
  Modelica.Blocks.Math.Division division annotation (Placement(transformation(
        extent={{-7,7},{7,-7}},
        rotation=0,
        origin={75,-85})));
protected
  parameter Real Vr0(fixed=false);
  parameter Real Vi0(fixed=false);
  parameter Real Ir0(fixed=false);
  parameter Real Ii0(fixed=false);
  parameter Real Efd0(fixed=false);
  parameter Real VREF(fixed=false);
  parameter Real V0(fixed=false);
  parameter Real Re(fixed=false);
  parameter Real Im(fixed=false);
  parameter Real KPr=K_P*cos(THETAP);
  parameter Real KPi=K_P*sin(THETAP);
  parameter Real VE0(fixed=false);
  parameter Real IN0(fixed=false);
  parameter Real VB0(fixed=false);
  parameter Real KCIFD0(fixed=false);

  function FEX_INI
    input Real IN;
    output Real FEX;
  algorithm
    if IN <= 0 then
      FEX := 1;
    elseif IN > 0 and IN <= 0.433 then
      FEX := 1 - 0.577*IN;
    elseif IN > 0.433 and IN < 0.75 then
      FEX := sqrt(0.75 - IN^2);
    elseif IN >= 0.75 and IN <= 1 then
      FEX := 1.732*(1 - IN);
    else
      FEX := 0;
    end if;
  end FEX_INI;
initial equation
  KCIFD0 = K_C*XADIFD;
  Efd0 = EFD0;
  V0 = sqrt(Vr0*Vr0 + Vi0*Vi0);
  VREF = V0;
  Re = KPr*Vr0 - KPi*Vi0 - K_I*Ii0 - X_L*(KPr*Ii0 + KPi*Ir0);
  Im = KPr*Vi0 + KPi*Vr0 + K_I*Ir0 + X_L*(KPr*Ir0 - KPi*Ii0);
  VE0 = sqrt(Re*Re + Im*Im);
  IN0 = KCIFD0/VE0;
  VB0 = VE0*FEX_INI(IN0);
equation
  connect(product.y, EFD) annotation (Line(
      points={{306.7,53},{336,53},{336,52},{350,52}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gain1.y, add.u1) annotation (Line(
      points={{9,72},{26,72},{26,57.6},{32.8,57.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add.y, limiter.u) annotation (Line(
      points={{46.6,54},{52,54}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gain2.y, add2.u1) annotation (Line(
      points={{185,72},{198,72},{198,65.6},{208.8,65.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add2.y, limiter1.u) annotation (Line(
      points={{222.6,62},{228,62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gain2.u, add1.y) annotation (Line(
      points={{162,72},{142,72},{142,57},{138.5,57}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add1.u1, gain.y) annotation (Line(
      points={{127,60},{124,60},{124,109},{185.1,109}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain.u, EFD) annotation (Line(
      points={{205.8,109},{336,109},{336,52},{350,52}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(vE.VE, product1.u1) annotation (Line(
      points={{56.4,-25.64},{81.2,-25.64},{81.2,-24.8},{144.6,-24.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(product1.y, maxLimiter.u) annotation (Line(
      points={{160.7,-29},{173.8,-29}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(maxLimiter.y, product.u2) annotation (Line(
      points={{199.1,-29},{280,-29},{280,48.8},{290.6,48.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pwVoltageCurrent.Vi, vE.Vi) annotation (Line(
      points={{-51.6,-20.5},{-40,-20.5},{-40,-20.6},{-20.4,-20.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pwVoltageCurrent.Ir, vE.Ir) annotation (Line(
      points={{-51.6,-27.5},{-34.525,-27.5},{-34.525,-28.88},{-20.4,-28.88}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pwVoltageCurrent.Ii, vE.Ii) annotation (Line(
      points={{-51.28,-35},{-35.37,-35},{-35.37,-37.52},{-20.4,-37.52}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pwVoltageCurrent.Vr, vE.Vr) annotation (Line(
      points={{-51.6,-13.5},{-41.525,-13.5},{-41.525,-12.32},{-20.4,-12.32}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pwVoltageCurrent.p, Gen_terminal) annotation (Line(
      points={{-82,-33},{-84,-33},{-84,98}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwVoltageCurrent.n, Bus) annotation (Line(
      points={{-50,-3},{-42,-3},{-42,98},{214,98}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(limiter1.y, lV_Gate.n1) annotation (Line(
      points={{251,62},{260,62},{260,62.5},{262.625,62.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(V_OEL.y, lV_Gate.n2) annotation (Line(
      points={{244.6,28},{256,28},{256,51.5},{262.625,51.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(lV_Gate.p, product.u1) annotation (Line(
      points={{284.625,57},{285.745,57},{285.745,57.2},{290.6,57.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VA.y, add1.u2) annotation (Line(points={{115,54},{127,54},{127,54}}, color={0,0,127}));
  connect(VA.u, limiter.y) annotation (Line(points={{92,54},{75,54},{75,54}}, color={0,0,127}));
  connect(VR1.y, add.u2) annotation (Line(points={{6.9,37},{26,37},{26,50.4},{32.8,50.4}}, color={0,0,127}));
  connect(VM1.u, add1.y) annotation (Line(points={{160.2,31},{142,31},{142,57},{138.5,57}}, color={0,0,127}));
  connect(VM1.y, add2.u2) annotation (Line(points={{180.9,31},{200,31},{200,58.4},{208.8,58.4}}, color={0,0,127}));
  connect(add3_1.y, Gain1.u) annotation (Line(points={{-25,56},{-22,56},{-22,72},{-14,72}}, color={0,0,127}));
  connect(VR1.u, Gain1.u) annotation (Line(points={{-13.8,37},{-22,37},{-22,72},{-14,72}}, color={0,0,127}));
  connect(Vm.u, ECOMP) annotation (Line(points={{-91.8,15},{-97.9,15},{-97.9,15},{-119,15}}, color={0,0,127}));
  connect(V_REF.y, add3.u2) annotation (Line(points={{-87.4,-6},{-78,-6},{-78,-8},{-62,-8},{-62,10.8},{-59.4,10.8}}, color={0,0,127}));
  connect(Vm.y, add3.u1) annotation (Line(points={{-71.1,15},{-62,15},{-62,19.2},{-59.4,19.2}}, color={0,0,127}));
  connect(add3.y, add3_1.u3) annotation (Line(points={{-43.3,15},{-32,15},{-32,38},{-58,38},{-58,48},{-48,48}}, color={0,0,127}));
  connect(VOTHSG, add3_1.u1) annotation (Line(points={{-119,63},{-84.5,63},{-84.5,64},{-48,64}}, color={0,0,127}));
  connect(VUEL, add3_1.u2) annotation (Line(points={{-123,-27},{-64,-27},{-64,56},{-48,56}}, color={0,0,127}));
  connect(fEX.y, product1.u2) annotation (Line(points={{117.3,-85},{134,-85},{134,-33.2},{144.6,-33.2}}, color={0,0,127}));
  connect(division.y, fEX.u) annotation (Line(points={{82.7,-85},{86.35,-85},{90,-85}}, color={0,0,127}));
  connect(gain2.y, division.u2) annotation (Line(points={{52.7,-81},{59.35,-81},{59.35,-80.8},{66.6,-80.8}}, color={0,0,127}));
  connect(gain2.u, product1.u1) annotation (Line(points={{36.6,-81},{20,-81},{20,-60},{80,-60},{80,-26},{81.2,-25.64},{81.2,-24.8},{144.6,-24.8}}, color={0,0,127}));
  connect(XADIFD, division.u1) annotation (Line(points={{-119,-91},{-27.5,-91},{-27.5,-89.2},{66.6,-89.2}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-160},{340,160}}), graphics={Text(
          extent={{70,76},{94,62}},
          lineColor={255,0,0},
          textString="VR"),Text(
          extent={{44,44},{50,34}},
          lineColor={255,0,0},
          textString="VH"),Text(
          extent={{116,-90},{142,-98}},
          lineColor={255,0,0},
          textString="FEX"),Text(
          extent={{66,-2},{90,-16}},
          lineColor={255,0,0},
          textString="VE"),Text(
          extent={{210,-4},{234,-18}},
          lineColor={255,0,0},
          textString="VB")}),
    Icon(coordinateSystem(extent={{-100,-160},{340,160}}, preserveAspectRatio=true), graphics={Text(
          extent={{-18,-10},{190,-106}},
          lineColor={0,0,255},
          textString="ESST4B"),Rectangle(extent={{-98,62},{228,-178}}, lineColor={0,0,255}),Text(
          extent={{-88,8},{-22,-72}},
          lineColor={0,0,255},
          textString="ECOMP"),Text(
          extent={{-90,52},{-18,-32}},
          lineColor={0,0,255},
          textString="VOTHSG"),Text(
          extent={{-88,-88},{-38,-146}},
          lineColor={0,0,255},
          textString="XadIfd"),Text(
          extent={{-92,-150},{-34,-174}},
          lineColor={0,0,255},
          textString="EFD0"),Text(
          extent={{-84,-46},{-34,-104}},
          lineColor={0,0,255},
          textString="VUEL"),Text(
          extent={{-60,76},{-10,18}},
          lineColor={0,0,255},
          textString="GenT")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSS/E Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>Unknown</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Mengjia Zhang,SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>", revisions="<html>
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
