within iPSL.Electrical.Loads.PSAT;
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
    Documentation(info="<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
end LOADPQ_variation;

