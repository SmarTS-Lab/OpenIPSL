within Tutorial.Example_1.Generator;
model Step_3
  extends Tutorial.Support.Generator_Example;

  OpenIPSL.Electrical.Machines.PSAT.Order6 machine(
    Vn=400,
    ra=0.003,
    xd=1.81,
    xq=1.76,
    xd1=0.3,
    xq1=0.65,
    xd2=0.23,
    xq2=0.25,
    Td10=8,
    Tq10=1,
    Td20=0.03,
    Tq20=0.07,
    Taa=0.002,
    M=7,
    D=0,
    Sn=2220,
    V_b=V_b,
    V_0=V_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0) annotation (Placement(visible=true, transformation(extent={{16,-70},{76,-10}}, rotation=0)));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII avr(
    vfmax=7,
    vfmin=-6.40,
    K0=200,
    T2=1,
    T1=1,
    Te=0.0001,
    Tr=0.015) annotation (Placement(visible=true, transformation(extent={{-54,-46},{-14,-6}}, rotation=0)));
  Modelica.Blocks.Sources.Constant pss_off(k=0) annotation (Placement(visible=true, transformation(extent={{-98,-44},{-78,-24}}, rotation=0)));
equation
  connect(pss_off.y, avr.vs) annotation (Line(points={{-77,-34},{-58,-34}}, color={0,0,127}));
  connect(avr.v, machine.v) annotation (Line(points={{-58,-16},{-70,-16},{-70,6},{86,6},{86,-31},{82.5,-31},{79,-31}}, color={0,0,127}));
  connect(avr.vf, machine.vf) annotation (Line(points={{-12,-26},{16,-26},{16,-25}}, color={0,0,127}));
  connect(machine.pm, machine.pm0) annotation (Line(points={{16,-55},{6,-55},{-4,-55},{-4,-80},{22,-80},{22,-76.5},{22,-73}}, color={0,0,127}));
  connect(avr.vf0, machine.vf0) annotation (Line(points={{-34,-2},{-34,4},{22,4},{22,-7}}, color={0,0,127}));
  connect(machine.p, pwPin) annotation (Line(points={{79,-39.8511},{79,-40.9256},{110,-40.9256},{110,0}}, color={0,0,255}));
  annotation (Diagram(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={2,2}), graphics={Text(
          fillPattern=FillPattern.Solid,
          lineThickness=1,
          extent={{-92,104},{98,86}},
          textString="Step 4: Connecting model's signals",
          fontSize=15,
          textStyle={TextStyle.Bold}),Text(
          origin={0,-8},
          fillPattern=FillPattern.Solid,
          lineThickness=1,
          extent={{-94,60},{36,54}},
          fontSize=10,
          horizontalAlignment=TextAlignment.Left,
          lineColor={0,0,0},
          textString="1. Machine's terminal voltage to AVR's input signal

2. AVR's output field voltage to machine's input field voltage

3. Initially calculated mechanical power to input signal of the machine's
mechanical power

4. Machine's power terminal to the generator model power terminal

5. Constant pss_off to the PSS input at the AVR

6. Initial generator field voltage to initial AVR field voltage

7. Generator pin to External pin")}), Documentation(revisions="<html>
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
end Step_3;
