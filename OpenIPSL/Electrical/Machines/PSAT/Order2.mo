within OpenIPSL.Electrical.Machines.PSAT;
model Order2 "Second Order Synchronous Machine with Inputs and Outputs"
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
protected
  parameter Real c1=Ra*K "CONSTANT";
  parameter Real c2=x1d*K "CONSTANT";
  parameter Real c3=x1d*K " CONSTANT";
  parameter Real K=1/(Ra*Ra + x1d*x1d) "CONSTANT";
  parameter Real delta0=atan2(vi0 + Ra*ii0 + x1d*ir0, vr0 + Ra*ir0 - x1d*ii0) "Initial rotor angle";
  parameter Real pm00=(vq0 + Ra*iq0)*iq0 + (vd0 + Ra*id0)*id0 "Initialitation";
  parameter Real vf00=vq0 + Ra*iq0 + x1d*id0 "Initialitation";
  parameter Real vd0=vr0*cos(pi/2 - delta0) - vi0*sin(pi/2 - delta0) "Initialitation";
  parameter Real vq0=vr0*sin(pi/2 - delta0) + vi0*cos(pi/2 - delta0) "Initialitation";
  parameter Real id0=ir0*cos(pi/2 - delta0) - ii0*sin(pi/2 - delta0) "Initialitation";
  parameter Real iq0=ir0*sin(pi/2 - delta0) + ii0*cos(pi/2 - delta0) "Initialitation";
equation
  id = (-c1*vd) - c3*vq + vf*c3;
  iq = c2*vd - c1*vq + vf*c1;
  pm0 = pm00;
  vf0 = vf00;
  annotation (Documentation(info="<html> 
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"> 
<tr> 
<td><p>Reference</p></td> 
<td><p>Order II Synchonous Machine, PSAT Manual 2.1.8</p></td> 
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
    Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        initialScale=0.1),
                       graphics={Text(
          origin={0,60},
          extent={{-60,-20},{60,20}},
          lineColor={28,108,200},
          textString="Order II")}));
end Order2;
