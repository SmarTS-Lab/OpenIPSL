within iPSL.Examples.Controls.PSAT.AVR;
model AVRTypeII_Test
  extends iPSL.Examples.BaseTest;
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
         annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Blocks.Sources.Constant imSetPoint(k=1) annotation (Placement(transformation(extent={{-100,3},
            {-90,13}})));
  iPSL.Electrical.Controls.PSAT.AVR.AVRTypeII exciter_Type_II(
    vref0=1,
    vrmin=-5,
    vrmax=5,
    Ta=0.1,
    Te=1,
    Tr=0.001,
    Ae=0.0006,
    Be=0.9,
    Kf=0.45,
    Tf=1,
    Ka=400,
    vf0=1.064,
    Ke=0.01) annotation (Placement(transformation(extent={{-80,-5},{-58,11}})));
equation
  connect(exciter_Type_II.vf, order6Type2_Inputs_Outputs.vf) annotation (Line(
        points={{-59.65,5.08},{-50.325,5.08},{-50.325,5},{-40,5}}, color={0,0,
          127}));
  connect(imSetPoint.y, exciter_Type_II.vref) annotation (Line(points={{-89.5,8},
          {-77.8,8},{-77.8,7.32}}, color={0,0,127}));
  connect(exciter_Type_II.v, order6Type2_Inputs_Outputs.v) annotation (Line(
        points={{-77.8,2.2},{-86,2.2},{-86,-17},{-16,-17},{-16,3},{-19,3}},
        color={0,0,127}));
  connect(order6Type2_Inputs_Outputs.p, bus.p) annotation (Line(points={{-19,
          0.04964},{-9.5,0.04964},{-9.5,0},{0,0}}, color={0,0,255}));
  connect(order6Type2_Inputs_Outputs.pm0, order6Type2_Inputs_Outputs.pm)
    annotation (Line(points={{-38,-11},{-38,-14},{-45,-14},{-45,-5},{-40,-5}},
        color={0,0,127}));
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
end AVRTypeII_Test;
