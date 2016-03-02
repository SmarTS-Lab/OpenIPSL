within TwoAreas;
model Two_Areas_PSSE

  parameter Real r=0.0001;
  parameter Real x=0.001;
  parameter Real b=0.00175*0.5;
  iPSL.Electrical.Buses.Bus bus1 annotation (Placement(transformation(extent={{-190,20},{-170,40}})));
  iPSL.Electrical.Buses.Bus bus2 annotation (Placement(transformation(extent={{-190,-20},{-170,0}})));
  iPSL.Electrical.Buses.Bus bus3 annotation (Placement(transformation(extent={{170,20},{190,40}})));
  iPSL.Electrical.Buses.Bus bus4 annotation (Placement(transformation(extent={{170,-20},{190,0}})));
  iPSL.Electrical.Buses.Bus bus5 annotation (Placement(transformation(extent={{-150,20},{-130,40}})));
  iPSL.Electrical.Buses.Bus bus6 annotation (Placement(transformation(extent={{-110,20},{-90,40}})));
  iPSL.Electrical.Buses.Bus bus7 annotation (Placement(transformation(extent={{-70,20},{-50,40}})));
  iPSL.Electrical.Buses.Bus bus8 annotation (Placement(transformation(extent={{-10,20},{10,40}})));
  iPSL.Electrical.Buses.Bus bus9 annotation (Placement(transformation(extent={{50,20},{70,40}})));
  iPSL.Electrical.Buses.Bus bus10 annotation (Placement(transformation(extent={{90,20},{110,40}})));
  iPSL.Electrical.Buses.Bus bus11 annotation (Placement(transformation(extent={{130,20},{150,40}})));
  TwoAreas.Groups.PSSE.No_Controls.G1 g1(
    V_0=1.03,
    angle_0=20.27066,
    P_0=700,
    Q_0=185.0296) annotation (Placement(transformation(extent={{-214,24},{-202,36}})));
  TwoAreas.Groups.PSSE.No_Controls.G2 g2(
    V_0=1.01,
    angle_0=10.50628,
    P_0=700,
    Q_0=234.6113) annotation (Placement(transformation(extent={{-214,-16},{-202,-4}})));
  TwoAreas.Groups.PSSE.No_Controls.G3 g3(
    V_0=1.03,
    angle_0=-6.8,
    P_0=719.0941,
    Q_0=176.0262) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={208,30})));
  TwoAreas.Groups.PSSE.No_Controls.G4 g4(
    V_0=1.01,
    angle_0=-16.9921,
    P_0=700,
    Q_0=202.0827) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={208,-10})));

  iPSL.Electrical.Branches.PwLine Line6_7(
    R=r*10,
    X=x*10,
    G=0,
    B=b*10) annotation (Placement(transformation(extent={{-90,20},{-70,40}})));
  iPSL.Electrical.Branches.PwLine Line5_6(
    R=r*25,
    X=x*25,
    G=0,
    B=b*25) annotation (Placement(transformation(extent={{-130,20},{-110,40}})));

  iPSL.Electrical.Branches.PwLine Line7_8_1(
    R=r*110,
    X=x*110,
    G=0,
    B=b*110) annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
  iPSL.Electrical.Branches.PwLine Line7_8_2(
    R=r*110,
    X=x*110,
    G=0,
    B=b*110) annotation (Placement(transformation(extent={{-40,10},{-20,30}})));
  iPSL.Electrical.Branches.PwLine Line8_9_2(
    R=r*110,
    X=x*110,
    G=0,
    B=b*110) annotation (Placement(transformation(extent={{20,10},{40,30}})));
  iPSL.Electrical.Branches.PwLine Line8_9_1(
    R=r*110,
    X=x*110,
    G=0,
    B=b*110) annotation (Placement(transformation(extent={{20,30},{40,50}})));

  iPSL.Electrical.Branches.PwLine Line9_10(
    R=r*10,
    X=x*10,
    G=0,
    B=b*10) annotation (Placement(transformation(extent={{70,20},{90,40}})));

  iPSL.Electrical.Branches.PwLine Line10_11(
    R=r*25,
    X=x*25,
    G=0,
    B=b*25) annotation (Placement(transformation(extent={{110,20},{130,40}})));

  iPSL.Electrical.Events.PwFault pwFault(
    X=0,
    R=0,
    t1=3,
    t2=3.2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={2,-16})));

  iPSL.Electrical.Loads.PSSE.Load Load7(
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    PQBRAK=0.7,
    V_0=0.9610106,
    angle_0=-4.68651,
    S_p(re=9.67, im=(100 - 184.7)/100)) annotation (Placement(transformation(extent={{-70,-12},{-58,0}})));
  iPSL.Electrical.Loads.PSSE.Load Load9(
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    PQBRAK=0.7,
    V_0=0.9713628,
    angle_0=-32.15403,
    S_p(re=17.67, im=(100 - 330.2)/100)) annotation (Placement(transformation(extent={{72,-12},{60,0}})));
  iPSL.Electrical.Branches.PwLine Line5_1(
    G=0,
    R=0,
    X=0.01667,
    B=0) annotation (Placement(transformation(extent={{-170,20},{-150,40}})));
  iPSL.Electrical.Branches.PwLine Line5_2(
    G=0,
    R=0,
    X=0.01667,
    B=0) annotation (Placement(transformation(extent={{-170,-20},{-150,0}})));
  iPSL.Electrical.Branches.PwLine Line5_3(
    G=0,
    R=0,
    X=0.01667,
    B=0) annotation (Placement(transformation(extent={{150,20},{170,40}})));
  iPSL.Electrical.Branches.PwLine Line5_4(
    G=0,
    R=0,
    X=0.01667,
    B=0) annotation (Placement(transformation(extent={{150,-20},{170,0}})));
  inner iPSL.Electrical.SystemBase SysData(fn=60) annotation (Placement(transformation(extent={{-220,48},{-172,62}})));
