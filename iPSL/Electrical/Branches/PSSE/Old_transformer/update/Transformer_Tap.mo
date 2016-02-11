within iPSL.Electrical.Branches.PSSE.Old_transformer.update;
model Transformer_Tap "Basic Two Winding Transformer equation with tap changer"
  iPSL.Connectors.PwPin T "To side" annotation (Placement(transformation(extent={{86,-2},{106,18}}), iconTransformation(extent={{86,-2},{106,18}})));
  iPSL.Connectors.PwPin F "From side" annotation (Placement(transformation(extent={{-92,0},{-72,20}}), iconTransformation(extent={{-92,0},{-72,20}})));
  extends TransformerParameter;
  Modelica.Blocks.Interfaces.RealInput t1 annotation (Placement(transformation(extent={{-110,22},{-70,62}})));
protected
  Real t;
equation
  t = t1;
  Req*(F.ir - G*F.vr + B*F.vi) - Xeq*(F.ii - B*F.vr - G*F.vi) = F.vr - T.vr*t;
  Req*(F.ii - B*F.vr - G*F.vi) + Xeq*(F.ir - G*F.vr + B*F.vi) = F.vi - T.vi*t;
  -t*(Req*T.ir - Xeq*T.ii) = F.vr - T.vr*t;
  -t*(Req*T.ii + Xeq*T.ir) = F.vi - T.vi*t;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-82,66},{92,-44}}, lineColor={0,0,255})}),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Line(
          points={{-68,16},{78,16},{78,16}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),Rectangle(
          extent={{-54,0},{-46,-42}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillPattern=FillPattern.Solid,
          fillColor={0,0,255}),Rectangle(
          extent={{-38,0},{-30,-42}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillPattern=FillPattern.Solid,
          fillColor={0,0,255}),Rectangle(
          extent={{16,20},{-18,12}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillPattern=FillPattern.Solid,
          fillColor={0,0,255}),Rectangle(
          extent={{60,20},{26,12}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillPattern=FillPattern.Solid,
          fillColor={0,0,255}),Line(
          points={{-42,16},{-42,4},{-34,4},{-34,-2},{-34,-48},{-50,-48},{-50,4},{-42,4},{-42,4}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),Line(
          points={{-42,-48},{-42,-58},{-54,-58},{-30,-58},{-30,-58}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),Text(
          extent={{-76,-10},{-58,-26}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="G"),Text(
          extent={{-26,-12},{-8,-28}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="B"),Text(
          extent={{-12,38},{6,22}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="R"),Text(
          extent={{34,38},{52,22}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="X")}),
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
end Transformer_Tap;
