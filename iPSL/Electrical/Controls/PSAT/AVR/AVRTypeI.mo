within iPSL.Electrical.Controls.PSAT.AVR;
model AVRTypeI "PSAT Exciter Type 1"
  parameter Real vrmax=7.57 "Maximum regulator voltage, p.u";
  parameter Real vrmin=0 "Minimum regulator voltage, p.u";
  parameter Real K0=7.04 "Regulator gain, p.u/p.u";
  parameter Real T1=6.67 "First pole, s";
  parameter Real T2=1 "First zero, s";
  parameter Real T3=1 "Second pole, s";
  parameter Real T4=1 "Second pole, s";
  parameter Real Te=0.4 "Field circuit time constant, s";
  parameter Real Tr=0.05 "Measurement time constant, s";
  parameter Real Ae=0 "1st ceiling coefficient";
  parameter Real Be=0 "2nd ceiling coefficient";
  parameter Real v0=1.05 "Initialization";
  parameter Real vref0=1.198705028536746 "Initialization";
  parameter Real vf0=1.046883400898693 "Initialization";
  parameter Real vm0=v0 "Initialization";
  parameter Real vr10=K0*(1 - T2/T1)*(vref0 - vm0) "Initialization";
  parameter Real vr20=1/K0*(1 - T4/T3)*(vr10 + K0*(vref0 - vm0)*T2/T1) "Initialization";
  parameter Real e=Modelica.Constants.e;
  Real Se;
  Real vm(start=vm0, fixed=true);
  Real vr1(start=vr10, fixed=true);
  Real vr2(start=vr20, fixed=true);
  Real vrs;
  Real vr;
  Modelica.Blocks.Interfaces.RealInput v annotation (Placement(transformation(extent={{-144,-56},{-104,-16}})));
  Modelica.Blocks.Interfaces.RealInput vref annotation (Placement(transformation(extent={{-142,36},{-102,76}})));
  Modelica.Blocks.Interfaces.RealOutput vf annotation (Placement(transformation(extent={{100,-8},{120,12}})));
equation
  der(vm) = (v - vm)/Tr;
  der(vr1) = (K0*(1 - T2/T1)*(vref - vm) - vr1)/T1;
  vrs = vr2 + T4/T3*(vr1 + K0*T2/T1*(vref - vm));
  if vrs >= vrmin and vrs <= vrmax then
    vr = vrs;
  elseif vrs > vrmax then
    vr = vrmax;
  else
    vr = vrmin;
  end if;
  der(vr2) = ((1 - T4/T3)*(vr1 + K0*(vref - vm)*T2/T1) - vr2)/T3;
  der(vf) = -(vf*(1 + Se) - vr)/Te;
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
          textString="AVR1")}),
    Documentation(info="<html>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"<tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>15/07/2015</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
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
end AVRTypeI;
