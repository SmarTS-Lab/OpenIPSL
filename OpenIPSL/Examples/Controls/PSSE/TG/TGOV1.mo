within OpenIPSL.Examples.Controls.PSSE.TG;
model TGOV1 "SMIB system with one load and GENROE model"
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
  OpenIPSL.Electrical.Controls.PSSE.TG.TGOV1 tGOV1_1(
    R=0.04,
    D_t=0,
    T_1=0.4,
    T_2=2,
    T_3=6,
    V_MAX=0.86,
    V_MIN=0.3) annotation (Placement(transformation(extent={{-72,32},{-88,44}})));
equation
  connect(gENROE.EFD, gENROE.EFD0) annotation (Line(points={{-99.6,-10},{-110,-10},{-110,-30},{-48,-30},{-48,-14},{-58.4,-14}}, color={0,0,127}));
  connect(tGOV1_1.SPEED, gENROE.SPEED) annotation (Line(points={{-73,41},{-52,41},{-52,18},{-58.4,18}}, color={0,0,127}));
  connect(tGOV1_1.PMECH0, gENROE.PMECH0) annotation (Line(points={{-73,35},{-48,35},{-48,-6},{-58.4,-6}}, color={0,0,127}));
  connect(tGOV1_1.PMECH, gENROE.PMECH) annotation (Line(points={{-89,38},{-110,38},{-110,10},{-99.6,10}}, color={0,0,127}));
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
end TGOV1;
