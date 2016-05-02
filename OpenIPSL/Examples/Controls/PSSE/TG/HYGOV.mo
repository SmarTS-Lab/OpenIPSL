within OpenIPSL.Examples.Controls.PSSE.TG;
model HYGOV
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
    Tppd0=0.028,
    Tppq0=0.0358,
    H=4.4100,
    D=0,
    Xd=1.2200,
    Xq=0.76000,
    Xpd=0.29700,
    S10=0.18600,
    S12=0.802)
    annotation (Placement(transformation(extent={{-96,-10},{-76,10}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.HYGOV HYGOV(
    VELM=0.02,
    G_MAX=0.415,
    R=0.05,
    r=0.3,
    T_r=5,
    T_f=0.05,
    T_g=0.5,
    G_MIN=0,
    T_w=1.25,
    A_t=1.2,
    D_turb=0.2,
    q_NL=0.08) annotation (Placement(transformation(
        extent={{-19,-14},{19,14}},
        rotation=180,
        origin={-81,38})));
  OpenIPSL.Electrical.Controls.PSSE.ES.SCRX SCRX(
    V_0=1,
    V_c0=1,
    T_B=10,
    K=100,
    T_E=0.05,
    E_MIN=0,
    E_MAX=5,
    r_cr_fd=0,
    C_SWITCH=false,
    T_AT_B=0.1) annotation (Placement(transformation(
        extent={{-18,-16},{18,16}},
        rotation=180,
        origin={-86,-34})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(
        extent={{-2,-2},{2,2}},
        rotation=180,
        origin={-56,-34})));
equation
  connect(SCRX.VUEL, const.y) annotation (Line(
      points={{-68.15,-29.04},{-59.67,-29.04},{-59.67,-34},{-58.2,-34}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(SCRX.VOEL, const.y) annotation (Line(
      points={{-68.15,-33.2},{-59.67,-33.2},{-59.67,-34},{-58.2,-34}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(SCRX.VOTHSG, const.y) annotation (Line(
      points={{-68.15,-37.04},{-59.67,-37.04},{-59.67,-34},{-58.2,-34}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(generator.EFD0, SCRX.EFD0) annotation (Line(
      points={{-75.2,-7},{-75.2,-14.64},{-68.15,-14.64}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(generator.PMECH0, HYGOV.PMECH0) annotation (Line(points={{-75.2,-3},{-52,-3},{-52,45},{-62.475,45}}, color={0,0,127}));
  connect(generator.SPEED, HYGOV.SPEED) annotation (Line(points={{-75.2,9},{-58,9},{-58,31},{-62.475,31}}, color={0,0,127}));
  connect(HYGOV.PMECH, generator.PMECH) annotation (Line(points={{-100.95,38},{-110,38},{-110,5},{-95.8,5}},color={0,0,127}));
  connect(SCRX.EFD, generator.EFD) annotation (Line(points={{-104.6,-27.76},{-110,-27.76},{-110,-5},{-95.8,-5}}, color={0,0,127}));
  connect(generator.ETERM, SCRX.ECOMP) annotation (Line(points={{-75.2,5},{-50,5},{-50,-41.52},{-68.15,-41.52}}, color={0,0,127}));
  connect(SCRX.ETERM, SCRX.ECOMP) annotation (Line(points={{-67.85,-20.24},{-50,-20.24},{-50,-41.52},{-68.15,-41.52}}, color={0,0,127}));
  connect(generator.XADIFD, SCRX.XADIFD) annotation (Line(points={{-75.2,-9},{-58,-9},{-58,-25.52},{-67.85,-25.52}}, color={0,0,127}));
  connect(generator.p, GEN1.p) annotation (Line(points={{-75,0},{-58,0},{-40,0}}, color={0,0,255}));
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
end HYGOV;
