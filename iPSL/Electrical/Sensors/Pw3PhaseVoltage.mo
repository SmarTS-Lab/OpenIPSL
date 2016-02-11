within iPSL.Electrical.Sensors;
model Pw3PhaseVoltage "Voltage sensor for generator machine with internal transformer"
  parameter Real RT "Step-up trafo Resistance in Machine (pu)";
  parameter Real XT "Step-up trafo Resistance in Machine (pu)";
  parameter Real r "Step-up trafo ratio in Machine";
  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-60,-10},{-40,10}}), iconTransformation(extent={{-60,-10},{-40,10}})));
  Modelica.Blocks.Interfaces.RealOutput v annotation (Placement(transformation(extent={{39,-32},{59,-12}}), iconTransformation(extent={{39,-32},{59,-12}})));
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{40,12},{60,32}}), iconTransformation(extent={{40,12},{60,32}})));
equation
  n.vr = p.vr;
  n.vi = p.vi;
  n.ir = -p.ir;
  n.ii = -p.ii;
  v = sqrt((p.vr + RT*p.ir - XT*p.ii)*(p.vr + RT*p.ir - XT*p.ii) + (p.vi + RT*p.ii + XT*p.ir)*(p.vi + RT*p.ii + XT*p.ir))*1.0/r;
  annotation (
    Icon(graphics={Rectangle(extent={{-40,40},{40,-40}}, lineColor={0,0,255}),Rectangle(extent={{-30,32},{30,-32}}, lineColor={0,0,255}),Rectangle(extent={{-20,20},{20,0}}, lineColor={0,0,255}),Text(
          extent={{-28,-18},{28,-30}},
          lineColor={0,0,255},
          textStyle={TextStyle.Bold},
          textString="3-Phase V"),Line(
          points={{0,0},{10,10}},
          color={0,0,255},
          smooth=Smooth.None)}),
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
end Pw3PhaseVoltage;
