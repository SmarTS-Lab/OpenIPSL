within iPSL.Electrical.Loads.PSAT;
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
end ExponentialRecovery;

