within iPSL.Examples.Controls.PSSE.ES;
model SCRX "SMIB model example of GENROU with Excitation System EXST1"
  import iPSL;
  extends iPSL.Examples.SMIBpartial;
  Modelica.Blocks.Sources.Constant const2(k=0) annotation (Placement(transformation(extent={{-110,166},{-94,182}})));
  iPSL.Electrical.Machines.PSSE.GENROU.GENROU gENROE(
    M_b=100,
    Tpd0=5,
    Tppd0=0.07,
    Tpq0=0.9,
    Tppq0=0.09,
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
    Xppq=0.2,
    R_a=0,
    Xpp=0.2,
    H=4.28) annotation (Placement(transformation(extent={{-112,-20},{-72,20}})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(
        extent={{4,-4},{-4,4}},
        rotation=0,
        origin={-52,-36})));
  iPSL.Electrical.Controls.PSSE.ES.SCRX.SCRX sCRX(
    T_AT_B=0.1,
    T_B=1,
    K=100,
    E_MIN=-10,
    E_MAX=10,
    C_SWITCH=false,
    r_cr_fd=0,
    V_c0=1,
    V_0=1,
    T_E=0.005) annotation (Placement(transformation(extent={{-74,-58},{-108,-30}})));
equation
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-111.6,10},{-116,10},{-116,26},{-62,26},{-62,-6},{-70.4,-6}},color={0,0,127}));
  connect(sCRX.EFD, gENROE.EFD) annotation (Line(points={{-108.567,-43.86},{-116,-43.86},{-116,-10},{-111.6,-10}},color={0,0,127}));
  connect(gENROE.ETERM, sCRX.ECOMP) annotation (Line(points={{-70.4,10},{-66,10},{-66,-31.82},{-74.1417,-31.82}}, color={0,0,127}));
  connect(const.y, sCRX.VOTHSG) annotation (Line(points={{-56.4,-36},{-74.1417,-36},{-74.1417,-35.74}}, color={0,0,127}));
  connect(sCRX.VOEL, sCRX.VOTHSG) annotation (Line(points={{-74.1417,-39.1},{-70,-39.1},{-70,-36},{-74.1417,-36},{-74.1417,-35.74}}, color={0,0,127}));
  connect(sCRX.VUEL, sCRX.VOTHSG) annotation (Line(points={{-74.1417,-42.74},{-70,-42.74},{-70,-36},{-74.1417,-36},{-74.1417,-35.74}}, color={0,0,127}));
  connect(sCRX.XADIFD, gENROE.XADIFD) annotation (Line(points={{-73.8583,-45.82},{-64,-45.82},{-64,-18},{-70.4,-18}}, color={0,0,127}));
  connect(sCRX.EFD0, gENROE.EFD0) annotation (Line(points={{-74.1417,-55.34},{-62,-55.34},{-62,-14},{-70.4,-14}}, color={0,0,127}));
  connect(sCRX.ETERM, sCRX.ECOMP) annotation (Line(points={{-73.8583,-50.44},{-66,-50.44},{-66,-31.82},{-74.1417,-31.82}}, color={0,0,127}));
  connect(gENROE.p, GEN1.p) annotation (Line(points={{-70,0},{-70,0},{-40,0}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,-100},{120,100}})),
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
</html>"),
    Icon(coordinateSystem(extent={{-120,-100},{120,100}})));
end SCRX;
