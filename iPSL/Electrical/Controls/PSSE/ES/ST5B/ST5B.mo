within iPSL.Electrical.Controls.PSSE.ES.ST5B;
model ST5B "IEEE 421.5 2005 ST5B Excitation System"
  parameter Real T_R=0.025 "Regulator input filter time constant (s)";
  parameter Real T_C1=0.1 "Lead time constant of first lead-lag block (voltage regulator channel) (s)";
  parameter Real T_B1=0.2 "Lag time constant of first lead-lag block (voltage regulator channel) (s)";
  parameter Real T_C2=1 "Lead time constant of second lead-lag block (voltage regulator channel) (s)";
  parameter Real T_B2=1 "Lag time constant of second lead-lag block (voltage regulator channel) (s)";
  parameter Real K_R=1 "Voltage regulator gain (pu)";
  parameter Real V_RMAX=10 "Voltage regulator maximum limit (pu)";
  parameter Real V_RMIN=-10 "Voltage regulator minimum limit (pu)";
  parameter Real T_1=0.58 "voltage regulator time constant (s)";
  parameter Real K_C=0.3 "(pu)";
  parameter Real T_UC1=1 "Lead time constant of first lead-lag block (under- excitation channel) (s)";
  parameter Real T_UB1=1 "Lag time constant of first lead-lag block (under- excitation channel) (s)";
  parameter Real T_UC2=1 "Lead time constant of second lead-lag block (under- excitation channel) (s)";
  parameter Real T_UB2=1 "Lag time constant of second lead-lag block (under- excitation channel) (s)";
  parameter Real T_OC1=1 "Lead time constant of first lead-lag block (over- excitation channel) (s)";
  parameter Real T_OB1=1 "Lag time constant of first lead-lag block (over- excitation channel) (s)";
  parameter Real T_OC2=1 "Lead time constant of second lead-lag block (over- excitation channel) (s)";
  parameter Real T_OB2=1 "Lag time constant of second lead-lag block (over- excitation channel) (s)";
  Modelica.Blocks.Interfaces.RealInput ECOMP annotation (Placement(transformation(extent={{-316,-10},{-296,10}}), iconTransformation(extent={{-300,80},{-280,100}})));
  Modelica.Blocks.Interfaces.RealInput XADIFD
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={210,-126}), iconTransformation(extent={{-10,-10},{10,10}}, origin={-290,-30})));
  Modelica.Blocks.Interfaces.RealOutput EFD annotation (Placement(transformation(extent={{300,-10},{320,10}}), iconTransformation(extent={{300,-10},{320,10}})));
  Modelica.Blocks.Interfaces.RealInput VUEL annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-100,104}), iconTransformation(
        extent={{-10,-10},{10,10}},
        origin={-130,-110},
        rotation=90)));
  Modelica.Blocks.Interfaces.RealInput EFD0
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-306,-64}), iconTransformation(extent={{-10,-10},{10,10}}, origin={-290,-90})));
  Modelica.Blocks.Interfaces.RealInput VOTHSG annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-134,104}), iconTransformation(
        extent={{-10,-10},{10,10}},
        origin={30,-110},
        rotation=90)));
  Modelica.Blocks.Math.Add VERR(k1=-1, k2=1) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-210,6})));
  Modelica.Blocks.Interfaces.RealInput VOEL annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-48,104}), iconTransformation(
        extent={{-10,-10},{10,10}},
        origin={-50,-110},
        rotation=90)));
  Modelica.Blocks.Math.Add VERR1 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-98,6})));
  NonElectrical.Logical.LV_GATE lV_Gate annotation (Placement(transformation(extent={{-142,6},{-120,18}})));
  NonElectrical.Logical.HV_GATE hV_Gate annotation (Placement(transformation(extent={{-182,2},{-156,16}})));
  NonElectrical.Continuous.LeadLagLim imLimitedLeadLag(
    K=1,
    outMax=V_RMAX/K_R,
    T1=T_C1,
    T2=T_B1,
    outMin=V_RMIN/K_R,
    y_start=VR0/K_R) annotation (Placement(transformation(extent={{-50,-4},{-30,16}})));
  NonElectrical.Continuous.LeadLagLim imLimitedLeadLag2(
    K=1,
    outMax=V_RMAX/K_R,
    T1=T_C2,
    T2=T_B2,
    outMin=V_RMIN/K_R,
    y_start=VR0/K_R) annotation (Placement(transformation(extent={{10,-4},{30,16}})));
  Modelica.Blocks.Math.Gain K_r(k=K_R) annotation (Placement(transformation(
        extent={{-10,-9.5},{10,9.5}},
        rotation=0,
        origin={130,0.5})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_RMAX, uMin=V_RMIN) annotation (Placement(transformation(extent={{160,-10},{180,10}})));
  Modelica.Blocks.Math.Add VERR2(k1=-1, k2=1) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={230,0})));
  Modelica.Blocks.Math.Gain K_c(k=K_C) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={210,-92})));
  NonElectrical.Continuous.LeadLagLim imLimitedLeadLag1(
    K=1,
    T1=T_UC1,
    T2=T_UB1,
    outMin=V_RMIN/K_R,
    y_start=VR0/K_R,
    outMax=V_RMAX/K_R) annotation (Placement(transformation(extent={{-50,-54},{-30,-34}})));
  NonElectrical.Continuous.LeadLagLim imLimitedLeadLag3(
    K=1,
    outMax=V_RMAX/K_R,
    T1=T_UC1,
    T2=T_UB1,
    outMin=V_RMIN/K_R,
    y_start=VR0/K_R) annotation (Placement(transformation(extent={{10,-54},{30,-34}})));
  NonElectrical.Continuous.LeadLagLim imLimitedLeadLag4(
    K=1,
    outMax=V_RMAX/K_R,
    T1=T_OC1,
    T2=T_OB1,
    outMin=V_RMIN/K_R,
    y_start=VR0/K_R) annotation (Placement(transformation(extent={{-50,-94},{-30,-74}})));
  NonElectrical.Continuous.LeadLagLim imLimitedLeadLag5(
    K=1,
    outMax=V_RMAX/K_R,
    T1=T_OC1,
    T2=T_OB1,
    outMin=V_RMIN/K_R,
    y_start=VR0/K_R) annotation (Placement(transformation(extent={{10,-94},{30,-74}})));
  NonElectrical.Continuous.SimpleLagLimVar simpleLagLimVar(
    K=1,
    T=T_1,
    y_start=Efd0) annotation (Placement(transformation(extent={{260,-10},{280,10}})));
  Modelica.Blocks.Math.Gain high(k=V_RMAX) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={182,-30})));
  Modelica.Blocks.Math.Gain low(k=V_RMIN) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={180,-70})));
  Modelica.Blocks.Sources.Constant const(k=VREF) annotation (Placement(transformation(extent={{-260,36},{-240,56}})));
  Modelica.Blocks.Interfaces.RealInput ETERM
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={110,-124}), iconTransformation(extent={{-300,20},{-280,40}})));
  NonElectrical.Continuous.SimpleLag simpleLag(
    K=1,
    T=T_R,
    y_start=Vm0) annotation (Placement(transformation(extent={{-270,-10},{-250,10}})));
