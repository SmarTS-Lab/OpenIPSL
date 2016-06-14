within OpenIPSL.Electrical.Banks.PSSE.SVC;
model SVC "On bus 10106 & 10114"
  OpenIPSL.Connectors.PwPin VIB
    "Voltage signal connected to stepdown transformer (pu)"                             annotation (Placement(transformation(extent={{-98,-4},{-86,8}})));
  Modelica.Blocks.Sources.Constant imSetPoint(k=Vref) annotation (Placement(transformation(extent={{-76,20},{-64,32}})));
  Modelica.Blocks.Sources.Constant imSetPoint1(k=Bref) annotation (Placement(transformation(extent={{-52,20},{-38,34}})));
  OpenIPSL.NonElectrical.Continuous.LeadLag imLeadLag(
    K=K,
    T1=T1,
    T2=T3,
    y_start=init_SVC_Leadlag) annotation (Placement(transformation(extent={{-6,0},{10,16}})));
  OpenIPSL.NonElectrical.Continuous.LeadLag imLeadLag1(
    K=1,
    T1=T2,
    T2=T4,
    y_start=init_SVC_Leadlag) annotation (Placement(transformation(extent={{18,0},{34,16}})));
  Modelica.Blocks.Nonlinear.Limiter imLimited(uMin=Vmin, uMax=Vmax) annotation (Placement(transformation(extent={{42,0},{58,16}})));
  NonElectrical.Continuous.SimpleLagLim imLimitedSimpleLag(
    K=1,
    T=T5,
    outMin=Mvar_C,
    y_start=init_SVC_Lag,
    outMax=Mvar_R) annotation (Placement(transformation(extent={{66,0},{82,16}})));
  OpenIPSL.Electrical.Banks.PwShunt shunt annotation (Placement(transformation(extent={{76,-72},{162,12}})));
  OpenIPSL.NonElectrical.Logical.Relay3 imRelay annotation (Placement(transformation(extent={{52,-40},{68,-24}})));
  Modelica.Blocks.Sources.Constant Q_capacitors(k=Mvar_C) "If Verr>Vov" annotation (Placement(transformation(extent={{6,-20},{22,-4}})));
  Modelica.Blocks.Sources.Constant Q_Reactors(k=Mvar_R) "If Verr<-Vov" annotation (Placement(transformation(extent={{6,-42},{22,-26}})));
  Modelica.Blocks.Math.Gain imGain(k=1/Sbase) annotation (Placement(transformation(extent={{80,-32},{92,-20}})));
  parameter Real Vref "Reference voltage (pu)";
  parameter Real Bref "Reference susceptance (pu)";
  parameter Real K=150 "Steady-state gain";
  parameter Real T1 "Time constant (s)";
  parameter Real T2 "Time constant (s)";
  parameter Real T3 "Time constant (s)";
  parameter Real T4 "Time constant (s)";
  parameter Real T5=0.03 "Time constant of thyristor bridge (s)";
  parameter Real Vmax;
  parameter Real Vmin;
  parameter Real Vov=0.5 "Override voltage (pu)";
  parameter Real Sbase "Base power of the bus (MVA)";
  parameter Real init_SVC_Leadlag "Initial value";
  parameter Real init_SVC_Lag "Initial value";
  parameter Real OtherSignals;
  parameter Real Mvar_C=100
    "Total compensation capacity of shunt capacitor, 100(10106)/200(10114) MVar";
  parameter Real Mvar_R=-50
    "Total compensation capacity of shunt reactor, MVar";
  Modelica.Blocks.Sources.Constant imSetPoint2(k=OtherSignals) annotation (Placement(transformation(extent={{-52,-18},{-40,-6}})));
  OpenIPSL.Electrical.Sensors.PwVoltage pwVoltage annotation (Placement(transformation(extent={{-90,-14},{-58,20}})));
  Modelica.Blocks.Math.Add add(k1=1, k2=-1) annotation (Placement(transformation(extent={{-58,0},{-46,12}})));
  Modelica.Blocks.Math.Add3 add3_1(k1=-1, k3=-1) annotation (Placement(transformation(extent={{-28,2},{-14,16}})));
