within iPSL.Electrical.Controls.PSSE.ES.IEEET2;
model IEEET2 "IEEE Type 2 excitation system"

  parameter Real T_R=0.02 "Voltage input time constant (s)";
  parameter Real K_A=200.0 "AVR gain";
  parameter Real T_A=0.001 "AVR time constant (s)";
  parameter Real V_RMAX=6.08 "Maximum AVR output (pu)";
  parameter Real V_RMIN=-6.08 "Minimum AVR output (pu)";
  parameter Real K_E=1 "Exciter field gain";
  parameter Real T_E=0.55 "Exciter time constant s";
  parameter Real K_F=0.06 "Rate feedback gain (pu)";
  parameter Real T_F1=0.3 "Rate feedback time constant (s)";
  parameter Real T_F2=0.6 "Rate feedback time constant (s)";
  parameter Real E_1=2.85 "Exciter saturation point 1 (pu)";
  parameter Real S_EE_1=0.3 "Saturation at E_1";
  parameter Real E_2=3.8 "Exciter saturation point 2 (pu)";
  parameter Real S_EE_2=0.6 "Saturation at E_2";

  Modelica.Blocks.Interfaces.RealInput VOTHSG "PSS output Upss" annotation (Placement(transformation(extent={{-110,-20},{-104,-12}}), iconTransformation(extent={{-126,30},{-106,50}})));
  Modelica.Blocks.Interfaces.RealInput VOEL "OEL output" annotation (Placement(transformation(extent={{-110,-28},{-104,-20}}), iconTransformation(extent={{-126,-10},{-106,10}})));
  Modelica.Blocks.Sources.Constant Vref(k=VREF) annotation (Placement(transformation(extent={{-96,14},{-84,26}})));
  Modelica.Blocks.Interfaces.RealOutput EFD(start=Efd0) "Output,excitation voltage" annotation (Placement(transformation(extent={{100,-6},{110,6}}), iconTransformation(extent={{120,-10},{138,10}})));
  Modelica.Blocks.Interfaces.RealInput VUEL annotation (Placement(transformation(extent={{-112,-38},{-106,-30}}), iconTransformation(extent={{-126,-50},{-106,-30}})));

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

  Modelica.Blocks.Interfaces.RealInput EFD0 "Input, generator terminal voltage"
    annotation (Placement(transformation(extent={{-110,-46},{-104,-38}}), iconTransformation(extent={{-126,-90},{-106,-70}})));
  NonElectrical.Functions.ImSE se1(
    SE1=S_EE_1,
    SE2=S_EE_2,
    E1=E_1,
    E2=E_2) annotation (Placement(transformation(
        extent={{-8,-9},{8,9}},
        rotation=180,
        origin={78,41})));
  Modelica.Blocks.Interfaces.RealInput ECOMP "Input, generator terminal voltage" annotation (Placement(
      visible=true,
      transformation(
        origin={-114,2},
        extent={{-4,-4},{4,4}},
        rotation=0),
      iconTransformation(
        origin={-116,80},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  NonElectrical.Continuous.SimpleLag imSimpleLag1(
    K=1,
    y_start=VT0,
    T=T_R) annotation (Placement(transformation(extent={{-76,-4},{-62,10}})));
  Modelica.Blocks.Math.Add3 add3_1(k2=-1) annotation (Placement(transformation(extent={{-52,-4},{-38,10}})));
  Modelica.Blocks.Math.Add3 add3_2 annotation (Placement(transformation(extent={{-76,-36},{-64,-24}})));
  Modelica.Blocks.Math.Add add(k2=-1) annotation (Placement(transformation(extent={{-28,-8},{-16,4}})));
  NonElectrical.Continuous.SimpleLag simpleLag(
    K=1,
    T=T_F2,
    y_start=0) annotation (Placement(transformation(extent={{-2,-40},{-16,-26}})));
  Modelica.Blocks.Continuous.Derivative derivativeLag(
    k=K_F,
    y_start=0,
    T=T_F1,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    x_start=VR0) annotation (Placement(transformation(extent={{28,-40},{14,-26}})));
  Modelica.Blocks.Math.Add add1(k1=-1) annotation (Placement(transformation(extent={{40,-6},{52,6}})));
  Modelica.Blocks.Continuous.Integrator integrator(
    k=1/T_E,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=Efd0) annotation (Placement(transformation(extent={{74,-6},{86,6}})));
  Modelica.Blocks.Math.Product product annotation (Placement(transformation(extent={{60,32},{50,42}})));
  Modelica.Blocks.Math.Add add2 annotation (Placement(transformation(extent={{42,22},{30,34}})));
  Modelica.Blocks.Math.Gain gain(k=K_E0) annotation (Placement(transformation(extent={{82,16},{72,26}})));
  NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=K_A,
    T=T_A,
    y_start=VR0,
    outMax=V_RMAX0,
    outMin=V_RMIN0) annotation (Placement(transformation(extent={{0,-8},{12,4}})));
protected
  parameter Real V_RMAX0(fixed=false);
  //=7.3 "Maximum AVR output (pu)";
  parameter Real V_RMIN0(fixed=false);
  //=-7.3 "Minimum AVR output (pu)";
  parameter Real K_E0(fixed=false);
  //=1 "Exciter field gain, s"
  parameter Real VT0(fixed=false);
  //=Ec0;
  parameter Real VREF(fixed=false);
  //=VR0/KA+VT0+Vs.a0 "Reference terminal voltage (pu)";
  parameter Real Efd0(fixed=false);
  //
  parameter Real SE_Efd0(fixed=false);
  parameter Real VR0(fixed=false);

initial algorithm
  VT0 := ECOMP;
  Efd0 := EFD0;
  SE_Efd0 := iPSL.NonElectrical.Functions.SE(
    EFD0,
    S_EE_1,
    S_EE_2,
    E_1,
    E_2);

  (V_RMAX0,K_E0) := param_init(
    V_RMAX,
    K_E,
    E_2,
    S_EE_2,
    Efd0,
    SE_Efd0);
  if (V_RMAX == 0) then
    V_RMIN0 := -V_RMAX0;
  else
    V_RMIN0 := V_RMIN;
  end if;

  VR0 := Efd0*(K_E0 + SE_Efd0);
  VREF := VR0/K_A + VT0 - add3_2.y;

equation
  connect(ECOMP, imSimpleLag1.u) annotation (Line(points={{-114,2},{-77.4,2},{-77.4,3}}, color={0,0,127}));
  connect(imSimpleLag1.y, add3_1.u2) annotation (Line(points={{-61.3,3},{-53.4,3}}, color={0,0,127}));
  connect(Vref.y, add3_1.u1) annotation (Line(points={{-83.4,20},{-58,20},{-58,8.6},{-53.4,8.6}}, color={0,0,127}));
  connect(VOTHSG, add3_2.u1) annotation (Line(points={{-107,-16},{-80,-16},{-80,-25.2},{-77.2,-25.2}}, color={0,0,127}));
  connect(add3_2.u2, VOEL) annotation (Line(points={{-77.2,-30},{-102,-30},{-102,-24},{-107,-24}}, color={0,0,127}));
  connect(VUEL, add3_2.u3) annotation (Line(points={{-109,-34},{-77.2,-34},{-77.2,-34.8}}, color={0,0,127}));
  connect(add3_2.y, add3_1.u3) annotation (Line(points={{-63.4,-30},{-58,-30},{-58,-2.6},{-53.4,-2.6}}, color={0,0,127}));
  connect(add3_1.y, add.u1) annotation (Line(points={{-37.3,3},{-33.65,3},{-33.65,1.6},{-29.2,1.6}}, color={0,0,127}));
  connect(simpleLag.y, add.u2) annotation (Line(points={{-16.7,-33},{-34,-33},{-34,-5.6},{-29.2,-5.6}}, color={0,0,127}));
  connect(simpleLag.u, derivativeLag.y) annotation (Line(points={{-0.6,-33},{6.7,-33},{13.3,-33}}, color={0,0,127}));
  connect(integrator.y, EFD) annotation (Line(points={{86.6,0},{105,0}}, color={0,0,127}));
  connect(add1.y, integrator.u) annotation (Line(points={{52.6,0},{72.8,0}}, color={0,0,127}));
  connect(se1.VE_IN, EFD) annotation (Line(points={{86.8,41},{96,41},{96,0},{105,0}}, color={0,0,127}));
  connect(product.u1, se1.VE_OUT) annotation (Line(points={{61,40},{69.52,40},{69.52,41}}, color={0,0,127}));
  connect(product.u2, EFD) annotation (Line(points={{61,34},{96,34},{96,0},{105,0}}, color={0,0,127}));
  connect(add2.u1, product.y) annotation (Line(points={{43.2,31.6},{46,31.6},{46,37},{49.5,37}}, color={0,0,127}));
  connect(add2.y, add1.u1) annotation (Line(points={{29.4,28},{24,28},{24,12},{32,12},{32,3.6},{38.8,3.6}}, color={0,0,127}));
  connect(derivativeLag.u, add1.u2) annotation (Line(points={{29.4,-33},{36,-33},{36,-3.6},{38.8,-3.6}}, color={0,0,127}));
  connect(gain.u, EFD) annotation (Line(points={{83,21},{96,21},{96,0},{105,0}}, color={0,0,127}));
  connect(gain.y, add2.u2) annotation (Line(points={{71.5,21},{50,21},{50,24.4},{43.2,24.4}}, color={0,0,127}));
  connect(add.y, simpleLagLim.u) annotation (Line(points={{-15.4,-2},{-1.2,-2}}, color={0,0,127}));
  connect(simpleLagLim.y, add1.u2) annotation (Line(points={{12.6,-2},{24,-2},{24,-3.6},{38.8,-3.6}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-120,-100},{120,100}}), graphics={Text(
          extent={{-94,24},{-86,16}},
          lineColor={0,0,255},
          textString="Vref"),Text(
          extent={{-104,-40},{-88,-46}},
          lineColor={0,0,255},
          textString="Efd0"),Text(
          extent={{-112,6},{-84,0}},
          lineColor={0,0,255},
          textString="Ec"),Text(
          extent={{-104,-8},{-86,-18}},
          lineColor={0,0,255},
          textString="VOTHSG"),Text(
          extent={{-106,-18},{-84,-24}},
          lineColor={0,0,255},
          textString="VOEL"),Text(
          extent={{-106,-26},{-84,-32}},
          lineColor={0,0,255},
          textString="VUEL")}),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-120,-100},{120,100}}), graphics={Rectangle(
          extent={{-120,100},{120,-100}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{100,8},{118,-8}},
          lineColor={0,0,255},
          textString="EFD"),Text(
          extent={{-38,14},{44,-18}},
          lineColor={0,0,255},
          textString="IEEET2"),Text(
          extent={{-102,-74},{-78,-86}},
          lineColor={0,0,255},
          textString="EFD0"),Text(
          extent={{-98,46},{-60,34}},
          lineColor={0,0,255},
          textString="VOTHSG "),Text(
          extent={{-102,-32},{-74,-48}},
          lineColor={0,0,255},
          textString=" VUEL "),Text(
          extent={{-102,6},{-72,-8}},
          lineColor={0,0,255},
          textString=" VOEL"),Text(
          extent={{-100,84},{-68,74}},
          lineColor={0,0,255},
          textString="ECOMP")}),
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
end IEEET2;
