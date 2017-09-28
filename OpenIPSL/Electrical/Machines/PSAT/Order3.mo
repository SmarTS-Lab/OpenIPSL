within OpenIPSL.Electrical.Machines.PSAT;
model Order3 "Third Order Synchronous Machine with Inputs and Outputs"
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
  parameter Real xd "d-axis synchronous reactance (pu)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real Td10 "d-axis open circuit transient time constant (s)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real xq "q-axis synchronous reactance (pu)"
    annotation (Dialog(group="Machine parameters"));
  //Base changing
  Real e1q(start=e1q0) "q-axis transient voltage (pu)";
protected
  parameter Real Xd=xd*CoB "d-axis reactance, p.u.";
  parameter Real x1d=xd1*CoB "d-axis transient reactance, p.u.";
  parameter Real Xq=xq*CoB "q-axis reactance, p.u.";
  parameter Real m=M/CoB2 "Machanical starting time (2H), kWs/kVA";
  parameter Real c1=Ra*K "CONSTANT";
  parameter Real c2=x1d*K "CONSTANT";
  parameter Real c3=Xq*K " CONSTANT";
  parameter Real K=1/(Ra*Ra + Xq*x1d) "CONSTANT";
  parameter Real delta0=atan2(vi0 + Ra*ii0 + Xq*ir0, vr0 + Ra*ir0 - Xq*ii0)
    "Initialitation";
  parameter Real vd0=vr0*cos(pi/2 - delta0) - vi0*sin(pi/2 - delta0)
    "Initialitation";
  parameter Real vq0=vr0*sin(pi/2 - delta0) + vi0*cos(pi/2 - delta0)
    "Initialitation";
  parameter Real id0=ir0*cos(pi/2 - delta0) - ii0*sin(pi/2 - delta0)
    "Initialitation";
  parameter Real iq0=ir0*sin(pi/2 - delta0) + ii0*cos(pi/2 - delta0)
    "Initialitation";
  parameter Real pm00=(vq0 + Ra*iq0)*iq0 + (vd0 + Ra*id0)*id0 "Initialitation";
  parameter Real vf00=e1q0 + (Xd - x1d)*id0 "Initialitation";
  parameter Real e1q0=vq0 + Ra*iq0 + x1d*id0 "Initialitation";
initial equation
  der(e1q) = 0;
equation
  der(e1q) = ((-e1q) - (Xd - x1d)*id + vf)/Td10;
  id = (-c1*vd) - c3*vq + e1q*c3;
  iq = c2*vd - c1*vq + e1q*c1;
  vf0 = vf00;
  pm0 = pm00;
  annotation (Icon(coordinateSystem(extent={{-100,-100},{100,100}},
          initialScale=0.1), graphics={Text(
          origin={0,60},
          extent={{-60,-20},{60,20}},
          lineColor={28,108,200},
          textString="Order III")}), Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>Order III Synchonous Machine, PSAT Manual 2.1.8</p></td>
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
</html>"));
end Order3;
