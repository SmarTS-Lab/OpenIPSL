within iPSL.Electrical.Branches.PSSE;
model PwTransformer "Two winding fixed transformer composed of an ideal transformer,
  a series  impedance and a shunt admittance, with explicit equations for currents.
  2014/12/16"
  iPSL.Connectors.PwPin To annotation (Placement(transformation(extent={{60,-10},{80,10}}), iconTransformation(extent={{60,-10},{80,10}})));
  iPSL.Connectors.PwPin From annotation (Placement(transformation(extent={{-80,-10},{-60,10}}), iconTransformation(extent={{-80,-10},{-60,10}})));
  parameter Real R "Resistance To.u.";
  parameter Real X "Reactance To.u.";
  parameter Real G "Shunt conductance To.u.";
  parameter Real B "Shunt susceptance To.u.";
  parameter Real t1 "Primary winding tap ratio";
  parameter Real t2 "Secondary winding tap ratio";
  parameter Boolean PrimaryOnFromSide "Is the primary winding on the From-side?";
protected
  parameter Real t=if PrimaryOnFromSide then t1/t2 else t2/t1;
  parameter Real x=if t1 >= t2 then t2 else t1;
  parameter Real Req=R*x*x;
  parameter Real Xeq=X*x*x;
equation
  To.ir = 1/(Req*Req + Xeq*Xeq)*(Req*(t*t*To.vr - t*From.vr) + Xeq*(t*t*To.vi - t*From.vi));
  To.ii = 1/(Req*Req + Xeq*Xeq)*(Req*(t*t*To.vi - t*From.vi) - Xeq*(t*t*To.vr - t*From.vr));
  From.ir = (-1/t*(1/(Req*Req + Xeq*Xeq)*(Req*(t*t*To.vr - t*From.vr) + Xeq*(t*t*To.vi - t*From.vi)))) + G*From.vr - B*From.vi;
  From.ii = (-1/t*(1/(Req*Req + Xeq*Xeq)*(Req*(t*t*To.vi - t*From.vi) - Xeq*(t*t*To.vr - t*From.vr)))) + G*From.vi + B*From.vr;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-60,40},{60,-40}}, lineColor={0,0,255}),Ellipse(
          extent={{-28,22},{14,-22}},
          lineColor={0,0,255},
          lineThickness=1),Line(
          points={{-60,0},{-28,0}},
          color={0,0,255},
          thickness=1,
          smooth=Smooth.None),Line(
          points={{28,0},{60,0}},
          color={0,0,255},
          thickness=1,
          smooth=Smooth.None),Text(
          extent={{-94,34},{-62,14}},
          lineColor={0,0,255},
          textString="From"),Text(
          extent={{62,34},{94,14}},
          lineColor={0,0,255},
          textString="To"),Ellipse(
          extent={{-14,22},{28,-22}},
          lineColor={0,0,255},
          lineThickness=1)}),
    Diagram(graphics),
    Documentation(info="<html>
Transformer model from Nordic44 system developed by Giuseppe.
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
end PwTransformer;
