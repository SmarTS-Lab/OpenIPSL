within iPSL.Examples.Controls.PSAT.AVR;


model AVRTypeI_Test
  iPSL.Electrical.Machines.PSAT.SixthOrder.Order6 Syn1(
    Sn=991,
    V_0=1.05,
    angle_0=0.159255652433349,
    ra=0,
    xd=2,
    xd1=0.245,
    xq1=0.42,
    xd2=0.2,
    xq2=0.2,
    Td10=5,
    Tq10=0.66,
    Td20=0.031,
    Tq20=0.061,
    M=2.8756*2,
    xq=1.91,
    Taa=0.002,
    D=0,
    V_b=20,
    P_0=89.9999999999999,
    Q_0=-9.0933105025882,
    Vn=20)
         annotation (Placement(transformation(extent={{-116,-14},{-86,14}})));
  iPSL.Electrical.Buses.Bus bus1 annotation (Placement(transformation(extent={{-80,-12},{-56,12}})));
  iPSL.Electrical.Buses.Bus bus2 annotation (Placement(transformation(extent={{102,-12},{126,12}})));
  iPSL.Electrical.Buses.Bus bus3 annotation (Placement(transformation(extent={{20,-12},
            {44,12}})));
  iPSL.Electrical.Buses.Bus bus4 annotation (Placement(transformation(extent={{-22,-12},{2,12}})));
  iPSL.Electrical.Buses.Bus bus5 annotation (Placement(transformation(extent={{60,-12},
            {84,12}})));
  iPSL.Electrical.Branches.PwLine pwLine1to4(
    R=0,
    X=0.05,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-46,-4},{-34,4}})));
  iPSL.Electrical.Branches.PwLine pwLine1(
    R=0,
    X=0.05,
    G=0,
    B=0) annotation (Placement(transformation(extent={{4,-4},{16,4}})));
  iPSL.Electrical.Branches.PwLine pwLine2(
    R=0,
    X=0.05,
    G=0,
    B=0) annotation (Placement(transformation(extent={{46,-4},{58,4}})));
  iPSL.Electrical.Branches.PwLine pwLine3(
    R=0,
    X=0.05,
    G=0,
    B=0) annotation (Placement(transformation(extent={{88,-4},{100,4}})));
  iPSL.Electrical.Machines.PSAT.SecondOrder.Order2 Syn2(
    Sn=991,
    V_b=20000,
    V_0=1.081,
    ra=0,
    xd1=0.01,
    M=6,
    D=0,
    P_0=-9.00000000000001,
    Q_0=23.9371894974117,
    Vn=20)
         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={140,0})));
  Modelica.Blocks.Sources.Constant vref2(k=1.198705028536746) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-167,19})));
  iPSL.Electrical.Events.PwFault pwFault(
    R=0.15,
    X=0,
    t1=2,
    t2=2.1) annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=270,
        origin={36,-32})));
  iPSL.Electrical.Controls.PSAT.AVR.AVRTypeI aVRI(vrmax=7.57) annotation (Placement(transformation(extent={{-148,4},
            {-128,24}})));
  inner iPSL.Electrical.SystemBase SysData(S_b=100)
                                           annotation (Placement(transformation(extent={{-180,80},
            {-120,100}})));
equation
  connect(Syn1.p, bus1.p) annotation (Line(
      points={{-84.5,0.069496},{-74.5,0.069496},{-74.5,0},{-68,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus1.p, pwLine1to4.p) annotation (Line(
      points={{-68,0},{-47,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1to4.n, bus4.p) annotation (Line(
      points={{-33,0},{-10,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus4.p, pwLine1.p) annotation (Line(
      points={{-10,0},{3,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus3.p, pwLine1.n) annotation (Line(
      points={{32,0},{17,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus3.p, pwLine2.p) annotation (Line(
      points={{32,0},{45,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine2.n, bus5.p) annotation (Line(
      points={{59,0},{72,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.n, bus2.p) annotation (Line(
      points={{101,0},{114,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus2.p, Syn2.p) annotation (Line(
      points={{114,0},{122,0},{122,-0.04964},{129,-0.04964}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus3.p, pwFault.p) annotation (Line(points={{32,0},{36,0},{36,-4},{36,
          -25}},                                                                                          color={0,0,255}));
  connect(Syn1.v, aVRI.v) annotation (Line(points={{-84.5,4.2},{-74,4.2},{-74,
          -32},{-160,-32},{-160,10.4},{-150.4,10.4}},                                                                     color={0,0,127}));
  connect(pwLine3.p, bus5.p)
    annotation (Line(points={{87,0},{80,0},{72,0}}, color={0,0,255}));
  connect(Syn2.pm0, Syn2.pm) annotation (Line(points={{148,11},{148,14},{154,14},
          {154,5},{150,5}}, color={0,0,127}));
  connect(Syn2.vf, Syn2.vf0) annotation (Line(points={{150,-5},{152,-5},{152,
          -14},{148,-14},{148,-11}}, color={0,0,127}));
  connect(Syn1.pm, Syn1.pm0) annotation (Line(points={{-116,-7},{-120,-7},{-120,
          -20},{-113,-20},{-113,-15.4}}, color={0,0,127}));
  connect(vref2.y, aVRI.vref) annotation (Line(points={{-161.5,19},{-156.75,19},
          {-156.75,19.6},{-150.2,19.6}}, color={0,0,127}));
  connect(Syn1.vf, aVRI.vf) annotation (Line(points={{-116,7},{-122,7},{-122,
          14.2},{-127,14.2}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-180,-100},{160,100}}, preserveAspectRatio=false)),
    Icon(coordinateSystem(extent={{-180,-100},{160,100}})),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>15/07/2015</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad,SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>", revisions="<html>
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
</html>"));
end AVRTypeI_Test;
