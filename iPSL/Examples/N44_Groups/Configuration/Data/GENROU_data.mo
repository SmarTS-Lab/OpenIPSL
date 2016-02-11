within iPSL.Examples.N44_Groups.Configuration.Data;
record GENROU_data
  parameter Real J=6.15 "d-axis transient open-circuit time constant s";
  parameter Real J1=0.11 "d-axis sub-transient open-circuit time constant s";
  parameter Real J2=0.3 "q-axis transient open-circuit time constant s";
  parameter Real J3=0.1 "q-axis transient open-circuit time constant s";
  parameter Real J4=3 "inertia constant s";
  parameter Real J5=0 "Damping";
  parameter Real J6=1.157 "d-axis reactance";
  parameter Real J7=0.968 "q-axis reactance";
  parameter Real J8=0.242 "d-axis transient reactance";
  parameter Real J9=0.427 "d-axis transient reactance";
  parameter Real J10=0.2 "d-axis sub-transient reactance";
  parameter Real J11=0.12 "leakage reactance";
  parameter Real J12=0.1175;
  //less than zero can commend the saturation function
  parameter Real J13=0.42;
  // paremeter Real gentype = 1;
  annotation (
    Icon(graphics={Rectangle(extent={{-40,40},{40,-40}}, lineColor={0,0,255}),Text(
          extent={{-32,14},{32,-10}},
          lineColor={0,0,255},
          textStyle={TextStyle.Bold},
          textString="|x|"),Text(
          extent={{-58,4},{-46,-4}},
          lineColor={255,255,255},
          textString="p1")}),
    Diagram(graphics),
    Documentation(revisions="<html>
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
end GENROU_data;
