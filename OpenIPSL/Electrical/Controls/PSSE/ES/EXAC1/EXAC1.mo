within OpenIPSL.Electrical.Controls.PSSE.ES.EXAC1;
model EXAC1
  import OpenIPSL.NonElectrical.Functions.SE;
  Modelica.Blocks.Sources.Constant Vref(k=VREF) annotation (Placement(transformation(extent={{-108,-86},{-94,-72}})));
  Modelica.Blocks.Interfaces.RealInput XADIFD "Field current" annotation (Placement(transformation(extent={{-108,38},{-94,52}}), iconTransformation(extent={{-100,54},{-90,66}})));
  Modelica.Blocks.Interfaces.RealInput ECOMP "Compensated generator terminal voltage"
    annotation (Placement(transformation(extent={{-104,14},{-94,26}}), iconTransformation(extent={{-100,-6},{-90,6}})));
  Modelica.Blocks.Interfaces.RealInput VOTHSG "PSS output signal" annotation (Placement(transformation(extent={{-122,-26},{-112,-14}}), iconTransformation(extent={{-100,34},{-90,46}})));
  Modelica.Blocks.Interfaces.RealInput VOEL "OEL output" annotation (Placement(transformation(extent={{-122,-46},{-112,-34}}), iconTransformation(extent={{-100,-56},{-90,-44}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLagLim imLimitedSimpleLag(
    K=K_A,
    T=T_A,
    outMin=V_RMIN,
    outMax=V_RMAX,
    y_start=VR0) annotation (Placement(transformation(extent={{0,-36},{16,-20}})));
  Modelica.Blocks.Sources.Constant imSetPoint3(k=K_E) annotation (Placement(transformation(extent={{76,14},{64,26}})));
  NonElectrical.Nonlinear.FEX fEX annotation (Placement(transformation(extent={{2,62},{18,78}})));
  Modelica.Blocks.Interfaces.RealOutput EFD "Excitation voltage" annotation (Placement(transformation(extent={{128,-6},{138,6}}), iconTransformation(extent={{100,-6},{110,6}})));
  parameter Real T_R=0 "Voltage input time constant (s)";
  parameter Real T_B=0 "AVR lead-lag time constant (s)";
  parameter Real T_C=0 "AVR lead-lag time constant (s)";
  parameter Real K_A=400 "AVR gain (pu)";
  parameter Real T_A=0.02 "AVR time constant (s)";
  parameter Real V_RMAX=9 "Maximum AVR output (pu)";
  parameter Real V_RMIN=-5.43 "Minimum AVR output (pu)";
  parameter Real T_E=0.8 "Exciter time constant (s)";
  parameter Real K_F=0.03 "Rate feedback gain (pu)";
  parameter Real T_F=1 "Rate feedback time const (s)";
  parameter Real K_C=0.2 "Rectifier load factor (pu)";
  parameter Real K_D=0.48 "Exciter demagnetizing factor (pu)";
  parameter Real K_E=1 "Exciter field factor (pu)";
  parameter Real E_1=5.25 "Exciter saturation point 1 (pu)";
  parameter Real E_2=7 "Exciter saturation point 2 (pu)";
  parameter Real S_EE_1=0.03 "Saturation at E1";
  parameter Real S_EE_2=0.1 "Saturation at E2";
  Modelica.Blocks.Continuous.Derivative imDerivativeLag(
    k=K_F,
    T=T_F,
    y_start=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput) annotation (Placement(transformation(extent={{-20,-8},{-36,8}})));
  NonElectrical.Continuous.LeadLag leadLag(
    K=1,
    T1=T_C,
    T2=T_B,
    y_start=VR0/K_A) annotation (Placement(transformation(extent={{-28,-36},{-12,-20}})));
  Modelica.Blocks.Math.Add3 add3_1(k2=-1, k1=-1) annotation (Placement(transformation(extent={{-56,-36},{-40,-20}})));
  NonElectrical.Continuous.SimpleLag simpleLag(
    K=1,
    T=T_R,
    y_start=ECOMP0) annotation (Placement(transformation(extent={{-86,12},{-70,28}})));
  Modelica.Blocks.Math.Add add(k1=-1) annotation (Placement(transformation(extent={{30,-36},{46,-20}})));
  Modelica.Blocks.Continuous.LimIntegrator limIntegrator(
    k=1/T_E,
    outMax=Modelica.Constants.inf,
    outMin=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=VE0) annotation (Placement(transformation(extent={{56,-36},{72,-20}})));
  NonElectrical.Functions.ImSE imSE(
    SE1=S_EE_1,
    SE2=S_EE_2,
    E1=E_1,
    E2=E_2) annotation (Placement(transformation(extent={{80,30},{60,50}})));
  Modelica.Blocks.Math.Add add1 annotation (Placement(transformation(extent={{46,24},{36,34}})));
  Modelica.Blocks.Math.Product product annotation (Placement(transformation(extent={{24,20},{14,30}})));
  Modelica.Blocks.Math.Add add2 annotation (Placement(transformation(extent={{2,24},{-8,34}})));
  Modelica.Blocks.Math.Gain gain(k=K_D) annotation (Placement(transformation(extent={{-6,40},{4,50}})));
  Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(extent={{100,-6},{112,6}})));
  Modelica.Blocks.Math.Division division annotation (Placement(transformation(extent={{-56,64},{-44,76}})));
  Modelica.Blocks.Math.Gain gain1(k=K_C) annotation (Placement(transformation(extent={{-30,64},{-18,76}})));
  Modelica.Blocks.Math.Add3 add3_2(k1=+1, k2=+1) annotation (Placement(transformation(extent={{-102,-48},{-86,-32}})));
  Modelica.Blocks.Interfaces.RealInput VUEL "Under-excitation limter input" annotation (Placement(transformation(extent={{-126,-66},{-112,-52}}), iconTransformation(extent={{-100,-36},{-88,-24}})));
  Modelica.Blocks.Math.Add add3 annotation (Placement(transformation(extent={{-78,-56},{-64,-42}})));
  Modelica.Blocks.Interfaces.RealInput EFD0 annotation (Placement(transformation(extent={{-62,-82},{-40,-60}}), iconTransformation(extent={{-100,-74},{-90,-64}})));
protected
  parameter Real VREF(fixed=false) "Reference terminal voltage (pu)";
  parameter Real VR0(fixed=false);
  parameter Real Efd0(fixed=false);
  parameter Real Ifd0(fixed=false);
  parameter Real VE0(fixed=false);
  parameter Real VFE0(fixed=false);
  parameter Real ECOMP0(fixed=false);
initial equation
  ECOMP0 = ECOMP;
  Efd0 = EFD0;
  Ifd0 = XADIFD;
  // Finding initial value of excitation voltage, VE0, via going through conditions of FEX function
  if Ifd0 <= 0 then
    VE0 = Efd0;
  elseif K_C*Ifd0/(Efd0 + 0.577*K_C*Ifd0) <= 0.433 then
    VE0 = Efd0 + 0.577*K_C*Ifd0;
  elseif K_C*Ifd0/sqrt((Efd0^2 + (K_C*Ifd0)^2)/0.75) > 0.433 and K_C*Ifd0/sqrt((Efd0^2 + (K_C*Ifd0)^2)/0.75) < 0.75 then
    VE0 = sqrt((Efd0^2 + (K_C*Ifd0)^2)/0.75);
  else
    VE0 = (Efd0 + 1.732*K_C*Ifd0)/1.732;
  end if;
  // Case IN>0 not checked because it will be resolved in the next iteration
  VFE0 = VE0*(SE(
    VE0,
    S_EE_1,
    S_EE_2,
    E_1,
    E_2) + K_E) + Ifd0*K_D;
  VR0 = VFE0;
  VREF = VR0/K_A + ECOMP0;
equation
  connect(leadLag.y, imLimitedSimpleLag.u) annotation (Line(points={{-11.2,-28},{-8,-28},{-1.6,-28}}, color={0,0,127}));
  connect(add3_1.y, leadLag.u) annotation (Line(points={{-39.2,-28},{-36,-28},{-29.6,-28}}, color={0,0,127}));
  connect(ECOMP, simpleLag.u) annotation (Line(points={{-99,20},{-87.6,20}}, color={0,0,127}));
  connect(simpleLag.y, add3_1.u2) annotation (Line(points={{-69.2,20},{-66,20},{-66,-28},{-57.6,-28}}, color={0,0,127}));
  connect(imLimitedSimpleLag.y, add.u2) annotation (Line(points={{16.8,-28},{22,-28},{22,-32.8},{28.4,-32.8}}, color={0,0,127}));
  connect(add.y, limIntegrator.u) annotation (Line(points={{46.8,-28},{54.4,-28}}, color={0,0,127}));
  connect(add1.u1, imSE.VE_OUT) annotation (Line(points={{47,32},{54,32},{54,40},{59.4,40}}, color={0,0,127}));
  connect(add1.u2, imSetPoint3.y) annotation (Line(points={{47,26},{54,26},{54,20},{63.4,20}}, color={0,0,127}));
  connect(product.u1, add1.y) annotation (Line(points={{25,28},{35.5,28},{35.5,29}}, color={0,0,127}));
  connect(add2.u2, product.y) annotation (Line(points={{3,26},{8,26},{8,25},{13.5,25}}, color={0,0,127}));
  connect(gain.u, XADIFD) annotation (Line(points={{-7,45},{-101,45}}, color={0,0,127}));
  connect(gain.y, add2.u1) annotation (Line(points={{4.5,45},{8,45},{8,32},{3,32}}, color={0,0,127}));
  connect(imDerivativeLag.u, add2.y) annotation (Line(points={{-18.4,0},{-12,0},{-12,29},{-8.5,29}}, color={0,0,127}));
  connect(imDerivativeLag.y, add3_1.u1) annotation (Line(points={{-36.8,0},{-62,0},{-62,-21.6},{-57.6,-21.6}}, color={0,0,127}));
  connect(add.u1, add2.y) annotation (Line(points={{28.4,-23.2},{24,-23.2},{24,0},{-12,0},{-12,29},{-8.5,29}}, color={0,0,127}));
  connect(limIntegrator.y, imSE.VE_IN) annotation (Line(points={{72.8,-28},{86,-28},{86,40},{81,40}}, color={0,0,127}));
  connect(product.u2, imSE.VE_IN) annotation (Line(points={{25,22},{32,22},{32,8},{86,8},{86,40},{81,40}}, color={0,0,127}));
  connect(product1.y, EFD) annotation (Line(points={{112.6,0},{122,0},{133,0}}, color={0,0,127}));
  connect(product1.u2, imSE.VE_IN) annotation (Line(points={{98.8,-3.6},{86,-3.6},{86,40},{81,40}}, color={0,0,127}));
  connect(division.u1, XADIFD) annotation (Line(points={{-57.2,73.6},{-80,73.6},{-80,45},{-101,45}}, color={0,0,127}));
  connect(division.u2, imSE.VE_IN) annotation (Line(points={{-57.2,66.4},{-60,66.4},{-60,54},{86,54},{86,40},{81,40}}, color={0,0,127}));
  connect(gain1.u, division.y) annotation (Line(points={{-31.2,70},{-43.4,70}}, color={0,0,127}));
  connect(VOEL, add3_2.u2) annotation (Line(points={{-117,-40},{-103.6,-40}}, color={0,0,127}));
  connect(VOTHSG, add3_2.u1) annotation (Line(points={{-117,-20},{-108,-20},{-108,-33.6},{-103.6,-33.6}}, color={0,0,127}));
  connect(VUEL, add3_2.u3) annotation (Line(points={{-119,-59},{-108,-59},{-108,-46.4},{-103.6,-46.4}}, color={0,0,127}));
  connect(add3_2.y, add3.u1) annotation (Line(points={{-85.2,-40},{-84,-40},{-84,-44.8},{-79.4,-44.8}}, color={0,0,127}));
  connect(Vref.y, add3.u2) annotation (Line(points={{-93.3,-79},{-86,-79},{-86,-53.2},{-79.4,-53.2}}, color={0,0,127}));
  connect(add3.y, add3_1.u3) annotation (Line(points={{-63.3,-49},{-62,-49},{-62,-34.4},{-57.6,-34.4}}, color={0,0,127}));
  connect(gain1.y, fEX.u) annotation (Line(points={{-17.4,70},{-7.7,70},{2,70}}, color={0,0,127}));
  connect(fEX.y, product1.u1) annotation (Line(points={{18.8,70},{94,70},{94,3.6},{98.8,3.6}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-80},{100,80}}), graphics={Text(
          extent={{-14,78},{-8,72}},
          lineColor={255,0,0},
          textString="I"),Text(
          extent={{-10,74},{-8,74}},
          lineColor={255,0,0},
          textString="N"),Text(
          extent={{84,-28},{90,-34}},
          lineColor={255,0,0},
          textString="V"),Text(
          extent={{88,-32},{90,-32}},
          lineColor={255,0,0},
          textString="E")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-80},{100,80}}), graphics={Rectangle(extent={{-100,80},{100,-80}}, lineColor={0,0,255}),Text(
          extent={{-88,68},{-56,52}},
          lineColor={0,0,255},
          textString="XADIFD"),Text(
          extent={{-88,48},{-52,30}},
          lineColor={0,0,255},
          textString="VOTHSG"),Text(
          extent={{-92,-46},{-60,-56}},
          lineColor={0,0,255},
          textString="VOEL"),Text(
          extent={{68,8},{98,-8}},
          lineColor={0,0,255},
          textString="EFD"),Text(
          extent={{-54,34},{52,-28}},
          lineColor={0,0,255},
          textString="EXAC1"),Text(
          extent={{-88,4},{-56,-6}},
          lineColor={0,0,255},
          textString="ECOMP"),Text(
          extent={{-90,-26},{-58,-36}},
          lineColor={0,0,255},
          textString="VUEL"),Text(
          extent={{-92,-64},{-60,-74}},
          lineColor={0,0,255},
          textString="EFD0")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>EXAC2, PSS/E Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-11-26</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Tin Rabuzin, SmarTS Lab, KTH Royal Institute of Technology</p></td>
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
end EXAC1;
