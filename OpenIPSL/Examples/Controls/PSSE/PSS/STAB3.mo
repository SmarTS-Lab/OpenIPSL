within OpenIPSL.Examples.Controls.PSSE.PSS;
model STAB3
  "Simple Machine Infinite Bus with Machine, Governor and Excitation system"
  extends OpenIPSL.Examples.SMIBpartial;
  OpenIPSL.Electrical.Machines.PSSE.GENSAL generator(
    Xppd=0.2,
    Xppq=0.2,
    Xl=0.12,
    V_0=1,
    angle_0=4.05,
    P_0=39.99995,
    Q_0=5.416571,
    M_b=100,
    Tpd0=6.7000,
    Tppd0=0.28000E-01,
    Tppq0=0.35000E-01,
    H=4.4100,
    D=0,
    Xd=1.2200,
    Xq=0.76000,
    Xpd=0.29700,
    S10=0.18600,
    S12=0.802)
    annotation (Placement(transformation(extent={{-106,-12},{-78,14}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.HYGOV HYGOV(VELM=0.02, G_MAX=0.415) annotation (Placement(transformation(
        extent={{-19,-14},{19,14}},
        rotation=180,
        origin={-83,30})));
  OpenIPSL.Electrical.Controls.PSSE.ES.SCRX SCRX(
    V_0=1,
    V_c0=1,
    T_AT_B=0.01,
    T_B=10,
    K=100,
    T_E=0.05,
    E_MIN=0,
    E_MAX=5,
    r_cr_fd=0,
    C_SWITCH=false) annotation (Placement(transformation(
        extent={{-18,-16},{18,16}},
        rotation=180,
        origin={-94,-36})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(
        extent={{-2,-2},{2,2}},
        rotation=180,
        origin={-68,-34})));
equation
  connect(SCRX.VUEL, const.y) annotation (Line(
      points={{-76.15,-31.04},{-71.67,-31.04},{-71.67,-34},{-70.2,-34}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(SCRX.VOEL, const.y) annotation (Line(
      points={{-76.15,-35.2},{-71.67,-35.2},{-71.67,-34},{-70.2,-34}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(generator.EFD0, SCRX.EFD0) annotation (Line(
      points={{-76.88,-8.1},{-74,-8.1},{-74,-16.64},{-76.15,-16.64}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(generator.XADIFD, SCRX.XADIFD) annotation (Line(points={{-76.88,-10.7},{-70,-10.7},{-70,-27.52},{-75.85,-27.52}}, color={0,0,127}));
  connect(SCRX.ECOMP, generator.ETERM) annotation (Line(points={{-76.15,-43.52},{-66,-43.52},{-66,7.5},{-76.88,7.5}}, color={0,0,127}));
  connect(generator.SPEED, HYGOV.SPEED) annotation (Line(points={{-76.88,12.7},{-58,12.7},{-58,23},{-64.475,23}}, color={0,0,127}));
  connect(generator.PMECH0, HYGOV.PMECH0) annotation (Line(points={{-76.88,-2.9},{-64,-2.9},{-64,10},{-48,10},{-48,37},{-64.475,37}}, color={0,0,127}));
  connect(HYGOV.PMECH, generator.PMECH) annotation (Line(points={{-102.95,30},{-112,30},{-112,7.5},{-105.72,7.5}}, color={0,0,127}));
  connect(generator.EFD, SCRX.EFD) annotation (Line(points={{-105.72,-5.5},{-116,-5.5},{-116,-29.76},{-112.6,-29.76}}, color={0,0,127}));
  connect(SCRX.VOTHSG, const.y) annotation (Line(points={{-76.15,-39.04},{-74,-39.04},{-74,-36},{-71.67,-35.2},{-71.67,-34},{-70.2,-34}}, color={0,0,127}));
  connect(SCRX.ETERM, generator.ETERM) annotation (Line(points={{-75.85,-22.24},{-66,-22},{-66,7.5},{-76.88,7.5}}, color={0,0,127}));
  connect(generator.p, GEN1.p) annotation (Line(points={{-76.6,1},{-58.3,1},{-58.3,0},{-40,0}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-120},{100,80}})),
    Icon(coordinateSystem(extent={{-100,-120},{100,80}})),
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
</html>"));
end STAB3;
