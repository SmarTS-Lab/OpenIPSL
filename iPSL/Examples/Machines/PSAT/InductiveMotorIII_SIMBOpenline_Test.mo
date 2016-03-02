within iPSL.Examples.Machines.PSAT;
model InductiveMotorIII_SIMBOpenline_Test
  iPSL.Electrical.Machines.PSAT.InductionMachine.MotorTypeIII motorTypeI(
    Sup=0,
    V_0=1.0336,
    angle_0=-0.02173,
    P_0=0.251061717038311,
    Q_0=0.226568616630697) annotation (Placement(transformation(
        extent={{-27,-22},{27,22}},
        rotation=180,
        origin={65,-16})));
  iPSL.Electrical.Branches.PwLine pwLine1(
    G=0,
    R=0.01,
    X=0.1,
    B=1e-3) annotation (Placement(transformation(
        extent={{-25,-16},{25,16}},
        rotation=180,
        origin={-9,-38})));
  iPSL.Electrical.Branches.PwLine2Openings pwLine2(
    G=0,
    R=0.01,
    X=0.1,
    t1=2,
    t2=3,
    B=1e-3) annotation (Placement(transformation(
        extent={{-25,-16},{25,16}},
        rotation=180,
        origin={-9,4})));
  iPSL.Electrical.Buses.InfiniteBus infiniteBus(V=1.05, angle=0) annotation (Placement(transformation(
        extent={{-16.5,-13.5},{16.5,13.5}},
        rotation=0,
        origin={-86.5,-15.5})));
  inner iPSL.Electrical.SystemBase SysData(fn=60) annotation (Placement(transformation(extent={{40,60},{64,80}})));
equation
  connect(infiniteBus.p, pwLine2.n) annotation (Line(
      points={{-68.35,-15.5},{-48.175,-15.5},{-48.175,4},{-26.5,4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1.n, infiniteBus.p) annotation (Line(
      points={{-26.5,-38},{-48,-38},{-48,-15.5},{-68.35,-15.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine2.p, motorTypeI.p) annotation (Line(
      points={{8.5,4},{26,4},{26,-16},{42.32,-16}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1.p, motorTypeI.p) annotation (Line(
      points={{8.5,-38},{30,-38},{30,-16},{42.32,-16}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics), Documentation(revisions="<html>
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
end InductiveMotorIII_SIMBOpenline_Test;
