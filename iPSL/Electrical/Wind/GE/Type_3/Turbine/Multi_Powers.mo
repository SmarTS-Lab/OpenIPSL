within iPSL.Electrical.Wind.GE.Type_3.Turbine;
block Multi_Powers "Multiplexer block for four input connectors"
  extends Modelica.Blocks.Interfaces.BlockIcon;
  Modelica.Blocks.Interfaces.RealInput u1 "Input" annotation (Placement(transformation(extent={{-140,70},{-100,110}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput y[5] "Multiple powers of the input" annotation (Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
protected
  Real u2;
  Real u3;
  Real u4;
equation
  u2 = u1^2;
  u3 = u1^3;
  u4 = u1^4;
  [y] = [1; u1; u2; u3; u4];
  annotation (
    Documentation(info="<HTML>
<p>
The output connector is the <b>concatenation</b> of the four input connectors.
Note, that the dimensions of the input connector signals have to be
explicitly defined via parameters n1, n2, n3 and n4.
</p>
</HTML>
", revisions="<html>
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
</html>"),
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Line(points={{8,0},{102,0}}, color={0,0,127}),Line(points={{-100,90},{-60,90},{-3,4}}, color={0,0,127}),Line(points={{-100,30},{-60,30},{-9,0}}, color={0,0,127}),Line(
          points={{-99,-30},{-59,-30},{-10,-5}}, color={0,0,127}),Line(points={{-100,-90},{-60,-90},{-5,-6}}, color={0,0,127}),Ellipse(
          extent={{-15,15},{15,-15}},
          fillColor={0,0,127},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,127})}),
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Line(points={{-100,90},{-60,90},{-3,4}}, color={0,0,255}),Line(points={{-100,-90},{-60,-90},{-5,-6}}, color={0,0,255}),Line(points={{8,0},{102,0}}, color={0,0,255}),
          Ellipse(
          extent={{-15,15},{15,-15}},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,255}),Line(points={{-100,30},{-60,30},{-9,0}}, color={0,0,255}),Line(points={{-99,-30},{-59,-30},{-10,-5}}, color={0,0,255})}));
end Multi_Powers;
