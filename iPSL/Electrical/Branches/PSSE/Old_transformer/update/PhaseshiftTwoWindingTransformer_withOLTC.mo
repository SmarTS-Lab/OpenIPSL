within iPSL.Electrical.Branches.PSSE.Old_transformer.update;
model PhaseshiftTwoWindingTransformer_withOLTC "Two Winding Transformer with Phaseshift and OLTC"
  extends TransformerParameter;
  inner parameter Real initialtapratio=1;
  parameter Real phase " From side and To side phase shift in degree";
  parameter Real Vmax=1.1 annotation (Dialog(group=" OLTC control"));
  parameter Real Vmin=0.9 annotation (Dialog(group=" OLTC control"));
  parameter Real rmax=1.1 annotation (Dialog(group=" OLTC control"));
  parameter Real rmin=0.9 annotation (Dialog(group=" OLTC control"));
  parameter Real Ntap=33 "Number of tap positions" annotation (Dialog(group=" OLTC control"));
  parameter Real Td=17.0 "Regulator delay" annotation (Dialog(group=" OLTC control"));
  parameter Real TC=5 "motor delay" annotation (Dialog(group=" OLTC control"));
  parameter Real TSD "delay between two subsequent tap changes" annotation (Dialog(group=" OLTC control"));
  parameter Real dtap=(rmax - rmin)/(Ntap - 1) annotation (Dialog(group=" OLTC control"));
  parameter Real Rmax=1 + (rmax - rmin)/2 annotation (Dialog(group=" OLTC control"));
  parameter Real Rmin=1 - (rmax - rmin)/2 annotation (Dialog(group=" OLTC control"));
  iPSL.Connectors.PwPin F annotation (Placement(transformation(extent={{-114,-4},{-94,16}})));
  iPSL.Connectors.PwPin T annotation (Placement(transformation(extent={{86,-6},{106,14}})));
  phaseshift phaseship1(phase=phase) annotation (Placement(transformation(extent={{-86,-26},{-10,30}})));
  Transformer_Tap transformer_Tap(
    R=R,
    X=X,
    G=G,
    B=B,
    ti=ti,
    tj=tj) annotation (Placement(transformation(extent={{10,-20},{66,24}})));
  OLTC oLTC(TSD=0) annotation (Placement(transformation(extent={{-62,26},{-26,52}})));
  Modelica.Blocks.Interfaces.RealInput V annotation (Placement(transformation(extent={{-112,30},{-88,54}})));
equation
  connect(phaseship1.F, F) annotation (Line(
      points={{-82.96,4.24},{-86.6934,4.24},{-86.6934,6},{-104,6}},
      color={0,0,255},
      thickness=0.5,
      smooth=Smooth.None));
  connect(phaseship1.T, transformer_Tap.F) annotation (Line(
      points={{-15.32,4.24},{-3.03,4.24},{-3.03,4.2},{15.04,4.2}},
      color={0,0,255},
      thickness=0.5,
      smooth=Smooth.None));
  connect(transformer_Tap.T, T) annotation (Line(
      points={{64.88,3.76},{86.44,3.76},{86.44,4},{96,4}},
      color={0,0,255},
      thickness=0.5,
      smooth=Smooth.None));
  connect(oLTC.y, transformer_Tap.t1) annotation (Line(
      points={{-27.08,40.82},{-4,40.82},{-4,11.24},{12.8,11.24}},
      color={0,0,127},
      thickness=0.5,
      smooth=Smooth.None));
  connect(V, oLTC.u) annotation (Line(
      points={{-100,42},{-88.36,42},{-88.36,40.82},{-62.72,40.82}},
      color={0,0,127},
      thickness=0.5,
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
        Text(
          extent={{26,54},{114,2}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="*",
          textStyle={TextStyle.Bold}),
        Ellipse(
          extent={{-74,44},{6,-40}},
          lineColor={0,0,255},
          lineThickness=0.5),
        Ellipse(
          extent={{-10,44},{70,-40}},
          lineColor={0,0,255},
          lineThickness=0.5),
        Line(
          points={{-13,-12},{-5,-12},{-5,-6},{1,-6},{1,0},{9,0},{9,6},{15,6},{15,12}},
          color={0,0,255},
          smooth=Smooth.None,
          origin={-29,4},
          rotation=180,
          thickness=0.5)}),
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
end PhaseshiftTwoWindingTransformer_withOLTC;
