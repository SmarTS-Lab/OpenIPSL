within OpenIPSL.Examples.Controls.PSSE.ES;
model EXST1 "SMIB system with one load and GENROE model"
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
  OpenIPSL.Electrical.Controls.PSSE.ES.EXST1 eXST1_1(
    V_IMAX=10,
    V_IMIN=-10,
    T_R=0.02,
    T_B=1,
    K_A=80,
    T_A=0.05,
    V_RMAX=8,
    V_RMIN=-3,
    K_C=0.2,
    K_F=0.1,
    T_F=1,
    T_C=0.1)
    annotation (Placement(transformation(extent={{-58,-58},{-100,-28}})));
equation
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-99.6,10},{-110,10},{-110,26},{-48,26},{-48,-6},{-58.4,-6}}, color={0,0,127}));
  connect(eXST1_1.EFD, gENROE.EFD) annotation (Line(points={{-99,-42},{-110,-42},{-110,-10},{-99.6,-10}}, color={0,0,127}));
  connect(eXST1_1.ECOMP, gENROE.ETERM) annotation (Line(points={{-58.5,-31.1},{-50,-31.1},{-50,10},{-58.4,10}}, color={0,0,127}));
  connect(eXST1_1.ETERM, gENROE.ETERM) annotation (Line(points={{-58.5,-34.7},{-50,-34.7},{-50,10},{-58.4,10}}, color={0,0,127}));
  connect(const.y, eXST1_1.VOEL) annotation (Line(points={{-41,-46},{-58.5,-46},{-58.5,-46.7}}, color={0,0,127}));
  connect(eXST1_1.VOTHSG, eXST1_1.VOEL) annotation (Line(points={{-58.5,-43.1},{-50,-43.1},{-50,-46},{-58.5,-46},{-58.5,-46.7}}, color={0,0,127}));
  connect(eXST1_1.VUEL, eXST1_1.VOEL) annotation (Line(points={{-58.5,-50.5},{-50,-50.5},{-50,-46},{-58.5,-46},{-58.5,-46.7}}, color={0,0,127}));
  connect(eXST1_1.XADIFD, gENROE.XADIFD) annotation (Line(points={{-58.5,-38.9},{-54,-38.9},{-54,-18},{-58.4,-18}}, color={0,0,127}));
  connect(eXST1_1.EFD0, gENROE.EFD0) annotation (Line(points={{-66.1,-54.5},{-66.1,-60},{-48,-60},{-48,-14},{-58.4,-14}}, color={0,0,127}));
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
end EXST1;
