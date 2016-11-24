within OpenIPSL.Examples.Machines.PSAT;


model InductiveMotorV_SIMBOpenline_Test
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Machines.PSAT.MotorTypeV motorTypeI(
    Sup=0,
    V_0=1.0336,
    angle_0=-0.02173,
    P_0=0.251061717038311,
    Q_0=0.226568616630697) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={60,0})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    G=0,
    B=0,
    R=0.01,
    X=0.1) annotation (Placement(transformation(
        extent={{-6,-4},{6,4}},
        rotation=180,
        origin={0,-20})));
  OpenIPSL.Electrical.Branches.PwLine pwLine2(
    G=0,
    B=0,
    R=0.01,
    X=0.1,
    t1=2,
    t2=3,
    opening=1) annotation (Placement(transformation(
        extent={{-6,-4},{6,4}},
        rotation=180,
        origin={0,20})));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(V_0=1.05, angle_0=0) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-60,0})));
  inner OpenIPSL.Electrical.SystemBase SysData(fn=60) annotation (Placement(transformation(extent={{-100,80},{-40,100}})));
equation
  connect(infiniteBus.p, pwLine2.n) annotation (Line(
      points={{-49,0},{-38.175,0},{-38.175,20},{-7,20}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1.n, infiniteBus.p) annotation (Line(
      points={{-7,-20},{-38,-20},{-38,0},{-49,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine2.p, motorTypeI.p) annotation (Line(
      points={{7,20},{36,20},{36,1.11022e-015},{51.6,1.11022e-015}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1.p, motorTypeI.p) annotation (Line(
      points={{7,-20},{26,-20},{26,0},{51.6,0}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics), Documentation(revisions="<html>
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
end InductiveMotorV_SIMBOpenline_Test;
