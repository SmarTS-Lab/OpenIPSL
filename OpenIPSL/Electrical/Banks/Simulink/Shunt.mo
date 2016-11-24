within OpenIPSL.Electrical.Banks.Simulink;


model Shunt "Shunt Inductor or Capacitor"
  OpenIPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-22,48},{-2,68}}), iconTransformation(extent={{-10,40},{10,60}})));
  constant Real pi=Modelica.Constants.pi;
  parameter Real Qnom "Reactive power produced by the shunt under 1 p.u voltage, (negative for inductive charge, positive for capacitive charge) Mvar";
  parameter Real Sbase "Base power of the system, MVA";
  parameter Real X=Sbase/(-Qnom) "Reactance in p.u";
  Real Q "Consumed power";
  Real v;
equation
  v = sqrt(p.vr*p.vr + p.vi*p.vi);
  0 = p.vr*p.ir + p.vi*p.ii;
  Q = p.vi*p.ir - p.vr*p.ii;
  Q = 1/X*v*v;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Line(
          points={{0,40},{0,30}},
          smooth=Smooth.None,
          color={0,0,255},
          thickness=0.5),Rectangle(extent={{-22,40},{24,-42}}, lineColor={0,0,255}),Text(
          extent={{-12,34},{12,-18}},
          lineColor={0,0,255},
          textString="Y",
          lineThickness=0.5),Line(
          points={{0,-12},{0,-26}},
          smooth=Smooth.None,
          color={0,0,255},
          thickness=0.5),Line(
          points={{-1,14},{-1,-6}},
          smooth=Smooth.None,
          color={0,0,255},
          origin={-4,-27},
          rotation=-90,
          thickness=0.5),Line(
          points={{-1,-6},{-1,-2}},
          smooth=Smooth.None,
          color={0,0,255},
          origin={-4,-33},
          rotation=90,
          thickness=0.5),Line(
          points={{-1,12},{-1,-0.000000000000000183697}},
          smooth=Smooth.None,
          color={0,0,255},
          origin={-6,-31},
          rotation=-90,
          thickness=0.5)}), Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Shunt Inductor or Capacitor</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-10-02</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Le Qi, SmarTS Lab, KTH Royal Institute of Technology</p></td>
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
"));
end Shunt;
