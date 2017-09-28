within OpenIPSL.Electrical.Controls.PSSE.ES;
model ESST1A "IEEE Type ST1A Excitation System"
  extends OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter;
  parameter Real T_R=0 "Voltage input time constant (s)"
    annotation (Dialog(group="Excitation system parameters"));
  parameter Real V_IMAX
    annotation (Dialog(group="Excitation system parameters"));
  parameter Real V_IMIN
    annotation (Dialog(group="Excitation system parameters"));
  parameter Real T_C=0 "AVR lead-lag time constant (s)"
    annotation (Dialog(group="Excitation system parameters"));
  parameter Real T_B=0 "AVR lead-lag time constant (s)"
    annotation (Dialog(group="Excitation system parameters"));
  parameter Real T_C1=0 "AVR lead-lag time constant (s)"
    annotation (Dialog(group="Excitation system parameters"));
  parameter Real T_B1=0 "AVR lead-lag time constant (s)"
    annotation (Dialog(group="Excitation system parameters"));
  parameter Real K_A=400 "AVR gain"
    annotation (Dialog(group="Excitation system parameters"));
  parameter Real T_A=0.02 "AVR time constant (s)"
    annotation (Dialog(group="Excitation system parameters"));
  parameter Real V_AMAX "Maximum AVR output (pu)"
    annotation (Dialog(group="Excitation system parameters"));
  parameter Real V_AMIN "Minimum AVR output (pu)"
    annotation (Dialog(group="Excitation system parameters"));
  parameter Real V_RMAX=9
    annotation (Dialog(group="Excitation system parameters"));
  parameter Real V_RMIN=-5.43
    annotation (Dialog(group="Excitation system parameters"));
  parameter Real K_C=0.2 "Rectifier load factor (pu)"
    annotation (Dialog(group="Excitation system parameters"));
  parameter Real K_F=0.03 "Rate feedback gain (pu)"
    annotation (Dialog(group="Excitation system parameters"));
  parameter Real T_F=1 "Rate feedback time constant (s)"
    annotation (Dialog(group="Excitation system parameters"));
  parameter Real K_LR annotation (Dialog(group="Excitation system parameters"));
  parameter Real I_LR annotation (Dialog(group="Excitation system parameters"));
  Modelica.Blocks.Continuous.Derivative imDerivativeLag(
    y_start=0,
    k=K_F,
    T=T_F,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    x_start=Efd0)
    annotation (Placement(transformation(extent={{20,60},{0,80}})));
  Modelica.Blocks.Interfaces.RealInput VOTHSG2 "VOS=2" annotation (Placement(
        transformation(extent={{-210,122},{-190,142}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-200,130})));
  Modelica.Blocks.Interfaces.RealInput VUEL3 "UEL=3" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={50,-200}), iconTransformation(
        extent={{9.95,-10.15},{-9.95,10.15}},
        rotation=270,
        origin={49.85,-199.95})));
  Modelica.Blocks.Nonlinear.Limiter imLimited(uMin=V_IMIN, uMax=V_IMAX)
    annotation (Placement(transformation(extent={{-64,-10},{-44,10}})));
  NonElectrical.Logical.HV_GATE hV_GATE
    annotation (Placement(transformation(extent={{-36.7,-5.5},{-14,6}})));
  Modelica.Blocks.Interfaces.RealInput VUEL2 "UEL=2" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-10,-200}), iconTransformation(
        extent={{9.9,-9.9},{-9.9,9.9}},
        rotation=270,
        origin={-9.9,-199.9})));
  Modelica.Blocks.Math.Gain imGain(k=K_LR) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={40,-70})));
  NonElectrical.Logical.HV_GATE hV_GATE1
    annotation (Placement(transformation(extent={{105.3,-2.7},{126,8}})));
  NonElectrical.Logical.LV_GATE lV_GATE
    annotation (Placement(transformation(extent={{130.8,-6.7},{156,6}})));
  Modelica.Blocks.Interfaces.RealInput VT "sensed VT" annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={150,-140}), iconTransformation(
        extent={{-9.75,-10.25},{9.75,10.25}},
        rotation=0,
        origin={-199.75,49.75})));
  Modelica.Blocks.Sources.Constant Vref1(k=I_LR)
    annotation (Placement(transformation(extent={{0,-150},{20,-130}})));
  NonElectrical.Continuous.LeadLag imLeadLag(
    K=1,
    T1=T_C,
    T2=T_B,
    y_start=VA0/K_A,
    x_start=V_REF - ECOMP0)
    annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
  NonElectrical.Continuous.LeadLag imLeadLag1(
    K=1,
    y_start=VA0/K_A,
    T1=T_C1,
    T2=T_B1,
    x_start=VA0/K_A)
    annotation (Placement(transformation(extent={{22,-9},{42,10}})));
  Modelica.Blocks.Interfaces.RealInput XADIFD annotation (Placement(
        transformation(
        extent={{-12.35,-12.35},{12.35,12.35}},
        rotation=90,
        origin={162.25,-159.55}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-200,-70})));
  Modelica.Blocks.Math.Add3 add3_1(k1=-1)
    annotation (Placement(transformation(extent={{-92,-10},{-72,10}})));
  NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=K_A,
    T=T_A,
    y_start=VA0,
    outMax=V_AMAX,
    outMin=V_AMIN)
    annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  Modelica.Blocks.Math.Add add2(k1=-1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={40,-120})));
  Modelica.Blocks.Nonlinear.Limiter imLimited1(uMax=Modelica.Constants.inf,
      uMin=0) annotation (Placement(transformation(
        extent={{-10,-9.6},{10,9.6}},
        rotation=90,
        origin={40.4,-40})));
  Modelica.Blocks.Math.Add3 add3_2(k3=-1)
    annotation (Placement(transformation(extent={{78,-10},{98,10}})));
  Modelica.Blocks.Math.Gain imGain1(k=V_RMIN) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={136,-30})));
  Modelica.Blocks.Math.Gain imGain2(k=V_RMAX) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={150,-70})));
  Modelica.Blocks.Math.Add add3(k1=-1) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={170,-30})));
  Modelica.Blocks.Math.Gain imGain3(k=K_C) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={190,-70})));
  Modelica.Blocks.Nonlinear.VariableLimiter variableLimiter
    annotation (Placement(transformation(extent={{178,-10},{198,10}})));
  NonElectrical.Continuous.SimpleLag TransducerDelay(
    K=1,
    T=T_R,
    y_start=ECOMP0)
    annotation (Placement(transformation(extent={{-170,-10},{-150,10}})));
  Modelica.Blocks.Math.Add Limiters
    annotation (Placement(transformation(extent={{-120,-60},{-100,-40}})));
