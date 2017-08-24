within OpenIPSL.NonElectrical.Functions;
function SE "Scaled Quadratic Saturation Function (PTI PSS/E) "
  extends Modelica.Icons.Function;
  input Real u "Unsaturated Input";
  input Real SE1;
  input Real SE2;
  input Real E1;
  input Real E2;
  output Real sys "Saturated Output";
protected
  parameter Real a=if SE2 <> 0 then sqrt(SE1*E1/(SE2*E2)) else 0;
  parameter Real A=E2 - (E1 - E2)/(a - 1);
  parameter Real B=if abs(E1 - E2) < Modelica.Constants.eps then 0 else SE2*E2*(a - 1)^2/(E1 - E2)^2;
algorithm
  if SE1 == 0.0 or u <= 0.0 then
    sys := 0.0;
  else
    if u <= A then
      sys := 0.0;
    else
      sys := B*(u - A)^2/u;
    end if;
  end if;
  annotation (Documentation(info="<html>
</html>", revisions="<html>
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
end SE;
