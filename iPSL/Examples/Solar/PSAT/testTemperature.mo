within iPSL.Examples.Solar.PSAT;
model testTemperature

  Modelica.Blocks.Sources.Constant const(k=1000)
    annotation (Placement(visible=true, transformation(
        origin={-49.8987,15.1013},
        extent={{-4.8987,-4.8987},{4.8987,4.8987}},
        rotation=0)));
  Modelica.Blocks.Sources.Constant const1(k=25) annotation (Placement(visible=true, transformation(
        origin={-70,-5},
        extent={{-5.00005,-5},{4.99998,5}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine13(
    B=0,
    G=0,
    R=0,
    X=0.04*1/0.63) annotation (Placement(visible=true, transformation(
        origin={15.0188,0.0012},
        extent={{-5.9812,-3.9988},{5.9812,3.9988}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine14(
    B=0.001884956/2*100,
    G=0,
    R=0,
    X=0.848230016469244/100) annotation (Placement(visible=true, transformation(
        origin={50.0889,10.2251},
        extent={{-5.9111,-3.77495},{5.9111,3.77495}},
        rotation=0)));
  iPSL.Electrical.Buses.InfiniteBus infiniteBus8(angle_0=0, V_0=1,
    Q_0=0,
    P_0=1)
    annotation (Placement(visible=true, transformation(
        origin={88.987,-0.1504},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine15(
    B=0.001884956/2*100,
    G=0,
    R=0,
    X=0.848230016469244/100) annotation (Placement(visible=true, transformation(
        origin={50.1376,-9.7749},
        extent={{-5.86241,-3.7749},{5.86242,3.7749}},
        rotation=0)));
  Modelica.Blocks.Math.Add add1 annotation (Placement(visible=true, transformation(
        origin={-50,-15},
        extent={{-5,-5},{5,5}},
        rotation=0)));
  Modelica.Blocks.Sources.Step step1(startTime=0.3, height=15)
    annotation (Placement(visible=true, transformation(
        origin={-90.0002,-15.2156},
        extent={{-5.0002,-5.2156},{5.0002,5.2156}},
        rotation=0)));
  Modelica.Blocks.Sources.Step step2(startTime=0.7, height=-15)
    annotation (Placement(visible=true, transformation(
        origin={-90,-35},
        extent={{-5,-5},{5,5}},
        rotation=0)));
  Modelica.Blocks.Math.Add add2 annotation (Placement(visible=true, transformation(
        origin={-70,-25},
        extent={{-4.99999,-5},{4.99999,4.99998}},
        rotation=0)));
  iPSL.Electrical.Solar.KTH.PFmodelmpptCorrected05MW PFmodel1(
    anglev0=0.030372922116265,
    p0=0.44884,
    q0=0.00003,
    v0=1.0003436) annotation (Placement(visible=true, transformation(
        origin={-19.9875,0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  inner iPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{-100,80},
            {-50,100}})));
  Electrical.Buses.Bus      bus1 annotation (Placement(visible=true, transformation(
        origin={0.4579,0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Electrical.Buses.Bus      bus2 annotation (Placement(visible=true, transformation(
        origin={30.4579,0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Electrical.Buses.Bus      bus3 annotation (Placement(visible=true, transformation(
        origin={70.4579,0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
equation
  connect(const1.y, add1.u1) annotation (Line(
      visible=true,
      origin={-63.3155,-9.4113},
      points={{-1.18452,4.4113},{3.3154,4.4113},{3.3154,-2.5887},{7.3155,
          -2.5887}},
      color={0,0,127}));
  connect(bus1.p, pwLine13.p) annotation (Line(points={{0.4579,0},{8.04073,0},{
          8.04073,0.0012}}, color={0,0,255}));
  connect(pwLine13.n, bus2.p) annotation (Line(points={{21.9969,0.0012},{
          25.9984,0.0012},{25.9984,0},{30.4579,0}}, color={0,0,255}));
  connect(pwLine15.p, bus2.p) annotation (Line(points={{43.2981,-9.7749},{35,
          -9.7749},{35,0},{30.4579,0}}, color={0,0,255}));
  connect(pwLine14.p, bus2.p) annotation (Line(points={{43.1926,10.2251},{35,
          10.2251},{35,0},{30.4579,0}}, color={0,0,255}));
  connect(bus3.p, infiniteBus8.p) annotation (Line(points={{70.4579,0},{77.987,
          0},{77.987,-0.1504}}, color={0,0,255}));
  connect(pwLine14.n, bus3.p) annotation (Line(points={{56.9852,10.2251},{66,
          10.2251},{66,0},{70.4579,0}}, color={0,0,255}));
  connect(pwLine15.n, bus3.p) annotation (Line(points={{56.9771,-9.7749},{66,
          -9.7749},{66,0},{70.4579,0}}, color={0,0,255}));
  connect(add1.y, PFmodel1.T) annotation (Line(points={{-44.5,-15},{-44.5,-15},
          {-40,-15},{-40,-5},{-31.9875,-5}}, color={0,0,127}));
  connect(const.y, PFmodel1.E) annotation (Line(points={{-44.5101,15.1013},{-40,
          15.1013},{-40,5},{-31.9875,5}}, color={0,0,127}));
  connect(add2.y, add1.u2) annotation (Line(points={{-64.5,-25},{-60,-25},{-60,
          -18},{-56,-18}}, color={0,0,127}));
  connect(step1.y, add2.u1) annotation (Line(points={{-84.5,-15.2156},{-81,
          -15.2156},{-81,-22},{-76,-22}}, color={0,0,127}));
  connect(step2.y, add2.u2) annotation (Line(points={{-84.5,-35},{-81,-35},{-81,
          -28},{-76,-28}}, color={0,0,127}));
  connect(PFmodel1.pwPin1, bus1.p)
    annotation (Line(points={{-8.9875,0},{0.4579,0}}, color={0,0,255}));
  annotation (Diagram(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={1,1})),          Documentation(revisions="<html>
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
    Icon(coordinateSystem(grid={1,1}, initialScale=0.1)));
end testTemperature;
