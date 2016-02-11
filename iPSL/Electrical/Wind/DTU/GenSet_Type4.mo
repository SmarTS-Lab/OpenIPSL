within iPSL.Electrical.Wind.DTU;
model GenSet_Type4 "Generator Type 4 Set Model. Developed by DTU"
  parameter Real Tg;
  parameter Real diPmax;
  parameter Real diQmin;
  parameter Real diQmax;
  parameter Real ini_iPref;
  parameter Real ini_iQref;
  Modelica.Blocks.Interfaces.RealInput iPmax annotation (Placement(transformation(extent={{-51,34},{-41,46}})));
  Modelica.Blocks.Interfaces.RealInput iPcmd annotation (Placement(transformation(extent={{-51,10},{-41,22}})));
  Modelica.Blocks.Interfaces.RealInput iQmax annotation (Placement(transformation(extent={{-51,-46},{-41,-34}})));
  Modelica.Blocks.Interfaces.RealInput iQcmd annotation (Placement(transformation(extent={{-51,-22},{-41,-10}})));
  Modelica.Blocks.Interfaces.RealOutput iPref annotation (Placement(transformation(extent={{25,14},{35,26}}), iconTransformation(extent={{25,14},{35,26}})));
  Modelica.Blocks.Interfaces.RealOutput iQref annotation (Placement(transformation(extent={{25,-26},{35,-14}}), iconTransformation(extent={{25,-26},{35,-14}})));
  Modelica.Blocks.Sources.Constant imSetPoint(k=-999) annotation (Placement(transformation(extent={{-38,0},{-26,12}})));
  Modelica.Blocks.Math.Gain imGain2(k=-1) annotation (Placement(transformation(extent={{-22,-30},{-14,-22}})));
  iPSL.NonElectrical.Continuous.SimpleLagRateLimVar imSimpleLag_varnonwindup(
    T=Tg,
    rmax=diPmax,
    y_start=ini_iPref,
    rmin=-999) annotation (Placement(transformation(extent={{-16,8},{0,24}})));
  iPSL.NonElectrical.Continuous.SimpleLagRateLimVar imSimpleLag_varnonwindup1(
    T=Tg,
    rmin=diQmin,
    rmax=diQmax,
    y_start=ini_iQref) annotation (Placement(transformation(extent={{-10,-22},{4,-8}})));
equation
  connect(imSimpleLag_varnonwindup.u, iPcmd) annotation (Line(
      points={{-17.6,16},{-46,16}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSimpleLag_varnonwindup.y, iPref) annotation (Line(
      points={{0.8,16},{14.3,16},{14.3,20},{30,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSimpleLag_varnonwindup.outMax, iPmax) annotation (Line(
      points={{-1.6,27.2},{-22,27.2},{-22,40},{-46,40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSimpleLag_varnonwindup1.u, iQcmd) annotation (Line(
      points={{-11.4,-15},{-30,-15},{-30,-16},{-46,-16}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSimpleLag_varnonwindup1.y, iQref) annotation (Line(
      points={{4.7,-15},{14,-15},{14,-20},{30,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSetPoint.y, imSimpleLag_varnonwindup.outMin) annotation (Line(points={{-25.4,6},{-14.4,6},{-14.4,4.8}}, color={0,0,127}));
  connect(imGain2.y, imSimpleLag_varnonwindup1.outMin) annotation (Line(points={{-13.6,-26},{-8.6,-26},{-8.6,-24.8}}, color={0,0,127}));
  connect(iQmax, imGain2.u) annotation (Line(points={{-46,-40},{-34,-40},{-34,-26},{-22.8,-26}}, color={0,0,127}));
  connect(imSimpleLag_varnonwindup1.outMax, imGain2.u) annotation (Line(points={{2.6,-5.2},{-26,-5.2},{-26,-26},{-22.8,-26}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-55,-60},{55,55}},
        initialScale=0.1,
        grid={2,2})),
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-55,-60},{55,55}},
        initialScale=0.1,
        grid={2,2}), graphics={Rectangle(
          extent={{-40,40},{26,-40}},
          lineColor={0,0,255},
          lineThickness=0.5),Text(
          extent={{-18,8},{8,-8}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillPattern=FillPattern.Solid,
          textString="Type 4
Gen Set"),Text(
          extent={{-38,36},{-26,30}},
          lineColor={0,0,255},
          textString="i_Pmax"),Text(
          extent={{-38,18},{-26,12}},
          lineColor={0,0,255},
          textString="i_Pcmd"),Text(
          extent={{-38,-10},{-26,-16}},
          lineColor={0,0,255},
          textString="i_Qcmd"),Text(
          extent={{-38,-32},{-26,-38}},
          lineColor={0,0,255},
          textString="i_Qmax"),Text(
          extent={{11,24},{23,18}},
          lineColor={0,0,255},
          textString="i_Pref"),Text(
          extent={{10,-17},{22,-23}},
          lineColor={0,0,255},
          textString="i_Qref")}),
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
end GenSet_Type4;
