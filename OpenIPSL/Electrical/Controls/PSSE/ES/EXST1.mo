within OpenIPSL.Electrical.Controls.PSSE.ES;
model EXST1 "IEEE Type AC2A Excitation System"
  parameter Real T_R=0.02;
  parameter Real V_IMAX=0.2;
  parameter Real V_IMIN=0;
  parameter Real T_C=1;
  parameter Real T_B=1;
  parameter Real K_A=80;
  parameter Real T_A=0.05;
  parameter Real V_RMAX=8;
  parameter Real V_RMIN=-3;
  parameter Real K_C=0.2;
  parameter Real K_F=0.1;
  parameter Real T_F=1;
  OpenIPSL.NonElectrical.Continuous.LeadLag imLeadLag(
    K=1,
    T1=T_C,
    T2=T_B,
    y_start=Efd0/K_A) annotation (Placement(transformation(extent={{116,-32},{140,-8}})));
  NonElectrical.Continuous.SimpleLag Vm(
    y_start=Vm0,
    K=1,
    T=T_R) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={8,-24})));
  Modelica.Blocks.Interfaces.RealInput ECOMP annotation (Placement(transformation(extent={{-136,48},{-98,86}}), iconTransformation(extent={{-132,52},{-98,86}})));
  Modelica.Blocks.Sources.Constant V_REF(k=VREF) annotation (Placement(transformation(extent={{4,8},{16,20}})));
  Modelica.Blocks.Interfaces.RealInput XADIFD
    annotation (Placement(transformation(
        extent={{-19,-19},{19,19}},
        rotation=0,
        origin={-119,-69}), iconTransformation(extent={{-17,-17},{17,17}}, origin={-115,-9})));
  Modelica.Blocks.Interfaces.RealOutput EFD annotation (Placement(transformation(extent={{280,-50},{300,-30}}), iconTransformation(extent={{280,-50},{300,-30}})));
  Modelica.Blocks.Interfaces.RealInput EFD0 annotation (Placement(transformation(
        extent={{-17,-17},{17,17}},
        rotation=0,
        origin={-119,-179}), iconTransformation(
        extent={{-17,-17},{17,17}},
        origin={-39,-165},
        rotation=90)));
  Modelica.Blocks.Interfaces.RealInput ETERM
    annotation (Placement(transformation(
        extent={{-19,-19},{19,19}},
        rotation=0,
        origin={-117,31}), iconTransformation(extent={{-17,-17},{17,17}}, origin={-115,33})));
  Modelica.Blocks.Math.Add VERR(k1=-1, k2=1) annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=0,
        origin={34,-20})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_IMAX, uMin=V_IMIN) annotation (Placement(transformation(extent={{78,-30},{98,-10}})));
  NonElectrical.Continuous.SimpleLag Vm1(
    y_start=Efd0,
    K=1,
    T=T_A) annotation (Placement(transformation(
        extent={{-16,-14},{16,14}},
        rotation=0,
        origin={192,-20})));
  Modelica.Blocks.Math.Gain K_a(k=K_A) annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=0,
        origin={154,-20})));
  Modelica.Blocks.Interfaces.RealInput VOTHSG annotation (Placement(transformation(extent={{-138,-52},{-98,-12}}), iconTransformation(extent={{-132,-68},{-98,-34}})));
  Modelica.Blocks.Interfaces.RealInput VOEL
    "Input from voltage over excitation limiter"
    annotation (Placement(transformation(extent={{-138,-110},{-98,-70}}), iconTransformation(extent={{-132,-104},{-98,-70}})));
  Modelica.Blocks.Interfaces.RealInput VUEL
    "Input from voltage under excitation limiter"
    annotation (Placement(transformation(extent={{-140,-158},{-100,-118}}), iconTransformation(extent={{-132,-142},{-98,-108}})));
  Modelica.Blocks.Continuous.Derivative imDerivativeLag(
    k=K_F,
    T=T_F,
    y_start=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput) annotation (Placement(transformation(extent={{142,-90},{122,-70}})));
  Modelica.Blocks.Math.Add3 add3_2 annotation (Placement(transformation(extent={{-60,-100},{-40,-80}})));
  Modelica.Blocks.Math.Add3 add3_1(k3=-1) annotation (Placement(transformation(extent={{48,-30},{68,-10}})));
protected
  parameter Real VREF(fixed=false);
  parameter Real Vm0(fixed=false);
  parameter Real Efd0(fixed=false);
