within OpenIPSL.Electrical.Banks;
model PwShunt "Thyristor controlled Shunt reactor/capacitor"
  OpenIPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-8,44},{12,64}}), iconTransformation(extent={{-10,42},{10,62}})));
  Modelica.Blocks.Interfaces.RealInput Q
    "Reactive power produced by the shunt (pu)"                                      annotation (Placement(transformation(extent={{-62,-2},{-42,18}}), iconTransformation(extent={{-40,0},{-58,18}})));
  constant Real pi=Modelica.Constants.pi;
  parameter Real fn=50 "Frequency rating, Hz";
  Real C "Capacitance in p.u";
  Real L "Inductance in p.u";
  Real v;
  Real anglev;
  Real i;
  Real anglei;
equation
  v = sqrt(p.vr^2 + p.vi^2);
  anglev = atan2(p.vi, p.vr);
  i = sqrt(p.ir^2 + p.ii^2);
  anglei = atan2(p.ii, p.ir);
  if Q >= 0 then
    C = Q/(v^2*2*pi*fn);
    L = 0;
    anglei = anglev + pi/2;
    i = v*2*pi*fn*C;
  else
    L = v^2/(2*pi*fn*(-Q));
    C = 0;
    anglei = anglev - pi/2;
    i = v/(2*pi*fn*L);
  end if;
  //p.u
  //p.u
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Line(
          points={{0,42},{0,30}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{-16,20},{-4,20}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{-16,16},{-4,16}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),Rectangle(extent={{-40,42},{42,-24}}, lineColor={0,0,255}),Line(
          points={{-16,10},{-4,10}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{-16,6},{-4,6}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{-16,0},{-4,0}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{-16,-4},{-4,-4}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{-10,30},{-10,22},{-10,20}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-10,16},{-10,10}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-10,6},{-10,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-10,-4},{-10,-8}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-14,-8},{-6,-8}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-12,-10},{-8,-10}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-10,30},{0,30}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{0,30},{10,30}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{10,30},{10,22},{10,20}},
          color={0,0,255},
          smooth=Smooth.None),Ellipse(extent={{6,20},{14,14}}, lineColor={0,0,255}),Ellipse(extent={{6,14},{14,8}}, lineColor={0,0,255}),Ellipse(extent={{6,8},{14,2}}, lineColor={0,0,255}),Rectangle(
          extent={{10,20},{20,-4}},
          pattern=LinePattern.None,
          lineColor={255,255,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Line(
          points={{10,2},{10,-4},{10,-4}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{10,-4},{10,-8}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{6,-8},{14,-8}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{8,-10},{12,-10}},
          color={0,0,255},
          smooth=Smooth.None),Text(
          extent={{-38,14},{-28,0}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Q")}),
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
end PwShunt;
