within OpenIPSL.Electrical.Machines.PSAT;
model Order5_Type2
  extends BaseClasses.baseMachine(vf(start=vf00), xq0=xq);
  parameter Real xd=1.9 "d-axis synchronous reactance (pu)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real xq=1.7 "q-axis synchronous reactance (pu)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real x2d=0.204 "d-axis sub-transient reactance (pu)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real x2q=0.3 "q-axis sub-transient reactance (pu)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real T1d0=8 "d-axis open circuit transient time constant (s)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real T2d0=0.8 "d-axis open circuit transient time constant (s)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real T2q0=0.02 "q-axis open circuit transient time constant (s)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real Taa=0.002 "d-axis aditional leakage time constant (s)"
    annotation (Dialog(group="Machine parameters"));
  Real e1q(start=e1q0) "q-axis transient voltage";
  Real e2q(start=e2q0) "q-axis sub-transient voltage";
  Real e2d(start=e2d0) "d-axis sub-transient voltage";
protected
  parameter Real e2q0=vq0 + ra*iq0 + x2d*id0 "Initialitation";
  parameter Real e2d0=vd0 + ra*id0 - x2q*iq0 "Initialitation";
  parameter Real K1=xd - x1d - (T2d0*x2d*(xd - x1d))/(T1d0*x1d);
  parameter Real K2=x1d - x2d + (T2d0*x2d*(xd - x1d))/(T1d0*x1d);
  parameter Real e1q0=(-K1*Taa/T1d0*id0) + (1 - Taa/T1d0)*(e2q0 + K2*id0);
  parameter Real vf00=V_MBtoSB*(K1*id0 + e1q0)/(1 - Taa/T1d0)
    "Init. val. (pu, SB)";
initial equation
  //der(e1q) = 0;
  der(e2q) = 0;
  der(e2d) = 0;
equation
  der(e1q) = ((-e1q) - (xd - x1d - T2d0/T1d0*x2d/x1d*(xd - x1d))*id + (1 - Taa/
    T1d0)*vf_MB)/T1d0;
  der(e2d) = ((-e2d) + (xq - x2q)*iq)/T2q0;
  der(e2q) = ((-e2q) + e1q - (x1d - x2d + T2d0/T1d0*x2d/x1d*(xd - x1d))*id +
    Taa/T1d0*vf_MB)/T2d0 "differential equations";
  e2q = vq + ra*iq + x2d*id;
  e2d = vd + ra*id - x2q*iq "relation between voltages and currents";
  vf0 = vf00;
  annotation (Icon(coordinateSystem(extent={{-100,-100},{100,100}},
          initialScale=0.1), graphics={Rectangle(
          visible=true,
          fillColor={255,255,255},
          extent={{-100.0,-100.0},{100.0,100.0}}),Text(
          origin={0,60},
          extent={{-60,-20},{60,20}},
          lineColor={28,108,200},
          textString="Order V - Type 2")}), Documentation(info="<html>
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
