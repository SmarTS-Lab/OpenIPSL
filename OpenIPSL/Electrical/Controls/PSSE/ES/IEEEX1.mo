within OpenIPSL.Electrical.Controls.PSSE.ES;
model IEEEX1

  parameter Real T_R "Voltage input time constant (s)";
  parameter Real K_A "AVR gain";
  parameter Real T_A "AVR time constant (s)";
  parameter Real T_B "(s)";
  parameter Real T_C "(s)";
  parameter Real V_RMAX "Maximum AVR output (pu)";
  parameter Real V_RMIN "Minimum AVR output (pu)";
  parameter Real K_E "Exciter field gain";
  parameter Real T_E "Exciter time constant (s)";
  parameter Real K_F "Rate feedback gain (pu)";
  parameter Real T_F1 "Rate feedback time constant (s)";
  parameter Real E_1 "Exciter saturation point 1 (pu)";
  parameter Real S_EE_1 "Saturation at E1";
  parameter Real E_2 "Exciter saturation point 2 (pu)";
  parameter Real S_EE_2 "Saturation at E2";
  Modelica.Blocks.Interfaces.RealInput VOTHSG "PSS output signal" annotation (Placement(transformation(extent={{-133,36},{-127,42}}), iconTransformation(extent={{-130,-30},{-120,-20}})));
  Modelica.Blocks.Interfaces.RealInput VOEL "OEL output" annotation (Placement(transformation(extent={{-133,29},{-127,35}}), iconTransformation(extent={{-130,20},{-120,30}})));
  Modelica.Blocks.Sources.Constant Vref(k=VREF) annotation (Placement(transformation(extent={{-110,10},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput EFD "Excitation voltage" annotation (Placement(transformation(extent={{110,-7},{120,5}}), iconTransformation(extent={{110,-5},{120,5}})));
  NonElectrical.Functions.ImSE se1(
    SE1=S_EE_1,
    SE2=S_EE_2,
    E1=E_1,
    E2=E_2) annotation (Placement(transformation(
        extent={{-8,-5},{8,5}},
        rotation=180,
        origin={70,37})));
  Modelica.Blocks.Interfaces.RealInput VUEL annotation (Placement(transformation(extent={{-133,22},{-127,28}}), iconTransformation(extent={{-130,40},{-120,50}})));
  Modelica.Blocks.Interfaces.RealInput ECOMP
    "Compensated generator terminal voltage "
    annotation (Placement(transformation(extent={{-133,-11},{-127,-5}}), iconTransformation(extent={{-130,-5},{-120,5}})));
  Modelica.Blocks.Interfaces.RealInput EFD0 "Input, generator terminal voltage"
    annotation (Placement(transformation(extent={{-133,-31},{-127,-25}}), iconTransformation(extent={{-130,-50},{-120,-40}})));
  Modelica.Blocks.Math.Add imSum2_2(k2=-1) annotation (Placement(transformation(extent={{-80,-10},{-70,0}})));
  Modelica.Blocks.Math.Gain KE_EFD(k=K_E0) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={44,19})));
  Modelica.Blocks.Math.Add imSum2_4 annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={29,29})));
  Modelica.Blocks.Math.Product VE annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={44,34})));
  Modelica.Blocks.Math.Add imSum2_3(k1=-1) annotation (Placement(transformation(extent={{29,-7},{39,3}})));
  NonElectrical.Continuous.LeadLag LL(
    T1=T_C,
    T2=T_B,
    K=1,
    y_start=VR0/K_A,
    x_start=VREF - ECOMP0) annotation (Placement(transformation(extent={{-40,-10},{-30,0}})));
  Modelica.Blocks.Math.Add3 V_Erro1(k3=-1) annotation (Placement(transformation(extent={{-60,-10},{-50,0}})));
  NonElectrical.Continuous.SimpleLag imSimpleLag1(
    K=1,
    T=T_R,
    y_start=ECOMP0) annotation (Placement(transformation(extent={{-110,-13},{-100,-3}})));
  Modelica.Blocks.Continuous.Derivative imDerivativeLag(
    k=K_F,
    T=T_F1,
    y_start=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    x_start=Efd0) annotation (Placement(transformation(extent={{10,-40},{0,-30}})));
  Modelica.Blocks.Math.Add3 V_Erro2 annotation (Placement(transformation(extent={{-90,30},{-80,40}})));
  Modelica.Blocks.Continuous.Integrator INT(
    k=1/T_E,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=Efd0) annotation (Placement(transformation(extent={{55,-7},{65,3}})));
  NonElectrical.Continuous.SimpleLagLim SL(
    K=K_A,
    T=T_A,
    y_start=VR0,
    outMax=V_RMAX0,
    outMin=V_RMIN0) annotation (Placement(transformation(extent={{-10,-10},{0,0}})));

  // Parameter initialization as it is specified in section 15.2.4 of PAGV2 from PSS/E
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
protected
  parameter Real ECOMP0(fixed=false);
  parameter Real VREF(fixed=false);
  parameter Real Efd0(fixed=false);
  parameter Real SE_Efd0(fixed=false);
  parameter Real VR0(fixed=false);
  parameter Real V_RMAX0(fixed=false);
  parameter Real K_E0(fixed=false);
  parameter Real V_RMIN0(fixed=false);
