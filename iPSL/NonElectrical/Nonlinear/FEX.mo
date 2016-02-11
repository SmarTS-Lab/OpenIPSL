within iPSL.NonElectrical.Nonlinear;
model FEX "FEX=f(IN)"
  Modelica.Blocks.Interfaces.RealInput u annotation (Placement(transformation(extent={{-70,-10},{-50,10}}), iconTransformation(extent={{-110,-10},{-90,10}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(extent={{58,-10},{78,10}}), iconTransformation(extent={{100,-10},{120,10}})));
equation
  if u <= 0 then
    y = 1;
  elseif u > 0 and u <= 0.433 then
    y = 1 - 0.577*u;
  elseif u > 0.433 and u < 0.75 then
    y = sqrt(0.75 - u^2);
  elseif u >= 0.75 and u <= 1 then
    y = 1.732*(1 - u);
  else
    y = 0;
  end if;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-62,28},{64,-30}},
          lineColor={0,0,255},
          textString="FEX=f(IN)")}),
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
end FEX;
