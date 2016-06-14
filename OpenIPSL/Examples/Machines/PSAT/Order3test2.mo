within OpenIPSL.Examples.Machines.PSAT;
model Order3test2

  extends OpenIPSL.Examples.BaseTest;
  extends Modelica.Icons.Example;

  OpenIPSL.Electrical.Machines.PSAT.Order3 order31(
    V_b=400,
    V_0=1,
    angle_0=0,
    Sn=20,
    Vn=400,
    ra=0.01,
    xd1=0.302,
    M=10,
    D=0,
    xd=1.9,
    Td10=8,
    xq=1.7,
    P_0=16.0352698692006,
    Q_0=11.859436505981) annotation (Placement(visible=true, transformation(
        origin={-25,0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
equation

  connect(order31.vf, order31.vf0) annotation (Line(points={{-35,5},{-40,5},{-40,15},{-33,15},{-33,11}}, color={0,0,127}));
  connect(order31.pm, order31.pm0) annotation (Line(points={{-35,-5},{-40,-5},{-40,-15},{-33,-15},{-33,-11}}, color={0,0,127}));
  connect(order31.p, bus.p) annotation (Line(points={{-14,0.04964},{-7,0.04964},{-7,0},{0,0}}, color={0,0,255}));

  annotation (
    Diagram(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={2,2})),
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
        grid={2,2},
        initialScale=0.1)));
end Order3test2;
