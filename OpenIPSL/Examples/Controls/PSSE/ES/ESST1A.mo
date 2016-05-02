within OpenIPSL.Examples.Controls.PSSE.ES;
model ESST1A "SMIB system with one load and GENROE model"
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
    Xppq=0.2)
    annotation (Placement(transformation(extent={{-100,-20},{-60,20}})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(extent={{-20,-56},{-40,-36}})));
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
    T_R=0.1)
    annotation (Placement(transformation(extent={{-56,-60},{-108,-30}})));
  Modelica.Blocks.Sources.Constant const1(k=-Modelica.Constants.inf) annotation (Placement(transformation(extent={{-20,-90},{-40,-70}})));
  Modelica.Blocks.Sources.Constant const2(k=Modelica.Constants.inf) annotation (Placement(transformation(extent={{-18,-120},{-38,-100}})));
equation
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-99.6,10},{-110,10},{-110,26},{-48,26},{-48,-6},{-58.4,-6}}, color={0,0,127}));
  connect(const1.y, eSST1A.VUEL2) annotation (Line(points={{-41,-80},{-78.7717,-80},{-78.7717,-59.0438}}, color={0,0,127}));
  connect(eSST1A.VUEL3, eSST1A.VUEL2) annotation (Line(points={{-85.2175,-59.0531},{-85.2175,-80},{-78.7717,-80},{-78.7717,-59.0438}}, color={0,0,127}));
  connect(const2.y, eSST1A.VOEL) annotation (Line(points={{-39,-110},{-91.75,-110},{-91.75,-59.0625}}, color={0,0,127}));
  connect(eSST1A.EFD, gENROE.EFD) annotation (Line(points={{-109.083,-45.0375},{-112,-45.0375},{-112,-10},{-99.6,-10}}, color={0,0,127}));
  connect(const.y, eSST1A.VUEL1) annotation (Line(points={{-41,-46},{-46,-46},{-46,-68},{-72.2175,-68},{-72.2175,-59.0625}}, color={0,0,127}));
  connect(eSST1A.VOTHSG, eSST1A.VUEL1) annotation (Line(points={{-57.0833,-32.8125},{-46,-32.8125},{-46,-68},{-72.2175,-68},{-72.2175,-59.0625}}, color={0,0,127}));
  connect(eSST1A.VOTHSG2, eSST1A.VUEL1) annotation (Line(points={{-57.0833,-36.5625},{-46,-36.5625},{-46,-68},{-72.2175,-68},{-72.2175,-59.0625}}, color={0,0,127}));
  connect(gENROE.ETERM, eSST1A.ECOMP) annotation (Line(points={{-58.4,10},{-52,10},{-52,-45},{-57.0833,-45}}, color={0,0,127}));
  connect(eSST1A.VT, eSST1A.ECOMP) annotation (Line(points={{-57.2458,-49.7344},{-52,-49.7344},{-52,-45},{-57.0833,-45}}, color={0,0,127}));
  connect(eSST1A.EFD0, gENROE.EFD0) annotation (Line(points={{-57.0833,-53.4094},{-50,-53.4094},{-50,-14},{-58.4,-14}}, color={0,0,127}));
  connect(eSST1A.XADIFD, gENROE.XADIFD) annotation (Line(points={{-57.0833,-57.1875},{-48,-57.1875},{-48,-18},{-58.4,-18}}, color={0,0,127}));
  connect(gENROE.p, GEN1.p) annotation (Line(points={{-58,0},{-49,0},{-40,0}}, color={0,0,255}));
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
end ESST1A;