protected
  Modelica.Blocks.Interfaces.RealOutput EFD1 annotation (Placement(transformation(extent={{230,-30},{250,-10}}), iconTransformation(extent={{302,-64},{322,-44}})));
initial equation
  Vm0 = ECOMP;
  Efd0 = EFD0;
  VREF = Efd0/K_A + Vm0;
equation
  if EFD > ETERM*V_RMAX - K_C*XADIFD then
    EFD = ETERM*V_RMAX - K_C*XADIFD;
  elseif EFD < ETERM*V_RMIN - K_C*XADIFD then
    EFD = ETERM*V_RMIN - K_C*XADIFD;
  else
    EFD = EFD1;
  end if;
  connect(V_REF.y, VERR.u2) annotation (Line(
      points={{16.6,14},{24,14},{24,-16.4},{26.8,-16.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Vm.y, VERR.u1) annotation (Line(points={{19,-24},{26.8,-24},{26.8,-23.6}}, color={0,0,127}));
  connect(ECOMP, Vm.u) annotation (Line(points={{-117,67},{-40,67},{-40,-24},{-4,-24}}, color={0,0,127}));
  connect(imLeadLag.y, K_a.u) annotation (Line(points={{141.2,-20},{149.2,-20}}, color={0,0,127}));
  connect(imLeadLag.u, limiter.y) annotation (Line(points={{113.6,-20},{99,-20}}, color={0,0,127}));
  connect(VOEL, add3_2.u2) annotation (Line(points={{-118,-90},{-90,-90},{-62,-90}}, color={0,0,127}));
  connect(VOTHSG, add3_2.u1) annotation (Line(points={{-118,-32},{-78,-32},{-78,-82},{-62,-82}}, color={0,0,127}));
  connect(VUEL, add3_2.u3) annotation (Line(points={{-120,-138},{-80,-138},{-80,-98},{-62,-98}}, color={0,0,127}));
  connect(add3_1.y, limiter.u) annotation (Line(points={{69,-20},{76,-20}}, color={0,0,127}));
  connect(VERR.y, add3_1.u2) annotation (Line(points={{40.6,-20},{46,-20}}, color={0,0,127}));
  connect(imDerivativeLag.y, add3_1.u3) annotation (Line(points={{121,-80},{84,-80},{46,-80},{46,-28}}, color={0,0,127}));
  connect(add3_2.y, add3_1.u1) annotation (Line(points={{-39,-90},{42,-90},{42,-12},{46,-12}}, color={0,0,127}));
  connect(K_a.y, Vm1.u) annotation (Line(points={{158.4,-20},{172.8,-20}}, color={0,0,127}));
  connect(Vm1.y, EFD1) annotation (Line(points={{209.6,-20},{240,-20}}, color={0,0,127}));
  connect(imDerivativeLag.u, EFD1) annotation (Line(points={{144,-80},{220,-80},{220,-20},{240,-20}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,-200},{300,100}}), graphics={Text(
          extent={{50,-2},{56,-12}},
          lineColor={255,0,0},
          textString="VS"),Text(
          extent={{24,0},{38,-16}},
          lineColor={255,0,0},
          textString="VERR")}),
    Icon(coordinateSystem(extent={{-120,-200},{300,100}}, preserveAspectRatio=true), graphics={Text(
          extent={{28,-18},{188,-60}},
          lineColor={0,0,255},
          textString="EXST1"),Rectangle(extent={{-100,82},{280,-160}}, lineColor={0,0,255}),Text(
          extent={{-90,100},{-30,38}},
          lineColor={0,0,255},
          textString="ECOMP"),Text(
          extent={{-88,24},{-28,-40}},
          lineColor={0,0,255},
          textString="XADIFD"),Text(
          extent={{-44,-124},{18,-146}},
          lineColor={0,0,255},
          textString="EFD0"),Text(
          extent={{-90,46},{-32,20}},
          lineColor={0,0,255},
          textString="ETERM"),Text(
          extent={{-92,-18},{-26,-82}},
          lineColor={0,0,255},
          textString="VOTHSG"),Text(
          extent={{-94,-52},{-48,-116}},
          lineColor={0,0,255},
          textString="VOEL"),Text(
          extent={{-94,-94},{-46,-156}},
          lineColor={0,0,255},
          textString="VUEL"),Text(
          extent={{238,-10},{274,-74}},
          lineColor={0,0,255},
          textString="EFD")}),
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
end EXST1;
