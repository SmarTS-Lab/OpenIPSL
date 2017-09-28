within OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses;
function calculate_dc_exciter_params "Automatic Calculation of DC Exciter Parameters"
  input Real V_RMAX_init;
  input Real V_RMIN_init;
  input Real K_E_init;
  input Real E_2;
  input Real S_EE_2;
  input Real Efd0;
  input Real SE_Efd0;
  output Real V_RMAX;
  output Real V_RMIN;
  output Real K_E;
algorithm
  if V_RMAX_init == 0 then
    if K_E_init <= 0 then
      V_RMAX := S_EE_2*E_2;
    else
      V_RMAX := S_EE_2 + K_E_init;
    end if;
  else
    V_RMAX := V_RMAX_init;
  end if;
  if K_E_init == 0 then
    K_E := V_RMAX/(10*Efd0) - SE_Efd0;
  else
    K_E := K_E_init;
  end if;
  if V_RMAX_init == 0 then
    V_RMIN := -V_RMAX;
  else
    V_RMIN := V_RMIN_init;
  end if;
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
", info="<html>
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
end calculate_dc_exciter_params;
