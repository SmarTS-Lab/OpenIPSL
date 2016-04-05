within iPSL.Examples.Controls.PSAT.AVR;
model AVRTypeII_OEL_Test
  extends iPSL.Examples.BaseTest;
  iPSL.Electrical.Machines.PSAT.SixthOrder.Order6 order6Type2_Inputs_Outputs(
    Sn=Sn,
    Vn=Vn,
    V_b=Vbus,
    xd=xd0,
    xq=xq0,
    V_0=1,
    angle_0=0,
    P_0=0.160352698692006,
    Q_0=0.11859436505981,
    ra=0.001,
    xd1=0.302,
    M=10,
    D=0) annotation (Placement(transformation(extent={{-47,-15},{-17,15}})));
  iPSL.Electrical.Controls.PSAT.OEL.OEL oXL(
    vOELmax=0.05,
    xd=xd0,
    xq=xq0,
    iflim=2.7,
    T0=5) annotation (Placement(transformation(extent={{-21,24},{-45,44}})));
  parameter Real Sn=370 "Power rating, MVA";
  parameter Real Vn=400000 "Nominal voltage";
  parameter Real Vbus=400000 "Bus nominal voltage, change of base";
  parameter Real xd0=1.9 "d-axis reactance, p.u.";
  parameter Real xq0=1.7 "q-axis reactance, p.u.";
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
    Ke=0.01) annotation (Placement(transformation(extent={{-76,-5},{-56,15}})));
equation
  connect(exciter_Type_II.vf, order6Type2_Inputs_Outputs.vf) annotation (Line(
        points={{-57.5,7.6},{-52.75,7.6},{-52.75,7.5},{-47,7.5}}, color={0,0,127}));
  connect(order6Type2_Inputs_Outputs.pm, order6Type2_Inputs_Outputs.pm0)
    annotation (Line(points={{-47,-7.5},{-52,-7.5},{-52,-20},{-44,-20},{-44,-16.5}},
        color={0,0,127}));
  connect(oXL.v, order6Type2_Inputs_Outputs.v) annotation (Line(points={{-23.88,
          42.2},{-5,42.2},{-5,4.5},{-15.5,4.5}}, color={0,0,127}));
  connect(order6Type2_Inputs_Outputs.P, oXL.p) annotation (Line(points={{-15.5,
          -4.52423},{-10,-4.52423},{-10,38.7},{-23.88,38.7}},
                                                    color={0,0,127}));
  connect(order6Type2_Inputs_Outputs.Q, oXL.q) annotation (Line(points={{-15.5,-9},
          {-7,-9},{-7,34.9},{-23.88,34.9}}, color={0,0,127}));
  connect(exciter_Type_II.v, order6Type2_Inputs_Outputs.v) annotation (Line(
        points={{-74,4},{-83,4},{-83,20},{-5,20},{-5,4.5},{-15.5,4.5}}, color={0,
          0,127}));
  connect(order6Type2_Inputs_Outputs.p, bus.p) annotation (Line(points={{-15.5,
          0.07446},{-7.75,0.07446},{-7.75,0},{0,0}}, color={0,0,255}));
  connect(oXL.v_OXL, exciter_Type_II.vref) annotation (Line(points={{-42.6,36.2},
          {-79,36.2},{-79,10.4},{-74,10.4}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=false,
        grid={1,1},
        initialScale=0.1)),
    Icon(coordinateSystem(extent={{-100,-100},{140,100}},
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
end AVRTypeII_OEL_Test;
