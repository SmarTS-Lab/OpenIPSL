within iPSL.Electrical.Branches;
model PwLine "Model for a transmission Line based on the pi-equivalent circuit.
              2013"
  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-80,-10},{-60,10}}), iconTransformation(extent={{-80,-10},{-60,10}})));
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{60,-10},{80,10}}), iconTransformation(extent={{60,-10},{80,10}})));
  parameter Real R "Resistance p.u.";
  parameter Real X "Reactance p.u.";
  parameter Real G "Shunt half conductance p.u.";
  parameter Real B "Shunt half susceptance p.u.";
  parameter Real S_b=100 "System base power (MVA)";
  Real P12;
  Real P21;
  Real Q12;
  Real Q21;
equation
  P12 = (p.vr*p.ir - p.vi*p.ii)*S_b;
  P21 = -(n.vr*n.ir - n.vi*n.ii)*S_b;
  Q12 = (p.vr*p.ii - p.vi*p.ir)*S_b;
  Q21 = -(n.vr*n.ii - n.vi*n.ir)*S_b;
  R*(n.ir - G*n.vr + B*n.vi) - X*(n.ii - B*n.vr - G*n.vi) = n.vr - p.vr;
  R*(n.ii - B*n.vr - G*n.vi) + X*(n.ir - G*n.vr + B*n.vi) = n.vi - p.vi;
  R*(p.ir - G*p.vr + B*p.vi) - X*(p.ii - B*p.vr - G*p.vi) = p.vr - n.vr;
  R*(p.ii - B*p.vr - G*p.vi) + X*(p.ir - G*p.vr + B*p.vi) = p.vi - n.vi;
  annotation (
    Icon(graphics={Rectangle(extent={{-60,40},{60,-42}}, lineColor={0,0,255}),Rectangle(
          extent={{-40,10},{40,-10}},
          lineColor={0,0,255},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),Text(
          extent={{-106,82},{-18,36}},
          lineColor={238,46,47},
          textString=DynamicSelect("0.0", String(P12, significantDigits=2))),Text(
          extent={{24,82},{112,36}},
          lineColor={238,46,47},
          textString=DynamicSelect("0.0", String(P21, significantDigits=2))),Text(
          extent={{20,-54},{108,-100}},
          lineColor={0,255,0},
          textString=DynamicSelect("0.0", String(Q21, significantDigits=2))),Text(
          extent={{-108,-54},{-20,-100}},
          lineColor={0,255,0},
          textString=DynamicSelect("0.0", String(Q12, significantDigits=2))),Line(points={{-86,86},{-38,86},{-46,92}}, color={0,0,0}),Line(points={{-38,86},{-46,80}}, color={0,0,0}),Line(points={{42,
          86},{90,86},{82,92}}, color={0,0,0}),Line(points={{90,86},{82,80}}, color={0,0,0}),Line(points={{-88,-54},{-40,-54},{-48,-48}}, color={0,0,0}),Line(points={{-80,-48},{-80,-60}}, color={0,0,
          0}),Line(points={{-40,-54},{-48,-60}}, color={0,0,0}),Line(points={{48,-48},{48,-60}}, color={0,0,0}),Line(points={{40,-54},{88,-54},{80,-48}}, color={0,0,0}),Line(points={{88,-54},{80,-60}},
          color={0,0,0})}),
    Diagram(graphics),
    uses(Modelica(version="3.2.1")),
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
end PwLine;
