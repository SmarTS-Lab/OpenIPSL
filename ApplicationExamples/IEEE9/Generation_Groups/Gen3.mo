within IEEE9.Generation_Groups;

model Gen3
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  parameter Real vf0=1.079018784709528;
  parameter Real vref0=1.095077501312303;
  parameter Real height_3 annotation (Dialog(group="AVR Disturbance"));
  parameter Real tstart_3 annotation (Dialog(group="AVR Disturbance"));
  parameter Boolean refdisturb_3 annotation (Dialog(group="AVR Disturbance"));
  OpenIPSL.Electrical.Machines.PSAT.Order4 gen(
    Sn=100,
    ra=0,
    xd=0.1460,
    xq=0.0969,
    xd1=0.0608,
    xq1=0.0969,
    Td10=8.96,
    Tq10=0.310,
    V_b=V_b,
    V_0=V_0,
    P_0=P_0,
    Q_0=Q_0,
    M=47.28,
    D=0,
    Vn=16.5,
    angle_0=angle_0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={28,14})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII AVR(
    vrmin=-5,
    vrmax=5,
    v0=V_0,
    vf0=vf0,
    vref0=vref0,
    Ka=20,
    Ta=0.2,
    Kf=0.063,
    Tf=0.35,
    Ke=1,
    Te=0.314,
    Tr=0.001,
    Ae=0.0039,
    Be=1.555) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-6,10})));
  Modelica.Blocks.Sources.Constant vref2(k=vref0) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-71,25})));
  Modelica.Blocks.Sources.Step step(
    startTime=tstart_3,
    height=height_3,
    offset=vref0) annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={-56,-2})));
  Modelica.Blocks.Logical.Switch switch1 annotation (Placement(transformation(extent={{-50,12},{-40,22}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=refdisturb_3) annotation (Placement(transformation(extent={{-80,2},{-70,12}})));
  OpenIPSL.Interfaces.PwPin pwPin annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  //Real P_MW;
  //Real Q_MVA;
equation
  //P_MW = gen.P*S_b;
  //Q_MVA = gen.Q*S_b;
  connect(gen.v, AVR.v) annotation (Line(
      points={{39,17},{48,17},{48,-14},{-22,-14},{-22,9},{-14,9}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch1.y, AVR.vref) annotation (Line(points={{-39.5,17},{-26.75,17},{-26.75,15.4},{-14,15.4}}, color={0,0,127}));
  connect(booleanConstant.y, switch1.u2) annotation (Line(points={{-69.5,7},{-66,7},{-66,17},{-51,17}}, color={255,0,255}));
  connect(vref2.y, switch1.u3) annotation (Line(points={{-65.5,25},{-60,25},{-60,13},{-51,13}}, color={0,0,127}));
  connect(step.y, switch1.u1) annotation (Line(points={{-56,2.4},{-56,21},{-51,21}}, color={0,0,127}));
  connect(gen.p, pwPin) annotation (Line(points={{39,14.0496},{66,14.0496},{66,0},{110,0}}, color={0,0,255}));
  connect(AVR.vf, gen.vf) annotation (Line(points={{2.5,12.6},{8,12.6},{8,19},{18,19}}, color={0,0,127}));
  connect(gen.pm0, gen.pm) annotation (Line(points={{20,3},{20,0},{14,0},{14,9},{18,9}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Ellipse(extent={{-100,-100},{100,100}}, lineColor={28,108,200}),Line(points={{-60,-20},{-20,20},{20,-20},
          {60,20}}, color={28,108,200}),Text(
          extent={{-34,-32},{38,-52}},
          lineColor={28,108,200},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="%name"),Text(
          extent={{62,106},{134,68}},
          lineColor={238,46,47},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString=DynamicSelect("0.0", String(P_MW, significantDigits=3))),Text(
          extent={{62,-70},{134,-108}},
          lineColor={0,255,0},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString=DynamicSelect("0.0", String(Q_MVA, significantDigits=3)))}),
    Documentation(revisions="<html>
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
end Gen3;
