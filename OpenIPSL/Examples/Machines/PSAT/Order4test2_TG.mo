within OpenIPSL.Examples.Machines.PSAT;
model Order4test2_TG
  extends OpenIPSL.Examples.BaseTest;
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Controls.PSAT.TG.TGtypeII TGtypeII1 annotation (Placement(visible=true, transformation(
        origin={-72.5,-7.5},
        extent={{-12.5,-12.5},{12.5,12.5}},
        rotation=0)));
  OpenIPSL.Electrical.Machines.PSAT.Order4 Generator(
    V_b=200,
    V_0=1,
    angle_0=0,
    ra=0.001,
    xd1=0.302,
    M=10,
    D=0,
    Sn=370,
    Vn=200,
    P_0=16.0352698692006,
    Q_0=11.859436505981) annotation (Placement(transformation(extent={{-40,-15},{-10,15}})));
equation
  connect(Generator.p, bus.p) annotation (Line(points={{-8.5,0.07446},{-4.25,0.07446},{-4.25,0},{0,0}}, color={0,0,255}));
  connect(TGtypeII1.pm, Generator.pm) annotation (Line(points={{-58.75,-7.5},{-49.375,-7.5},{-40,-7.5}}, color={0,0,127}));
  connect(Generator.pm0, TGtypeII1.pm0) annotation (Line(points={{-37,-16.5},{-37,-25},{-50,-25},{-50,15},{-72.5,15},{-72.5,7.5}}, color={0,0,127}));
  connect(Generator.vf0, Generator.vf) annotation (Line(points={{-37,16.5},{-37,20},{-45,20},{-45,7.5},{-40,7.5}}, color={0,0,127}));
  connect(TGtypeII1.W, Generator.w) annotation (Line(points={{-87.5,-7.5},{-95,-7.5},{-95,25},{-5,25},{-5,13.5},{-8.5,13.5}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={1,1})),
    Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>OpenIPSL:</p>
<p>Copyright 2016 SmarTS Lab (Sweden)</p>
<ul>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>

<p></p>
<p>iPSL:</p>
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
</html>
"),
    Icon(coordinateSystem(extent={{-100,-50},{100,100}})));
end Order4test2_TG;

