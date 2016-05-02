within OpenIPSL.Examples.Machines.PSAT;
model Order3test2_TG

  extends OpenIPSL.Examples.BaseTest;
  extends Modelica.Icons.Example;

  OpenIPSL.Electrical.Machines.PSAT.Order3 order3_Inputs_Outputs1(
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
        origin={-32.3443,-0.375601},
        extent={{-11.6557,-11.6244},{11.6556,11.6244}},
        rotation=0)));
  OpenIPSL.Electrical.Controls.PSAT.TG.TGtypeII TGtypeII1 annotation (Placement(visible=true, transformation(
        origin={-64,-6},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation

  connect(TGtypeII1.pm, order3_Inputs_Outputs1.pm) annotation (Line(points={{-53,-6},{-50,-6},{-50,-6.1878},{-44,-6.1878}}, color={0,0,127}));
  connect(order3_Inputs_Outputs1.vf0, order3_Inputs_Outputs1.vf) annotation (Line(points={{-41.6689,12.4112},{-41.6689,16},{-48,16},{-48,6},{-48,5.4366},{-44,5.4366}}, color={0,0,127}));
  connect(order3_Inputs_Outputs1.pm0, TGtypeII1.pm0) annotation (Line(points={{-41.6689,-13.1624},{-41.6689,-28},{-42,-28},{-86,-28},{-86,10},{-64,10},{-64,6}}, color={0,0,127}));
  connect(order3_Inputs_Outputs1.w, TGtypeII1.W) annotation (Line(points={{-19.5231,10.0864},{-16,10.0864},{-16,20},{-80,20},{-80,-6},{-76,-6}}, color={0,0,127}));
  connect(order3_Inputs_Outputs1.p, bus.p) annotation (Line(points={{-19.5231,-0.317897},{-9.76155,-0.317897},{-9.76155,0},{0,0}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=true,
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
    Icon(coordinateSystem(grid={2,2}, initialScale=0.1)));
end Order3test2_TG;
