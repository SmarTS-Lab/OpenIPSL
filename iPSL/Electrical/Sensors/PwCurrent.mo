within iPSL.Electrical.Sensors;
model PwCurrent "Current sensor"
  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-60,-10},{-40,10}}), iconTransformation(extent={{-60,-10},{-40,10}})));
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{40,10},{60,30}}), iconTransformation(extent={{40,10},{60,30}})));
  Modelica.Blocks.Interfaces.RealOutput outp annotation (Placement(transformation(extent={{39,-30},{59,-10}}), iconTransformation(extent={{39,-30},{59,-10}})));
equation
  n.vr = p.vr;
  n.vi = p.vi;
  n.ir = -p.ir;
  n.ii = -p.ii;
  outp = sqrt(p.ir*p.ir + p.ii*p.ii) annotation (Icon(graphics={Rectangle(extent={{-40,40},{40,-40}}, lineColor={0,0,255}),Rectangle(extent={{-30,32},{30,-32}}, lineColor={0,0,255}),Rectangle(extent=
          {{-20,20},{20,0}}, lineColor={0,0,255}),Text(
          extent={{-26,-12},{-6,-28}},
          lineColor={0,0,255},
          textStyle={TextStyle.Bold},
          textString="I"),Line(
          points={{0,0},{10,10}},
          color={0,0,255},
          smooth=Smooth.None)}), Diagram(graphics));
  annotation (
    Icon(graphics={Text(
          extent={{-68,20},{-60,14}},
          lineColor={0,0,255},
          textString="p"),Text(
          extent={{58,40},{66,34}},
          lineColor={0,0,255},
          textString="p"),Text(
          extent={{-66,20},{-58,14}},
          lineColor={0,0,255},
          textString="p"),Text(
          extent={{56,40},{64,34}},
          lineColor={0,0,255},
          textString="n"),Text(
          extent={{-66,22},{-58,16}},
          lineColor={0,0,255},
          textString="p"),Text(
          extent={{56,42},{64,36}},
          lineColor={0,0,255},
          textString="p"),Text(
          extent={{-68,22},{-60,16}},
          lineColor={0,0,255},
          textString="p"),Text(
          extent={{52,-4},{60,-10}},
          lineColor={0,0,255},
          textString="outp")}),
    Diagram(graphics),
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
end PwCurrent;
