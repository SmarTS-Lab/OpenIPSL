within OpenIPSL.Examples.Machines.PSAT;
model Order4test2_AVR

  extends OpenIPSL.Examples.BaseTest;
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII AVRtypeIII1 annotation (Placement(visible=true, transformation(
        origin={-67,5},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OpenIPSL.Electrical.Machines.PSAT.Order4 order4_Inputs_Outputs(
    V_b=200,
    V_0=1,
    angle_0=0,
    Sn=370,
    Vn=200,
    ra=0.001,
    xd1=0.302,
    M=10,
    D=0,
    P_0=16.0352698692006,
    Q_0=11.859436505981) annotation (Placement(transformation(extent={{-37,-10},{-17,10}})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(extent={{-97,-4},{-87,6}})));
equation
  connect(AVRtypeIII1.vf, order4_Inputs_Outputs.vf) annotation (Line(
      points={{-56,5},{-47,5},{-47,5},{-37,5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, AVRtypeIII1.vs) annotation (Line(points={{-86.5,1},{-79,1}}, color={0,0,127}));
  connect(AVRtypeIII1.v, order4_Inputs_Outputs.v) annotation (Line(points={{-79,10},{-87,10},{-87,20},{-10,20},{-10,3},{-16,3}}, color={0,0,127}));
  connect(order4_Inputs_Outputs.pm0, order4_Inputs_Outputs.pm) annotation (Line(points={{-35,-11},{-35,-13},{-41,-13},{-41,-5},{-37,-5}}, color={0,0,127}));
  connect(order4_Inputs_Outputs.p, bus.p) annotation (Line(points={{-16,0.04964},{-8,0.04964},{-8,0},{0,0}}, color={0,0,255}));
  connect(AVRtypeIII1.vf0, order4_Inputs_Outputs.vf0) annotation (Line(points={{-67,17},{-67,23},{-35,23},{-35,11}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={1,1})),
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
end Order4test2_AVR;
