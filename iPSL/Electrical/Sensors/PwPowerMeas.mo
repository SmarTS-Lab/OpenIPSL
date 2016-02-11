within iPSL.Electrical.Sensors;
model PwPowerMeas
  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-52,-6},{-40,6}})));
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{40,20},{52,32}}), iconTransformation(extent={{40,20},{52,32}})));
  Modelica.Blocks.Interfaces.RealOutput P annotation (Placement(transformation(extent={{40,-16},{50,-4}}), iconTransformation(extent={{40,-16},{50,-4}})));
  Modelica.Blocks.Interfaces.RealOutput Q annotation (Placement(transformation(extent={{40,-40},{50,-28}}), iconTransformation(extent={{40,-40},{50,-28}})));
equation
  n.vr = p.vr;
  n.vi = p.vi;
  n.ir = -p.ir;
  n.ii = -p.ii;
  -Q = (-n.vr*n.ii) + n.vi*n.ir;
  P = n.vr*n.ir + n.vi*n.ii;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-40,40},{40,-40}}, lineColor={0,0,255}),Rectangle(extent={{-30,32},{30,-32}},
          lineColor={0,0,255}),Rectangle(extent={{-20,20},{20,0}}, lineColor={0,0,255}),Text(
          extent={{-20,-12},{0,-28}},
          lineColor={0,0,255},
          textStyle={TextStyle.Bold},
          textString="Q"),Line(
          points={{0,0},{10,10}},
          color={0,0,255},
          smooth=Smooth.None),Text(
          extent={{-32,-12},{-12,-28}},
          lineColor={0,0,255},
          textStyle={TextStyle.Bold},
          textString="P/")}),
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
end PwPowerMeas;
