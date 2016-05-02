within OpenIPSL.Examples.Machines.PSAT;
model Order6test2

  extends OpenIPSL.Examples.BaseTest;
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Machines.PSAT.Order6 order6Type2_1(
    Sn=100,
    V_0=1,
    angle_0=0,
    ra=0.001,
    xd1=0.302,
    M=10,
    D=0,
    V_b=400,
    Vn=20,
    xd=1.9,
    xq=1.7,
    xq1=0.5,
    xd2=0.204,
    xq2=0.3,
    Td10=8,
    Tq10=0.8,
    Td20=0.04,
    Tq20=0.02,
    Taa=2e-3,
    P_0=16.0352698692006,
    Q_0=11.859436505981) annotation (Placement(transformation(extent={{-61,-20},{-21,20}})));
equation
  connect(order6Type2_1.vf0, order6Type2_1.vf) annotation (Line(points={{-57,22},{-57,25},{-71,25},{-71,10},{-61,10}}, color={0,0,127}));
  connect(order6Type2_1.pm, order6Type2_1.pm0) annotation (Line(points={{-61,-10},{-71,-10},{-71,-25},{-57,-25},{-57,-22}}, color={0,0,127}));
  connect(order6Type2_1.p, bus.p) annotation (Line(points={{-19,0.09928},{-10,0.09928},{-10,0},{0,0}}, color={0,0,255}));
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
end Order6test2;
