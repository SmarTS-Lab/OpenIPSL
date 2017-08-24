within OpenIPSL.Electrical.Machines.PSAT;
model Order5_Type2
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
  parameter Real xd2=0.204 "d-axis sub-transient reactance (pu)" annotation (Dialog(group="Machine parameters"));
  parameter Real xq2=0.3 "q-axis sub-transient reactance (pu)" annotation (Dialog(group="Machine parameters"));
  parameter Real Td10=8 "d-axis open circuit transient time constant (s)" annotation (Dialog(group="Machine parameters"));
  parameter Real Td20=0.8 "d-axis open circuit transient time constant (s)" annotation (Dialog(group="Machine parameters"));
  parameter Real Tq20=0.02 "q-axis open circuit transient time constant (s)" annotation (Dialog(group="Machine parameters"));
  parameter Real Taa=0.002 "d-axis aditional leakage time constant (s)" annotation (Dialog(group="Machine parameters"));
  Real e1q(start=e1q0) "q-axis transient voltage";
  Real e2q(start=e2q0) "q-axis sub-transient voltage";
  Real e2d(start=e2d0) "d-axis sub-transient voltage";
protected
  parameter Real Xd=xd*CoB "d-axis reactance, p.u.";
  parameter Real x2d=xd2*CoB "d-axis sub-transient reactance, p.u.(only for V.2,VI,VIII)";
  parameter Real Xq=xq*CoB "q-axis reactance, p.u.";
  parameter Real x2q=xq2*CoB "q-axis sub-trasient reactance, p.u.(only for V.2,VI,VIII)";
  parameter Real delta0=atan2(vi0 + Ra*ii0 + Xq*ir0, vr0 + Ra*ir0 - Xq*ii0) "Initialitation";
  parameter Real vd0=vr0*cos(pi/2 - delta0) - vi0*sin(pi/2 - delta0) "Initialitation";
  parameter Real vq0=vr0*sin(pi/2 - delta0) + vi0*cos(pi/2 - delta0) "Initialitation";
  parameter Real id0=ir0*cos(pi/2 - delta0) - ii0*sin(pi/2 - delta0) "Initialitation";
  parameter Real iq0=ir0*sin(pi/2 - delta0) + ii0*cos(pi/2 - delta0) "Initialitation";
  parameter Real pm00=(vq0 + Ra*iq0)*iq0 + (vd0 + Ra*id0)*id0 "Initialitation";
  parameter Real e2q0=vq0 + Ra*iq0 + x2d*id0 "Initialitation";
  parameter Real e2d0=vd0 + Ra*id0 - x2q*iq0 "Initialitation";
  parameter Real K1=Xd - x1d - Td20/Td10*x2d/x1d*(Xd - x1d);
  parameter Real K2=x1d - x2d + Td20/Td10*x2d/x1d*(Xd - x1d);
  parameter Real e1q0=(-K1*Taa/Td10*id0) + (1 - Taa/Td10)*(e2q0 + K2*id0);
  parameter Real vf00=(K1*id0 + e1q0)/(1 - Taa/Td10);
equation
  der(e1q) = ((-e1q) - (Xd - x1d - Td20/Td10*x2d/x1d*(Xd - x1d))*id + (1 - Taa/Td10)*vf)/Td10;
  der(e2d) = ((-e2d) + (Xq - x2q)*iq)/Tq20;
  der(e2q) = ((-e2q) + e1q - (x1d - x2d + Td20/Td10*x2d/x1d*(Xd - x1d))*id + Taa/Td10*vf)/Td20 "differential equations";
  e2q = vq + Ra*iq + x2d*id;
  e2d = vd + Ra*id - x2q*iq "relation between voltages and currents";
  pm0 = pm00;
  vf0 = vf00;
  annotation (
    Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        initialScale=0.1),
                       graphics={Rectangle(
          visible=true,
          fillColor={255,255,255},
          extent={{-100.0,-100.0},{100.0,100.0}}),Text(
          origin={0,60},
          extent={{-60,-20},{60,20}},
          lineColor={28,108,200},
          textString="Order IV - Typ 2")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Generator Order V Type 2, PSAT Manual</td>
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
</html>"));
end Order5_Type2;
