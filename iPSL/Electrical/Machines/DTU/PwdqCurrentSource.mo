within iPSL.Electrical.Machines.DTU;
model PwdqCurrentSource "Developed by DTU"
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{60,-6},{72,6}}), iconTransformation(extent={{60,-6},{72,6}})));
  Modelica.Blocks.Interfaces.RealInput id_ref annotation (Placement(transformation(extent={{-73,33},{-61,47}})));
  Modelica.Blocks.Interfaces.RealInput iq_ref annotation (Placement(transformation(extent={{-73,-47},{-61,-33}})));
  Modelica.Blocks.Interfaces.RealInput phi_meas annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={0,-46}), iconTransformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={0,-66})));
equation
  n.ir = id_ref*cos(phi_meas) - iq_ref*sin(phi_meas);
  n.ii = id_ref*sin(phi_meas) + iq_ref*cos(phi_meas);
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),Ellipse(
          extent={{-22,22},{22,-20}},
          lineColor={0,0,255},
          lineThickness=0.5),Polygon(
          points={{0,22},{-2,16},{2,16},{0,22}},
          lineColor={0,0,255},
          lineThickness=0.5,
          smooth=Smooth.None,
          fillPattern=FillPattern.Solid,
          fillColor={0,0,255}),Line(
          points={{0,38},{0,-42}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),Text(
          extent={{-56,48},{-36,32}},
          lineColor={0,0,255},
          lineThickness=1,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="Id_ref"),Text(
          extent={{-56,-32},{-36,-48}},
          lineColor={0,0,255},
          lineThickness=1,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="Iq_ref")}),
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
end PwdqCurrentSource;
