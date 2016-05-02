within OpenIPSL.Electrical.Controls.PSSE.ES;
model ESST1A "IEEE Type ST1A Excitation System"

  Modelica.Blocks.Sources.Constant Vref(k=VREF) annotation (Placement(transformation(extent={{-116.6,21.9},{-107,32}})));
  Modelica.Blocks.Interfaces.RealInput ECOMP
    "Input, generator terminal voltage"
    annotation (Placement(transformation(extent={{-141.3,0.4},{-131.3,12.4}}),iconTransformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-115,0})));
  Modelica.Blocks.Interfaces.RealInput VOTHSG "VOS=1"
    annotation (Placement(transformation(extent={{-141.2,67.8},{-131.2,79.8}}),iconTransformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-115,65})));
  Modelica.Blocks.Interfaces.RealInput VUEL1 "UEL=1"
    annotation (Placement(transformation(extent={{-141.1,36.6},{-131.1,48.6}}),iconTransformation(
        extent={{5,-5.15},{-5,5.15}},
        rotation=270,
        origin={-45.15,-75})));
  Modelica.Blocks.Interfaces.RealOutput EFD "Output,excitation voltage" annotation (Placement(transformation(extent={{138.3,0.2},{148.3,12.2}}), iconTransformation(extent={{120,-5.4},{130,5}})));

  parameter Real T_R=0 "Voltage input time constant (s)" annotation (Dialog(group="Excitation system parameters"));
  parameter Real V_IMAX annotation (Dialog(group="Excitation system parameters"));
  parameter Real V_IMIN annotation (Dialog(group="Excitation system parameters"));
  parameter Real T_C=0 "AVR lead-lag time constant (s)" annotation (Dialog(group="Excitation system parameters"));
  parameter Real T_B=0 "AVR lead-lag time constant (s)" annotation (Dialog(group="Excitation system parameters"));
  parameter Real T_C1=0 "AVR lead-lag time constant (s)" annotation (Dialog(group="Excitation system parameters"));
  parameter Real T_B1=0 "AVR lead-lag time constant (s)" annotation (Dialog(group="Excitation system parameters"));
  parameter Real K_A=400 "AVR gain" annotation (Dialog(group="Excitation system parameters"));
  parameter Real T_A=0.02 "AVR time constant (s)" annotation (Dialog(group="Excitation system parameters"));
  parameter Real V_AMAX "Maximum AVR output (pu)" annotation (Dialog(group="Excitation system parameters"));
  parameter Real V_AMIN "Minimum AVR output (pu)" annotation (Dialog(group="Excitation system parameters"));
  parameter Real V_RMAX=9 annotation (Dialog(group="Excitation system parameters"));
  parameter Real V_RMIN=-5.43 annotation (Dialog(group="Excitation system parameters"));
  parameter Real K_C=0.2 "Rectifier load factor (pu)" annotation (Dialog(group="Excitation system parameters"));
  parameter Real K_F=0.03 "Rate feedback gain (pu)" annotation (Dialog(group="Excitation system parameters"));
  parameter Real T_F=1 "Rate feedback time constant (s)" annotation (Dialog(group="Excitation system parameters"));
  parameter Real K_LR annotation (Dialog(group="Excitation system parameters"));
  parameter Real I_LR annotation (Dialog(group="Excitation system parameters"));
  Modelica.Blocks.Continuous.Derivative imDerivativeLag(
    y_start=0,
    k=K_F,
    T=T_F,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    x_start=Efd0) annotation (Placement(transformation(extent={{9,56},{-1.6,66.6}})));
  Modelica.Blocks.Interfaces.RealInput VOTHSG2 "VOS=2"
    annotation (Placement(transformation(extent={{-141.4,-25},{-131.4,-13}}),iconTransformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-115,45})));
  Modelica.Blocks.Interfaces.RealInput VUEL3 "UEL=3"
    annotation (Placement(transformation(extent={{-141.3,-66},{-131.3,-54}}), iconTransformation(
        extent={{4.95,-5.15},{-4.95,5.15}},
        rotation=270,
        origin={14.85,-74.95})));
  Modelica.Blocks.Nonlinear.Limiter imLimited(uMin=V_IMIN, uMax=V_IMAX) annotation (Placement(transformation(extent={{-57.2,25.8},{-47,36}})));
  NonElectrical.Logical.HV_GATE hV_GATE annotation (Placement(transformation(extent={{-38.7,16.5},{-18.2,37.3}})));
  Modelica.Blocks.Interfaces.RealInput VUEL2 "UEL=2"
    annotation (Placement(transformation(extent={{-141.5,-46},{-131.5,-34}}),iconTransformation(
        extent={{4.9,-4.9},{-4.9,4.9}},
        rotation=270,
        origin={-14.9,-74.9})));
  Modelica.Blocks.Math.Gain imGain(k=K_LR) annotation (Placement(transformation(
        extent={{-4.65,-4.85},{4.65,4.85}},
        rotation=90,
        origin={44.15,-25.35})));
  NonElectrical.Logical.HV_GATE hV_GATE1 annotation (Placement(transformation(extent={{71.3,17.3},{85,24}})));
  NonElectrical.Logical.LV_GATE lV_GATE annotation (Placement(transformation(extent={{94.8,13.3},{111,21}})));
  Modelica.Blocks.Interfaces.RealInput VOEL annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=270,
        origin={82.3,-63.7}), iconTransformation(
        extent={{5,-5},{-5,5}},
        rotation=270,
        origin={45,-75})));
  Modelica.Blocks.Interfaces.RealInput VT "sensed VT" annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=270,
        origin={104.3,-63.7}), iconTransformation(
        extent={{-5.25,-5.25},{5.25,5.25}},
        rotation=0,
        origin={-114.25,-25.25})));
  Modelica.Blocks.Sources.Constant Vref1(k=I_LR) annotation (Placement(transformation(extent={{19,-74},{29,-64}})));
  NonElectrical.Continuous.LeadLag imLeadLag(
    K=1,
    T1=T_C,
    T2=T_B,
    y_start=VA0/K_A,
    x_start=VREF - ECOMP0) annotation (Placement(transformation(extent={{-15,21},{-5,31}})));
  NonElectrical.Continuous.LeadLag imLeadLag1(
    K=1,
    y_start=VA0/K_A,
    T1=T_C1,
    T2=T_B1,
    x_start=VA0/K_A) annotation (Placement(transformation(extent={{4,21},{14,31}})));
  NonElectrical.Continuous.SimpleLag imSimpleLag(
    K=1,
    T=T_R,
    y_start=ECOMP0) annotation (Placement(transformation(extent={{-115.8,1},{-106,11}})));
  Modelica.Blocks.Interfaces.RealInput EFD0 "VOS=1" annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=90,
        origin={2.1,-69.7}), iconTransformation(
        extent={{-5,-5.15},{5,5.15}},
        rotation=0,
        origin={-115,-44.85})));
  Modelica.Blocks.Interfaces.RealInput XADIFD annotation (Placement(transformation(
        extent={{-12.35,-12.35},{12.35,12.35}},
        rotation=90,
        origin={62.25,-71.55}), iconTransformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-115,-65})));
  Modelica.Blocks.Math.Add add(k2=-1) annotation (Placement(transformation(extent={{-96,6},{-86,16}})));
  Modelica.Blocks.Math.Add add1 annotation (Placement(transformation(extent={{-101,50},{-91,60}})));
  Modelica.Blocks.Math.Add3 add3_1(k1=-1) annotation (Placement(transformation(extent={{-75,26},{-65,36}})));
  NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=K_A,
    T=T_A,
    y_start=VA0,
    outMax=V_AMAX,
    outMin=V_AMIN) annotation (Placement(transformation(extent={{23,21},{33,31}})));
  Modelica.Blocks.Math.Add add2(k1=-1) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={44,-45})));
  Modelica.Blocks.Nonlinear.Limiter imLimited1(uMax=Modelica.Constants.inf, uMin=0)
    annotation (Placement(transformation(
        extent={{-5.1,-5.1},{5.1,5.1}},
        rotation=90,
        origin={43.9,-9.1})));
  Modelica.Blocks.Math.Add3 add3_2(k1=+1, k2=-1) annotation (Placement(transformation(extent={{55,17},{65,27}})));
  Modelica.Blocks.Math.Gain imGain1(k=V_RMIN) annotation (Placement(transformation(
        extent={{-4.65,-4.85},{4.65,4.85}},
        rotation=90,
        origin={89.15,-39.35})));
  Modelica.Blocks.Math.Gain imGain2(k=V_RMAX) annotation (Placement(transformation(
        extent={{-4.65,-4.85},{4.65,4.85}},
        rotation=90,
        origin={104.15,-39.35})));
  Modelica.Blocks.Math.Add add3(k1=-1) annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=270,
        origin={114,-19})));
  Modelica.Blocks.Math.Gain imGain3(k=K_C) annotation (Placement(transformation(
        extent={{-4.65,-4.85},{4.65,4.85}},
        rotation=90,
        origin={124.15,-39.35})));
  Modelica.Blocks.Nonlinear.VariableLimiter variableLimiter annotation (Placement(transformation(extent={{117,0},{129,12}})));
