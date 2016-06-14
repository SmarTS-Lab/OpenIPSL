within OpenIPSL.Examples.Machines.PSAT;
model Order4test2

  extends OpenIPSL.Examples.BaseTest;
  extends Modelica.Icons.Example;

  OpenIPSL.Electrical.Machines.PSAT.Order4 Generator(
    Sn=100,
    Vn=20,
    V_b=400,
    V_0=1,
    angle_0=0,
    ra=0.001,
    M=10,
    D=0,
    xd1=0.302,
    P_0=16.0352698692006,
    Q_0=11.859436505981) annotation (Placement(transformation(extent={{-65,-15},{-35,15}})));
equation

  connect(Generator.vf0, Generator.vf) annotation (Line(points={{-62,16.5},{-62,20},{-70,20},{-70,7.5},{-65,7.5}}, color={0,0,127}));
  connect(Generator.pm, Generator.pm0) annotation (Line(points={{-65,-7.5},{-70,-7.5},{-70,-10},{-70,-20},{-62,-20},{-62,-16.5}}, color={0,0,127}));
  connect(Generator.p, bus.p) annotation (Line(points={{-33.5,0.07446},{-16.75,0.07446},{-16.75,0},{0,0}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={1,1})),
    experiment(StopTime=20),
    __Dymola_experimentSetupOutput,
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
</html>"),
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        grid={1,1},
        initialScale=0.1)));
end Order4test2;
