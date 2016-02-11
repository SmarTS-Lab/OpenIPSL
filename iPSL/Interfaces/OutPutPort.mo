within iPSL.Interfaces;
model OutPutPort "OutPutPort for plotting output results"
  output Real vo;
  input Real vi;
equation
  vi = vo;
  annotation (
    Icon(graphics={Rectangle(extent={{-20,20},{40,-20}}, lineColor={0,0,255}),Text(
          extent={{-8,10},{26,-8}},
          lineColor={0,0,255},
          textString="Out")}),
    Diagram(graphics={Rectangle(extent={{-30,20},{30,-20}}, lineColor={0,0,255}),Text(
          extent={{-18,10},{16,-8}},
          lineColor={0,0,255},
          textString="Out")}),
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
end OutPutPort;
