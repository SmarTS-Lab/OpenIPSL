within OpenIPSL.Examples.Controls.PSSE.ES;
model EXAC1 "SMIB system with one load and GENROE model"
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
    Xppq=0.2) annotation (Placement(transformation(extent={{-100,-20},{-60,20}})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(extent={{-20,-56},{-40,-36}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.EXAC1 eXAC1_1(
    K_A=400,
    T_A=0.02,
    V_RMAX=9,
    V_RMIN=-5.43,
    T_E=0.8,
    K_F=0.03,
    T_F=1,
    K_C=0.2,
    K_D=0.48,
    K_E=1,
    E_1=5.25,
    E_2=7,
    S_EE_1=0.03,
    S_EE_2=0.1,
    T_R=0.004,
    T_B=0.004,
    T_C=0.004) annotation (Placement(transformation(extent={{-60,-50},{-98,-24}})));
equation
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-99.6,10},{-110,10},{-110,26},{-48,26},{-48,-6},{-58.4,-6}}, color={0,0,127}));
  connect(eXAC1_1.EFD, gENROE.EFD) annotation (Line(points={{-98.95,-37},{-110,-37},{-110,-10},{-99.6,-10}}, color={0,0,127}));
  connect(eXAC1_1.XADIFD, gENROE.XADIFD) annotation (Line(points={{-60.95,-27.25},{-56,-27.25},{-56,-18},{-58.4,-18}}, color={0,0,127}));
  connect(eXAC1_1.VOTHSG, const.y) annotation (Line(points={{-60.95,-30.5},{-48,-30.5},{-48,-46},{-41,-46}}, color={0,0,127}));
  connect(eXAC1_1.VUEL, const.y) annotation (Line(points={{-61.14,-41.875},{-48,-42},{-48,-46},{-41,-46}}, color={0,0,127}));
  connect(eXAC1_1.VOEL, const.y) annotation (Line(points={{-60.95,-45.125},{-48,-44},{-48,-46},{-41,-46}}, color={0,0,127}));
  connect(eXAC1_1.ECOMP, gENROE.ETERM) annotation (Line(points={{-60.95,-37},{-52,-37},{-52,10},{-58.4,10}}, color={0,0,127}));
  connect(eXAC1_1.EFD0, gENROE.EFD0) annotation (Line(points={{-60.95,-48.2125},{-54,-48.2125},{-54,-14},{-58.4,-14}}, color={0,0,127}));
  connect(gENROE.p, GEN1.p) annotation (Line(points={{-58,0},{-49,0},{-40,0}}, color={0,0,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})), Documentation(revisions="<html>
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
end EXAC1;
