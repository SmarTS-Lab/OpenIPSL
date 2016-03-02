within REN_AIA.REN_Groups.Configuration.Data;
record IEESGO_data
  parameter Real Ssystem=100;
  parameter Real Smachine=100;
  parameter Real J=0 "controller lag(sec)";
  parameter Real J1=0 "controller lead compensation(sec)";
  parameter Real J2=0.02 "governor lag (sec)";
  parameter Real J3=0.673 "delay due to steam inlet volumes associated with steam chest and inlet piping(sec)";
  parameter Real J4=3 "reheater delay including hot and cold leads (sec)";
  parameter Real J5=0.45 "delay due to IP-LP turbine, crossover pipes, and LP end hoods (sec)";
  parameter Real J6=14.3 "1/per unit regulation";
  parameter Real J7=0.7 "fraction";
  parameter Real J8=1 "fraction";
  parameter Real J9=10 "upper power limit";
  parameter Real J10=0.5 "lower power limit";
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
end IEESGO_data;
