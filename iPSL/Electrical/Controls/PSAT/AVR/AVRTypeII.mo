within iPSL.Electrical.Controls.PSAT.AVR;
model AVRTypeII "PSAT AVR Type 2"
  Modelica.Blocks.Interfaces.RealInput v "Generator termminal voltage (pu)" annotation (Placement(transformation(extent={{-98,-8},{-78,12}}), iconTransformation(extent={{-98,-28},{-62,8}})));
  Modelica.Blocks.Interfaces.RealOutput vf "Filed voltage (pu)" annotation (Placement(transformation(extent={{74,22},{94,42}}), iconTransformation(extent={{68,8},{102,44}})));
  Modelica.Blocks.Interfaces.RealInput vref "Reference generator terminal voltage (pu)"
    annotation (Placement(transformation(extent={{-96,40},{-76,60}}), iconTransformation(extent={{-98,36},{-62,72}})));
  parameter Real vrmin "Minimum regulator voltage (pu)";
  parameter Real vrmax "Maximum regulator voltage (p.u..)";
  parameter Real Ka "Amplifier gain (p.u/p.u)";
  parameter Real Ta "Amplifier time constant (s)";
  parameter Real Kf "Stabilizer gain (p.u/p.u)";
  parameter Real Tf "Stabilizer time constant (s)";
  parameter Real Ke "Field circuit integral deviation (p.u/p.u)";
  parameter Real Te "Field circuit time constant (s)";
  parameter Real Tr "Measurement time constant (s)";
  parameter Real Ae=0.0006 "1st ceiling coefficient";
  parameter Real Be=0.9 "2nd ceiling coefficient";
  parameter Real v0=1 "Initialization";
  parameter Real vref0 "Initialization";
  parameter Real vf0 "Initialization";
  Real Se "Saturated field voltage (pu)";
  Real vr "Regulator voltage (pu)";
protected
  parameter Real vm0=v0 "Initialization";
  parameter Real vr10=Ka*(vref0 - vm0 - vr20 - vf0*Kf/Tf) "Initialization";
  parameter Real vr20=-vf0*Kf/Tf "Initialization";
  parameter Real e=Modelica.Constants.e;
  Real vm(start=vm0, fixed=true);
  Real vr1(start=vr10, fixed=true);
  Real vr2(start=vr20, fixed=true);
equation
  der(vm) = (v - vm)/Tr;
  der(vr1) = (Ka*(vref - vm - vr2 - vf*Kf/Tf) - vr1)/Ta;
  if vr1 >= vrmin and vr1 <= vrmax then
    vr = vr1;
  elseif vr1 > vrmax then
    vr = vrmax;
  else
    vr = vrmin;
  end if;
  der(vr2) = -(vf*Kf/Tf + vr2)/Tf;
  der(vf) = -(vf*(Ke + Se) - vr)/Te;
  Se = Ae*e^(Be*abs(vf));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-60,70},{70,-28}}, lineColor={0,0,255}),Text(
          extent={{-56,68},{-24,46}},
          lineColor={0,0,255},
          textString="vref"),Text(
          extent={{-64,2},{-32,-20}},
          lineColor={0,0,255},
          textString="v"),Text(
          extent={{40,40},{72,18}},
          lineColor={0,0,255},
          textString="vf"),Text(
          extent={{-36,44},{40,-16}},
          lineColor={0,0,255},
          textString="AVR2")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>AVR Type II, PSAT Manual 2.1.8</p></td>
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
end AVRTypeII;
