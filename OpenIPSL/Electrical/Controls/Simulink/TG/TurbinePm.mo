within OpenIPSL.Electrical.Controls.Simulink.TG;
model TurbinePm "Hydraulic turbine model. Mechanical Power Pm as output"
  parameter Real p0 "Initialization, initial electrical power";
  Modelica.Blocks.Interfaces.RealInput z "Gate openning" annotation (Placement(transformation(extent={{-95,2},{-88,10}}), iconTransformation(extent={{-92,-6},{-78,8}})));
  Modelica.Blocks.Sources.Constant Hs(k=1) "set point" annotation (Placement(transformation(extent={{-78,-14},{-58,6}})));
  Modelica.Blocks.Math.Gain Tw(k=1) "Water constant" annotation (Placement(transformation(extent={{-16,0},{0,16}})));
  Modelica.Blocks.Continuous.Integrator imIntegrator(
    k=1,
    y_start=p0,
    initType=Modelica.Blocks.Types.Init.InitialOutput) annotation (Placement(transformation(extent={{12,0},{28,16}})));
  Modelica.Blocks.Interfaces.RealOutput Pm "Mechanical power" annotation (Placement(transformation(extent={{88,2},{94,10}}), iconTransformation(extent={{32,-6},{48,12}})));
  Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(extent={{-54,26},{-40,40}})));
  Modelica.Blocks.Math.Division division1 annotation (Placement(transformation(extent={{-80,26},{-66,40}})));
  Modelica.Blocks.Math.Add add(k1=-1) annotation (Placement(transformation(extent={{-46,-2},{-26,18}})));
  Modelica.Blocks.Math.Product product annotation (Placement(transformation(extent={{42,4},{58,20}})));
equation
  connect(division1.y, product1.u1) annotation (Line(points={{-65.3,33},{-60,33},{-60,37.2},{-55.4,37.2}}, color={0,0,127}));
  connect(product1.u2, product1.u1) annotation (Line(points={{-55.4,28.8},{-60,28.8},{-60,37.2},{-55.4,37.2}}, color={0,0,127}));
  connect(Tw.y, imIntegrator.u) annotation (Line(points={{0.8,8},{6,8},{10.4,8}}, color={0,0,127}));
  connect(add.y, Tw.u) annotation (Line(points={{-25,8},{-17.6,8},{-17.6,8}}, color={0,0,127}));
  connect(Hs.y, add.u2) annotation (Line(points={{-57,-4},{-54,-4},{-54,2},{-48,2}}, color={0,0,127}));
  connect(imIntegrator.y, product.u2) annotation (Line(points={{28.8,8},{34,8},{34,7.2},{40.4,7.2}}, color={0,0,127}));
  connect(product.y, Pm) annotation (Line(points={{58.8,12},{74,12},{74,6},{91,6}}, color={0,0,127}));
  connect(product.u1, product1.y) annotation (Line(points={{40.4,16.8},{34,16.8},{34,33},{-39.3,33}}, color={0,0,127}));
  connect(division1.u1, product.u2) annotation (Line(points={{-81.4,37.2},{-88,37.2},{-88,50},{32,50},{32,8},{34,8},{34,7.2},{40.4,7.2}}, color={0,0,127}));
  connect(division1.u2, z) annotation (Line(points={{-81.4,28.8},{-84,28.8},{-84,6},{-91.5,6}}, color={0,0,127}));
  connect(add.u1, product1.y) annotation (Line(points={{-48,14},{-56,14},{-56,24},{-34,24},{-34,33},{-39.3,33}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-78,46},{32,-44}}, lineColor={0,0,255}),Text(
          extent={{-78,10},{-64,-2}},
          lineColor={0,0,255},
          textString="z"),Text(
          extent={{20,10},{30,-4}},
          lineColor={0,0,255},
          textString="Pm"),Text(
          extent={{-52,18},{8,-20}},
          lineColor={0,0,255},
          textString="Hy turbine")}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Text(
          extent={{-28,40},{-12,38}},
          lineColor={0,0,127},
          textString="q (water flow)"),Text(
          extent={{-28,28},{-14,26}},
          lineColor={0,0,127},
          textString="H (head)"),Text(
          extent={{60,12},{78,12}},
          lineColor={0,0,127},
          textString="Pm (mech. power)"),Text(
          extent={{-98,-4},{-82,4}},
          lineColor={0,0,127},
          textString="z (gate opening)")}),
    Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>OpenIPSL:</p>
<p>Copyright 2016 SmarTS Lab (Sweden)</p>
<ul>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>

<p></p>
<p>iPSL:</p>
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
</html>
"));
end TurbinePm;