protected
  parameter Real VREF(fixed=false) "Reference terminal voltage (pu)";
  parameter Real Efd0(fixed=false)
    "Initial value of the excitation voltage as a parameter";
  parameter Real IFD0(fixed=false);
  parameter Real VA0(fixed=false);
  parameter Real ECOMP0(fixed=false);
initial equation
  Efd0 = EFD0;
  IFD0 = XADIFD;
  VA0 = Efd0 + K_LR*(IFD0 - I_LR);
  VREF = VA0/K_A + ECOMP0;
  ECOMP0 = ECOMP;

equation
  connect(VUEL2, hV_GATE.n2) annotation (Line(
      points={{-136.5,-40},{-96.4,-40},{-96.4,-39.6},{-41.7,-39.6},{-41.7,21.7},{-39.9813,21.7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VUEL3, hV_GATE1.n2) annotation (Line(
      points={{-136.3,-60},{28.9,-60},{28.9,5.3},{70.4438,5.3},{70.4438,18.975}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hV_GATE1.p, lV_GATE.n1) annotation (Line(
      points={{84.1438,20.65},{89,20.65},{89,20},{89.8,20},{89.8,19.075},{93.7875,19.075}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VOEL, lV_GATE.n2) annotation (Line(
      points={{82.3,-63.7},{82.3,15.225},{93.7875,15.225}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ECOMP, imSimpleLag.u) annotation (Line(points={{-136.3,6.4},{-126.65,6.4},{-126.65,6},{-116.78,6}}, color={0,0,127}));
  connect(Vref.y, add.u1) annotation (Line(points={{-106.52,26.95},{-101,26.95},{-101,14},{-97,14}}, color={0,0,127}));
  connect(imSimpleLag.y, add.u2) annotation (Line(points={{-105.51,6},{-103,6},{-101,6},{-101,8},{-97,8}}, color={0,0,127}));
  connect(VOTHSG, add1.u1) annotation (Line(points={{-136.2,73.8},{-111,73.8},{-111,65},{-102,65},{-102,58}}, color={0,0,127}));
  connect(VUEL1, add1.u2) annotation (Line(points={{-136.1,42.6},{-111,42.6},{-111,52},{-102,52}},color={0,0,127}));
  connect(add.y, add3_1.u3) annotation (Line(points={{-85.5,11},{-81,11},{-81,27},{-76,27}}, color={0,0,127}));
  connect(add1.y, add3_1.u2) annotation (Line(points={{-90.5,55},{-81,55},{-81,31},{-76,31}}, color={0,0,127}));
  connect(add3_1.y, imLimited.u) annotation (Line(points={{-64.5,31},{-58.22,31},{-58.22,30.9}}, color={0,0,127}));
  connect(imLimited.y, hV_GATE.n1) annotation (Line(points={{-46.49,30.9},{-41,30.9},{-41,32.1},{-39.9813,32.1}}, color={0,0,127}));
  connect(hV_GATE.p, imLeadLag.u) annotation (Line(points={{-19.4813,26.9},{-19.7013,26.9},{-19.7013,26},{-16,26}}, color={0,0,127}));
  connect(imLeadLag.y, imLeadLag1.u) annotation (Line(points={{-4.5,26},{3,26}}, color={0,0,127}));
  connect(simpleLagLim.u, imLeadLag1.y) annotation (Line(points={{22,26},{14.5,26}}, color={0,0,127}));
  connect(imGain.u, add2.y) annotation (Line(points={{44.15,-30.93},{44.15,-36.065},{44,-36.065},{44,-39.5}}, color={0,0,127}));
  connect(Vref1.y, add2.u1) annotation (Line(points={{29.5,-69},{41,-69},{41,-51}}, color={0,0,127}));
  connect(add2.u2, XADIFD) annotation (Line(points={{47,-51},{47,-71.55},{62.25,-71.55}}, color={0,0,127}));
  connect(imGain.y, imLimited1.u) annotation (Line(points={{44.15,-20.235},{44.15,-17.6175},{43.9,-17.6175},{43.9,-15.22}}, color={0,0,127}));
  connect(add3_2.y, hV_GATE1.n1) annotation (Line(points={{65.5,22},{70.4438,22},{70.4438,22.325}}, color={0,0,127}));
  connect(simpleLagLim.y, add3_2.u1) annotation (Line(points={{33.5,26},{43.75,26},{54,26}}, color={0,0,127}));
  connect(VOTHSG2, add3_2.u3) annotation (Line(points={{-136.4,-19},{-69,-19},{-1,-19},{-1,18},{54,18}},color={0,0,127}));
  connect(imLimited1.y, add3_2.u2) annotation (Line(points={{43.9,-3.49},{43.9,22},{54,22}}, color={0,0,127}));
  connect(VT, imGain1.u) annotation (Line(points={{104.3,-63.7},{89.15,-63.7},{89.15,-44.93}}, color={0,0,127}));
  connect(VT, imGain2.u) annotation (Line(points={{104.3,-63.7},{104.3,-54.35},{104.15,-54.35},{104.15,-44.93}}, color={0,0,127}));
  connect(imGain2.y, add3.u2) annotation (Line(points={{104.15,-34.235},{104.15,-30},{111,-30},{111,-25}}, color={0,0,127}));
  connect(imGain3.y, add3.u1) annotation (Line(points={{124.15,-34.235},{124.15,-32},{124,-32},{124,-30},{117,-30},{117,-25}}, color={0,0,127}));
  connect(XADIFD, imGain3.u) annotation (Line(points={{62.25,-71.55},{62.25,-73},{124.15,-73},{124.15,-44.93}}, color={0,0,127}));
  connect(variableLimiter.y, EFD) annotation (Line(points={{129.6,6},{143.3,6},{143.3,6.2}}, color={0,0,127}));
  connect(lV_GATE.p, variableLimiter.u) annotation (Line(points={{109.988,17.15},{109,17.15},{109,6},{115.8,6}}, color={0,0,127}));
  connect(add3.y, variableLimiter.limit1) annotation (Line(points={{114,-13.5},{114,-10},{114,10.8},{115.8,10.8}}, color={0,0,127}));
  connect(imGain1.y, variableLimiter.limit2) annotation (Line(points={{89.15,-34.235},{89.15,1.2},{115.8,1.2}}, color={0,0,127}));
  connect(imDerivativeLag.u, hV_GATE1.n1) annotation (Line(points={{10.06,61.3},{68,61.3},{68,22},{70.4438,22},{70.4438,22.325}}, color={0,0,127}));
  connect(add3_1.u1, imDerivativeLag.y) annotation (Line(points={{-76,35},{-86,35},{-86,61.3},{-2.13,61.3}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-120,-80},{120,80}},
        grid={1,1}), graphics={Text(
          extent={{-52.2,41.6},{-42.2,35.6}},
          lineColor={255,0,0},
          textString="V"),Text(
          extent={{-42.5,38.3},{-48.5,36.3}},
          lineColor={255,0,0},
          textString="F"),Text(
          extent={{39.3,34.3},{49.3,28.3}},
          lineColor={255,0,0},
          textString="V"),Text(
          extent={{49.3,30.3},{43.3,28.3}},
          lineColor={255,0,0},
          textString="A"),Text(
          extent={{-134.4,86.6},{-119.4,71.3}},
          lineColor={0,0,255},
          textString="VOTHSG1"),Text(
          extent={{-137.3,55.9},{-125.9,45.4}},
          lineColor={0,0,255},
          textString="VUEL1"),Text(
          extent={{-138.1,22.6},{-124.7,7.1}},
          lineColor={0,0,255},
          textString="ECOMP"),Text(
          extent={{-137.6,-4.1},{-122.6,-19.4}},
          lineColor={0,0,255},
          textString="VOTHSG2"),Text(
          extent={{-137.4,-27.8},{-126,-38.3}},
          lineColor={0,0,255},
          textString="VUEL2"),Text(
          extent={{-137.8,-48},{-126.4,-58.5}},
          lineColor={0,0,255},
          textString="VUEL3"),Text(
          extent={{-15.8,-61.2},{-2.4,-76.7}},
          lineColor={0,0,255},
          textString="EFD0")}),
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-120,-80},{120,80}},
        grid={1,1}), graphics={Rectangle(extent={{-120,80},{120,-80}}, lineColor={0,0,255}),Text(
          extent={{-110,-60},{-77,-70}},
          lineColor={0,0,255},
          textString="XADIFD"),Text(
          extent={{-109,5},{-74,-5}},
          lineColor={0,0,255},
          textString="ECOMP"),Text(
          extent={{-108,72},{-80,55}},
          lineColor={0,128,0},
          textString="VOTHSG
(VOS=1)"),Text(
          extent={{31,-58},{63,-68}},
          lineColor={0,0,255},
          textString="VOEL"),Text(
          extent={{86,7},{116,-9}},
          lineColor={0,0,255},
          textString="EFD"),Text(
          extent={{-50,30},{50,-30}},
          lineColor={0,0,255},
          textString="ESST1A"),Text(
          extent={{-112,-20},{-90,-30}},
          lineColor={0,0,255},
          textString="VT"),Text(
          extent={{-27,-54},{1,-68}},
          lineColor={0,128,0},
          textString="VUEL2
(UEL=2)"),Text(
          extent={{-58,-54},{-30,-68}},
          lineColor={0,128,0},
          textString="VUEL1
(UEL=1)"),Text(
          extent={{3,-54},{31,-68}},
          lineColor={0,128,0},
          textString="VUEL3
(UEL=3)"),Text(
          extent={{-110,52},{-79,34}},
          lineColor={0,128,0},
          textString="VOTHSG2
(VOS=2)"),Text(
          extent={{-55,-32},{26,-45}},
          lineColor={0,128,0},
          fontName="Calibri",
          textStyle={TextStyle.Bold,TextStyle.Italic},
          textString="Alternate UEL inputs"),Text(
          extent={{-71,62},{25,47}},
          lineColor={0,128,0},
          fontName="Calibri",
          textStyle={TextStyle.Bold,TextStyle.Italic},
          textString="Alternate stabilizer inputs"),Text(
          extent={{3,20},{-3,-20}},
          lineColor={0,128,0},
          textString="}",
          origin={-75,56},
          rotation=360),Text(
          extent={{3,20},{-3,-20}},
          lineColor={0,128,0},
          textString="}",
          origin={-16,-47},
          rotation=90),Text(
          extent={{-107.8,-39.8},{-84,-50}},
          lineColor={0,0,255},
          textString="EFD0")}),
    Documentation(info="<html>
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
end ESST1A;
