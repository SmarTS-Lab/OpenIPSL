within OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses;
model SelectLogic "Selection of voltage signal depending on the Excitation limiters"
  Modelica.Blocks.Interfaces.RealInput V1 annotation (Placement(transformation(extent={{-138,40},{-98,80}})));
  Modelica.Blocks.Interfaces.RealInput V2 annotation (Placement(transformation(extent={{-138,-20},{-98,20}})));
  Modelica.Blocks.Interfaces.RealInput V3 annotation (Placement(transformation(extent={{-138,-80},{-98,-40}})));
  Modelica.Blocks.Interfaces.RealInput VOEL annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-60,96}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-60,112})));
  Modelica.Blocks.Interfaces.RealInput VUEL annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,96}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,112})));
  Modelica.Blocks.Interfaces.RealInput VERR annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={60,96}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={60,112})));
  Modelica.Blocks.Interfaces.RealOutput Vout annotation (Placement(transformation(extent={{100,10},{120,30}})));
equation
  Vout = if VOEL > 0 then V3 else if VUEL > 0 then V2 else V1;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Text(
          extent={{-42,54},{38,-48}},
          lineColor={0,0,255},
          textString="Select
Logic"),Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255})}),
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
end SelectLogic;
