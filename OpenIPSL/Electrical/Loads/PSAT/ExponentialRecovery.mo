within OpenIPSL.Electrical.Loads.PSAT;
model ExponentialRecovery "Exponential Recovery Load"
  extends BaseClasses.baseLoad;
  parameter Real Tp=1 "Active power time constant (s)";
  parameter Real Tq=1 "Reactive power time constant (s)";
  parameter Real alpha_s=2 "Static active power exponent";
  parameter Real alpha_t=1.5 "Dynamic active power exponent";
  parameter Real beta_s=2 "Static reactive power exponent";
  parameter Real beta_t=1.5 "Dynamic reactive power exponent";
  Real ps "Static real power absorption (pu)";
  Real pt "Transient real power absorption (pu)";
  Real qs "Static imaginary power absorption (pu)";
  Real qt "Transient imaginary power absorption (pu)";
protected
  Real xp(start=0);
  Real xq(start=0);
equation
  der(xp) = (-xp/Tp) + ps - pt;
  P = xp/Tp + pt;
  ps = P_0/S_b*(V/V_0)^alpha_s;
  pt = P_0/S_b*(V/V_0)^alpha_t;
  der(xq) = (-xq/Tq) + qs - qt;
  Q = xq/Tq + qt;
  qs = Q_0/S_b*(V/V_0)^beta_s;
  qt = Q_0/S_b*(V/V_0)^beta_t;
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
<td><p>Exponential Recovery Load, PSAT Manual 2.1.8</p></td>
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
end ExponentialRecovery;
