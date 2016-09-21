within OpenIPSL.Electrical.Events;
model PwFault "Transitory short-circuit on a node. Shunt impedance connected only during a specified interval of time.
              Developed by AIA. 2014/12/16"

  OpenIPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-80,-10},{-60,10}}), iconTransformation(extent={{-80,-10},{-60,10}})));
  parameter Real R "Resistance (pu)";
  parameter Real X "Conductance (pu)";
  parameter Real t1 "Start time of the fault (s)";
  parameter Real t2 "End time of the fault (s)";
  import Modelica.Constants.eps;
protected
  parameter Boolean ground=(abs(R) < eps and abs(X) < eps);
equation
  if time < t1 then
    p.ii = 0;
    p.ir = 0;
  elseif time < t2 and ground then
    p.vr = 1E-10;
    // This is to avoid numerical problems
    p.vi = 0;
  elseif time < t2 then
    p.ii = (R*p.vi - X*p.vr)/(X*X + R*R);
    p.ir = (R*p.vr + X*p.vi)/(R*R + X*X);
  else
    p.ii = 0;
    p.ir = 0;
  end if;
  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-60,-60},{60,60}},
        initialScale=0.1), graphics={
        Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
        Rectangle(
          extent={{-28,26},{12,6}},
          lineColor={0,0,0},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Line(
          points={{12,16},{26,16},{26,-24}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{14,-24},{38,-24}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{16,-28},{36,-28}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{20,-32},{34,-32}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{22,-36},{30,-36}},
          color={0,0,255},
          smooth=Smooth.None),
        Rectangle(
          extent={{-38,18},{-28,14}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-12,34},{-4,16},{-18,16},{-6,-6}},
          color={255,0,0},
          smooth=Smooth.None,
          thickness=0.5),
        Line(
          points={{-12,-4},{-6,-6},{-6,0}},
          color={255,0,0},
          smooth=Smooth.None)}),
    Diagram(coordinateSystem(
        extent={{-60,-60},{60,60}},
        preserveAspectRatio=true,
        initialScale=0.1), graphics),
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
end PwFault;
