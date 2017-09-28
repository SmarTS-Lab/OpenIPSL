within OpenIPSL.NonElectrical.Logical;
model NegCurLogic
  Modelica.Blocks.Interfaces.RealInput Vd(start=nstartvalue) annotation (Placement(transformation(extent={{-76,10},{-56,30}}), iconTransformation(extent={{-80,10},{-60,30}})));
  Modelica.Blocks.Interfaces.RealOutput Efd(start=nstartvalue) annotation (Placement(transformation(extent={{62,-24},{82,-4}}), iconTransformation(extent={{60,-10},{80,10}})));
  Modelica.Blocks.Interfaces.RealInput XadIfd(start=nstartvalue) annotation (Placement(transformation(extent={{-76,-46},{-56,-26}}), iconTransformation(extent={{-80,-30},{-60,-10}})));
  parameter Real RC_rfd;
  parameter Real nstartvalue;
  Real Crowbar_V;
equation
  Efd = if XadIfd < 0 then Crowbar_V else Vd;
  Crowbar_V = if RC_rfd == 0 then 0 else (-1)*RC_rfd*XadIfd;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-60,-40},{60,40}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-60,-40},{60,40}}), graphics={Rectangle(
          extent={{-60,40},{60,-40}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-52,46},{54,-42}},
          lineColor={0,0,255},
          textString="Negative Current Logic")}),
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
end NegCurLogic;