equation
  connect(g1.pwPin, bus1.p) annotation (Line(points={{-201,30},{-190.5,30},{-180,30}}, color={0,0,255}));
  connect(g2.pwPin, bus2.p) annotation (Line(points={{-201,-10},{-190.5,-10},{-180,-10}}, color={0,0,255}));
  connect(Line6_7.n, bus7.p) annotation (Line(points={{-73,30},{-66.5,30},{-60,30}}, color={0,0,255}));
  connect(Line6_7.p, bus6.p) annotation (Line(points={{-87,30},{-93.5,30},{-100,30}}, color={0,0,255}));
  connect(Line5_6.n, bus6.p) annotation (Line(points={{-113,30},{-106.5,30},{-100,30}}, color={0,0,255}));
  connect(Line5_6.p, bus5.p) annotation (Line(points={{-127,30},{-133.5,30},{-140,30}}, color={0,0,255}));
  connect(Line8_9_2.n, bus9.p) annotation (Line(points={{37,20},{54,20},{54,30},{60,30}}, color={0,0,255}));
  connect(Line8_9_1.n, bus9.p) annotation (Line(points={{37,40},{54,40},{54,30},{60,30}}, color={0,0,255}));
  connect(Line8_9_2.p, bus8.p) annotation (Line(points={{23,20},{6,20},{6,30},{0,30}}, color={0,0,255}));
  connect(Line8_9_1.p, bus8.p) annotation (Line(points={{23,40},{6,40},{6,30},{0,30}}, color={0,0,255}));
  connect(Line7_8_2.n, bus8.p) annotation (Line(points={{-23,20},{-6,20},{-6,22},{-6,30},{0,30}}, color={0,0,255}));
  connect(Line7_8_1.n, bus8.p) annotation (Line(points={{-23,40},{-6,40},{-6,30},{0,30}}, color={0,0,255}));
  connect(Line7_8_1.p, bus7.p) annotation (Line(points={{-37,40},{-54,40},{-54,30},{-60,30}}, color={0,0,255}));
  connect(Line7_8_2.p, bus7.p) annotation (Line(points={{-37,20},{-54,20},{-54,30},{-60,30}}, color={0,0,255}));
  connect(bus9.p, Line9_10.p) annotation (Line(points={{60,30},{73,30}}, color={0,0,255}));
  connect(Line9_10.n, bus10.p) annotation (Line(points={{87,30},{93.5,30},{100,30}}, color={0,0,255}));
  connect(bus10.p, Line10_11.p) annotation (Line(points={{100,30},{113,30}}, color={0,0,255}));
  connect(Line10_11.n, bus11.p) annotation (Line(points={{127,30},{133.5,30},{140,30}}, color={0,0,255}));
  connect(g4.pwPin, bus4.p) annotation (Line(points={{201,-10},{201,-10},{180,-10}}, color={0,0,255}));
  connect(g3.pwPin, bus3.p) annotation (Line(points={{201,30},{180,30}}, color={0,0,255}));
  connect(Load7.p, bus7.p) annotation (Line(points={{-64,0.6},{-64,0.6},{-64,30},{-60,30}}, color={0,0,255}));
  connect(Load9.p, Line9_10.p) annotation (Line(points={{66,0.6},{66,0.6},{66,30},{73,30}}, color={0,0,255}));
  connect(pwFault.p, bus8.p) annotation (Line(points={{2,-4.33333},{2,30},{0,30}}, color={0,0,255}));
  connect(bus1.p, Line5_1.p) annotation (Line(points={{-180,30},{-174,30},{-167,30}}, color={0,0,255}));
  connect(bus5.p, Line5_1.n) annotation (Line(points={{-140,30},{-146,30},{-153,30}}, color={0,0,255}));
  connect(bus2.p, Line5_2.p) annotation (Line(points={{-180,-10},{-174,-10},{-167,-10}}, color={0,0,255}));
  connect(Line5_2.n, bus6.p) annotation (Line(points={{-153,-10},{-104,-10},{-104,30},{-100,30}}, color={0,0,255}));
  connect(bus11.p, Line5_3.p) annotation (Line(points={{140,30},{153,30}}, color={0,0,255}));
  connect(Line5_3.n, bus3.p) annotation (Line(points={{167,30},{173.5,30},{180,30}}, color={0,0,255}));
  connect(bus4.p, Line5_4.n) annotation (Line(points={{180,-10},{167,-10}}, color={0,0,255}));
  connect(Line5_4.p, Line10_11.p) annotation (Line(points={{153,-10},{104,-10},{104,30},{113,30}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-220,-40},{220,60}}), graphics={Text(
          extent={{-70,-30},{52,-38}},
          lineColor={28,108,200},
          textString="Two-Area System
Prabha Kundur, \"Power System Stability and Control\", Example 12.6, page 813")}),
    Icon(coordinateSystem(extent={{-220,-40},{220,60}})),
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
<td>Klein-Rogers-Kundur power network</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-12-01</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Maxime Baudette, Tin Rabuzin, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"),
    experiment(StopTime=10, Tolerance=0.001));
end Two_Areas_PSSE;
