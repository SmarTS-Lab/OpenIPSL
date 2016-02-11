within iPSL.Connectors;
model PwCoBPin "connector for change from machine power base to system power base "
  parameter Real mbase "machine base power rating MVA";
  parameter Real Sbase "system base power rating MVA";
  parameter Real CoB=mbase/Sbase "change of base ratio";
  iPSL.Connectors.PwPin p "machine base" annotation (Placement(transformation(extent={{-32,-4},{-12,16}}), iconTransformation(extent={{-32,-4},{-12,16}})));
  iPSL.Connectors.PwPin n "system base" annotation (Placement(transformation(extent={{8,-4},{28,16}}), iconTransformation(extent={{8,-4},{28,16}})));
equation
  0 = n.vr - p.vr;
  // real part of the voltage
  0 = n.vi - p.vi;
  // imaginary part of the voltage
  0 = p.ir*CoB + n.ir;
  // real part of the current
  0 = p.ii*CoB + n.ii;
  // imaginary part of the current
  annotation (
    Icon(graphics={Rectangle(
          extent={{-100,98},{100,-102}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.None)}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
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
end PwCoBPin;
