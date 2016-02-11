within iPSL.Electrical.Controls.PSAT.OEL;
model FieldCurrent
  Modelica.Blocks.Interfaces.RealInput v "generator terminal voltage" annotation (Placement(transformation(extent={{-82,32},{-62,52}}), iconTransformation(extent={{-82,32},{-50,66}})));
  Modelica.Blocks.Interfaces.RealInput p "active power " annotation (Placement(transformation(extent={{-82,-4},{-62,16}}), iconTransformation(extent={{-82,-10},{-48,24}})));
  Modelica.Blocks.Interfaces.RealInput q "reactive power" annotation (Placement(transformation(extent={{-82,-38},{-62,-18}}), iconTransformation(extent={{-82,-54},{-48,-20}})));
  Modelica.Blocks.Interfaces.RealOutput ifield annotation (Placement(transformation(extent={{58,4},{78,24}}), iconTransformation(extent={{58,-10},{90,24}})));
  parameter Real xd;
  parameter Real xq;
  Real gamap;
  Real gamaq;
equation
  gamap = xq*p/v;
  gamaq = xq*q/v;
  ifield = sqrt((v + gamaq)^2 + p^2) + (xd/xq + 1)*(gamaq*(v + gamaq) + gamap)/sqrt((v + gamaq)^2 + p^2);
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-48,66},{60,-52}}, lineColor={0,0,255}),Text(
          extent={{-52,62},{-20,42}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="v"),Text(
          extent={{-48,14},{-20,-2}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="p"),Text(
          extent={{-50,-28},{-22,-44}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="q"),Text(
          extent={{36,12},{64,-4}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="if")}),
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
end FieldCurrent;
