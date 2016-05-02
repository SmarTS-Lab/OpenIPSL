within OpenIPSL.Electrical.Controls.PSSE.ES;
model EXAC2 "IEEE Type AC2 Excitation System"
  import OpenIPSL.NonElectrical.Functions.SE;
  Modelica.Blocks.Sources.Constant Vref(k=VREF) annotation (Placement(transformation(extent={{-130,-10},{-116,4}})));
  Modelica.Blocks.Interfaces.RealInput XADIFD "Machine field current (pu)" annotation (Placement(transformation(extent={{-166,34},{-154,46}}), iconTransformation(extent={{-164,34},{-154,46}})));
  Modelica.Blocks.Interfaces.RealInput ECOMP
    "Voltage regultor compensated voltage (pu)"
    annotation (Placement(transformation(extent={{-164,14},{-152,26}}), iconTransformation(extent={{-164,14},{-152,26}})));
  Modelica.Blocks.Interfaces.RealInput VOTHSG "Stabilizer signal (pu)" annotation (Placement(transformation(extent={{-164,-26},{-152,-14}}), iconTransformation(extent={{-164,-26},{-152,-14}})));
  Modelica.Blocks.Interfaces.RealInput VOEL
    "Maximum excitation limiter signal (pu)"
    annotation (Placement(transformation(extent={{-164,-66},{-152,-54}}), iconTransformation(extent={{-164,-66},{-152,-54}})));
  NonElectrical.Nonlinear.FEX fEX annotation (Placement(transformation(extent={{80,48},{64,64}})));
  Modelica.Blocks.Interfaces.RealOutput EFD "Generator main field voltage (pu)"
                                                                                annotation (Placement(transformation(extent={{160,-6},{170,6}})));
  parameter Real VREF=1 "Reference terminal voltage (pu)";
  parameter Real T_R=0 "Voltage input time constant (s)";
  parameter Real T_B=0 "AVR lead-lag time constant (s)";
  parameter Real T_C=0 "AVR lead-lag time constant (s)";
  parameter Real K_A=400 "AVR gain";
  parameter Real T_A=0.02 "AVR time constant (s)";
  parameter Real V_AMAX=9 "Maximum AVR output (pu)";
  parameter Real V_AMIN=-5.43 "Minimum AVR output (pu)";
  parameter Real K_B;
  parameter Real V_RMAX;
  parameter Real V_RMIN;
  parameter Real T_E=0.8 "Exciter time constant (s)";
  parameter Real K_L;
  parameter Real K_H;
  parameter Real K_F=0.03 "Rate feedback gain (pu)";
  parameter Real T_F=1 "Rate feedback time constant (s)";
  parameter Real K_C=0.2 "Rectifier load factor (pu)";
  parameter Real K_D=0.48 "Exciter demagnetizing factor (pu)";
  parameter Real K_E=1 "Exciter field factor (pu)";
  parameter Real V_LR "Limit value of excitation voltage (pu)";
  parameter Real E_1=5.25 "Exciter saturation point 1 (pu)";
  parameter Real E_2=7 "Exciter saturation point 2 (pu)";
  parameter Real S_EE_1=0.03 "Saturation factor at E1";
  parameter Real S_EE_2=0.1 "Saturation factor at E2";
  Modelica.Blocks.Continuous.Derivative imDerivativeLag(
    k=K_F,
    T=T_F,
    y_start=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput) annotation (Placement(transformation(
        extent={{7,-6},{-7,6}},
        rotation=0,
        origin={-59,0})));
  NonElectrical.Continuous.SimpleLag imSimpleLag(
    K=1,
    T=T_R,
    y_start=EC0) annotation (Placement(transformation(extent={{-132,-40},{-116,-24}})));
  Modelica.Blocks.Interfaces.RealInput VUEL
    "Minimum excitation limiter signal (pu)"
    annotation (Placement(transformation(extent={{-164,-46},{-152,-34}}), iconTransformation(extent={{-164,-46},{-152,-34}})));
  NonElectrical.Continuous.LeadLag imLeadLag(
    K=1,
    T1=T_C,
    T2=T_B,
    y_start=VA0/K_A) annotation (Placement(transformation(extent={{-60,-34},{-48,-22}})));
  Modelica.Blocks.Math.Gain gain(k=K_H) annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=0,
        origin={-32,-12})));
  NonElectrical.Logical.LV_GATE lV_GATE annotation (Placement(transformation(extent={{10,-38},{30,-18}})));
  Modelica.Blocks.Math.Gain gain1(k=K_B) annotation (Placement(transformation(extent={{32,-34},{42,-24}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_RMAX, uMin=V_RMIN) annotation (Placement(transformation(extent={{50,-34},{60,-24}})));
  NonElectrical.Functions.ImSE imSE(
    SE1=S_EE_1,
    SE2=S_EE_2,
    E1=E_1,
    E2=E_2) annotation (Placement(transformation(extent={{92,14},{72,34}})));
  Modelica.Blocks.Math.Gain gain2(k=K_E) annotation (Placement(transformation(extent={{86,0},{78,8}})));
  Modelica.Blocks.Sources.Constant Vref1(k=V_LR) annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=270,
        origin={-17,55})));
  Modelica.Blocks.Interfaces.RealInput EFD0
    "Initial value of generator main field voltage (pu)"
    annotation (Placement(transformation(extent={{-164,54},{-152,66}}), iconTransformation(extent={{-164,54},{-152,66}})));
  Modelica.Blocks.Math.Add3 add3_1 annotation (Placement(transformation(extent={{-120,-62},{-108,-50}})));
  Modelica.Blocks.Math.Add3 add3_2(k2=-1) annotation (Placement(transformation(extent={{-94,-38},{-84,-28}})));
  Modelica.Blocks.Math.Add add1(k1=-1) annotation (Placement(transformation(extent={{-76,-34},{-64,-22}})));
  Modelica.Blocks.Math.Add add2(k1=-1) annotation (Placement(transformation(extent={{-10,-30},{2,-18}})));
  Modelica.Blocks.Math.Add add3(k1=-1, k2=+1) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-14,10})));
  Modelica.Blocks.Math.Gain gain3(k=K_L) annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=270,
        origin={-14,-8})));
  Modelica.Blocks.Math.Add add4(k1=-1) annotation (Placement(transformation(extent={{68,-32},{80,-20}})));
  Modelica.Blocks.Continuous.LimIntegrator limIntegrator(
    k=1/T_E,
    outMax=Modelica.Constants.inf,
    outMin=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=VE0) annotation (Placement(transformation(extent={{92,-32},{104,-20}})));
  Modelica.Blocks.Math.Product product annotation (Placement(transformation(extent={{140,-8},{156,8}})));
  Modelica.Blocks.Math.Add add5(k1=+1) annotation (Placement(transformation(extent={{64,6},{52,18}})));
  Modelica.Blocks.Math.Division division annotation (Placement(transformation(extent={{118,48},{104,62}})));
  Modelica.Blocks.Math.Gain gain4(k=K_C) annotation (Placement(transformation(extent={{98,50},{88,60}})));
  Modelica.Blocks.Math.Gain gain5(k=K_D) annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=90,
        origin={43,29})));
  Modelica.Blocks.Math.Add add6(k1=+1) annotation (Placement(transformation(extent={{38,10},{26,22}})));
  NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=K_A,
    T=T_A,
    y_start=VA0,
    outMax=V_AMAX,
    outMin=V_AMIN) annotation (Placement(transformation(extent={{-36,-34},{-24,-22}})));
