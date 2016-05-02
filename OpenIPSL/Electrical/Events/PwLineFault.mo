within OpenIPSL.Electrical.Events;
model PwLineFault "Transitory short-circuit on a line at the point of location from the sending node
   given by parameter k. A fictitious node is created with where a shunt impedance is connected only
   during a specified interval of time. Developed by AIA. 2015/03/20."
  OpenIPSL.Connectors.PwPin p annotation (Placement(transformation));
  OpenIPSL.Connectors.PwPin n annotation (Placement(transformation));
  parameter Real R1 "Resistance";
  parameter Real X1 "Conductance";
  parameter Real G1 "Shunt half conductance p.u.";
  parameter Real B1 "Shunt half susceptance p.u.";
  parameter Real k
    "Point of the line where the short circuit occurs (between 0.1 and 0.99)";
  parameter Real Rfault "Fault resistance";
  parameter Real Xfault "Fault reactance";
  parameter Real time_1 "Start time of the fault";
  parameter Real time_2 "End time of the fault";
  parameter Real V1_0 "Initial voltage magnitude at Sending node";
  parameter Real angle1_0 "Initial  voltage angle Sending node";
  parameter Real V2_0 "Initial voltage magnitude Receiving node";
  parameter Real angle2_0 "Initial voltage angle at Receiving node";
  parameter Complex Z(re=R1, im=X1);
  parameter Complex Y(re=G1, im=B1);
  parameter Complex V1(re=V1_0*cos(angle1_0*Modelica.Constants.pi/180), im=V1_0*sin(angle1_0*Modelica.Constants.pi/180));
  parameter Complex V2(re=V2_0*cos(angle2_0*Modelica.Constants.pi/180), im=V2_0*sin(angle2_0*Modelica.Constants.pi/180));
  parameter Complex V0fict=((1 - k)*V1 + k*V2)/(1 + k*(1 - k)*Z*Y);
  parameter Real V0fict_real=V0fict.re;
  parameter Real V0fict_img=V0fict.im;
  // FICTITIOUS BUS
  OpenIPSL.Electrical.Buses.Bus FICT(V_0=sqrt(V0fict_real^2 + V0fict_img^2), angle_0=atan2(V0fict_img, V0fict_real)) annotation (Placement(transformation));
  // THE ORIGINAL LINE IS SEPARATED IN TWO PARTS
  OpenIPSL.Electrical.Branches.PwLine_2 Line_1(
    R=k*R1,
    X=k*X1,
    G=k*G1,
    B=k*B1) annotation (Placement(transformation));
  OpenIPSL.Electrical.Branches.PwLine_2 Line_2(
    R=(1 - k)*R1,
    X=(1 - k)*X1,
    G=(1 - k)*G1,
    B=(1 - k)*B1) annotation (Placement(transformation));
  // FAULT ADDED TO FICTITIOUS BUS
  OpenIPSL.Electrical.Events.PwFault Fault(
    R=Rfault,
    X=Xfault,
    t1=time_1,
    t2=time_2) annotation (Placement(transformation));
equation
  connect(p, Line_1.p) annotation (Line);
  connect(Line_1.n, FICT.p) annotation (Line);
  connect(FICT.p, Line_2.p) annotation (Line);
  connect(Line_2.n, n) annotation (Line);
  connect(Fault.p, FICT.p) annotation (
    Icon(graphics={Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),Rectangle(
          extent={{-28,30},{12,10}},
          lineColor={0,0,0},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),Line(
          points={{12,20},{26,20},{26,-20}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{14,-20},{38,-20}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{16,-24},{36,-24}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{20,-28},{34,-28}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{22,-32},{30,-32}},
          color={0,0,255},
          smooth=Smooth.None),Rectangle(
          extent={{-38,22},{-28,18}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),Line(
          points={{-12,38},{-4,20},{-18,20},{-6,-2}},
          color={255,0,0},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{-12,0},{-6,-2},{-6,4}},
          color={255,0,0},
          smooth=Smooth.None)}),
    Diagram(graphics),
    uses(Modelica(version="3.2")));
  annotation (
    Diagram(coordinateSystem(extent={{-80,-100},{100,100}})),
    Icon(coordinateSystem(extent={{-80,-100},{100,100}})),
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
end PwLineFault;
