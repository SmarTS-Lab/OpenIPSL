within OpenIPSL.Electrical.Machines.PSAT;
model Order2 "Second Order Synchronous Machine with Inputs and Outputs"
  import Modelica.Constants.pi;
  extends BaseClasses.baseMachine(
    delta(start=delta0),
    pe(start=pm00),
    pm(start=pm00),
    pm0(start=pm00),
    vf(start=vf00),
    vf0(start=vf00),
    vq(start=vq0),
    vd(start=vd0),
    iq(start=iq0),
    id(start=id0));
protected
  parameter Real c1=Ra*K "CONSTANT";
  parameter Real c2=x1d*K "CONSTANT";
  parameter Real c3=x1d*K " CONSTANT";
  parameter Real K=1/(Ra*Ra + x1d*x1d) "CONSTANT";
  parameter Real delta0=atan2(vi0 + Ra*ii0 + x1d*ir0, vr0 + Ra*ir0 - x1d*ii0) "Initial rotor angle";
  parameter Real pm00=(vq0 + Ra*iq0)*iq0 + (vd0 + Ra*id0)*id0 "Initialitation";
  parameter Real vf00=vq0 + Ra*iq0 + x1d*id0 "Initialitation";
  parameter Real vd0=vr0*cos(pi/2 - delta0) - vi0*sin(pi/2 - delta0) "Initialitation";
  parameter Real vq0=vr0*sin(pi/2 - delta0) + vi0*cos(pi/2 - delta0) "Initialitation";
  parameter Real id0=ir0*cos(pi/2 - delta0) - ii0*sin(pi/2 - delta0) "Initialitation";
  parameter Real iq0=ir0*sin(pi/2 - delta0) + ii0*cos(pi/2 - delta0) "Initialitation";
equation
  id = (-c1*vd) - c3*vq + vf*c3;
  iq = c2*vd - c1*vq + vf*c1;
  pm0 = pm00;
  vf0 = vf00;
  annotation (
    Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={10,10}), graphics={Text(
          origin={4,61.9022},
          fillPattern=FillPattern.Solid,
          extent={{-57.2101,-15.0},{57.2101,15.0}},
          fontName="Arial",
          lineColor={28,108,200},
          textString="Order II")}),
    Diagram(coordinateSystem(
        extent={{-148.5,-105},{148.5,105}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={5,5})),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>Order II Synchonous Machine, PSAT Manual 2.1.8</p></td>
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
end Order2;

