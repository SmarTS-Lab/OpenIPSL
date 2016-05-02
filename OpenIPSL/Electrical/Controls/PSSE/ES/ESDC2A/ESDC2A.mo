within OpenIPSL.Electrical.Controls.PSSE.ES.ESDC2A;
model ESDC2A
  import OpenIPSL.NonElectrical.Functions.SE;
  Modelica.Blocks.Sources.Constant Vref(k=VREF) annotation (Placement(transformation(extent={{-92,12},{-80,24}})));
  Modelica.Blocks.Interfaces.RealInput ECOMP "Input, generator terminal voltage" annotation (Placement(transformation(extent={{-100,24},{-90,36}}), iconTransformation(extent={{-100,24},{-90,36}})));
  Modelica.Blocks.Interfaces.RealInput VOTHSG "Upss" annotation (Placement(transformation(extent={{-100,2},{-90,14}}), iconTransformation(extent={{-100,2},{-90,14}})));
  Modelica.Blocks.Interfaces.RealInput VOEL "OEL output" annotation (Placement(transformation(extent={{-100,-16},{-90,-4}}), iconTransformation(extent={{-100,-16},{-90,-4}})));
  Modelica.Blocks.Interfaces.RealOutput EFD "Output,excitation voltage" annotation (Placement(transformation(extent={{100,-6},{110,6}}), iconTransformation(extent={{100,-6},{110,6}})));
  parameter Real T_R=0 "Voltage input time constant (s)";
  parameter Real K_A=400 "AVR gain";
  parameter Real T_A=0.02 "AVR time constant (s)";
  parameter Real T_B=0 "AVR lead-lag time constant (s)";
  parameter Real T_C=0 "AVR lead-lag time constant (s)";
  parameter Real V_RMAX=9 "Maximum AVR output (pu)";
  parameter Real V_RMIN=-5.43 "Minimum AVR output (pu)";
  parameter Real K_E=1 "Exciter field factor (pu)";
  parameter Real T_E=0.8 "Exciter time constant (s)";
  parameter Real K_F=0.03 "Rate feedback gain (pu)";
  parameter Real T_F1=1 "Rate feedback time constant (s)";
  parameter Real E_1=5.25 "Exciter saturation point 1 (pu)";
  parameter Real E_2=7 "Exciter saturation point 2 (pu)";
  parameter Real S_EE_1=0.03 "Saturation at E1";
  parameter Real S_EE_2=0.1 "Saturation at E2";
  Modelica.Blocks.Continuous.Derivative imDerivativeLag(
    k=K_F,
    T=T_F1,
    y_start=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput) annotation (Placement(transformation(extent={{8,-6},{-4,6}})));
  NonElectrical.Logical.HV_GATE hV_GATE annotation (Placement(transformation(extent={{-16,-34},{0,-26}})));
  Modelica.Blocks.Interfaces.RealInput VUEL "UEL output" annotation (Placement(transformation(extent={{-96,-80},{-86,-68}}), iconTransformation(extent={{-100,-36},{-90,-24}})));
  Modelica.Blocks.Interfaces.RealInput VT "sensed VT" annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=270,
        origin={23,-62}), iconTransformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-10,-34})));
  Modelica.Blocks.Interfaces.RealInput EFD0 annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=0,
        origin={-129,39}), iconTransformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-50,-34})));
  NonElectrical.Functions.ImSE imSE(
    SE1=S_EE_1,
    SE2=S_EE_2,
    E1=E_1,
    E2=E_2) annotation (Placement(transformation(extent={{82,38},{64,58}})));
  NonElectrical.Continuous.LeadLag imLeadLag(
    K=1,
    T1=T_C,
    T2=T_B,
    y_start=vr0/K_A) annotation (Placement(transformation(extent={{-34,-34},{-22,-22}})));
  Modelica.Blocks.Math.Add3 add3_2 annotation (Placement(transformation(extent={{-70,-12},{-60,-2}})));
  Modelica.Blocks.Math.Add3 add3_1(k2=-1, k1=-1) annotation (Placement(transformation(extent={{-48,-32},{-40,-24}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag imSimpleLag1(
    K=1,
    T=T_R,
    y_start=ECOMP0) annotation (Placement(transformation(extent={{-74,26},{-66,34}})));
  Modelica.Blocks.Math.Add add1 annotation (Placement(transformation(extent={{12,26},{-2,40}})));
  Modelica.Blocks.Math.Product product annotation (Placement(transformation(extent={{42,36},{28,50}})));
  Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(extent={{54,10},{40,24}})));
  Modelica.Blocks.Sources.Constant const(k=K_E0) annotation (Placement(transformation(extent={{86,18},{74,30}})));
  Modelica.Blocks.Math.Add add(k1=-1) annotation (Placement(transformation(extent={{44,-30},{52,-22}})));
  Modelica.Blocks.Continuous.Integrator integrator(
    k=1/T_E,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=vf00) annotation (Placement(transformation(extent={{70,-32},{82,-20}})));
  NonElectrical.Continuous.SimpleLagLimVar simpleLagLimVar(
    K=K_A,
    T=T_A,
    y_start=vr0) annotation (Placement(transformation(extent={{12,-34},{22,-24}})));
  Modelica.Blocks.Math.Gain gain(k=V_RMIN0) annotation (Placement(transformation(
        extent={{-3,-3},{3,3}},
        rotation=90,
        origin={13,-47})));
  Modelica.Blocks.Math.Gain gain1(k=V_RMAX0) annotation (Placement(transformation(
        extent={{-3,-3},{3,3}},
        rotation=90,
        origin={29,-47})));
  function param_init
    input Real V_RMAX_init;
    input Real K_E_init;
    input Real E_2;
    input Real S_EE_2;
    input Real Efd0;
    input Real SE_Efd0;
    output Real V_RMAX;
    output Real K_E;
  algorithm
    if (V_RMAX_init == 0) then
      if (K_E_init <= 0) then
        V_RMAX := S_EE_2*E_2;
      else
        V_RMAX := S_EE_2 + K_E_init;
      end if;
    else
      V_RMAX := V_RMAX_init;
    end if;

    if (K_E_init == 0) then
      K_E := V_RMAX/(10*Efd0) - SE_Efd0;
    else
      K_E := K_E_init;
    end if;
    annotation (Documentation(revisions="<html>
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
  end param_init;

  parameter Real VREF(fixed=false);
  parameter Real vf00(fixed=false) "Initial field voltage";
  parameter Real vr0(fixed=false);
  parameter Real ECOMP0(fixed=false);
  parameter Real V_RMAX0(fixed=false);
  parameter Real K_E0(fixed=false);
  parameter Real V_RMIN0(fixed=false);
  parameter Real SE_Efd0(fixed=false);
initial equation
  ECOMP0 = ECOMP;
  vf00 = EFD0;
  SE_Efd0 = OpenIPSL.NonElectrical.Functions.SE(
    vf00,
    S_EE_1,
    S_EE_2,
    E_1,
    E_2);

  (V_RMAX0,K_E0) = param_init(
    V_RMAX,
    K_E,
    E_2,
    S_EE_2,
    vf00,
    SE_Efd0);
  if (V_RMAX == 0) then
    V_RMIN0 = -V_RMAX0;
  else
    V_RMIN0 = V_RMIN;
  end if;

  vr0 = vf00*(K_E0 + SE(
    vf00,
    S_EE_1,
    S_EE_2,
    E_1,
    E_2));
  VREF = vr0/K_A + ECOMP0;

equation
  connect(VUEL, hV_GATE.n2) annotation (Line(
      points={{-91,-74},{-17,-74},{-17,-32}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSE.VE_IN, EFD) annotation (Line(points={{82.9,48},{98,48},{98,0},{105,0}}, color={0,0,127}));
  connect(Vref.y, add3_2.u1) annotation (Line(points={{-79.4,18},{-76,18},{-76,-3},{-71,-3}}, color={0,0,127}));
  connect(VOTHSG, add3_2.u2) annotation (Line(points={{-95,8},{-88,8},{-88,-7},{-71,-7}}, color={0,0,127}));
  connect(VOEL, add3_2.u3) annotation (Line(points={{-95,-10},{-71,-10},{-71,-11}}, color={0,0,127}));
  connect(add3_1.y, imLeadLag.u) annotation (Line(points={{-39.6,-28},{-35.2,-28}}, color={0,0,127}));
  connect(imLeadLag.y, hV_GATE.n1) annotation (Line(points={{-21.4,-28},{-17,-28}}, color={0,0,127}));
  connect(imDerivativeLag.y, add3_1.u2) annotation (Line(points={{-4.6,0},{-52,0},{-52,-28},{-48.8,-28}}, color={0,0,127}));
  connect(ECOMP, imSimpleLag1.u) annotation (Line(points={{-95,30},{-74.8,30}}, color={0,0,127}));
  connect(imSimpleLag1.y, add3_1.u1) annotation (Line(points={{-65.6,30},{-56,30},{-56,-24.8},{-48.8,-24.8}}, color={0,0,127}));
  connect(add3_2.y, add3_1.u3) annotation (Line(points={{-59.5,-7},{-54,-7},{-54,-31.2},{-48.8,-31.2}}, color={0,0,127}));
  connect(product1.u1, const.y) annotation (Line(points={{55.4,21.2},{64.7,21.2},{64.7,24},{73.4,24}}, color={0,0,127}));
  connect(product.u1, imSE.VE_OUT) annotation (Line(points={{43.4,47.2},{53.7,47.2},{53.7,48},{63.46,48}}, color={0,0,127}));
  connect(product.u2, EFD) annotation (Line(points={{43.4,38.8},{98,38},{98,0},{105,0}}, color={0,0,127}));
  connect(add1.u1, product.y) annotation (Line(points={{13.4,37.2},{20,37.2},{20,43},{27.3,43}}, color={0,0,127}));
  connect(add1.u2, product1.y) annotation (Line(points={{13.4,28.8},{26,28.8},{26,17},{39.3,17}}, color={0,0,127}));
  connect(add1.y, add.u1) annotation (Line(points={{-2.7,33},{-10,33},{-10,16},{34,16},{34,-23.6},{43.2,-23.6}}, color={0,0,127}));
  connect(add.y, integrator.u) annotation (Line(points={{52.4,-26},{68.8,-26}}, color={0,0,127}));
  connect(integrator.y, EFD) annotation (Line(points={{82.6,-26},{98,-26},{98,0},{105,0}}, color={0,0,127}));
  connect(imDerivativeLag.u, EFD) annotation (Line(points={{9.2,0},{105,0}}, color={0,0,127}));
  connect(product1.u2, EFD) annotation (Line(points={{55.4,12.8},{98,12.8},{98,0},{105,0}}, color={0,0,127}));
  connect(hV_GATE.p, simpleLagLimVar.u) annotation (Line(points={{-1,-30},{4.745,-30},{4.745,-29},{11,-29}}, color={0,0,127}));
  connect(simpleLagLimVar.y, add.u2) annotation (Line(points={{22.5,-29},{33.25,-29},{33.25,-28.4},{43.2,-28.4}}, color={0,0,127}));
  connect(gain.y, simpleLagLimVar.outMin) annotation (Line(points={{13,-43.7},{13,-39.85},{13,-36}}, color={0,0,127}));
  connect(gain1.y, simpleLagLimVar.outMax) annotation (Line(points={{29,-43.7},{29,-16},{21,-16},{21,-22}}, color={0,0,127}));
  connect(VT, gain.u) annotation (Line(points={{23,-62},{24,-62},{24,-56},{13,-56},{13,-50.6}}, color={0,0,127}));
  connect(gain1.u, gain.u) annotation (Line(points={{29,-50.6},{29,-56},{13,-56},{13,-50.6}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}}), graphics={Rectangle(
          extent={{-100,40},{100,-40}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{74,4},{102,-6}},
          lineColor={0,0,255},
          textString="EFD"),Text(
          extent={{-42,8},{40,-12}},
          lineColor={0,0,255},
          textString="ESDC2A"),Text(
          extent={{-86,38},{-56,22}},
          lineColor={0,0,255},
          textString="ECOMP"),Text(
          extent={{-86,16},{-54,6}},
          lineColor={0,0,255},
          textString="VOTHSG"),Text(
          extent={{-88,-4},{-62,-14}},
          lineColor={0,0,255},
          textString="VOEL"),Text(
          extent={{-92,-24},{-60,-34}},
          lineColor={0,0,255},
          textString="VUEL"),Text(
          extent={{-66,-18},{-34,-28}},
          lineColor={0,0,255},
          textString="EFD0"),Text(
          extent={{-26,-18},{6,-28}},
          lineColor={0,0,255},
          textString="VT")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>ESDC2A, PSS/E Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>Major change - 2016-01-19</td>
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
end ESDC2A;
