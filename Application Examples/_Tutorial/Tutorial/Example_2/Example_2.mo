within Tutorial.Example_2;


model Example_2
  OpenIPSL.Electrical.Buses.Bus B1 annotation (Placement(transformation(extent={{-92,-12},{-68,12}})));
  OpenIPSL.Electrical.Buses.Bus B2 annotation (Placement(transformation(extent={{-32,-12},{-8,12}})));
  OpenIPSL.Electrical.Buses.Bus B3 annotation (Placement(transformation(extent={{48,-12},{72,12}})));
  Tutorial.Example_2.Generator.Generator G1(
    angle_0=0.494677176989154,
    V_b=400,
    V_0=1,
    P_0=1997.9999999936396,
    Q_0=967.9249699065775) annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer Transformer(
    Sn=2220,
    x=0.15,
    r=0,
    V_b=400,
    Vn=400) annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  OpenIPSL.Electrical.Branches.PwLine Line_1(
    R=0,
    G=0,
    B=0,
    X=0.022522522522523,
    S_b=100) annotation (Placement(transformation(extent={{10,10},{30,30}})));
  OpenIPSL.Electrical.Buses.InfiniteBus infinite_bus(
    V_0=0.90081,
    P_0=-1998,
    Q_0=87.066) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={90,0})));
  OpenIPSL.Electrical.Events.PwFault Fault(
    R=0,
    t1=0.5,
    t2=0.57,
    X=0.0004504504504504504) annotation (Placement(transformation(extent={{0,-60},{20,-40}})));
  OpenIPSL.Electrical.Branches.PwLine Line_2(
    R=0,
    G=0,
    B=0,
    S_b=100,
    X=0.041891891891892) annotation (Placement(transformation(extent={{10,-30},{30,-10}})));
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=100, fn=60) annotation (Placement(transformation(extent={{60,-100},{120,-60}})));
equation
  connect(G1.pwPin, B1.p) annotation (Line(points={{-99,0},{-99,0},{-80,0}}, color={0,0,255}));
  connect(B1.p, Transformer.p) annotation (Line(points={{-80,0},{-70,0},{-61,0}}, color={0,0,255}));
  connect(Transformer.n, B2.p) annotation (Line(points={{-39,0},{-20,0}}, color={0,0,255}));
  connect(B2.p, Line_1.p) annotation (Line(points={{-20,0},{-14,0},{-14,0},{-10,0},{-10,20},{8.33333,20}}, color={0,0,255}));
  connect(Fault.p, Line_1.p) annotation (Line(points={{-1.66667,-50},{-14,-50},{-14,0},{-10,0},{-10,20},{8.33333,20}}, color={0,0,255}));
  connect(Line_2.p, Line_1.p) annotation (Line(points={{8.33333,-20},{-10,-20},{-10,20},{8.33333,20}}, color={0,0,255}));
  connect(B3.p, infinite_bus.p) annotation (Line(points={{60,0},{70,0},{79,0},{79,1.38778e-015}}, color={0,0,255}));
  connect(B3.p, Line_1.n) annotation (Line(points={{60,0},{56,0},{56,0},{50,0},{50,20},{31.6667,20}}, color={0,0,255}));
  connect(Line_2.n, Line_1.n) annotation (Line(points={{31.6667,-20},{50,-20},{50,20},{31.6667,20}}, color={0,0,255}));
  annotation (
    Icon(coordinateSystem(extent={{-140,-100},{120,100}})),
    Diagram(coordinateSystem(
        extent={{-140,-100},{120,100}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={2,2}), graphics={Text(
          fillPattern=FillPattern.Solid,
          lineThickness=1,
          extent={{-120,100},{100,80}},
          fontSize=15,
          textStyle={TextStyle.Bold},
          textString="Example 2: Single-machine infinite bus model with the PSS*",
          lineColor={0,0,0}),Text(
          fillPattern=FillPattern.Solid,
          lineThickness=1,
          extent={{-170,-88},{48,-106}},
          textString="*P. Kundur, \"Power System Stability and Control\", Example 13.2",
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
end Example_2;
