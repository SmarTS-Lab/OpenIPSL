within N44_AIA.N44_Groups.Configuration.Data;
record IEEET2_data
  parameter Real J=0.20000E-01 "Voltage input time constant (s)";
  //0
  parameter Real J1=200.00 "AVR gain";
  //400
  parameter Real J2=0.10000E-02 "AVR time constant (s)";
  parameter Real J3=6.0800 "Maximum AVR output (pu)";
  parameter Real J4=-6.0800 "Minimum AVR output (pu)";
  parameter Real J5=1 "Exciter field gain, s";
  parameter Real J6=0.55000 "Exciter time constant (s)";
  parameter Real J7=0.60000E-01 "Rate feedback gain (pu)";
  parameter Real J8=0.30000 "Rate feedback time constant (s)";
  parameter Real J9=0.60000 "Rate feedback time constant (s)";
  parameter Real J10=2.8500 "Exciter saturation point 1 (pu)";
  parameter Real J11=0.30000 "Saturation at E1";
  parameter Real J12=3.8000 "Exciter saturation point 2 (pu)";
  parameter Real J13=0.60000 "Saturation at E2";
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
end IEEET2_data;
