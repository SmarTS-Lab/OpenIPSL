within iPSL.Electrical.Solar.KTH.Auxiliary;


model CurrentLimitdeadband
  Modelica.Blocks.Interfaces.RealInput idin annotation (Placement(
      visible=true,
      transformation(
        origin={-168.0385,-35.0},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0),
      iconTransformation(
        origin={-103.1115,53.6136},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput id_ref annotation (Placement(
      visible=true,
      transformation(
        origin={160.0,30.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0),
      iconTransformation(
        origin={9.4772,39.6741},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput duac annotation (Placement(
      visible=true,
      transformation(
        origin={-168.0827,0.0},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0),
      iconTransformation(
        origin={-95.1115,45.6136},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput iqin annotation (Placement(
      visible=true,
      transformation(
        origin={-160.0,42.5},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0),
      iconTransformation(
        origin={-87.1115,37.6136},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput iq_ref annotation (Placement(
      visible=true,
      transformation(
        origin={158.267,-3.451},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0),
      iconTransformation(
        origin={17.4772,31.6741},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Math.Abs abs1 annotation (Placement(visible=true, transformation(
        origin={52.1853,70.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMin=0, uMax=maxAbsCur*maxAbsCur)
    annotation (Placement(visible=true, transformation(
        origin={5.0,70.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Sources.Constant const(k=maxAbsCur) annotation (Placement(visible=true, transformation(
        origin={-140.0,95.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Math.Product product1 annotation (Placement(visible=true, transformation(
        origin={-75.0,83.3156},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Math.Product product2 annotation (Placement(visible=true, transformation(
        origin={-75.0,57.5},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Math.Add add1(k2=-1) annotation (Placement(visible=true, transformation(
        origin={-40.0,70.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Math.Sqrt sqrt1 annotation (Placement(visible=true, transformation(
        origin={82.1897,70.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
equation
  connect(abs1.y, sqrt1.u) annotation (Line(
      visible=true,
      origin={66.6875,70.0},
      points={{-3.5022,0.0},{3.5022,0.0}},
      color={0,0,127}));
  connect(limiter1.y, abs1.u) annotation (Line(
      visible=true,
      origin={28.0926,70.0},
      points={{-12.0926,0},{12.0927,0}},
      color={0,0,127}));
  connect(add1.y, limiter1.u) annotation (Line(
      visible=true,
      origin={-18.0,70.0},
      points={{-11.0,0.0},{11.0,0.0}},
      color={0,0,127}));
  connect(product2.y, add1.u2) annotation (Line(
      visible=true,
      origin={-56.5,60.75},
      points={{-7.5,-3.25},{1.5,-3.25},{1.5,3.25},{4.5,3.25}},
      color={0,0,127}));
  connect(product1.y, add1.u1) annotation (Line(
      visible=true,
      origin={-56.5,79.6578},
      points={{-7.5,3.6578},{1.5,3.6578},{1.5,-3.6578},{4.5,-3.6578}},
      color={0,0,127}));
  connect(iqin, product2.u1)
    annotation (Line(
      visible=true,
      origin={-102.8,54.8073},
      points={{-57.2,-12.3073},{12.8,-12.3073},{12.8,7.9609},{15.8,7.9609},{15.8,8.6927}},
      color={0,0,127}));
  connect(iqin, product2.u2) annotation (Line(
      visible=true,
      origin={-106.75,47.0},
      points={{-53.25,-4.5},{16.75,-4.5},{16.75,4.5},{19.75,4.5}},
      color={0,0,127}));
  connect(const.y, product1.u2) annotation (Line(
      visible=true,
      origin={-101.5,86.1578},
      points={{-27.5,8.8422},{6.5,8.8422},{6.5,-8.8422},{14.5,-8.8422}},
      color={0,0,127}));
  connect(const.y, product1.u1) annotation (Line(
      visible=true,
      origin={-99.0,92.1578},
      points={{-30,2.8422},{9,2.8422},{9,-2.8422},{12,-2.8422}},
      color={0,0,127}));
  annotation (Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={5,5})), Documentation(info="<html>
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
end CurrentLimitdeadband;
