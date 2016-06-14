within OpenIPSL.Electrical.Loads.PSAT;
model FrequencyDependentLoad "Frequency Dependent Load"
  import Modelica.Constants.pi;
  extends BaseClasses.baseLoad;
  parameter Real alpha_p=0 "Active power voltage coefficient";
  parameter Real alpha_q=0 "Reactive power voltage coefficient";
  parameter Real beta_p=1.3 "Active power frequency coefficient";
  parameter Real beta_q=1.3 "Reactive power frequency coefficient";
  parameter Real Tf=0.1 "Filter time constant (s)";
  Real deltaw "Frequency deviation (pu)";
protected
  Real a "Auxiliary variable, voltage division";
  Real x(start=0) "auxiliary variable";
initial equation
  der(x) = 0;
equation
  a = V/V_0;
  der(x) = -deltaw/Tf;
  0 = x + 1/(2*pi*fn)*1/Tf*(Angle_V - angle_0) - deltaw;
  P = P_0/S_b*a^alpha_p*(1 + deltaw)^beta_p;
  Q = Q_0/S_b*a^alpha_q*(1 + deltaw)^beta_q;
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
        grid={5,5}), graphics={Rectangle(
          visible=true,
          origin={10.0,-2.5},
          lineColor={0,0,128},
          fillColor={255,255,255},
          extent={{-90.0,-82.5},{90.0,82.5}})}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>Frequency Dependent Load, PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>September 2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>", revisions="<html>
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
end FrequencyDependentLoad;