initial equation
  ECOMP0 = ECOMP;
  Efd0 = EFD0;

  SE_Efd0 = OpenIPSL.NonElectrical.Functions.SE(
    EFD0,
    S_EE_1,
    S_EE_2,
    E_1,
    E_2);

  (V_RMAX0,K_E0) = param_init(
    V_RMAX,
    K_E,
    E_2,
    S_EE_2,
    Efd0,
    SE_Efd0);
  if (V_RMAX == 0) then
    V_RMIN0 = -V_RMAX0;
  else
    V_RMIN0 = V_RMIN;
  end if;

  VR0 = Efd0*(K_E0 + SE_Efd0);
  VREF = VR0/K_A + ECOMP0;

equation
  connect(se1.VE_OUT, VE.u2) annotation (Line(
      points={{61.52,37},{50,37}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VE.y, imSum2_4.u2) annotation (Line(
      points={{38.5,34},{37,34},{37,32},{35,32}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(KE_EFD.y, imSum2_4.u1) annotation (Line(
      points={{38.5,19},{37,19},{37,26},{35,26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSum2_4.y, imSum2_3.u1) annotation (Line(
      points={{23.5,29},{20,29},{20,1},{28,1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSum2_2.y, V_Erro1.u2) annotation (Line(
      points={{-69.5,-5},{-61,-5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSimpleLag1.y, imSum2_2.u2) annotation (Line(points={{-99.5,-8},{-89.65,-8},{-81,-8}}, color={0,0,127}));
  connect(imSimpleLag1.u, ECOMP) annotation (Line(points={{-111,-8},{-111,-8},{-130,-8}}, color={0,0,127}));
  connect(Vref.y, imSum2_2.u1) annotation (Line(points={{-99.5,15},{-88,15},{-88,-2},{-81,-2}},color={0,0,127}));
  connect(VOTHSG, V_Erro2.u1) annotation (Line(points={{-130,39},{-91,39}}, color={0,0,127}));
  connect(VOEL, V_Erro2.u2) annotation (Line(points={{-130,32},{-106,32},{-106,35},{-91,35}}, color={0,0,127}));
  connect(VUEL, V_Erro2.u3) annotation (Line(points={{-130,25},{-102,25},{-102,31},{-91,31}}, color={0,0,127}));
  connect(V_Erro2.y, V_Erro1.u1) annotation (Line(points={{-79.5,35},{-66,35},{-66,-1},{-61,-1}}, color={0,0,127}));
  connect(V_Erro1.y, LL.u) annotation (Line(points={{-49.5,-5},{-43,-5},{-41,-5}}, color={0,0,127}));
  connect(imSum2_3.y, INT.u) annotation (Line(points={{39.5,-2},{46.25,-2},{54,-2}}, color={0,0,127}));
  connect(INT.y, EFD) annotation (Line(points={{65.5,-2},{89,-2},{89,-1},{115,-1}}, color={0,0,127}));
  connect(se1.VE_IN, EFD) annotation (Line(points={{78.8,37},{89,37},{89,11},{89,10},{89,-1},{115,-1}}, color={0,0,127}));
  connect(VE.u1, EFD) annotation (Line(points={{50,31},{89,31},{89,11},{89,10},{89,-1},{115,-1}}, color={0,0,127}));
  connect(KE_EFD.u, EFD) annotation (Line(points={{50,19},{89,19},{89,11},{89,10},{89,-1},{115,-1}}, color={0,0,127}));
  connect(LL.y, SL.u) annotation (Line(points={{-29.5,-5},{-11,-5}}, color={0,0,127}));
  connect(SL.y, imSum2_3.u2) annotation (Line(points={{0.5,-5},{28,-5}}, color={0,0,127}));
  connect(imDerivativeLag.u, EFD) annotation (Line(points={{11,-35},{89,-35},{89,-1},{115,-1}}, color={0,0,127}));
  connect(imDerivativeLag.y, V_Erro1.u3) annotation (Line(points={{-0.5,-35},{-28,-35},{-66,-35},{-66,-9},{-61,-9}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-130,-60},{110,60}},
        grid={1,1}), graphics={Text(
          extent={{-110,18},{-98,12}},
          lineColor={0,0,255},
          textString="Vref")}),
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-130,-60},{110,60}},
        grid={1,1}), graphics={Rectangle(extent={{-130,60},{110,-60}}, lineColor={0,0,255}),Text(
          extent={{-117,5},{-84,-5}},
          lineColor={0,0,255},
          textString="ECOMP"),Text(
          extent={{-118,-20},{-79,-30}},
          lineColor={0,0,255},
          textString="VOTHSG"),Text(
          extent={{-117,50},{-93,40}},
          lineColor={0,0,255},
          textString="VUEL"),Text(
          extent={{89,5},{109,-5}},
          lineColor={0,0,255},
          textString="EFD"),Text(
          extent={{-60,20},{60,-20}},
          lineColor={0,0,255},
          textString="IEEEX1"),Text(
          extent={{-120,30},{-90,20}},
          lineColor={0,0,255},
          textString="VOEL"),Text(
          extent={{-121,-40},{-91,-50}},
          lineColor={0,0,255},
          textString="EFD0")}),
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
end IEEEX1;
