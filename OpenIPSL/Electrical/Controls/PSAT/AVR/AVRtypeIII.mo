within OpenIPSL.Electrical.Controls.PSAT.AVR;
model AVRtypeIII
  parameter Real vfmax=5;
  parameter Real vfmin=-5;
  parameter Real K0=20 "regulator gain";
  parameter Real T2=0.1 "regulator pole";
  parameter Real T1=0.45 "Regulator zero";
  parameter Real Te=0.1 "Field circuit time constant";
  parameter Real Tr=0.0015 "Measurement time constant";
  Real vm;
  Real vr;
  Real vf1;
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=vfmax, uMin=vfmin)
    annotation (Placement(visible=true, transformation(
        origin={5,0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput v(start=1) annotation (Placement(
      visible=true,
      transformation(
        origin={-119.972,50},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0),
      iconTransformation(
        origin={-110,60},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput vf annotation (Placement(
      visible=true,
      transformation(
        origin={130,0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0),
      iconTransformation(
        origin={130,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput vs annotation (Placement(transformation(extent={{-140,-82},{-100,-42}}), iconTransformation(extent={{-120,
            -70},{-100,-50}})));
  Modelica.Blocks.Interfaces.RealInput vf0(start=1) annotation (Placement(
      visible=true,
      transformation(
        origin={0.028,120},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=-90),
      iconTransformation(
        origin={0,110},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
protected
  parameter Real vref(fixed=false);
  parameter Real s0(fixed=false);
initial equation
  vref = v;
  s0 = vs;
  vf1 = vf0;
  vm = v;
  vr = K0*(1 - T1/T2)*(vref + vs - vm);
equation
  der(vm) = (v - vm)/Tr;
  der(vr) = (K0*(1 - T1/T2)*(vref + vs - vm) - vr)/T2;
  der(vf1) = ((vr + K0*(T1/T2)*(vref + vs - vm) + vf0)*(1 + s0*(v/vm - 1)) - vf1)/Te;
  limiter1.u = vf1;
  limiter1.y = vf;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-120,-120},{120,
            120}}),                                                                   graphics={
        Rectangle(
          extent={{-120,120},{120,-120}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-104,72},{-72,50}},
          lineColor={0,0,255},
          textString="v"),
        Text(
          extent={{-100,-48},{-68,-70}},
          lineColor={0,0,255},
          textString="vs"),
        Text(
          extent={{88,10},{120,-12}},
          lineColor={0,0,255},
          textString="vf"),
        Text(
          extent={{-34,36},{42,-24}},
          lineColor={0,0,255},
          textString="AVRTypeIII"),
        Text(
          extent={{-16,100},{16,78}},
          lineColor={0,0,255},
          textString="vf0")}),
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
", info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>AVR Type III, PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>September 2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"),
    Diagram(coordinateSystem(extent={{-120,-120},{120,120}})));
end AVRtypeIII;
