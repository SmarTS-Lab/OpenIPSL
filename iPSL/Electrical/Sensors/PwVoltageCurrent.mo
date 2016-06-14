within iPSL.Electrical.Sensors;
class PwVoltageCurrent "Voltage sensor."
  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-60,-40},{-40,-20}}), iconTransformation(extent={{-60,-40},{-40,-20}})));
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{-10,50},{10,70}}), iconTransformation(extent={{40,20},{60,40}})));
  Modelica.Blocks.Interfaces.RealOutput Vr annotation (Placement(transformation(extent={{48,-34},{68,-14}}), iconTransformation(extent={{40,4},{50,14}})));
  Modelica.Blocks.Interfaces.RealOutput Vi annotation (Placement(transformation(extent={{48,-54},{68,-34}}), iconTransformation(extent={{40,-10},{50,0}})));
  Modelica.Blocks.Interfaces.RealOutput Ir annotation (Placement(transformation(extent={{48,-72},{68,-52}}), iconTransformation(extent={{40,-24},{50,-14}})));
  Modelica.Blocks.Interfaces.RealOutput Ii annotation (Placement(transformation(extent={{48,-88},{68,-68}}), iconTransformation(extent={{40,-40},{52,-28}})));
equation
  n.vr = p.vr;
  n.vi = p.vi;
  n.ir = -p.ir;
  n.ii = -p.ii;
  Vr = p.vr;
  Vi = p.vi;
  Ir = p.ir;
  Ii = p.ii;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-40,40},{40,-40}}, lineColor={0,0,255}),Rectangle(extent={{-30,32},{30,-32}},
          lineColor={0,0,255}),Rectangle(extent={{-20,20},{20,0}}, lineColor={0,0,255}),Text(
          extent={{-26,-12},{-6,-28}},
          lineColor={0,0,255},
          textString="U",
          textStyle={TextStyle.Bold}),Line(
          points={{0,0},{10,10}},
          color={0,0,255},
          smooth=Smooth.None),Text(
          extent={{52,12},{60,6}},
          lineColor={0,0,255},
          textString="vr"),Text(
          extent={{52,-2},{60,-8}},
          lineColor={0,0,255},
          textString="vi"),Text(
          extent={{52,-16},{60,-22}},
          lineColor={0,0,255},
          textString="Ir"),Text(
          extent={{52,-32},{60,-38}},
          lineColor={0,0,255},
          textString="Ii")}),
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
end PwVoltageCurrent;