protected
  parameter Real EC0(fixed=false);
  parameter Real VA0(fixed=false);
  parameter Real VR0(fixed=false);
  parameter Real VFE0(fixed=false);
  parameter Real Efd0(fixed=false);
  parameter Real Ifd0(fixed=false);
  parameter Real VE0(fixed=false);
initial equation
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
  VA0 = VR0/K_B + VFE0*K_H;
  EC0 = ECOMP;
equation
  connect(imSimpleLag.u, ECOMP) annotation (Line(points={{-133.6,-32},{-136,-32},{-136,20},{-158,20}}, color={0,0,127}));
  connect(VUEL, add3_1.u2) annotation (Line(points={{-158,-40},{-146,-40},{-146,-56},{-121.2,-56}}, color={0,0,127}));
  connect(VOEL, add3_1.u3) annotation (Line(points={{-158,-60},{-121.2,-60},{-121.2,-60.8}}, color={0,0,127}));
  connect(VOTHSG, add3_1.u1) annotation (Line(points={{-158,-20},{-142,-20},{-142,-51.2},{-121.2,-51.2}}, color={0,0,127}));
  connect(Vref.y, add3_2.u1) annotation (Line(points={{-115.3,-3},{-100,-3},{-100,-29},{-95,-29}}, color={0,0,127}));
  connect(imSimpleLag.y, add3_2.u2) annotation (Line(points={{-115.2,-32},{-95,-32},{-95,-33}}, color={0,0,127}));
  connect(add3_1.y, add3_2.u3) annotation (Line(points={{-107.4,-56},{-100,-56},{-100,-37},{-95,-37}}, color={0,0,127}));
  connect(add1.y, imLeadLag.u) annotation (Line(points={{-63.4,-28},{-61.2,-28}}, color={0,0,127}));
  connect(add3_2.y, add1.u2) annotation (Line(points={{-83.5,-33},{-80,-33},{-80,-31.6},{-77.2,-31.6}}, color={0,0,127}));
  connect(imDerivativeLag.y, add1.u1) annotation (Line(points={{-66.7,0},{-82,0},{-82,-24.4},{-77.2,-24.4}}, color={0,0,127}));
  connect(add2.y, lV_GATE.n1) annotation (Line(points={{2.6,-24},{8.75,-24},{8.75,-23}}, color={0,0,127}));
  connect(add2.u1, gain.y) annotation (Line(points={{-11.2,-20.4},{-20,-20.4},{-20,-14},{-27.6,-14},{-27.6,-12}}, color={0,0,127}));
  connect(Vref1.y, add3.u2) annotation (Line(points={{-17,45.1},{-17,26.525},{-17.6,26.525},{-17.6,17.2}}, color={0,0,127}));
  connect(gain3.u, add3.y) annotation (Line(points={{-14,-3.2},{-14,3.4}}, color={0,0,127}));
  connect(gain3.y, lV_GATE.n2) annotation (Line(points={{-14,-12.4},{-14,-12.4},{-14,-40},{10,-40},{10,-33},{8.75,-33}}, color={0,0,127}));
  connect(lV_GATE.p, gain1.u) annotation (Line(points={{28.75,-28},{30.95,-28},{30.95,-29},{31,-29}}, color={0,0,127}));
  connect(gain1.y, limiter.u) annotation (Line(points={{42.5,-29},{46.25,-29},{49,-29}}, color={0,0,127}));
  connect(limiter.y, add4.u2) annotation (Line(points={{60.5,-29},{64.25,-29},{64.25,-29.6},{66.8,-29.6}}, color={0,0,127}));
  connect(add4.y, limIntegrator.u) annotation (Line(points={{80.6,-26},{90.8,-26}}, color={0,0,127}));
  connect(product.y, EFD) annotation (Line(points={{156.8,0},{165,0},{165,0}}, color={0,0,127}));
  connect(limIntegrator.y, product.u2) annotation (Line(points={{104.6,-26},{130,-26},{130,-4.8},{138.4,-4.8}}, color={0,0,127}));
  connect(imSE.VE_IN, product.u2) annotation (Line(points={{93,24},{130,24},{130,-4.8},{138.4,-4.8}}, color={0,0,127}));
  connect(gain2.u, product.u2) annotation (Line(points={{86.8,4},{130,4},{130,-4.8},{138.4,-4.8}}, color={0,0,127}));
  connect(add5.u1, imSE.VE_OUT) annotation (Line(points={{65.2,15.6},{68,15.6},{68,24},{71.4,24}}, color={0,0,127}));
  connect(add5.u2, gain2.y) annotation (Line(points={{65.2,8.4},{68,8.4},{68,4},{77.6,4}}, color={0,0,127}));
  connect(XADIFD, division.u2) annotation (Line(points={{-160,40},{-14,40},{130,40},{130,50.8},{119.4,50.8}}, color={0,0,127}));
  connect(gain4.u, division.y) annotation (Line(points={{99,55},{106,55},{103.3,55}}, color={0,0,127}));
  connect(division.u1, product.u2) annotation (Line(points={{119.4,59.2},{130,59.2},{130,-4.8},{138.4,-4.8}}, color={0,0,127}));
  connect(gain5.u, division.u2) annotation (Line(points={{43,35},{43,40},{130,40},{130,50.8},{119.4,50.8}}, color={0,0,127}));
  connect(add6.u1, gain5.y) annotation (Line(points={{39.2,19.6},{43,19.6},{43,23.5}}, color={0,0,127}));
  connect(add6.u2, add5.y) annotation (Line(points={{39.2,12.4},{41.6,12.4},{41.6,12},{51.4,12}}, color={0,0,127}));
  connect(imDerivativeLag.u, add6.y) annotation (Line(points={{-50.6,0},{8,0},{8,16},{25.4,16}}, color={0,0,127}));
  connect(gain.u, add6.y) annotation (Line(points={{-36.8,-12},{-42,-12},{-42,0},{8,0},{8,16},{25.4,16}}, color={0,0,127}));
  connect(add3.u1, add6.y) annotation (Line(points={{-10.4,17.2},{-10.4,20},{8,20},{8,16},{25.4,16}}, color={0,0,127}));
  connect(add4.u1, add6.y) annotation (Line(points={{66.8,-22.4},{62,-22.4},{62,0},{8,0},{8,16},{25.4,16}}, color={0,0,127}));
  connect(imLeadLag.y, simpleLagLim.u) annotation (Line(points={{-47.4,-28},{-37.2,-28}}, color={0,0,127}));
  connect(simpleLagLim.y, add2.u2) annotation (Line(points={{-23.4,-28},{-11.2,-28},{-11.2,-27.6}}, color={0,0,127}));
  connect(fEX.u, gain4.y) annotation (Line(points={{80,56},{84,56},{84,55},{87.5,55}}, color={0,0,127}));
  connect(fEX.y, product.u1) annotation (Line(points={{63.2,56},{58,56},{58,34},{134,34},{134,4.8},{138.4,4.8}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-160,-80},{160,80}}), graphics={Text(
          extent={{-124,-18},{-114,-26}},
          lineColor={0,0,255},
          textString="VREF"),Text(
          extent={{-8,28},{2,22}},
          lineColor={255,0,0},
          textString="V"),Text(
          extent={{-4,24},{4,22}},
          lineColor={255,0,0},
          textString="FE"),Text(
          extent={{-170,60},{-160,54}},
          lineColor={255,0,0},
          textString="V"),Text(
          extent={{-160,56},{-166,54}},
          lineColor={255,0,0},
          textString="F")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-160,-80},{160,80}}), graphics={Rectangle(extent={{-160,80},{160,-80}}, lineColor={0,0,255}),Text(
          extent={{-150,64},{-128,54}},
          lineColor={0,0,255},
          textString="EFD0"),Text(
          extent={{-150,28},{-120,12}},
          lineColor={0,0,255},
          textString="ECOMP"),Text(
          extent={{-154,-16},{-106,-26}},
          lineColor={0,0,255},
          textString="VOTHSG"),Text(
          extent={{-154,-36},{-122,-46}},
          lineColor={0,0,255},
          textString="VUEL"),Text(
          extent={{128,8},{158,-8}},
          lineColor={0,0,255},
          textString="EFD"),Text(
          extent={{-52,32},{52,-30}},
          lineColor={0,0,255},
          textString="EXAC2"),Text(
          extent={{-150,50},{-118,30}},
          lineColor={0,0,255},
          textString="XADIFD"),Text(
          extent={{-154,-56},{-122,-66}},
          lineColor={0,0,255},
          textString="VOEL")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>EXAC2, PSS/E Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-08-25</td>
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
end EXAC2;
