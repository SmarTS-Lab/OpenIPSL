within OpenIPSL.Electrical.Machines.PSAT.FourthOrder;
model Order4 "Fourth Order Synchronous Machine with Inputs and Outputs"
  import Modelica.Constants.pi;
  extends BaseClasses.baseMachine(
    delta(start=delta0),
    pe(start=pm00),
    pm(start=pm00),
    pm0(start=pm00),
    vf(start=vf00),
    vf0(start=vf00),
    vq(start=vq0),
    vd(start=vd0),
    iq(start=iq0),
    id(start=id0));
  parameter Real xd=1.9 "d-axis synchronous reactance (pu)" annotation (Dialog(group="Machine parameters"));
  parameter Real xq=1.7 "q-axis synchronous reactance (pu)" annotation (Dialog(group="Machine parameters"));
  parameter Real xq1=0.5 "q-axis transient reactance (pu)" annotation (Dialog(group="Machine parameters"));
  parameter Real Td10=8 "d-axis open circuit transient time constant (s)" annotation (Dialog(group="Machine parameters"));
  parameter Real Tq10=0.8 "q-axis open circuit transient time constant (s)" annotation (Dialog(group="Machine parameters"));
  Real e1q(start=e1q0) "q-axis transient voltage (pu)";
  Real e1d(start=e1d0) "d-axis transient voltage (pu)";
protected
  parameter Real Xd=xd*CoB "d-axis reactance, p.u.";
  parameter Real Xq=xq*CoB "q-axis reactance, p.u.";
  parameter Real x1q=xq1*CoB
    "q-axis transient reactance, p.u.(only for order IV,V.1,VI,VIII)*";
  parameter Real vd0=vr0*cos(pi/2 - delta0) - vi0*sin(pi/2 - delta0)
    "Initialitation";
  parameter Real vq0=vr0*sin(pi/2 - delta0) + vi0*cos(pi/2 - delta0)
    "Initialitation";
  parameter Real id0=ir0*cos(pi/2 - delta0) - ii0*sin(pi/2 - delta0)
    "Initialitation";
  parameter Real iq0=ir0*sin(pi/2 - delta0) + ii0*cos(pi/2 - delta0)
    "Initialitation";
  parameter Real delta0=atan2(vi0 + Ra*ii0 + Xq*ir0, vr0 + Ra*ir0 - Xq*ii0)
    "Initialitation";
  parameter Real pm00=(vq0 + Ra*iq0)*iq0 + (vd0 + Ra*id0)*id0 "Initialitation";
  parameter Real vf00=e1q0 + (Xd - x1d)*id0 "Initialitation";
  parameter Real e1q0=vq0 + Ra*iq0 + x1d*id0 "Initialitation";
  parameter Real e1d0=vd0 + Ra*id0 - x1q*iq0 "Initialitation *";
equation
  der(e1q) = ((-e1q) - (Xd - x1d)*id + vf)/Td10;
  der(e1d) = ((-e1d) + (Xq - x1q)*iq)/Tq10 "differential equations *";
  e1q = vq + Ra*iq + x1d*id;
  e1d = vd + Ra*id - x1q*iq "relation between voltages and currents *";
  pm0 = pm00;
  vf0 = vf00;
  annotation (
    Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={10,10}), graphics={Text(
          origin={4,61.9022},
          fillPattern=FillPattern.Solid,
          extent={{-57.2101,-15.0},{57.2101,15.0}},
          fontName="Arial",
          lineColor={28,108,200},
          textString="Order IV")}),
    Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={5,5})),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Generator Order IV, PSAT Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-10-02</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Le Qi, SmarTS Lab, KTH Royal Institute of Technology</p></td>
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
end Order4;
