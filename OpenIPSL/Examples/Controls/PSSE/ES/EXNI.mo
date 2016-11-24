within OpenIPSL.Examples.Controls.PSSE.ES;


model EXNI "SMIB system with one load and GENROE model"
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
  Electrical.Controls.PSSE.ES.EXNI eXNI annotation (Placement(transformation(extent={{-64,-54},{-94,-26}})));
equation
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-99.6,10},{-110,10},{-110,26},{-48,26},{-48,-6},{-58.4,-6}}, color={0,0,127}));
  connect(gENROE.p, GEN1.p) annotation (Line(points={{-58,0},{-49,0},{-40,0}}, color={0,0,255}));
  connect(eXNI.VOTHSG, const.y) annotation (Line(points={{-64,-31.4444},{-60,-31.4444},{-60,-32},{-41,-32},{-41,-46}}, color={0,0,127}));
  connect(eXNI.ECOMP, gENROE.ETERM) annotation (Line(points={{-64,-38.4444},{-60,-38.4444},{-60,-38},{-52,-38},{-52,10},{-58.4,10}}, color={0,0,127}));
  connect(eXNI.XADIFD, gENROE.XADIFD) annotation (Line(points={{-64,-43.8889},{-60,-43.8889},{-60,-44},{-60,-18},{-58.4,-18}}, color={0,0,127}));
  connect(eXNI.EFD0, gENROE.EFD0) annotation (Line(points={{-64,-48.5556},{-60,-48.5556},{-60,-48},{-56,-48},{-56,-14},{-58.4,-14}}, color={0,0,127}));
  connect(eXNI.VUEL, const.y) annotation (Line(points={{-69.25,-54},{-70,-54},{-70,-60},{-46,-60},{-46,-46},{-41,-46}}, color={0,0,127}));
  connect(eXNI.VOEL, const.y) annotation (Line(points={{-73.75,-54},{-74,-54},{-74,-60},{-46,-60},{-46,-46},{-41,-46}}, color={0,0,127}));
  connect(eXNI.EFD, gENROE.EFD) annotation (Line(points={{-94.75,-38.4444},{-110,-38.4444},{-110,-10},{-99.6,-10}}, color={0,0,127}));
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
end EXNI;
