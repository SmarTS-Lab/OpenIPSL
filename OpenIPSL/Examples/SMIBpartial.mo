within OpenIPSL.Examples;
partial model SMIBpartial "SMIB system with one load"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Branches.PwLine pwLine(
    R=0.001,
    X=0.2,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-26,-4},{-14,4}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    R=0.001,
    G=0,
    B=0,
    X=0.2) annotation (Placement(transformation(extent={{34,26},{46,34}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine3(
    R=0.0005,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{14,-34},{26,-26}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine4(
    R=0.0005,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{54,-34},{66,-26}})));
  OpenIPSL.Electrical.Machines.PSSE.GENCLS gENCLS(
    M_b=100,
    D=0,
    V_0=1,
    angle_0=0,
    X_d=0.2,
    P_0=10.01711,
    Q_0=8.006544,
    H=0) annotation (Placement(transformation(extent={{112,-12},{98,12}})));
  OpenIPSL.Electrical.Loads.PSSE.Load_variation constantLoad(
    PQBRAK=0.7,
    d_t=0,
    d_P=0,
    V_0=0.9919935,
    angle_0=-0.5762684,
    t1=0,
    characteristic=2,
    P_0=50,
    Q_0=10) annotation (Placement(transformation(extent={{-4,-52},{8,-40}})));
  OpenIPSL.Electrical.Events.PwFault pwFault(
    t1=2,
    t2=2.15,
    R=0,
    X=0) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={44,-60})));
  OpenIPSL.Electrical.Buses.Bus GEN1 annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  inner OpenIPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{-100,80},{-40,100}})));
  OpenIPSL.Electrical.Buses.Bus LOAD annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  OpenIPSL.Electrical.Buses.Bus GEN2 annotation (Placement(transformation(extent={{70,-10},{90,10}})));
  OpenIPSL.Electrical.Buses.Bus FAULT annotation (Placement(transformation(extent={{30,-40},{50,-20}})));
equation
  connect(GEN1.p, pwLine.p) annotation (Line(points={{-40,0},{-40,0},{-27,0}}, color={0,0,255}));
  connect(pwLine.n, LOAD.p) annotation (Line(points={{-13,0},{-6.5,0},{0,0}}, color={0,0,255}));
  connect(pwLine3.p, LOAD.p) annotation (Line(points={{13,-30},{4,-30},{4,0},{0,0}}, color={0,0,255}));
  connect(constantLoad.p, LOAD.p) annotation (Line(points={{2,-39.4},{2,0},{0,0}}, color={0,0,255}));
  connect(pwLine1.p, LOAD.p) annotation (Line(points={{33,30},{4,30},{4,0},{0,0}}, color={0,0,255}));
  connect(GEN2.p, gENCLS.p) annotation (Line(points={{80,0},{96.6,0},{96.6,-0.180432}}, color={0,0,255}));
  connect(pwLine4.n, GEN2.p) annotation (Line(points={{67,-30},{76,-30},{76,0},{80,0}}, color={0,0,255}));
  connect(pwLine1.n, GEN2.p) annotation (Line(points={{47,30},{76,30},{76,0},{80,0}}, color={0,0,255}));
  connect(FAULT.p, pwLine4.p) annotation (Line(points={{40,-30},{53,-30}}, color={0,0,255}));
  connect(FAULT.p, pwLine3.n) annotation (Line(points={{40,-30},{27,-30}}, color={0,0,255}));
  connect(pwFault.p, pwLine4.p) annotation (Line(points={{44,-53},{44,-30},{53,-30}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
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
"), experiment(StopTime=10));
end SMIBpartial;
