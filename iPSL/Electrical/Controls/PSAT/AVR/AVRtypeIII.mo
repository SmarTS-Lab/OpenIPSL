within iPSL.Electrical.Controls.PSAT.AVR;
model AVRtypeIII
  parameter Real vref=1;
  parameter Real v0=1 "initial voltage after power flow";
  parameter Real vfmax=5;
  parameter Real vfmin=-5;
  parameter Real K0=20 "regulator gain";
  parameter Real T2=0.1 "regulator pole";
  parameter Real T1=0.45 "Regulator zero";
  parameter Real Te=0.1 "Field circuit time constant";
  parameter Real vf0 "Initial field voltage";
  parameter Real Tr=0.0015 "Measurement time constant";
  parameter Real s0;
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
        origin={-157.972,50},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0),
      iconTransformation(
        origin={-120.0,50.0},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput vf annotation (Placement(
      visible=true,
      transformation(
        origin={160,0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0),
      iconTransformation(
        origin={110.0,0.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput vs annotation (Placement(transformation(extent={{-140,-60},{-100,-20}}), iconTransformation(extent={{-140,-60},{-100,-20}})));
initial equation
  vf1 = vf0;
  vm = v0;
  vr = K0*(1 - T1/T2)*(vref + vs - vm);
equation
  der(vm) = (v - vm)/Tr;
  der(vr) = (K0*(1 - T1/T2)*(vref + vs - vm) - vr)/T2;
  der(vf1) = ((vr + K0*(T1/T2)*(vref + vs - vm) + vf0)*(1 + s0*(v/v0 - 1)) - vf1)/Te;
  limiter1.u = vf1;
  limiter1.y = vf;
  annotation (
    Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={10,10}), graphics={Rectangle(
          visible=true,
          fillColor={255,255,255},
          extent={{-100.0,-100.0},{100.0,100.0}}),Text(
          visible=true,
          origin={1.5941,2.9728},
          fillPattern=FillPattern.Solid,
          extent={{-31.5941,-24.9719},{31.5941,24.9719}},
          textString="AVRtypeIII",
          fontName="Arial"),Text(
          visible=true,
          origin={-77.3525,52.4473},
          fillPattern=FillPattern.Solid,
          extent={{-17.3525,-17.5527},{17.3525,17.5527}},
          textString="v",
          fontName="Arial"),Text(
          visible=true,
          origin={-74.7671,-32.7013},
          fillPattern=FillPattern.Solid,
          extent={{-11.7427,-9.8104},{11.7427,9.8104}},
          textString="vf0",
          fontName="Arial"),Text(
          visible=true,
          origin={84.2416,-0.0},
          fillPattern=FillPattern.Solid,
          extent={{-8.7313,-11.5403},{8.7313,11.5403}},
          textString="vf",
          fontName="Arial")}),
    Diagram(coordinateSystem(
        extent={{-148.5,-105},{148.5,105}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={5,5})),
    Documentation(info="<html>
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
</html>", revisions="<html>
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
end AVRtypeIII;
