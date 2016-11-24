within TwoAreas.Data;


record PF2
  import Modelica.Constants.pi;
  extends Support.PF_TwoAreas(
    voltages(
      V1=1.03,
      A1=0.353381617759011*180/pi,
      V2=1.01,
      A2=0.183079867930759*180/pi,
      V3=1.03,
      A3=-0.118682400000000*180/pi,
      V4=1.01,
      A4=-0.296314118513724*180/pi,
      V5=1.0069,
      A5=13.7881,
      V6=0.97914,
      A6=3.7146,
      V7=0.96283,
      A7=-0.0815909472281613*180/pi,
      V8=0.94828,
      A8=-18.5131,
      V9=0.973864710338689,
      A9=-0.560256955944523*180/pi,
      V10=0.98486,
      A10=-23.7131,
      V11=1.0088,
      A11=-13.4215),
    machines(
      P1_1=700,
      Q1_1=182.450226027067,
      P2_1=700,
      Q2_1=228.434194888742,
      P3_1=718.906215107731,
      Q3_1=172.421333322957,
      P4_1=700,
      Q4_1=193.556043309309),
    loads(
      PL7_1=967,
      QL7_1=-100,
      PL9_1=1767,
      QL9_1=-250));
  annotation (Documentation(revisions="<html>
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
end PF2;
