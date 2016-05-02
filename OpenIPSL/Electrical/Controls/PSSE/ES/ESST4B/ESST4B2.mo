within OpenIPSL.Electrical.Controls.PSSE.ES.ESST4B;
model ESST4B2 " IEEE type ST4B potential or compounded
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
    T=T_R,
    y_start=V0,
    K=1) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=0,
        origin={-89,-35})));
  Modelica.Blocks.Interfaces.RealInput EC annotation (Placement(transformation(extent={{-138,-54},{-100,-16}}), iconTransformation(extent={{-138,-54},{-100,-16}})));
  Modelica.Blocks.Interfaces.RealInput VOTHSG annotation (Placement(transformation(extent={{-138,-6},{-100,32}}), iconTransformation(extent={{-138,-6},{-100,32}})));
  Modelica.Blocks.Sources.Constant V_REF(k=VREF) annotation (Placement(transformation(extent={{-96,-64},{-84,-52}})));
  NonElectrical.Logical.LV_GATE lV_Gate annotation (Placement(transformation(extent={{264,-4},{286,18}})));
  Modelica.Blocks.Sources.Constant V_OEL(k=1000) annotation (Placement(transformation(extent={{232,-28},{244,-16}})));
  Modelica.Blocks.Interfaces.RealInput IFD
    annotation (Placement(transformation(
        extent={{-19,-19},{19,19}},
        rotation=0,
        origin={-119,-141}), iconTransformation(extent={{-17,-17},{17,17}}, origin={-119,-117})));
  NonElectrical.Nonlinear.FEX fEX annotation (Placement(transformation(extent={{92,-150},{122,-120}})));
  Modelica.Blocks.Math.Product product annotation (Placement(transformation(extent={{292,-4},{306,10}})));
  Modelica.Blocks.Interfaces.RealOutput EFD annotation (Placement(transformation(extent={{230,-100},{250,-80}}), iconTransformation(extent={{230,-100},{250,-80}})));
  Modelica.Blocks.Interfaces.RealInput EFD0
    annotation (Placement(transformation(
        extent={{-17,-17},{17,17}},
        rotation=0,
        origin={-121,-195}), iconTransformation(extent={{-17,-17},{17,17}}, origin={-121,-161})));
  Modelica.Blocks.Interfaces.RealInput VUEL
    annotation (Placement(transformation(
        extent={{-19,-19},{19,19}},
        rotation=0,
        origin={-123,-77}), iconTransformation(extent={{-17,-17},{17,17}}, origin={-121,-75})));
  NonElectrical.Continuous.SimpleLag VA(
    T=T_A,
    y_start=Efd0*K_G,
    K=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={108,4})));
  Modelica.Blocks.Continuous.LimIntegrator VR1(
    k=K_IR,
    outMin=V_RMIN/K_PR,
    outMax=V_RMAX/K_PR,
    y_start=Efd0*K_G) annotation (Placement(transformation(extent={{-12,-22},{6,-4}})));
  Modelica.Blocks.Math.Gain Gain1(k=K_PR) annotation (Placement(transformation(extent={{-12,12},{8,32}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_RMAX, uMin=V_RMIN) annotation (Placement(transformation(extent={{54,-6},{74,14}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{34,-2},{46,10}})));
  Modelica.Blocks.Math.Add add1(k1=-1) annotation (Placement(transformation(extent={{128,2},{138,12}})));
  Modelica.Blocks.Math.Gain gain(k=K_G) annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=180,
        origin={195,59})));
  Modelica.Blocks.Continuous.LimIntegrator VM1(
    k=K_IR,
    outMin=V_MMIN/K_PM,
    outMax=V_MMAX/K_PM,
    y_start=Efd0/VB0) annotation (Placement(transformation(extent={{166,-26},{186,-6}})));
  Modelica.Blocks.Math.Gain Gain2(k=K_PM) annotation (Placement(transformation(extent={{164,12},{184,32}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=V_RMAX, uMin=V_RMIN) annotation (Placement(transformation(extent={{228,2},{248,22}})));
  Modelica.Blocks.Math.Add add2 annotation (Placement(transformation(extent={{210,6},{222,18}})));
  VE vE annotation (Placement(transformation(extent={{-20,-92},{44,-56}})));
  Modelica.Blocks.Math.Product VB annotation (Placement(transformation(extent={{146,-86},{160,-72}})));
  Modelica.Blocks.Nonlinear.Limiter maxLimiter(uMax=V_BMAX, uMin=-Modelica.Constants.inf) annotation (Placement(transformation(extent={{176,-90},{198,-68}})));
  Modelica.Blocks.Math.Add3 add3_1 annotation (Placement(transformation(extent={{-48,-8},{-28,12}})));
  Modelica.Blocks.Math.Add add3(k1=-1) annotation (Placement(transformation(extent={{-68,-28},{-54,-14}})));
  Modelica.Blocks.Math.Division division annotation (Placement(transformation(
        extent={{-7,7},{7,-7}},
        rotation=0,
        origin={75,-135})));
  Modelica.Blocks.Math.Gain gain2(k=K_C) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=0,
        origin={45,-131})));
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

  Modelica.Blocks.Sources.Constant cons(k=Vr0) annotation (Placement(transformation(extent={{-66,-52},{-54,-40}})));
  Modelica.Blocks.Sources.Constant cons1(k=Vi0) annotation (Placement(transformation(extent={{-66,-74},{-54,-62}})));
  Modelica.Blocks.Sources.Constant cons2(k=Ir0) annotation (Placement(transformation(extent={{-66,-100},{-54,-88}})));
  Modelica.Blocks.Sources.Constant cons3(k=Ii0) annotation (Placement(transformation(extent={{-66,-122},{-54,-110}})));
