within OpenIPSL.Electrical.Loads.PSAT;
model ZIP_ExtInput "PSAT ZIP load with additionnal input"
  extends OpenIPSL.Electrical.Loads.PSAT.BaseClasses.baseLoad;
  parameter Real Pz=0.33 "Conductance (pu)";
  parameter Real Pi=0.33 "Active current (pu)";
  parameter Real Pp=1 - Pz - Pi "Active power (pu)";
  parameter Real Qz=0.33 "Susceptance (pu)";
  parameter Real Qi=0.33 "Reactive current (pu)";
  parameter Real Qp=1 - Qz - Qi "Reactive power (pu)";
protected
  Real a "Auxiliary variable, voltage division";
public
  Modelica.Blocks.Interfaces.RealInput u annotation (Placement(transformation(
          extent={{48,16},{88,56}}), iconTransformation(extent={{-100,36},{-62,
            74}})));

equation
  a = V/V_0;
  P = P_0/S_b*(Pz*a^2 + Pi*a + Pp) + u;
  Q = Q_0/S_b*(Qz*a^2 + Qi*a + Qp);

  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        initialScale=0.05)),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSS/E Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>Unknown</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Mengjia Zhang,SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>", revisions="<html>
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
"),
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        initialScale=0.05)));
end ZIP_ExtInput;
