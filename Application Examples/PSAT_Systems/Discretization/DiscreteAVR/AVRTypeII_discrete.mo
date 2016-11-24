within PSAT_Systems.Discretization.DiscreteAVR;


model AVRTypeII_discrete "Discretized PSAT Exciter Type 2"
  parameter Real vrmin=0 "Minimum regulator voltage, p.u";
  parameter Real vrmax=7.57 "Maximum regulator voltage, p.u";
  parameter Real Ka=7.04 "Amplifier gain, p.u/p.u";
  parameter Real Ta=0.4 "Amplifier time constant, s";
  parameter Real Kf=1 "Stabilizer gain, p.u/p.u";
  parameter Real Tf=0.05 "Stabilizer time constant, s";
  parameter Real Ke=1 "Field circuit integral deviation, p.u/p.u";
  parameter Real Te=0.4 "Field circui time constant, s";
  parameter Real Tr=0.05 "Measurement time constant, s";
  parameter Real Ae=0 "1st ceiling coefficient";
  parameter Real Be=0 "2nd ceiling coefficient";
  parameter Real v0=1 "Initialization";
  parameter Real vref0=1.9832 "Initialization";
  parameter Real vf0=1.0442 "Initialization";
  parameter Real vm0=v0 "Initialization";
  parameter Real vr10=Ka*(vref0 - vm0 - vr20 - vf0*Kf/Tf) "Initialization";
  parameter Real vr20=-vf0*Kf/Tf "Initialization";
  parameter Real e=Modelica.Constants.e;
  Real Se;
  Real vm(start=vm0, fixed=true);
  Real vr1(start=vr10, fixed=true);
  Real vr2(start=vr20, fixed=true);
  Real vr;
  Modelica.Blocks.Interfaces.RealInput vref "Connector of clocked, Real input signal"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}}, rotation=0), iconTransformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.RealInput v "Connector of clocked, Real input signal"
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}}, rotation=0), iconTransformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Interfaces.RealOutput vf(start=vf0) annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  vm = previous(vm) + (v - vm)/Tr;
  vr1 = previous(vr1) + (Ka*(vref - vm - vr2 - vf*Kf/Tf) - vr1)/Ta;
  if vr1 >= vrmin and vr1 <= vrmax then
    vr = vr1;
  elseif vr1 > vrmax then
    vr = vrmax;
  else
    vr = vrmin;
  end if;
  vr2 = previous(vr2) - (vf*Kf/Tf + vr2)/Tf;
  vf = previous(vf) - (vf*(Ke + Se) - vr)/Te;
  Se = Ae*e^(Be*abs(vf));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-96,72},{-64,50}},
          lineColor={0,0,255},
          textString="vref"),Text(
          extent={{-104,-48},{-72,-70}},
          lineColor={0,0,255},
          textString="v"),Text(
          extent={{70,10},{102,-12}},
          lineColor={0,0,255},
          textString="vf"),Text(
          extent={{-38,46},{38,-14}},
          lineColor={0,0,255},
          textString="Discrete
AVR2")}),
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
", info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p></p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Yuwa Chompoobutrgool, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end AVRTypeII_discrete;
