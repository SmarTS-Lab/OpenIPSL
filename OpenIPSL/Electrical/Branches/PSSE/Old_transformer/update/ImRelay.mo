within OpenIPSL.Electrical.Branches.PSSE.Old_transformer.update;
model ImRelay "input dependent output"
  Modelica.Blocks.Interfaces.RealInput p1 annotation (Placement(transformation(extent={{-54,-26},{-41,-12}}), iconTransformation(extent={{-54,-26},{-41,-12}})));
  Modelica.Blocks.Interfaces.RealInput p2 annotation (Placement(transformation(extent={{-54,18},{-41,32}}), iconTransformation(extent={{-54,18},{-41,32}})));
  Modelica.Blocks.Interfaces.RealOutput n1 annotation (Placement(transformation(extent={{39,-10},{59,10}}), iconTransformation(extent={{39,-10},{59,10}})));
  parameter Real COD=0 "Enable OLTC";
equation
  n1 = if COD > 0 then p1 else p2;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-40,40},{40,-40}}, lineColor={0,0,255}),Line(
          points={{-2,12},{14,2},{34,2}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-40,24},{-14,24}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-40,-20},{-14,-20}},
          color={0,0,255},
          smooth=Smooth.None),Ellipse(extent={{-14,26},{-8,20}}, lineColor={0,0,255}),Ellipse(extent={{-14,-16},{-8,-22}}, lineColor={0,0,255})}),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics),
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
end ImRelay;
