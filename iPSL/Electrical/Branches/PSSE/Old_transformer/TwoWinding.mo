within iPSL.Electrical.Branches.PSSE.Old_transformer;
model TwoWinding
  constant Real pi=Modelica.Constants.pi;
  parameter Complex Zeq "equivalent impedance";
  parameter Real COD;
  parameter Real t "initial tap ration";
  parameter Real angle_d "W1-2 angel shift in degree";
  parameter Real Vmax=1.1;
  parameter Real Vmin=0.9;
  parameter Real rmax=1.1;
  parameter Real rmin=0.9;
  parameter Real Ntap=33;
  //total tap position
  parameter Real dV=0.001;
  //dead band
  parameter Real tau=17.0;
  //regulator delay
  parameter Real TC=5;
  //motor delay
  iPSL.Connectors.PwPin P1 annotation (Placement(transformation(extent={{-104,2},{-84,22}}), iconTransformation(extent={{-104,2},{-84,22}})));
  iPSL.Connectors.PwPin P2 annotation (Placement(transformation(extent={{78,6},{100,26}}), iconTransformation(extent={{80,6},{100,26}})));
  iPSL.Electrical.Branches.PwLine pwLine1(
    R=Zeq.re,
    X=Zeq.im,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-29,-22},{29,22}},
        rotation=0,
        origin={-37,12})));
  Real v;
  iPSL.Electrical.Branches.PSSE.Old_transformer.phaseShift phaseship(phase=angle_d) annotation (Placement(transformation(extent={{4,-4},{58,26}})));
protected
  parameter Real angle=angle_d/180*pi "angel shift in rad";
equation
  v = sqrt(P2.vr^2 + P2.vi^2);
  connect(pwLine1.p, P1) annotation (Line(
      points={{-57.3,12},{-94,12}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(phaseship.n, P2) annotation (Line(
      points={{54.76,12.5},{74.16,12.5},{74.16,16},{89,16}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(phaseship.p, pwLine1.n) annotation (Line(
      points={{6.7,12.5},{6.7,12},{-16.7,12}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Text(
          extent={{26,54},{114,2}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="*",
          textStyle={TextStyle.Bold}),Ellipse(
          extent={{-74,44},{6,-40}},
          lineColor={0,0,255},
          lineThickness=0.5),Ellipse(
          extent={{-10,44},{70,-40}},
          lineColor={0,0,255},
          lineThickness=0.5)}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSS/E Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>Unknown</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Mengjia Zhang,SmarTS Lab, KTH Royal Institute of Technology</p></td>
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
end TwoWinding;