protected
  parameter Real IFD0(fixed=false);
  parameter Real VA0(fixed=false);
initial equation
  IFD0 = XADIFD;
  VA0 = Efd0 + K_LR*(IFD0 - I_LR);
  V_REF = VA0/K_A + ECOMP0;
equation
  connect(add3_1.y, imLimited.u)
    annotation (Line(points={{-71,0},{-66,0}}, color={0,0,127}));
  connect(imLeadLag.y, imLeadLag1.u)
    annotation (Line(points={{13,0},{13,0.5},{20,0.5}}, color={0,0,127}));
  connect(simpleLagLim.u, imLeadLag1.y)
    annotation (Line(points={{48,0},{43,0},{43,0.5}}, color={0,0,127}));
  connect(Vref1.y, add2.u1)
    annotation (Line(points={{21,-140},{34,-140},{34,-132}}, color={0,0,127}));
  connect(add2.u2, XADIFD) annotation (Line(points={{46,-132},{46,-159.55},{
          162.25,-159.55}}, color={0,0,127}));
  connect(imGain1.y, variableLimiter.limit2)
    annotation (Line(points={{136,-19},{136,-8},{176,-8}}, color={0,0,127}));
  connect(add3_1.u1, imDerivativeLag.y) annotation (Line(points={{-94,8},{-98,8},
          {-98,70},{-1,70}}, color={0,0,127}));
  connect(VUEL2, hV_GATE.n2) annotation (Line(points={{-10,-200},{-10,-174},{-42,
          -174},{-42,-2.625},{-38.1188,-2.625}}, color={0,0,127}));
  connect(variableLimiter.y, EFD)
    annotation (Line(points={{199,0},{210,0}}, color={0,0,127}));
  connect(imGain3.y, add3.u1) annotation (Line(points={{190,-59},{190,-50},{176,
          -50},{176,-42}}, color={0,0,127}));
  connect(imGain2.y, add3.u2) annotation (Line(points={{150,-59},{150,-50},{164,
          -50},{164,-42}}, color={0,0,127}));
  connect(XADIFD, imGain3.u) annotation (Line(points={{162.25,-159.55},{162.25,
          -100},{190,-100},{190,-82}}, color={0,0,127}));
  connect(VT, imGain2.u) annotation (Line(points={{150,-140},{150,-111},{150,-82}},
        color={0,0,127}));
  connect(VOEL, lV_GATE.n2) annotation (Line(points={{-70,-200},{-70,-200},{-70,
          -100},{100,-100},{100,-3.525},{129.225,-3.525}}, color={0,0,127}));
  connect(imGain1.u, imGain2.u) annotation (Line(points={{136,-42},{136,-120},{
          150,-120},{150,-82}}, color={0,0,127}));
  connect(ECOMP, TransducerDelay.u)
    annotation (Line(points={{-200,0},{-172,0}}, color={0,0,127}));
  connect(TransducerDelay.y, DiffV.u2) annotation (Line(points={{-149,0},{-132,
          0},{-132,-6},{-122,-6}}, color={0,0,127}));
  connect(DiffV.y, add3_1.u2)
    annotation (Line(points={{-99,0},{-94,0}}, color={0,0,127}));
  connect(VUEL, Limiters.u2) annotation (Line(points={{-130,-200},{-130,-200},{
          -130,-56},{-122,-56}}, color={0,0,127}));
  connect(VOTHSG, Limiters.u1) annotation (Line(points={{-200,90},{-170,90},{-140,
          90},{-140,-44},{-122,-44}}, color={0,0,127}));
  connect(Limiters.y, add3_1.u3) annotation (Line(points={{-99,-50},{-98,-50},{
          -98,-8},{-94,-8}}, color={0,0,127}));
  connect(imLimited.y, hV_GATE.n1) annotation (Line(points={{-43,0},{-42,0},{-42,
          3.125},{-38.1188,3.125}}, color={0,0,127}));
  connect(VOTHSG2, add3_2.u1) annotation (Line(points={{-200,132},{70,132},{70,
          8},{76,8}}, color={0,0,127}));
  connect(lV_GATE.p, variableLimiter.u) annotation (Line(points={{154.425,-0.35},
          {164.213,-0.35},{164.213,0},{176,0}}, color={0,0,127}));
  connect(hV_GATE1.p, lV_GATE.n1) annotation (Line(points={{124.706,2.65},{
          124.228,2.65},{124.228,2.825},{129.225,2.825}}, color={0,0,127}));
  connect(add3_2.y, hV_GATE1.n1) annotation (Line(points={{99,0},{100,0},{100,
          5.325},{104.006,5.325}}, color={0,0,127}));
  connect(imDerivativeLag.u, hV_GATE1.n1) annotation (Line(points={{22,70},{102,
          70},{102,5.325},{104.006,5.325}}, color={0,0,127}));
  connect(imGain.u, add2.y)
    annotation (Line(points={{40,-82},{40,-109},{40,-109}}, color={0,0,127}));
  connect(imLimited1.u, imGain.y)
    annotation (Line(points={{40.4,-52},{40,-52},{40,-59}}, color={0,0,127}));
  connect(imLimited1.y, add3_2.u3) annotation (Line(points={{40.4,-29},{40.4,-20},
          {70,-20},{70,-8},{76,-8}}, color={0,0,127}));
  connect(add3.y, variableLimiter.limit1)
    annotation (Line(points={{170,-19},{170,8},{176,8}}, color={0,0,127}));
  connect(simpleLagLim.y, add3_2.u2)
    annotation (Line(points={{71,0},{76,0}}, color={0,0,127}));
  connect(hV_GATE.p, imLeadLag.u) annotation (Line(points={{-15.4187,0.25},{-12.7094,
          0.25},{-12.7094,0},{-10,0}}, color={0,0,127}));
  connect(VUEL3, hV_GATE1.n2) annotation (Line(points={{50,-200},{50,-200},{50,
          -174},{110,-174},{110,-20},{104.006,-20},{104.006,-0.025}}, color={0,
          0,127}));
  annotation (
    Diagram(coordinateSystem(
        extent={{-200,-200},{200,160}},
        grid={2,2},
        initialScale=0.1)),
    Icon(coordinateSystem(
        extent={{-200,-200},{200,160}},
        grid={2,2},
        initialScale=0.1), graphics={Text(
          extent={{-162,112},{-134,95}},
          lineColor={0,128,0},
          textString="(VOS=1)"),Text(
          extent={{-23,-160},{5,-174}},
          lineColor={0,128,0},
          textString="(UEL=2)"),Text(
          extent={{-144,-160},{-116,-174}},
          lineColor={0,128,0},
          textString="(UEL=1)"),Text(
          extent={{33,-160},{61,-174}},
          lineColor={0,128,0},
          textString="(UEL=3)"),Text(
          extent={{-190,140},{-108,120}},
          lineColor={28,108,200},
          textString="VOTHSG2"),Text(
          extent={{-162,152},{-134,135}},
          lineColor={0,128,0},
          textString="(VOS=2)"),Text(
          extent={{-184,60},{-156,40}},
          lineColor={28,108,200},
          textString="VT"),Text(
          extent={{-184,-62},{-114,-82}},
          lineColor={28,108,200},
          textString="XADIFD"),Text(
          extent={{-36,-170},{16,-190}},
          lineColor={28,108,200},
          textString="VUEL"),Text(
          extent={{24,-170},{76,-190}},
          lineColor={28,108,200},
          textString="VUEL")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSS/E Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2016-04-29</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Tin Rabuzin,SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end ESST1A;
