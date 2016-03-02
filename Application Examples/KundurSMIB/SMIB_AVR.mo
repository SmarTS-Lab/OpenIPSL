within KundurSMIB;
model SMIB_AVR
  import Modelica.Constants.pi;
  iPSL.Electrical.Buses.Bus B1 annotation (Placement(transformation(extent={{-92,-12},{-68,12}})));
  iPSL.Electrical.Buses.Bus B2 annotation (Placement(transformation(extent={{-32,-12},{-8,12}})));
  iPSL.Electrical.Buses.Bus B3 annotation (Placement(transformation(extent={{48,-12},{72,12}})));
  Generation_Groups.Generator_AVR G1(
    V_0=1,
    P_0=0.899999999997135*S_b,
    Q_0=0.436002238696658*S_b,
    angle_0=0.494677176989155*180/pi) annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  iPSL.Electrical.Branches.PSAT.TwoWindingTransformer transformer(
    Sn=2220,
    x=0.15,
    r=0,
    V_b=400,
    Vn=400) annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  iPSL.Electrical.Branches.PwLine line_1(
    R=0,
    G=0,
    B=0,
    X=0.5,
    opening=1) annotation (Placement(transformation(extent={{10,14},{28,26}})));
  iPSL.Electrical.Buses.InfiniteBus infinite_bus(angle_0=0, V_0=0.900810000000000) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={110,0})));
  iPSL.Electrical.Events.PwFault fault(
    R=0,
    t1=0.5,
    t2=0.57,
    X=1e-5) annotation (Placement(transformation(extent={{0,-60},{20,-40}})));
  iPSL.Electrical.Branches.PwLine line_2(
    R=0,
    G=0,
    B=0,
    X=0.93,
    t1=0.57,
    t2=100,
    opening=1) annotation (Placement(transformation(extent={{10,-26},{28,-14}})));
  inner iPSL.Electrical.SystemBase SysData(S_b=2220, fn=60) annotation (Placement(transformation(extent={{-140,80},{-86,100}})));
protected
  parameter Real S_b=SysData.S_b;
equation
  connect(G1.pwPin, B1.p) annotation (Line(points={{-99,0},{-80,0}}, color={0,0,255}));
  connect(B1.p, transformer.p) annotation (Line(points={{-80,0},{-70,0},{-61,0}}, color={0,0,255}));
  connect(transformer.n, B2.p) annotation (Line(points={{-39,0},{-20,0}}, color={0,0,255}));
  connect(B2.p, line_1.p) annotation (Line(points={{-20,0},{-14,0},{-10,0},{-10,20},{8.5,20}}, color={0,0,255}));
  connect(line_1.n, B3.p) annotation (Line(points={{29.5,20},{50,20},{50,0},{60,0}}, color={0,0,255}));
  connect(B3.p, infinite_bus.p) annotation (Line(points={{60,0},{99,0}}, color={0,0,255}));
  connect(fault.p, line_1.p) annotation (Line(points={{-1.66667,-50},{-14,-50},{-14,0},{-10,0},{-10,20},{8.5,20}}, color={0,0,255}));
  connect(line_2.n, B3.p) annotation (Line(points={{29.5,-20},{50,-20},{50,0},{60,0}}, color={0,0,255}));
  connect(line_2.p, line_1.p) annotation (Line(points={{8.5,-20},{-10,-20},{-10,20},{8.5,20}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(extent={{-140,-100},{120,100}}, preserveAspectRatio=false), graphics={Text(
          extent={{-110,80},{110,60}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Solid,
          fontSize=15,
          textStyle={TextStyle.Bold},
          textString="Example 1: Single-machine infinite bus model*
(AVR)"), Text(
          extent={{-164,-88},{54,-106}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Solid,
          fontSize=12,
          textString="*P. Kundur, \"Power System Stability and Control\", Example 13.2")}),
    Icon(coordinateSystem(extent={{-140,-100},{120,100}})),
    experiment(
      StopTime=10,
      Interval=0.0001,
      Tolerance=1e-006,
      __Dymola_fixedstepsize=0.0001,
      __Dymola_Algorithm="Rkfix2"),
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
</html>", info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>SMIB PSAT, d_kundur2.mdl, PSAT</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>February 2016</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Maxime Baudette, Ahsan Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end SMIB_AVR;