protected
  parameter Real VREF(fixed=false);
  parameter Real Vm0(fixed=false);
  parameter Real VR0(fixed=false);
  parameter Real Efd0(fixed=false);
initial equation
  VR0 = EFD0 + K_C*XADIFD;
  VREF = VR0/K_R + ECOMP;
  Vm0 = ECOMP;
  Efd0 = EFD0;
equation
  connect(K_r.y, limiter.u) annotation (Line(
      points={{141,0.5},{152,0.5},{152,0},{158,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VOTHSG, VERR1.u1) annotation (Line(
      points={{-134,104},{-134,0},{-110,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limiter.y, VERR2.u2) annotation (Line(
      points={{181,0},{200,0},{200,6},{218,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hV_Gate.p, lV_Gate.n2) annotation (Line(
      points={{-157.625,9},{-143.375,9}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(lV_Gate.p, VERR1.u2) annotation (Line(
      points={{-121.375,12},{-110,12}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VERR1.y, imLimitedLeadLag.u) annotation (Line(points={{-87,6},{-52,6}}, color={0,0,127}));
  connect(imLimitedLeadLag.y, imLimitedLeadLag2.u) annotation (Line(points={{-29,6},{8,6}}, color={0,0,127}));
  connect(imLimitedLeadLag1.u, imLimitedLeadLag.u) annotation (Line(points={{-52,-44},{-80,-44},{-80,6},{-52,6}}, color={0,0,127}));
  connect(imLimitedLeadLag1.y, imLimitedLeadLag3.u) annotation (Line(points={{-29,-44},{-29,-44},{8,-44}}, color={0,0,127}));
  connect(imLimitedLeadLag4.u, imLimitedLeadLag.u) annotation (Line(points={{-52,-84},{-80,-84},{-80,6},{-52,6}}, color={0,0,127}));
  connect(VERR2.y, simpleLagLimVar.u) annotation (Line(points={{241,0},{241,0},{258,0}}, color={0,0,127}));
  connect(low.y, simpleLagLimVar.outMin) annotation (Line(points={{191,-70},{262,-70},{262,-14}}, color={0,0,127}));
  connect(high.y, simpleLagLimVar.outMax) annotation (Line(points={{193,-30},{244,-30},{244,32},{278,32},{278,14}}, color={0,0,127}));
  connect(VOEL, lV_Gate.n1) annotation (Line(points={{-48,104},{-48,66},{-152,66},{-152,15},{-143.375,15}}, color={0,0,127}));
  connect(hV_Gate.n1, VUEL) annotation (Line(points={{-183.625,12.5},{-190,12.5},{-190,86},{-100,86},{-100,104}}, color={0,0,127}));
  connect(K_c.u, XADIFD) annotation (Line(points={{210,-104},{210,-126}}, color={0,0,127}));
  connect(K_c.y, VERR2.u1) annotation (Line(points={{210,-81},{210,-81},{210,-6},{218,-6}}, color={0,0,127}));
  connect(imLimitedLeadLag4.y, imLimitedLeadLag5.u) annotation (Line(points={{-29,-84},{-10.5,-84},{8,-84}}, color={0,0,127}));
  connect(const.y, VERR.u2) annotation (Line(points={{-239,46},{-232,46},{-232,12},{-222,12}}, color={0,0,127}));
  connect(high.u, ETERM) annotation (Line(points={{170,-30},{110,-30},{110,-124}}, color={0,0,127}));
  connect(low.u, ETERM) annotation (Line(points={{168,-70},{110,-70},{110,-124}}, color={0,0,127}));
  connect(simpleLag.y, VERR.u1) annotation (Line(points={{-249,0},{-222,0}}, color={0,0,127}));
  connect(ECOMP, simpleLag.u) annotation (Line(points={{-306,0},{-289,0},{-272,0}}, color={0,0,127}));
  connect(imLimitedLeadLag2.y, K_r.u) annotation (Line(points={{31,6},{74,6},{74,0.5},{118,0.5}}, color={0,0,127}));
  connect(VERR.y, hV_Gate.n2) annotation (Line(points={{-199,6},{-183.625,6},{-183.625,5.5}}, color={0,0,127}));
  connect(simpleLagLimVar.y, EFD) annotation (Line(points={{281,0},{310,0}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-300,-120},{300,120}},
        grid={2,2})),
    Icon(coordinateSystem(
        extent={{-300,-120},{300,120}},
        preserveAspectRatio=false,
        grid={2,2}), graphics={Rectangle(
          extent={{-300,120},{300,-120}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-56,22},{66,-22}},
          lineColor={28,108,200},
          textString="ST5B"),Text(
          extent={{-274,100},{-202,80}},
          lineColor={28,108,200},
          textString="ECOMP"),Text(
          extent={{-6,-80},{70,-100}},
          lineColor={28,108,200},
          textString="VOTHSG"),Text(
          extent={{-274,-20},{-204,-40}},
          lineColor={28,108,200},
          textString="XADIFD"),Text(
          extent={{-156,-80},{-108,-100}},
          lineColor={28,108,200},
          textString="VUEL"),Text(
          extent={{-272,-80},{-226,-100}},
          lineColor={28,108,200},
          textString="EFD0"),Text(
          extent={{-72,-80},{-26,-100}},
          lineColor={28,108,200},
          textString="VOEL"),Text(
          extent={{254,10},{294,-10}},
          lineColor={28,108,200},
          textString="EFD"),Text(
          extent={{-276,40},{-204,20}},
          lineColor={28,108,200},
          textString="ETERM")}),
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
end ST5B;
