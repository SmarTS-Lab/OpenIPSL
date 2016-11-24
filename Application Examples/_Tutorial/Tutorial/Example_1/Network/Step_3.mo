within Tutorial.Example_1.Network;


partial model Step_3
  OpenIPSL.Electrical.Buses.Bus B1 annotation (Placement(transformation(extent={{-92,-12},{-68,12}})));
  OpenIPSL.Electrical.Buses.Bus B2 annotation (Placement(transformation(extent={{-32,-12},{-8,12}})));
  OpenIPSL.Electrical.Buses.Bus B3 annotation (Placement(transformation(extent={{48,-12},{72,12}})));
  Generator.Generator G1 annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer(
    Sn=2220,
    fn=60,
    x=0.15,
    r=0,
    V_b=400,
    Vn=400) annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine(
    R=0,
    G=0,
    B=0,
    X=0.5*100/2220,
    S_b=100) annotation (Placement(transformation(extent={{14,16},{26,24}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    R=0,
    G=0,
    B=0,
    S_b=100,
    X=0.93*100/2220) annotation (Placement(transformation(extent={{14,-24},{26,-16}})));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(V_0=0.90081, angle_0=0)
    annotation (Placement(visible=true, transformation(
        origin={90,0},
        extent={{10,10},{-10,-10}},
        rotation=180)));
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=100, fn=60)
    annotation (Placement(visible=true, transformation(
        origin={73.3331,-80},
        extent={{-33.3331,-20},{46.6669,20}},
        rotation=0)));
  annotation (
    Icon(coordinateSystem(extent={{-140,-100},{120,100}})),
    Diagram(coordinateSystem(
        extent={{-140,-100},{120,100}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={2,2}), graphics={Text(
          fillPattern=FillPattern.Solid,
          lineThickness=1,
          extent={{-106,102},{84,84}},
          textString="Step 3: Adding infinite bus model",
          fontSize=15,
          textStyle={TextStyle.Bold}),Rectangle(
          lineColor={255,0,0},
          lineThickness=1,
          extent={{78,14},{102,-12}}),Text(
          origin={-16,-2},
          fillPattern=FillPattern.Solid,
          lineThickness=1,
          extent={{62,24},{146,14}},
          textString="Electrical.Buses.InfiniteBus",
          fontSize=12)}),
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
"));
end Step_3;
