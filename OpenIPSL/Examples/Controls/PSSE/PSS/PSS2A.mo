within OpenIPSL.Examples.Controls.PSSE.PSS;
model PSS2A "SMIB system with one load and GENROE model"
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
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(extent={{-20,-86},{-40,-66}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.ESST1A eSST1A(
    V_IMAX=0.3,
    V_IMIN=-0.3,
    T_C=2,
    T_B=10,
    T_C1=0.08,
    T_B1=0.083,
    K_A=300,
    V_AMAX=7,
    V_AMIN=-7,
    V_RMAX=5.2,
    V_RMIN=-5.2,
    K_C=0.38,
    K_F=1,
    T_F=1,
    K_LR=1,
    I_LR=0,
    T_A=0.1,
    T_R=0.1) annotation (Placement(transformation(extent={{-56,-90},{-108,-60}})));
  Modelica.Blocks.Sources.Constant const1(k=-Modelica.Constants.inf) annotation (Placement(transformation(extent={{-20,-120},{-40,-100}})));
  Modelica.Blocks.Sources.Constant const2(k=Modelica.Constants.inf) annotation (Placement(transformation(extent={{-18,-150},{-38,-130}})));
  OpenIPSL.Electrical.Controls.PSSE.PSS.PSS2A pSS2A(
    T_w2=5,
    T_6=0,
    T_w3=5,
    T_w4=5,
    T_7=5,
    K_S2=0.758,
    K_S3=1,
    T_8=0.12,
    T_9=0.1,
    K_S1=2,
    T_1=0.47,
    T_2=0.07,
    T_3=0.47,
    T_4=0.07,
    V_STMAX=0.1,
    V_STMIN=-0.1,
    M=5,
    N=1,
    T_w1=0) annotation (Placement(transformation(extent={{-156,-40},{-118,-32}})));
equation
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-99.6,10},{-110,10},{-110,26},{-48,26},{-48,-6},{-58.4,-6}}, color={0,0,127}));
  connect(eSST1A.ECOMP, gENROE.ETERM) annotation (Line(points={{-56,-73.3333},{-52,-73.3333},{-52,10},{-58.4,10}}, color={0,0,127}));
  connect(const1.y, eSST1A.VUEL2) annotation (Line(points={{-41,-110},{-80.713,-110},{-80.713,-89.9917}}, color={0,0,127}));
  connect(eSST1A.VUEL, const.y) annotation (Line(points={{-65.1,-90},{-65.1,-94},{-46,-94},{-46,-76},{-41,-76}}, color={0,0,127}));
  connect(eSST1A.VUEL3, eSST1A.VUEL2) annotation (Line(points={{-88.4805,-89.9958},{-88.4805,-110},{-80.713,-110},{-80.713,-89.9917}}, color={0,0,127}));
  connect(const2.y, eSST1A.VOEL) annotation (Line(points={{-39,-140},{-72.9,-140},{-72.9,-90}}, color={0,0,127}));
  connect(pSS2A.V_S2, gENROE.PELEC) annotation (Line(points={{-156,-38},{-158,-38},{-158,-48},{-46,-48},{-46,-10},{-58.4,-10}}, color={0,0,127}));
  connect(pSS2A.V_S1, gENROE.SPEED) annotation (Line(points={{-156,-34},{-158,-34},{-158,30},{-44,30},{-44,18},{-58.4,18}}, color={0,0,127}));
  connect(eSST1A.EFD, gENROE.EFD) annotation (Line(points={{-109.3,-73.3333},{-114,-73.3333},{-114,-10},{-99.6,-10}}, color={0,0,127}));
  connect(eSST1A.VT, gENROE.ETERM) annotation (Line(points={{-56.0325,-69.1875},{-52,-69.1875},{-52,10},{-58.4,10}}, color={0,0,127}));
  connect(eSST1A.EFD0, gENROE.EFD0) annotation (Line(points={{-56,-84.1667},{-50,-84.1667},{-50,-14},{-58.4,-14}}, color={0,0,127}));
  connect(eSST1A.XADIFD, gENROE.XADIFD) annotation (Line(points={{-56,-79.1667},{-48,-79.1667},{-48,-18},{-58.4,-18}}, color={0,0,127}));
  connect(eSST1A.VOTHSG2, pSS2A.VOTHSG) annotation (Line(points={{-56,-62.5},{-44,-62.5},{-44,-36},{-117.4,-36}}, color={0,0,127}));
  connect(eSST1A.VOTHSG, const.y) annotation (Line(points={{-56,-65.8333},{-46,-65.8333},{-46,-76},{-41,-76}}, color={0,0,127}));
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
end PSS2A;

