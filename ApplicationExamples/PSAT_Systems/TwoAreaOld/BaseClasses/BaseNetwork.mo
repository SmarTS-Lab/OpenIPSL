within PSAT_Systems.TwoAreaOld.BaseClasses;

partial model BaseNetwork
  OpenIPSL.Electrical.Buses.Bus bus1 annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
  OpenIPSL.Electrical.Buses.Bus bus2 annotation (Placement(transformation(extent={{70,-10},{90,10}})));
  OpenIPSL.Electrical.Buses.Bus bus3 annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  OpenIPSL.Electrical.Buses.Bus bus4 annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  OpenIPSL.Electrical.Buses.Bus bus5 annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  OpenIPSL.Electrical.Branches.PwLine line_1_4(
    R=0,
    X=0.05,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-66,-4},{-54,4}})));
  OpenIPSL.Electrical.Branches.PwLine line_4_3(
    R=0,
    X=0.05,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-26,-4},{-14,4}})));
  OpenIPSL.Electrical.Branches.PwLine line_3_5(
    R=0,
    X=0.05,
    G=0,
    B=0) annotation (Placement(transformation(extent={{14,-4},{26,4}})));
  OpenIPSL.Electrical.Branches.PwLine line_5_2(
    R=0,
    X=0.05,
    G=0,
    B=0) annotation (Placement(transformation(extent={{54,-4},{66,4}})));
  OpenIPSL.Electrical.Events.PwFault pwFault(
    R=0.15,
    X=0,
    t1=2,
    t2=2.1) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={5,-25})));
  OpenIPSL.Electrical.Machines.PSAT.Order2 order2(
    Sn=991,
    V_0=1.081,
    ra=0,
    xd1=0.01,
    M=6,
    V_b=20,
    Vn=20,
    D=0,
    angle_0=0,
    P_0=-90.0000000000001,
    Q_0=23.9371894974117) annotation (Placement(transformation(extent={{120,-10},{100,10}})));
  inner OpenIPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{-160,60},{-100,80}})));
equation
  connect(bus1.p, line_1_4.p) annotation (Line(
      points={{-80,0},{-67,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(line_1_4.n, bus4.p) annotation (Line(
      points={{-53,0},{-40,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus4.p, line_4_3.p) annotation (Line(
      points={{-40,0},{-27,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus3.p, line_4_3.n) annotation (Line(
      points={{0,0},{-13,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus3.p, line_3_5.p) annotation (Line(
      points={{0,0},{13,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(line_3_5.n, bus5.p) annotation (Line(
      points={{27,0},{40,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus5.p, line_5_2.p) annotation (Line(
      points={{40,0},{53,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(line_5_2.n, bus2.p) annotation (Line(
      points={{67,0},{80,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwFault.p, line_3_5.p) annotation (Line(points={{5,-19.1667},{5,0},{13,0}}, color={0,0,255}));
  connect(order2.p, bus2.p) annotation (Line(points={{99,0.04964},{89.5,0.04964},{89.5,0},{80,0}}, color={0,0,255}));
  connect(order2.vf, order2.vf0) annotation (Line(points={{120,5},{122,5},{122,14},{118,14},{118,11}}, color={0,0,127}));
  connect(order2.pm, order2.pm0) annotation (Line(points={{120,-5},{122,-5},{122,-6},{122,-14},{118,-14},{118,-11}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-160,-80},{160,80}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-160,-80},{160,80}})),
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
", info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p></p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>Tin Rabuzin, May 2016</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Yuwa Chompoobutrgool, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end BaseNetwork;
