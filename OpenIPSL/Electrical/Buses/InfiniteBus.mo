within OpenIPSL.Electrical.Buses;
model InfiniteBus "PSAT Infinite Bus"
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  OpenIPSL.Connectors.PwPin p annotation (Placement(
      visible=true,
      transformation(
        origin={160.0,-0.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0),
      iconTransformation(
        origin={-110,0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Real P "Active Power absorbed by the Infinite bus (MW)";
  Real Q "Reactive Power absorbed by the Infinite bus (MVAr)";
equation
  p.vr = V_0*cos(angle_0*Modelica.Constants.pi/180);
  p.vi = V_0*sin(angle_0*Modelica.Constants.pi/180);
  P = -(p.vr*p.ir + p.vi*p.ii)*S_b;
  Q = -(p.vr*p.ii - p.vi*p.ir)*S_b;
  annotation (
    Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={10,10}), graphics={Rectangle(
          fillColor={255,255,255},
          extent={{-100,-100},{100,100}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid),Line(points={{34,86},{82,86},{74,92}}, color={0,0,0}),Text(
          extent={{14,84},{102,38}},
          lineColor={238,46,47},
          textString=DynamicSelect("0.0", String(P, significantDigits=2))),Line(points={{32,-54},{80,-54},{72,-48}}, color={0,0,0}),Text(
          extent={{12,-54},{100,-100}},
          lineColor={0,255,0},
          textString=DynamicSelect("0.0", String(Q, significantDigits=2))),Line(points={{40,-48},{40,-60}}, color={0,0,0}),Line(points={{80,-54},{72,-60}}, color={0,0,0}),Line(points={{82,86},{74,80}},
          color={0,0,0})}),
    Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={5,5})),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>None</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2015-12-14</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Maxime Baudette, SmarTS Lab, KTH Royal Institute of Technology</p></td>
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
end InfiniteBus;
