within iPSL.Examples.Wind;
model TestforWTv07_CDV_wApp "Developed by DTU"
  Modelica.Blocks.Sources.Constant imSetPoint1(k=0.9) annotation (Placement(transformation(extent={{-108,-44},{-88,-24}})));
  Modelica.Blocks.Sources.Constant imSetPoint5(k=1) annotation (Placement(transformation(extent={{-106,-20},{-94,-8}})));
  Modelica.Blocks.Sources.Constant imSetPoint6(k=0) annotation (Placement(transformation(extent={{-106,-30},{-86,-10}})));
  iPSL.Electrical.Buses.InfiniteBus2 infiniteBus(angle=0) annotation (Placement(transformation(extent={{34,-31},{14,-11}})));
  iPSL.Electrical.Wind.DTU.Type4B_WT_CDV type4B_WT_CDV annotation (Placement(transformation(extent={{-74,-50},{-4,6}})));
  Modelica.Blocks.Sources.Constant imSetPoint2(k=1) annotation (Placement(transformation(extent={{6,-52},{26,-32}})));
  Modelica.Blocks.Sources.Step step1(
    offset=0,
    height=-0.5,
    startTime=1) annotation (Placement(transformation(extent={{0,-72},{16,-56}})));
  Modelica.Blocks.Sources.Step step2(
    offset=0,
    height=0.5,
    startTime=2) annotation (Placement(transformation(extent={{0,-98},{16,-82}})));
  Modelica.Blocks.Math.Add3 add3_1 annotation (Placement(transformation(extent={{40,-60},{60,-40}})));
equation
  connect(imSetPoint5.y, type4B_WT_CDV.Uref) annotation (Line(
      points={{-93.4,-14},{-78,-14},{-78,-10.8},{-66.7941,-10.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSetPoint6.y, type4B_WT_CDV.Qref) annotation (Line(
      points={{-85,-20},{-78,-20},{-78,-22},{-66.7941,-22}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(infiniteBus.p, type4B_WT_CDV.WTG_terminal) annotation (Line(
      points={{13,-21},{2,-21},{2,-22},{-7.08824,-22}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(imSetPoint1.y, type4B_WT_CDV.Pref) annotation (Line(
      points={{-87,-34},{-78,-34},{-78,-33.2},{-66.7941,-33.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSetPoint2.y, add3_1.u1) annotation (Line(points={{27,-42},{38,-42},{38,-42}}, color={0,0,127}));
  connect(step1.y, add3_1.u2) annotation (Line(points={{16.8,-64},{30,-64},{30,-50},{38,-50}}, color={0,0,127}));
  connect(step2.y, add3_1.u3) annotation (Line(points={{16.8,-90},{34,-90},{34,-58},{38,-58}}, color={0,0,127}));
  connect(add3_1.y, infiniteBus.V) annotation (Line(points={{61,-50},{68,-50},{68,-48},{68,-21},{35,-21}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-220,-160},{160,100}}, preserveAspectRatio=false)),
    Icon(coordinateSystem(extent={{-220,-160},{160,100}})),
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
end TestforWTv07_CDV_wApp;