initial equation
  KCIFD0 = K_C*IFD;
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
      points={{306.7,3},{336,3},{336,-90},{240,-90}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gain1.y, add.u1) annotation (Line(
      points={{9,22},{26,22},{26,7.6},{32.8,7.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add.y, limiter.u) annotation (Line(
      points={{46.6,4},{52,4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gain2.y, add2.u1) annotation (Line(
      points={{185,22},{198,22},{198,15.6},{208.8,15.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add2.y, limiter1.u) annotation (Line(
      points={{222.6,12},{226,12}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gain2.u, add1.y) annotation (Line(
      points={{162,22},{142,22},{142,7},{138.5,7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add1.u1, gain.y) annotation (Line(
      points={{127,10},{124,10},{124,59},{185.1,59}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain.u, EFD) annotation (Line(
      points={{205.8,59},{336,59},{336,-90},{240,-90}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(vE.VE, VB.u1) annotation (Line(
      points={{50.4,-73.64},{81.2,-73.64},{81.2,-74.8},{144.6,-74.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VB.y, maxLimiter.u) annotation (Line(
      points={{160.7,-79},{173.8,-79}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(maxLimiter.y, product.u2) annotation (Line(
      points={{199.1,-79},{280,-79},{280,-1.2},{290.6,-1.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cons.y, vE.Vr) annotation (Line(
      points={{-53.4,-46},{-48,-46},{-48,-60},{-26.4,-60},{-26.4,-60.32}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cons1.y, vE.Vi) annotation (Line(
      points={{-53.4,-68},{-40,-68},{-40,-68.6},{-26.4,-68.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cons2.y, vE.Ir) annotation (Line(
      points={{-53.4,-94},{-42,-94},{-42,-76.88},{-26.4,-76.88}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cons3.y, vE.Ii) annotation (Line(
      points={{-53.4,-116},{-38,-116},{-38,-85.52},{-26.4,-85.52}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limiter1.y, lV_Gate.n1) annotation (Line(
      points={{249,12},{258,12},{258,12.5},{262.625,12.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(V_OEL.y, lV_Gate.n2) annotation (Line(
      points={{244.6,-22},{256,-22},{256,1.5},{262.625,1.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(lV_Gate.p, product.u1) annotation (Line(
      points={{284.625,7},{285.745,7},{285.745,7.2},{290.6,7.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VR1.y, add.u2) annotation (Line(points={{6.9,-13},{26,-13},{26,0.4},{32.8,0.4}}, color={0,0,127}));
  connect(VM1.y, add2.u2) annotation (Line(points={{187,-16},{200,-16},{200,8.4},{208.8,8.4}}, color={0,0,127}));
  connect(EC, Vm.u) annotation (Line(points={{-119,-35},{-97.4,-35}}, color={0,0,127}));
  connect(add3_1.y, Gain1.u) annotation (Line(points={{-27,2},{-20,2},{-20,22},{-14,22}}, color={0,0,127}));
  connect(VR1.u, Gain1.u) annotation (Line(points={{-13.8,-13},{-20,-13},{-20,22},{-14,22}}, color={0,0,127}));
  connect(Vm.y, add3.u1) annotation (Line(points={{-81.3,-35},{-80,-35},{-80,-36},{-78,-36},{-78,-16.8},{-69.4,-16.8}}, color={0,0,127}));
  connect(V_REF.y, add3.u2) annotation (Line(points={{-83.4,-58},{-76,-58},{-76,-25.2},{-69.4,-25.2}}, color={0,0,127}));
  connect(add3.y, add3_1.u3) annotation (Line(points={{-53.3,-21},{-50,-21},{-50,-6}}, color={0,0,127}));
  connect(VOTHSG, add3_1.u1) annotation (Line(points={{-119,13},{-84.5,13},{-84.5,10},{-50,10}}, color={0,0,127}));
  connect(VUEL, add3_1.u2) annotation (Line(points={{-123,-77},{-76,-77},{-76,2},{-50,2}}, color={0,0,127}));
  connect(VA.y, add1.u2) annotation (Line(points={{119,4},{127,4},{127,4}}, color={0,0,127}));
  connect(limiter.y, VA.u) annotation (Line(points={{75,4},{96,4},{96,4}}, color={0,0,127}));
  connect(VM1.u, add1.y) annotation (Line(points={{164,-16},{154,-16},{154,-18},{142,-18},{142,7},{138.5,7}}, color={0,0,127}));
  connect(fEX.y, VB.u2) annotation (Line(points={{123.5,-135},{134,-135},{134,-83.2},{144.6,-83.2}}, color={0,0,127}));
  connect(division.y, fEX.u) annotation (Line(points={{82.7,-135},{87.35,-135},{87.35,-135},{92,-135}}, color={0,0,127}));
  connect(gain2.y, division.u2) annotation (Line(points={{52.7,-131},{59.35,-131},{59.35,-130.8},{66.6,-130.8}}, color={0,0,127}));
  connect(gain2.u, VB.u1) annotation (Line(points={{36.6,-131},{20,-131},{20,-100},{72,-100},{72,-74},{81.2,-73.64},{81.2,-74.8},{144.6,-74.8}}, color={0,0,127}));
  connect(IFD, division.u1) annotation (Line(points={{-119,-141},{-26.5,-141},{-26.5,-139.2},{66.6,-139.2}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-180},{340,100}}), graphics={Text(
          extent={{70,26},{94,12}},
          lineColor={255,0,0},
          textString="VR"),Text(
          extent={{44,-6},{50,-16}},
          lineColor={255,0,0},
          textString="VH"),Text(
          extent={{116,-140},{142,-148}},
          lineColor={255,0,0},
          textString="FEX"),Text(
          extent={{66,-52},{90,-66}},
          lineColor={255,0,0},
          textString="VE"),Text(
          extent={{210,-54},{234,-68}},
          lineColor={255,0,0},
          textString="VB")}),
    Icon(coordinateSystem(extent={{-100,-180},{340,100}}, preserveAspectRatio=true), graphics={Text(
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
end ESST4B2;
