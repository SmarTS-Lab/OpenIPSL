within OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses;
function invFEX "Inverse F_EX function for initialization"

  input Real K_C=K_C;
  input Real Efd0;
  input Real Ifd0;
  output Real VE0;

algorithm
  if Ifd0 <= 0 then
    VE0 := Efd0;
  elseif K_C*Ifd0/(Efd0 + 0.577*K_C*Ifd0) <= 0.433 then
    VE0 := Efd0 + 0.577*K_C*Ifd0;
  elseif K_C*Ifd0/sqrt((Efd0^2 + (K_C*Ifd0)^2)/0.75) > 0.433 and K_C*Ifd0/sqrt((Efd0^2 + (K_C*Ifd0)^2)/0.75) < 0.75 then
    VE0 := sqrt((Efd0^2 + (K_C*Ifd0)^2)/0.75);
  else
    VE0 := (Efd0 + 1.732*K_C*Ifd0)/1.732;
  end if;
  annotation (Documentation(revisions="<html>
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
</html>", info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PAGV2 - Section 15.2.4, PSS/E Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2016-04-19</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Tin Rabuzin, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end invFEX;
