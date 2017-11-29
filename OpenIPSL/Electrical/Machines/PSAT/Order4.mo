within OpenIPSL.Electrical.Machines.PSAT;
model Order4 "Fourth Order Synchronous Machine with Inputs and Outputs"
  extends BaseClasses.baseMachine(vf(start=vf00), xq0=xq);
  parameter Real xd=1.9 "d-axis synchronous reactance (pu)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real xq=1.7 "q-axis synchronous reactance (pu)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real x1q=0.5 "q-axis transient reactance (pu)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real T1d0=8 "d-axis open circuit transient time constant (s)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real T1q0=0.8 "q-axis open circuit transient time constant (s)"
    annotation (Dialog(group="Machine parameters"));
  Real e1q(start=e1q0) "q-axis transient voltage (pu)";
  Real e1d(start=e1d0) "d-axis transient voltage (pu)";
protected
  parameter Real vf00=V_MBtoSB*(e1q0 + (xd - x1d)*id0) "Init. val. (pu, SB)";
  parameter Real e1q0=vq0 + ra*iq0 + x1d*id0 "Initialization";
  parameter Real e1d0=vd0 + ra*id0 - x1q*iq0 "Initialization";
initial equation
  der(e1q) = 0;

equation
  der(e1q) = ((-e1q) - (xd - x1d)*id + vf_MB)/T1d0;
  if xq <> x1q then
    // safe-guard against division by zero.
    der(e1d) = ((-e1d) + (xq - x1q)*iq)/T1q0 "differential equations *";
  else
    der(e1d) = (-e1d)/T1q0 "differential equations *";
  end if;
  e1q = vq + ra*iq + x1d*id;
  e1d = vd + ra*id - x1q*iq "relation between voltages and currents *";
  vf0 = vf00;
  annotation (Icon(coordinateSystem(extent={{-100,-100},{100,100}},
          initialScale=0.1), graphics={Text(
          origin={0,60},
          extent={{-60,-20},{60,20}},
          lineColor={28,108,200},
          textString="Order IV")}), Documentation(info="<html>
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
</html>"));
end Order4;
