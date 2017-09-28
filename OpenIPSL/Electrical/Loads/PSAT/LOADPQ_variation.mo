within OpenIPSL.Electrical.Loads.PSAT;
model LOADPQ_variation "Equations come from the mathematical separation in between reals and imaginary of S=P+jQ=UI*"
  extends BaseClasses.baseLoad;
  parameter Real t_start_1 "Start time of first load variation (s)" annotation (Dialog(group="Variation 1"));
  parameter Real t_end_1 "End time of first load variation (s)" annotation (Dialog(group="Variation 1"));
  parameter Real dP1 "First active load variation  (pu)" annotation (Dialog(group="Variation 1"));
  parameter Real dQ1 "First reactive load variation (p)" annotation (Dialog(group="Variation 1"));
  parameter Real t_start_2 "Start time of second Load variation (s)" annotation (Dialog(group="Variation 2"));
  parameter Real t_end_2 "End time of second load variation (s)" annotation (Dialog(group="Variation 2"));
  parameter Real dP2 "Second active load variation  (pu)" annotation (Dialog(group="Variation 2"));
  parameter Real dQ2 "Second reactive load variation (pu)" annotation (Dialog(group="Variation 2"));
equation
  if time >= t_start_1 and time <= t_end_1 then
    P = (P_0 + dP1)/S_b;
    Q = (Q_0 + dQ1)/S_b;
  elseif time >= t_start_2 and time <= t_end_2 then
    P = (P_0 + dP2)/S_b;
    Q = (Q_0 + dQ2)/S_b;
  else
    P = P_0/S_b;
    Q = Q_0/S_b;
  end if;
  annotation (
    Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={10,10})),
    Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={5,5})),
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
end LOADPQ_variation;
