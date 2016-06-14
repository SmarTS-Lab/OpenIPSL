within OpenIPSL.Electrical.Branches.Simulink.LTC;
model LTC_switch
  Modelica.Blocks.Interfaces.RealInput Signalin annotation (Placement(transformation(extent={{-68,-4},{-48,16}}), iconTransformation(extent={{-78,-16},{-48,16}})));
  Modelica.Blocks.Interfaces.RealInput LTCin annotation (Placement(transformation(extent={{-68,46},{-48,66}}), iconTransformation(extent={{-80,32},{-48,66}})));
  Modelica.Blocks.Interfaces.RealInput Normalin annotation (Placement(transformation(extent={{-68,-58},{-48,-38}}), iconTransformation(extent={{-78,-68},{-48,-38}})));
  Modelica.Blocks.Interfaces.RealOutput r annotation (Placement(transformation(extent={{54,0},{74,20}}), iconTransformation(extent={{56,-8},{86,24}})));
equation
  if Signalin > 0 then
    r = LTCin;
  else
    r = Normalin;
  end if;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Rectangle(
          extent={{-46,94},{56,-94}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Line(
          points={{-46,0},{-32,0},{-32,18}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=1),Line(
          points={{-32,0},{-32,-18}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=1)}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Load Tap Changer with switching</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-10-02</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Le Qi, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>", revisions="<html>
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
end LTC_switch;
