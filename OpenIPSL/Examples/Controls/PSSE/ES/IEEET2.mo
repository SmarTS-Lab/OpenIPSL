within OpenIPSL.Examples.Controls.PSSE.ES;
model IEEET2 "SMIB system with one load and GENROE model"
  extends OpenIPSL.Examples.SMIBpartial;
  OpenIPSL.Electrical.Machines.PSSE.GENROE gENROE(
    M_b=100,
    Tpd0=5,
    Tppd0=0.07,
    Tpq0=0.9,
    Tppq0=0.09,
    H=4.28,
    D=0,
    Xd=1.84,
    Xq=1.75,
    Xpd=0.41,
    Xpq=0.6,
    Xppd=0.2,
    Xl=0.12,
    S10=0.11,
    S12=0.39,
    V_0=1,
    P_0=40,
    angle_0=4.046276,
    Q_0=5.416582,
    Xppq=0.2) annotation (Placement(transformation(extent={{-108,-20},{-68,20}})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(extent={{-28,-50},{-48,-30}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.IEEET2 iEEET2_1(
    T_R=0.02,
    K_A=200,
    T_A=0.001,
    T_E=0.55,
    K_F=0.06,
    T_F1=0.3,
    T_F2=0.6,
    E_1=2.85,
    S_EE_1=0.3,
    E_2=3.8,
    S_EE_2=0.6,
    V_RMAX=2,
    V_RMIN=-2,
    K_E=0.1) annotation (Placement(transformation(extent={{-74,-58},{-106,-32}})));
  inner OpenIPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{-100,80},{-40,100}})));
equation
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-107.6,10},{-118,10},{-118,26},{-56,26},{-56,-6},{-66.4,-6}}, color={0,0,127}));
  connect(iEEET2_1.EFD, gENROE.EFD) annotation (Line(points={{-106.8,-43.5556},{-118,-43.5556},{-118,-10},{-107.6,-10}}, color={0,0,127}));
  connect(iEEET2_1.ECOMP, gENROE.ETERM) annotation (Line(points={{-74,-43.5556},{-58,-43.5556},{-58,10},{-66.4,10}},color={0,0,127}));
  connect(iEEET2_1.EFD0, gENROE.EFD0) annotation (Line(points={{-74,-52.9444},{-56,-52.9444},{-56,-14},{-66.4,-14}},color={0,0,127}));
  connect(iEEET2_1.VOTHSG, const.y) annotation (Line(points={{-74,-37.0556},{-55.3333,-37.0556},{-55.3333,-40},{-49,-40}},color={0,0,127}));
  connect(iEEET2_1.VOEL, const.y) annotation (Line(points={{-84.4,-58},{-50,-58},{-50,-40},{-49,-40}}, color={0,0,127}));
  connect(iEEET2_1.VUEL, const.y) annotation (Line(points={{-79.6,-58},{-50,-58},{-50,-40},{-49,-40}}, color={0,0,127}));
  connect(gENROE.p, GEN1.p) annotation (Line(points={{-66,0},{-54,0},{-40,0}}, color={0,0,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})), Documentation(revisions="<html>
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
end IEEET2;
