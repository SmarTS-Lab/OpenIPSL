within iPSL.Electrical.Essentials;
partial model pfComponent "Partial model containing all the Data for entering Power Flow data"
  outer iPSL.Electrical.SystemBase SysData "Must add this line in all models";
  parameter Real V_b=400 "Base voltage of the bus (kV)" annotation (Dialog(group="Power flow data"));
  parameter Real V_0=1 "Voltage magnitude (pu)" annotation (Dialog(group="Power flow data"));
  parameter Real angle_0=0 "Voltage angle (deg)" annotation (Dialog(group="Power flow data"));
  parameter Real P_0=1 "Active power (MW)" annotation (Dialog(group="Power flow data"));
  parameter Real Q_0=0 "Reactive power (MVAr)" annotation (Dialog(group="Power flow data"));
  parameter Real S_b=SysData.S_b "System base power (MVA)" annotation (Dialog(group="Power flow data", enable=false));
  parameter Real fn=SysData.fn "System Frequency (Hz)" annotation (Dialog(group="Power flow data", enable=false));
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
</html>"));
end pfComponent;
