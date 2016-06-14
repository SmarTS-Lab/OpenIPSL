within iPSL.Electrical.Controls.Eurostag;
model GOVER1 "Steam turbine governor. Developed by AIA. 2013"
  //update 14/03/2016
  //added initialization k1, k2, k3 of add3
  //added manually x_start
  parameter Real init_Integrator;
  parameter Real init_LeadLag;
  Modelica.Blocks.Sources.Constant imSetPoint(k=0) annotation (Placement(transformation(extent={{-92,22},{-74,40}})));
  Modelica.Blocks.Continuous.LimIntegrator imLimitedIntegrator(
    outMin=0,
    k=1,
    outMax=1.1,
    y_start=init_Integrator)
      annotation (Placement(transformation(extent={{-52,22},{-34,40}})));

  Modelica.Blocks.Sources.Constant imSetPoint1(k=25) annotation (Placement(transformation(extent={{-52,-38},{-30,-16}})));
  iPSL.NonElectrical.Continuous.LeadLag imLeadLag(
    K=1,
    T2=10,
    T1=3,
    y_start=init_LeadLag,
    x_start= init_LeadLag)
     annotation (Placement(transformation(extent={{40,2},{58,20}})));

  Modelica.Blocks.Interfaces.RealInput pin_OMEGA annotation (Placement(transformation(extent={{-81,0},{-61,20}}), iconTransformation(extent={{-81,0},{-61,20}})));
  Modelica.Blocks.Interfaces.RealOutput pin_CM annotation (Placement(transformation(extent={{79,0},{98,20}}), iconTransformation(extent={{79,0},{99,20}})));
  Modelica.Blocks.Math.Add3 add3_1(k1 = -25,k2 = 1,k3 = 1)  annotation (Placement(transformation(extent={{-10,0},{10,20}})));

equation
  connect(imSetPoint.y, imLimitedIntegrator.u) annotation (Line(points={{-73.1,31},
          {-63.55,31},{-63.55,31},{-53.8,31}},                                                                           color={0,0,127}));
  connect(imLimitedIntegrator.y,add3_1.u2) annotation (Line(points={{-33.1,31},{
          -22,31},{-22,10},{-12,10}},                                                                color={0,0,127}));
  connect(add3_1.u1, pin_OMEGA) annotation (Line(points={{-12,18},{-12,10},{-71,
          10}},                                                                       color={0,0,127}));
  connect(add3_1.u3, imSetPoint1.y) annotation (Line(points={{-12,2},{-20,2},{-20,
          -27},{-28.9,-27}},                                                                  color={0,0,127}));
  connect(add3_1.y, imLeadLag.u) annotation (Line(points={{11,10},{38.2,10},{38.2,
          11}},                                                                            color={0,0,127}));
  connect(imLeadLag.y, pin_CM) annotation (Line(points={{58.9,11},{70.45,11},{70.45,
          10},{88.5,10}},                                                                            color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Icon(graphics={Rectangle(extent={{-60,60},{80,-40}}, lineColor={0,0,255}),Text(
          extent={{-40,-2},{56,24}},
          lineColor={0,0,255},
          textString="GOVER1")}),
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
end GOVER1;
