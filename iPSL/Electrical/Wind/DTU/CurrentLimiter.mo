within iPSL.Electrical.Wind.DTU;
model CurrentLimiter "The current limitation model combines the physical limit. Developed by DTU"
  parameter Real i_maxdip "Maximum current during voltage dip at the wind turbine terminals";
  parameter Real i_max "Maximum continuous current at the wind turbine terminals";
  parameter Real M_Qpri "Prioritisation of q control during LVRT (0: active power priority - 1: reactive power priority)";
  parameter Real ini_Uwttfilt(fixed=false) "initial voltage magnitude";
  parameter Real T_Ufilt "filter time constant of the voltage measurement";
  Modelica.Blocks.Interfaces.RealInput iPcmdlmt annotation (Placement(transformation(extent={{-90,34},{-80,46}})));
  Modelica.Blocks.Interfaces.RealInput Uwtt annotation (Placement(transformation(extent={{-90,-6},{-80,6}})));
  Modelica.Blocks.Interfaces.RealInput iQcmdlmt annotation (Placement(transformation(extent={{-90,-46},{-80,-34}})));
  Modelica.Blocks.Interfaces.RealOutput iQmax annotation (Placement(transformation(extent={{80,24},{90,36}})));
  Modelica.Blocks.Interfaces.RealOutput iPmax annotation (Placement(transformation(extent={{80,-38},{90,-26}})));
  Modelica.Blocks.Sources.Constant Imax(k=i_max) "Maximum continuous current at the wind turbine terminals" annotation (Placement(transformation(extent={{-96,48},{-86,58}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=0.5) annotation (Placement(transformation(extent={{-80,58},{-72,66}})));
  Modelica.Blocks.Logical.Switch switch1 annotation (Placement(transformation(extent={{-64,56},{-52,68}})));
  Modelica.Blocks.Math.Add add(k1=1, k2=1) annotation (Placement(transformation(extent={{-28,51},{-18,61}})));
  Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(extent={{-48,32},{-38,42}})));
  Modelica.Blocks.Math.Sqrt sqrt1 annotation (Placement(transformation(extent={{6,51},{16,61}})));
  Modelica.Blocks.Math.Min min1 annotation (Placement(transformation(extent={{22,48},{32,58}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=999, uMin=0) annotation (Placement(transformation(extent={{-14,51},{-4,61}})));
  Modelica.Blocks.Interfaces.RealInput F_LVRT annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=-90,
        origin={0,65})));
  Modelica.Blocks.Math.Product product2 annotation (Placement(transformation(extent={{26,-3},{36,7}})));
  Modelica.Blocks.Sources.Constant Imaxdip(k=i_maxdip) "Maximum current during voltage dip at the wind turbine terminals" annotation (Placement(transformation(extent={{-96,68},{-86,78}})));
  Modelica.Blocks.Math.Product product3 annotation (Placement(transformation(extent={{-46,54},{-36,64}})));
  Modelica.Blocks.Logical.Switch switch2 annotation (Placement(transformation(extent={{54,52},{66,64}})));
  Modelica.Blocks.Math.Add add1(k1=1, k2=-1) annotation (Placement(transformation(extent={{-28,-45},{-18,-35}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=999, uMin=0) annotation (Placement(transformation(extent={{-12,-45},{-2,-35}})));
  Modelica.Blocks.Math.Sqrt sqrt2 annotation (Placement(transformation(extent={{6,-45},{16,-35}})));
  Modelica.Blocks.Math.Min min2 annotation (Placement(transformation(extent={{24,-42},{34,-32}})));
  Modelica.Blocks.Logical.Switch switch3 annotation (Placement(transformation(extent={{60,-38},{72,-26}})));
  Modelica.Blocks.Math.Product product4 annotation (Placement(transformation(extent={{-44,-48},{-34,-38}})));
  Modelica.Blocks.Tables.CombiTable1D iP_VDL(table=[0.1, 0; 0.15, 1; 0.9, 1; 0.925, 1; 1.075, 1; 1.1, 1]) "Lookup table for voltage dependency of active current limits"
    annotation (Placement(transformation(extent={{-26,-18},{-14,-6}})));
  Modelica.Blocks.Sources.Constant MQpri(k=M_Qpri) "Prioritisation of q control during LVRT (0: active power priority - 1: reactive power priority)"
    annotation (Placement(transformation(extent={{4,0},{14,10}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold1(threshold=0.5) annotation (Placement(transformation(extent={{40,-2},{48,6}})));
  iPSL.NonElectrical.Continuous.SimpleLag imSimpleLag(
    K=1,
    T=T_Ufilt,
    y_start=ini_Uwttfilt) annotation (Placement(transformation(extent={{-66,-6},{-54,6}})));
  Modelica.Blocks.Tables.CombiTable1D iQ_VDL(table=[0.1, 0; 0.15, 1; 0.9, 1; 0.925, 0.33; 1.075, 0.33; 1.1, 1]) "Lookup table for voltage dependency of reactive current limits"
    annotation (Placement(transformation(extent={{-22,24},{-10,36}})));
  Modelica.Blocks.Math.Min min3 annotation (Placement(transformation(extent={{-62,32},{-52,42}})));
  Modelica.Blocks.Math.Min min4 annotation (Placement(transformation(extent={{-56,-26},{-50,-20}})));
  Modelica.Blocks.Math.Abs abs1 annotation (Placement(transformation(extent={{-64,-44},{-58,-38}})));
initial equation
  ini_Uwttfilt = Uwtt;
equation
  connect(greaterThreshold.y, switch1.u2) annotation (Line(
      points={{-71.6,62},{-65.2,62}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(Imaxdip.y, switch1.u1) annotation (Line(
      points={{-85.5,73},{-70.75,73},{-70.75,66.8},{-65.2,66.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Imax.y, switch1.u3) annotation (Line(
      points={{-85.5,53},{-69.75,53},{-69.75,57.2},{-65.2,57.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch1.y, product3.u1) annotation (Line(
      points={{-51.4,62},{-47,62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(product3.u2, product3.u1) annotation (Line(
      points={{-47,56},{-48,56},{-48,62},{-47,62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(product3.y, add.u1) annotation (Line(
      points={{-35.5,59},{-29,59}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add.u2, product1.y) annotation (Line(
      points={{-29,53},{-35.5,53},{-35.5,37},{-37.5,37}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add.y, limiter.u) annotation (Line(
      points={{-17.5,56},{-15,56}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limiter.y, sqrt1.u) annotation (Line(
      points={{-3.5,56},{5,56}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sqrt1.y, min1.u1) annotation (Line(
      points={{16.5,56},{21,56}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add1.u1, add.u1) annotation (Line(
      points={{-29,-37},{-32,-37},{-32,59},{-29,59}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add1.y, limiter1.u) annotation (Line(
      points={{-17.5,-40},{-13,-40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limiter1.y, sqrt2.u) annotation (Line(
      points={{-1.5,-40},{5,-40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sqrt2.y, min2.u2) annotation (Line(
      points={{16.5,-40},{23,-40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(product4.y, add1.u2) annotation (Line(
      points={{-33.5,-43},{-29,-43}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(iP_VDL.y[1], min2.u1) annotation (Line(
      points={{-13.4,-12},{2,-12},{2,-34},{23,-34}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(MQpri.y, product2.u1) annotation (Line(
      points={{14.5,5},{25,5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(F_LVRT, product2.u2) annotation (Line(
      points={{0,65},{0,-4},{22,-4},{22,-1},{25,-1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(product2.y, greaterThreshold1.u) annotation (Line(
      points={{36.5,2},{39.2,2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(greaterThreshold1.y, switch2.u2) annotation (Line(
      points={{48.4,2},{50,2},{50,58},{52.8,58}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(iQmax, switch2.y) annotation (Line(
      points={{85,30},{74,30},{74,58},{74,58},{74,58},{66.6,58}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(min1.y, switch2.u3) annotation (Line(
      points={{32.5,53},{42.25,53},{42.25,53.2},{52.8,53.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch3.u2, switch2.u2) annotation (Line(
      points={{58.8,-32},{50,-32},{50,58},{52.8,58}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(min2.y, switch3.u1) annotation (Line(
      points={{34.5,-37},{40,-37},{40,-27.2},{58.8,-27.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch3.y, iPmax) annotation (Line(
      points={{72.6,-32},{85,-32}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch3.u3, min2.u1) annotation (Line(
      points={{58.8,-36.8},{44,-36.8},{44,-12},{2,-12},{2,-34},{23,-34}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(iQ_VDL.y[1], min1.u2) annotation (Line(
      points={{-9.4,30},{18,30},{18,50},{21,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch2.u1, min1.u2) annotation (Line(
      points={{52.8,62.8},{38,62.8},{38,30},{18,30},{18,50},{21,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(min3.u2, min2.u1) annotation (Line(
      points={{-63,34},{-66,34},{-66,12},{-12,12},{-12,-8},{-2,-8},{-2,-34},{23,-34}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(min3.y, product1.u1) annotation (Line(
      points={{-51.5,37},{-49.75,37},{-49.75,40},{-49,40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(min4.u1, min1.u2) annotation (Line(
      points={{-56.6,-21.2},{-94,-21.2},{-94,20},{18,20},{18,50},{21,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(min4.y, product4.u1) annotation (Line(
      points={{-49.7,-23},{-49.7,-33.5},{-45,-33.5},{-45,-40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(product4.u2, product4.u1) annotation (Line(
      points={{-45,-46},{-48,-46},{-48,-34},{-45,-33.5},{-45,-40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(min4.u2, abs1.y) annotation (Line(
      points={{-56.6,-24.8},{-58,-24.8},{-58,-41},{-57.7,-41}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(product1.u2, product1.u1) annotation (Line(
      points={{-49,34},{-50,34},{-50,38},{-49.75,40},{-49,40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(F_LVRT, greaterThreshold.u) annotation (Line(points={{0,65},{-2,65},{-2,88},{-2,90},{-110,90},{-110,62},{-80.8,62}}, color={0,0,127}));
  connect(iQcmdlmt, abs1.u) annotation (Line(points={{-85,-40},{-64.6,-40},{-64.6,-41}}, color={0,0,127}));
  connect(iPcmdlmt, min3.u1) annotation (Line(points={{-85,40},{-63,40},{-63,40}}, color={0,0,127}));
  connect(Uwtt, imSimpleLag.u) annotation (Line(points={{-85,0},{-67.2,0},{-67.2,0}}, color={0,0,127}));
  connect(imSimpleLag.y, iP_VDL.u[1]) annotation (Line(points={{-53.4,0},{-36,0},{-36,-12},{-27.2,-12}}, color={0,0,127}));
  connect(iQ_VDL.u[1], imSimpleLag.y) annotation (Line(points={{-23.2,30},{-38,30},{-38,0},{-53.4,0}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-70},{100,100}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-70},{100,100}}), graphics={Rectangle(extent={{-79,60},{81,-60}}, lineColor={0,0,255}),Ellipse(
          extent={{-22,20},{22,-22}},
          lineColor={0,0,255},
          lineThickness=0.5),Polygon(
          points={{0,20},{-2,14},{2,14},{0,20}},
          lineColor={0,0,255},
          lineThickness=0.5,
          smooth=Smooth.None,
          fillPattern=FillPattern.Solid,
          fillColor={0,0,255}),Line(
          points={{-10,-20},{-22,-38}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),Line(
          points={{24,34},{12,16}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),Line(
          points={{24,34},{36,34}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{-34,-38},{-22,-38}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{0,16},{0,-22}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),Text(
          extent={{-74,45},{-56,35}},
          lineColor={0,0,255},
          textString="i_Pcmd"),Text(
          extent={{-73,5},{-59,-4}},
          lineColor={0,0,255},
          textString="U_wtt"),Text(
          extent={{-8,55},{10,45}},
          lineColor={0,0,255},
          textString="F_LVRT"),Text(
          extent={{58,35},{76,25}},
          lineColor={0,0,255},
          textString="i_Qmax"),Text(
          extent={{60,-27},{78,-37}},
          lineColor={0,0,255},
          textString="i_Pmax"),Text(
          extent={{-72,-34},{-54,-44}},
          lineColor={0,0,255},
          textString="i_Qcmd"),Text(
          extent={{-26,-43},{26,-54}},
          lineColor={0,0,255},
          textString="Current Limitation Model")}),
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
end CurrentLimiter;
