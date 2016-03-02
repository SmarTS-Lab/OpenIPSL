within iPSL.Electrical.Solar.KTH.Auxiliary;


model Calcurrent
  parameter Real Udc0=700 "Intial dc voltage";
  Modelica.Blocks.Interfaces.RealInput yi annotation (Placement(
      visible=true,
      transformation(
        origin={-155.0,40.0},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0),
      iconTransformation(
        origin={-120.0,40.0},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput udc(start=Udc0) annotation (Placement(
      visible=true,
      transformation(
        origin={-150.0,-15.0},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0),
      iconTransformation(
        origin={-120.0,-50.0},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput yo annotation (Placement(
      visible=true,
      transformation(
        origin={157.5089,7.3692},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0),
      iconTransformation(
        origin={110.0,0.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
equation
  yo = yi/udc*1000000;
  annotation (
    Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={10,10}), graphics={
        Text(
          visible=true,
          origin={-80.1182,38.5265},
          fillPattern=FillPattern.Solid,
          extent={{-13.2292,-11.4735},{13.2292,11.4735}},
          textString="0",
          fontName="Arial"),
        Text(
          visible=true,
          origin={-80.0,-51.4735},
          fillPattern=FillPattern.Solid,
          extent={{-13.2292,-11.4735},{13.2292,11.4735}},
          textString="1",
          fontName="Arial"),
        Text(
          visible=true,
          origin={76.7708,-0.0},
          fillPattern=FillPattern.Solid,
          extent={{-13.2292,-11.4735},{13.2292,11.4735}},
          textString="out",
          fontName="Arial"),
        Rectangle(
          visible=true,
          fillColor={255,255,255},
          extent={{-100.0,-100.0},{100.0,100.0}}),
        Text(
          visible=true,
          origin={-2.514,58.5651},
          fillPattern=FillPattern.Solid,
          extent={{-27.486,-14.5669},{27.486,14.5669}},
          textString="Calc_current",
          fontName="Arial")}),
    Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={5,5})),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>TBD</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>TBD</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
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
end Calcurrent;
