within iPSL.Examples.Solar.PSAT;
model SolarPQtest

  iPSL.Electrical.Solar.PSAT.ConstantPQPV.PQ1 PQ11(
    P_0=0.4,
    Q_0=0.3,
    V_0=1.00018548610126,
    angle_0=-0.0000253046024029618) annotation (Placement(visible=true, transformation(
        origin={60,0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine1(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={-20,-10},
        extent={{-3,-2},{3,2}},
        rotation=0)));
  iPSL.Electrical.Events.PwFault pwFault1(
    R=20,
    X=1,
    t1=3,
    t2=3.1) annotation (Placement(visible=true, transformation(
        origin={65,-65.15},
        extent={{-5,-5.15},{5,5.15}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLinewithOpening1(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1,
    t1=8,
    t2=8.1,
    opening=3)
            annotation (Placement(visible=true, transformation(
        origin={20,-10},
        extent={{-3,-2},{3,2}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine2(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={-20,10},
        extent={{-3,-2},{3,2}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine3(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={20,-40},
        extent={{-3,-2},{3,2}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine4(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={20,10},
        extent={{-3,-2},{3,2}},
        rotation=0)));
  iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ2(
    V_0=1,
    angle_0=0,
    P_0=8,
    Q_0=6)     annotation (Placement(visible=true, transformation(
        origin={65,-40},
        extent={{-5,-5},{5,5}},
        rotation=90)));
  iPSL.Electrical.Machines.PSAT.ThirdOrder.Order3 order31(
    Sn=20,
    V_b=400,
    V_0=1,
    angle_0=0,
    Vn=400,
    ra=0.001,
    xd1=0.302,
    M=10,
    D=0,
    xd=1.9,
    Td10=8,
    xq=1.7,
    P_0=4.01256732154526,
    Q_0=2.62725307404601)
            annotation (Placement(visible=true, transformation(
        origin={-60,0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Buses.Bus bus1 annotation (Placement(visible=true, transformation(
        origin={-39.5421,0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Buses.Bus bus2 annotation (Placement(visible=true, transformation(
        origin={0.1378,-0.096898},
        extent={{-9.8622,-10.0969},{9.8622,10.0969}},
        rotation=0)));
  iPSL.Electrical.Buses.Bus bus3 annotation (Placement(visible=true, transformation(
        origin={40,0.1033},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Buses.Bus bus4 annotation (Placement(visible=true, transformation(
        origin={40.6888,-40},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  inner iPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{-100,80},
            {-50,100}})));
equation
  connect(order31.vf0, order31.vf) annotation (Line(points={{-68,11},{-68,15},{
          -75,15},{-75,5},{-70,5}},                                                                             color={0,0,127}));
  connect(order31.pm, order31.pm0) annotation (Line(points={{-70,-5},{-75,-5},{
          -75,-15},{-68,-15},{-68,-11}},                                                                      color={0,0,127}));
  connect(pwLine2.p, bus1.p) annotation (Line(points={{-23.5,10},{-36,10},{-36,
          0},{-39.5421,0}}, color={0,0,255}));
  connect(order31.p, bus1.p) annotation (Line(points={{-49,0.04964},{-44,
          0.04964},{-44,0},{-39.5421,0}}, color={0,0,255}));
  connect(pwLine1.p, bus1.p) annotation (Line(points={{-23.5,-10},{-36,-10},{
          -36,0},{-39.5421,0}}, color={0,0,255}));
  connect(pwLine2.n, bus2.p) annotation (Line(points={{-16.5,10},{-4,10},{-4,
          -0.096898},{0.1378,-0.096898}}, color={0,0,255}));
  connect(pwLine1.n, bus2.p) annotation (Line(points={{-16.5,-10},{-4,-10},{-4,
          -0.096898},{0.1378,-0.096898}}, color={0,0,255}));
  connect(pwLinewithOpening1.p, bus2.p) annotation (Line(points={{16.5,-10},{4,
          -10},{4,-0.096898},{0.1378,-0.096898}}, color={0,0,255}));
  connect(pwLine4.p, bus2.p) annotation (Line(points={{16.5,10},{4,10},{4,
          -0.096898},{0.1378,-0.096898}}, color={0,0,255}));
  connect(pwLine4.n, bus3.p) annotation (Line(points={{23.5,10},{36,10},{36,
          0.1033},{40,0.1033}}, color={0,0,255}));
  connect(pwLinewithOpening1.n, bus3.p) annotation (Line(points={{23.5,-10},{36,
          -10},{36,0},{40,0.1033}}, color={0,0,255}));
  connect(bus3.p, PQ11.p) annotation (Line(points={{40,0.1033},{44.5,0.1033},{
          44.5,0},{49,0}}, color={0,0,255}));
  connect(pwLine3.p, bus2.p) annotation (Line(points={{16.5,-40},{3,-40},{3,
          -0.096898},{0.1378,-0.096898}}, color={0,0,255}));
  connect(bus4.p, pwLoadPQ2.p) annotation (Line(points={{40.6888,-40},{40.6888,
          -40},{59.5,-40}}, color={0,0,255}));
  connect(pwLine3.n, bus4.p)
    annotation (Line(points={{23.5,-40},{40.6888,-40}}, color={0,0,255}));
  connect(pwFault1.p, pwLoadPQ2.p) annotation (Line(points={{59.1667,-65.15},{
          50,-65.15},{50,-40},{59.5,-40}}, color={0,0,255}));
  annotation (Diagram(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={1,1})), Documentation(revisions="<html>
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
end SolarPQtest;
