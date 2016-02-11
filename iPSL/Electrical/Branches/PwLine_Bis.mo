within iPSL.Electrical.Branches;
model PwLine_Bis "Model for a transmission Line based on the pi-equivalent circuit
  with explicit equations for currents. Developed by RTE. 2014/12/16"
  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-80,-10},{-60,10}}), iconTransformation(extent={{-80,-10},{-60,10}})));
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{60,-10},{80,10}}), iconTransformation(extent={{60,-10},{80,10}})));
  parameter Real R "Resistance p.u.";
  parameter Real X "Reactance p.u.";
  parameter Real G "Shunt half conductance p.u.";
  parameter Real B "Shunt half susceptance p.u.";
protected
  parameter Real Y=1/sqrt(R*R + X*X);
  parameter Real angle=atan2(R, X);
  parameter Real A=Y*sin(angle) + G;
  parameter Real A1=(-B) + Y*cos(angle);
  parameter Real A2=-Y*sin(angle);
  parameter Real A3=-Y*cos(angle);
  parameter Real A4=Y*cos(angle);
  parameter Real A5=-Y*sin(angle);
  parameter Real A6=B - Y*cos(angle);
  parameter Real A7=Y*sin(angle) + G;
equation
  n.ir = A*n.vr + A1*n.vi + A2*p.vr + A3*p.vi;
  n.ii = A6*n.vr + A7*n.vi + A4*p.vr + A2*p.vi;
  p.ir = A5*n.vr + A3*n.vi + A*p.vr + A1*p.vi;
  p.ii = A4*n.vr + A5*n.vi + A6*p.vr + A7*p.vi;
  annotation (
    Icon(graphics={Rectangle(extent={{-60,40},{60,-42}}, lineColor={0,0,255}),Rectangle(
          extent={{-40,10},{40,-10}},
          lineColor={0,0,255},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid)}),
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
end PwLine_Bis;
