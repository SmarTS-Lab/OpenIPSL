within iPSL.Examples.Controls.PSAT.TG;
model TGTypeI_Test
  extends iPSL.Examples.BaseTest(pwLinewithOpening1(t1=300, t2=300));
  iPSL.Electrical.Machines.PSAT.SixthOrder.Order6 order6Type2_Inputs_Outputs(
    V_0=1,
    angle_0=0,
    V_b=200,
    Sn=370,
    Vn=200,
    ra=0.001,
    xd1=0.302,
    M=10,
    D=0,
    P_0=16.0352698692006,
    Q_0=11.859436505981)
         annotation (Placement(transformation(extent={{-61,-20},{-21,20}})));
  parameter Real p0=0.160352698692006 "Power flow, node active power";
  iPSL.Electrical.Controls.PSAT.TG.TGTypeI tGTypeI(
    wref=1,
    pref=p0,
    R=0.2,
    pmax=1,
    pmin=0,
    Ts=0.1,
    Tc=1,
    T3=0.04,
    T4=5,
    T5=0.04) annotation (Placement(transformation(extent={{-26,-57},{-60,-28}})));
equation
  connect(tGTypeI.w, order6Type2_Inputs_Outputs.w) annotation (Line(points={{
          -29.2583,-40.325},{-10,-40.325},{-10,18},{-19,18}},
                                                     color={0,0,127}));
  connect(order6Type2_Inputs_Outputs.vf, order6Type2_Inputs_Outputs.vf0)
    annotation (Line(points={{-61,10},{-70,10},{-70,30},{-57,30},{-57,22}},
        color={0,0,127}));
  connect(order6Type2_Inputs_Outputs.p, bus.p) annotation (Line(points={{-19,
          0.09928},{-10,0.09928},{-10,0},{0,0}}, color={0,0,255}));
  connect(tGTypeI.pm, order6Type2_Inputs_Outputs.pm) annotation (Line(points={{
          -53.9083,-40.615},{-70,-40.615},{-70,-10},{-61,-10}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=false,
        grid={1,1},
        initialScale=0.1)),
    Icon(coordinateSystem(extent={{-100,-100},{140,120}},
        preserveAspectRatio=false,
        grid={5,5},
        initialScale=0.1)),
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
</html>"));
end TGTypeI_Test;