equation
  connect(VIB, pwVoltage.p) annotation (Line(
      points={{-92,2},{-87,2},{-87,3},{-82,3}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(shunt.p, VIB) annotation (Line(
      points={{119,-8.16},{119,52},{-92,52},{-92,2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(imRelay.y, imGain.u) annotation (Line(points={{69.2,-32},{74,-32},{74,-26},{78.8,-26}}, color={0,0,127}));
  connect(shunt.Q, imGain.y) annotation (Line(points={{97.93,-26.22},{96,-26.22},{96,-26},{92.6,-26}}, color={0,0,127}));
  connect(imLimitedSimpleLag.y, imRelay.u2) annotation (Line(points={{82.8,8},{88,8},{88,-16},{42,-16},{42,-26},{50.4,-26}}, color={0,0,127}));
  connect(imLimited.y, imLimitedSimpleLag.u) annotation (Line(points={{58.8,8},{60,8},{64.4,8}}, color={0,0,127}));
  connect(imLeadLag1.y, imLimited.u) annotation (Line(points={{34.8,8},{34.8,8},{40.4,8}}, color={0,0,127}));
  connect(imLeadLag.y, imLeadLag1.u) annotation (Line(points={{10.8,8},{16.4,8}}, color={0,0,127}));
  connect(Q_Reactors.y, imRelay.u4) annotation (Line(points={{22.8,-34},{50.4,-34}}, color={0,0,127}));
  connect(Q_capacitors.y, imRelay.u3) annotation (Line(points={{22.8,-12},{30,-12},{30,-30},{50.4,-30}}, color={0,0,127}));
  connect(add.u2, pwVoltage.v) annotation (Line(points={{-59.2,2.4},{-62,2.4},{-62,-2.1},{-66.16,-2.1}}, color={0,0,127}));
  connect(imSetPoint.y, add.u1) annotation (Line(points={{-63.4,26},{-59.2,26},{-59.2,9.6}}, color={0,0,127}));
  connect(add3_1.y, imLeadLag.u) annotation (Line(points={{-13.3,9},{-10.65,9},{-10.65,8},{-7.6,8}}, color={0,0,127}));
  connect(imSetPoint2.y, add3_1.u3) annotation (Line(points={{-39.4,-12},{-34,-12},{-34,3.4},{-29.4,3.4}}, color={0,0,127}));
  connect(imSetPoint1.y, add3_1.u1) annotation (Line(points={{-37.3,27},{-34,27},{-34,14.6},{-29.4,14.6}}, color={0,0,127}));
  connect(add.y, add3_1.u2) annotation (Line(points={{-45.4,6},{-38,6},{-38,9},{-29.4,9}}, color={0,0,127}));
  connect(imRelay.u1, add3_1.u2) annotation (Line(points={{50.4,-38},{36,-38},{36,-54},{-36,-54},{-36,9},{-29.4,9}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{140,100}}), graphics={Text(
          extent={{-44,16},{-34,12}},
          lineColor={255,0,0},
          textString="Verr"),Text(
          extent={{-82,28},{-58,24}},
          lineColor={255,0,0},
          textString="Vref"),Text(
          extent={{-58,28},{-34,24}},
          lineColor={255,0,0},
          textString="Bref"),Text(
          extent={{-80,-4},{-68,-10}},
          lineColor={255,0,0},
          textString="|VB|")}),
    Icon(coordinateSystem(extent={{-100,-100},{140,100}}, preserveAspectRatio=false), graphics={Line(
          points={{-88,0},{-60,0}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{-60,16},{-60,-18}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{-44,20},{-48,16},{-52,10},{-54,2},{-54,-4},{-52,-10},{-50,-14},{-46,-20},{-44,-20}},
          color={0,0,255},
          smooth=Smooth.Bezier,
          thickness=0.5),Rectangle(extent={{-86,34},{-14,-34}}, lineColor={0,0,255}),Text(
          extent={{-40,-18},{-14,-40}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="SVC")}),
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
end SVC;
