within iPSL.Electrical.Wind.DTU;
model VoltageDepCurrent "Part of the Q Control, to generate voltage dependent current. Developed by DTU"
  Modelica.Blocks.Interfaces.RealInput Uwtt annotation (Placement(transformation(extent={{-60,-6},{-48,6}}), iconTransformation(extent={{-60,-6},{-48,6}})));
  Modelica.Blocks.Interfaces.RealOutput iqv annotation (Placement(transformation(extent={{47,-6},{59,6}}), iconTransformation(extent={{47,-6},{59,6}})));
  parameter Real Udb1 "voltage dead band lower limit";
  parameter Real Udb2 "voltage dead band upper limit";
  parameter Real Kqv;
  parameter Real Uini(fixed=false) "initial voltage";
initial equation
  Uini = Uwtt;
equation
  iqv = if Uwtt < Uini - Udb1 then Kqv*(Uwtt - Uini + Udb1) elseif Uwtt > Uini + Udb2 then Kqv*(Uwtt - Uini - Udb2) else 0;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Rectangle(
          extent={{-48,30},{48,-28}},
          lineColor={0,0,255},
          lineThickness=0.5),Line(
          points={{-10,20},{-10,-20}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-30,0},{10,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-26,-10},{-20,0},{0,0},{6,10}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),Text(
          extent={{16,6},{34,-6}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillPattern=FillPattern.Solid,
          textString="Kqv")}),
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
end VoltageDepCurrent;
