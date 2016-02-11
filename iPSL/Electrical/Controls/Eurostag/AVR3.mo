within iPSL.Electrical.Controls.Eurostag;
model AVR3 "Voltage regulator. Developed by AIA. 2013"
  parameter Real Kgain;
  parameter Real KE;
  parameter Real TE;
  parameter Real init_V1;
  parameter Real init_V2;
  Modelica.Blocks.Math.Gain imGain(k=Kgain) annotation (Placement(transformation(extent={{-2,18},{20,40}})));
  Modelica.Blocks.Interfaces.RealOutput pin_EFD annotation (Placement(transformation(extent={{60,-10},{79,10}}), iconTransformation(extent={{59,-10},{79,10}})));
  Modelica.Blocks.Interfaces.RealInput pin_TerminalVoltage annotation (Placement(transformation(extent={{-61,-10},{-41,10}}), iconTransformation(extent={{-61,-10},{-41,10}})));
  Modelica.Blocks.Sources.Constant imSetPoint(k=init_V1) annotation (Placement(transformation(extent={{-90,38},{-68,60}})));
  iPSL.NonElectrical.Continuous.SimpleLag imSimpleLag(
    K=KE,
    T=TE,
    y_start=init_V2) annotation (Placement(transformation(extent={{34,20},{52,38}})));
  Modelica.Blocks.Math.Add add1(k2=-1) annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
equation
  connect(imGain.y, imSimpleLag.u) annotation (Line(points={{21.1,29},{26.55,29},{26.55,29},{32.2,29}}, color={0,0,127}));
  connect(imSimpleLag.y, pin_EFD) annotation (Line(points={{52.9,29},{80,29},{80,0},{69.5,0}}, color={0,0,127}));
  connect(add1.y, imGain.u) annotation (Line(points={{-19,30},{-4.2,30},{-4.2,29}}, color={0,0,127}));
  connect(imSetPoint.y, add1.u1) annotation (Line(points={{-66.9,49},{-50,49},{-50,36},{-42,36}}, color={0,0,127}));
  connect(add1.u2, pin_TerminalVoltage) annotation (Line(points={{-42,24},{-51,24},{-51,0}}, color={0,0,127}));
  annotation (
    Icon(graphics={Rectangle(extent={{-40,40},{60,-40}}, lineColor={0,0,255}),Text(
          extent={{58,-10},{-40,12}},
          lineColor={0,0,255},
          textString="AVR3")}),
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
</html>"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
end AVR3;
