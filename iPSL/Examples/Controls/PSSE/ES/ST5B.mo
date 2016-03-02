within iPSL.Examples.Controls.PSSE.ES;
model ST5B "SMIB system with one load and GENROE model"
  import iPSL;
  extends iPSL.Examples.SMIBpartial;
  iPSL.Electrical.Controls.PSSE.ES.ST5B.ST5B sT5B(
    T_R=0,
    T_C1=0.8,
    T_B1=6,
    T_C2=0.08,
    T_B2=0.01,
    T_UC1=2,
    T_UB1=10,
    T_UC2=0.1,
    T_UB2=0.05,
    T_OC1=0.1,
    T_OB1=2,
    T_OC2=0.08,
    T_OB2=0.08,
    K_C=0.004,
    T_1=0.001,
    K_R=200,
    V_RMAX=5,
    V_RMIN=-4) annotation (Placement(transformation(extent={{-64,-76},{-124,-44}})));
  Modelica.Blocks.Sources.Constant PSS_off(k=0) annotation (Placement(transformation(extent={{-140,-102},{-128,-90}})));
  Modelica.Blocks.Sources.Constant VOEL(k=100) annotation (Placement(transformation(extent={{-140,-122},{-128,-110}})));
  Modelica.Blocks.Sources.Constant VUEL(k=-100) annotation (Placement(transformation(extent={{-140,-142},{-128,-130}})));
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
    Xppq=0.2) annotation (Placement(transformation(extent={{-112,-20},{-72,20}})));
equation
  connect(sT5B.ETERM, sT5B.ECOMP) annotation (Line(points={{-65,-56},{-50,-56},{-50,-48},{-65,-48}}, color={0,0,127}));
  connect(PSS_off.y, sT5B.VOTHSG) annotation (Line(points={{-127.4,-96},{-97,-96},{-97,-74.6667}}, color={0,0,127}));
  connect(VOEL.y, sT5B.VOEL) annotation (Line(points={{-127.4,-116},{-89,-116},{-89,-74.6667}}, color={0,0,127}));
  connect(VUEL.y, sT5B.VUEL) annotation (Line(points={{-127.4,-136},{-81,-136},{-81,-74.6667}}, color={0,0,127}));
  connect(gENROE.ETERM, sT5B.ECOMP) annotation (Line(points={{-70.4,10},{-50,10},{-50,-48},{-65,-48}}, color={0,0,127}));
  connect(sT5B.XADIFD, gENROE.XADIFD) annotation (Line(points={{-65,-64},{-60,-64},{-60,-18},{-70.4,-18}}, color={0,0,127}));
  connect(sT5B.EFD0, gENROE.EFD0) annotation (Line(points={{-65,-72},{-56,-72},{-56,-14},{-70.4,-14}}, color={0,0,127}));
  connect(sT5B.EFD, gENROE.EFD) annotation (Line(points={{-125,-60},{-128,-60},{-128,-10},{-111.6,-10}}, color={0,0,127}));
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-111.6,10},{-128,10},{-128,30},{-60,30},{-60,-6},{-70.4,-6}}, color={0,0,127}));
  connect(gENROE.p, GEN1.p) annotation (Line(points={{-70,0},{-55,0},{-40,0}}, color={0,0,255}));
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
end ST5B;
