within iPSL.Examples.Controls.PSSE.PSS;
model IEEEST "SMIB system with one load and GENROE model"
  import iPSL;
  extends iPSL.Examples.SMIBpartial;
  iPSL.Electrical.Machines.PSSE.GENROE.GENROE gENROE(
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
    Xppq=0.2) annotation (Placement(transformation(extent={{-102,-20},{-62,20}})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(extent={{-22,-86},{-42,-66}})));
  iPSL.Electrical.Controls.PSSE.ES.ESST1A.ESST1A eSST1A(
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
    T_R=0.1) annotation (Placement(transformation(extent={{-58,-90},{-110,-60}})));
  Modelica.Blocks.Sources.Constant const1(k=-Modelica.Constants.inf) annotation (Placement(transformation(extent={{-22,-120},{-42,-100}})));
  Modelica.Blocks.Sources.Constant const2(k=Modelica.Constants.inf) annotation (Placement(transformation(extent={{-20,-150},{-40,-130}})));
  iPSL.Electrical.Controls.PSSE.PSS.IEEEST.IEEEST iEEEST(
    A_1=48.7435,
    A_2=4.7488,
    A_3=0.0,
    A_4=0.0,
    A_5=-85.7761,
    A_6=0.0459,
    T_1=0.7361,
    T_2=1.5868,
    T_3=0.0,
    T_4=0.02,
    T_5=13.8921,
    T_6=0.1057,
    K_S=0.0099,
    L_SMAX=0.1,
    L_SMIN=-0.1,
    V_CU=0.0,
    V_CL=0.0) annotation (Placement(transformation(extent={{-96,-44},{-68,-32}})));
equation
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-101.6,10},{-112,10},{-112,26},{-50,26},{-50,-6},{-60.4,-6}}, color={0,0,127}));
  connect(eSST1A.ECOMP, gENROE.ETERM) annotation (Line(points={{-59.0833,-75},{-54,-75},{-54,10},{-60.4,10}}, color={0,0,127}));
  connect(const1.y, eSST1A.VUEL2) annotation (Line(points={{-43,-110},{-80.7717,-110},{-80.7717,-89.0438}}, color={0,0,127}));
  connect(eSST1A.VUEL1, const.y) annotation (Line(points={{-74.2175,-89.0625},{-74.2175,-94},{-48,-94},{-48,-76},{-43,-76}}, color={0,0,127}));
  connect(eSST1A.VUEL3, eSST1A.VUEL2) annotation (Line(points={{-87.2175,-89.0531},{-87.2175,-110},{-80.7717,-110},{-80.7717,-89.0438}}, color={0,0,127}));
  connect(const2.y, eSST1A.VOEL) annotation (Line(points={{-41,-140},{-93.75,-140},{-93.75,-89.0625}}, color={0,0,127}));
  connect(eSST1A.EFD, gENROE.EFD) annotation (Line(points={{-111.083,-75.0375},{-116,-75.0375},{-116,-10},{-101.6,-10}}, color={0,0,127}));
  connect(eSST1A.VT, gENROE.ETERM) annotation (Line(points={{-59.2458,-79.7344},{-54,-79.7344},{-54,10},{-60.4,10}}, color={0,0,127}));
  connect(eSST1A.EFD0, gENROE.EFD0) annotation (Line(points={{-59.0833,-83.4094},{-52,-83.4094},{-52,-14},{-60.4,-14}}, color={0,0,127}));
  connect(eSST1A.XADIFD, gENROE.XADIFD) annotation (Line(points={{-59.0833,-87.1875},{-50,-87.1875},{-50,-18},{-60.4,-18}}, color={0,0,127}));
  connect(iEEEST.V_CT, gENROE.ETERM) annotation (Line(points={{-95.7667,-35},{-102,-35},{-102,-28},{-54,-28},{-54,10},{-60.4,10}}, color={0,0,127}));
  connect(iEEEST.V_S, gENROE.PELEC) annotation (Line(points={{-95.7667,-41},{-102,-41},{-102,-52},{-56,-52},{-56,-10},{-60.4,-10}}, color={0,0,127}));
  connect(eSST1A.VOTHSG2, const.y) annotation (Line(points={{-59.0833,-66.5625},{-46,-66.5625},{-46,-76},{-43,-76}}, color={0,0,127}));
  connect(iEEEST.VOTHSG, eSST1A.VOTHSG) annotation (Line(points={{-66.8333,-38},{-48,-38},{-48,-62.8125},{-59.0833,-62.8125}}, color={0,0,127}));
  connect(gENROE.p, GEN1.p) annotation (Line(points={{-60,0},{-50,0},{-40,0}}, color={0,0,255}));
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
end IEEEST;
