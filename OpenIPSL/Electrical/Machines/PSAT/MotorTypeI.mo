within OpenIPSL.Electrical.Machines.PSAT;
model MotorTypeI "Induction Machine - Order I"
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  parameter Integer Sup=1 "Start-up control" annotation (Dialog(group=
          "Machine parameters"), choices(choice=0, choice=1));
  parameter Real Rs=0.01 "Stator resistance (pu)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real Xs=0.15 "Stator reactance (pu)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real Rr1=0.05 "1st cage rotor resistance (pu)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real Xr1=0.15 "1st cage rotor reactance (pu)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real Xm=5 "Magnetizing reactance (pu)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real Hm=3 "Inertia constant (kWs/KVA)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real a=0.5 "1st coefficient of tau_m(w) (pu)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real b=0.00 "2nd coefficient of tau_m(w) (pu)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real c=0.00 "3rd coefficient of tau_m(w) (pu)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real tup=0 "Start up time (s)"
    annotation (Dialog(group="Machine parameters"));
  Real v(start=V_0) "Bus voltage magnitude";
  Real anglev(start=angle_0) " Bus voltage angle";
  Real s(start=Rr1*P_0*(Q_0 + V_0*V_0/Xm)/(V_0*V_0*V_0*V_0*(Xs + Xr1)));
  Real Tm;
  Real P(start=P_0);
  Real Q(start=Q_0);
  Real Re;
  OpenIPSL.Interfaces.PwPin p(
    vr(start=vr0),
    vi(start=vi0),
    ir(start=ir0),
    ii(start=ii0))
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
protected
  constant Real pi=Modelica.Constants.pi;
  parameter Real vr0=V_0*cos(angle_0);
  parameter Real vi0=V_0*sin(angle_0);
  parameter Real ir0=(P_0*vr0 + Q_0*vi0)/(vr0^2 + vi0^2);
  parameter Real ii0=(P_0*vi0 - Q_0*vr0)/(vr0^2 + vi0^2);
  parameter Real A=a + b + c;
  parameter Real B=(-b) - 2*c;
  parameter Real C=c;
  parameter Real Xe=Xs + Xr1;
initial equation
  der(s) = 0;
equation
  P = p.vr*p.ir + p.vi*p.ii;
  Q = (-p.vr*p.ii) + p.vi*p.ir;
  anglev = atan2(p.vi, p.vr);
  v = sqrt(p.vr^2 + p.vi^2);
  Tm = A + B*s + C*s*s;
  Re = Rs + Rr1/s;
  //s=Rr1/(Re-Rs);
  der(s) = (Tm - P)/(2*Hm);
  p.ii = (-p.vr/Xm) + (p.vi*Re - p.vr*Xe)/(Re*Re + Xe*Xe);
  p.ir = p.vi/Xm + (p.vr*Re + p.vi*Xe)/(Re*Re + Xe*Xe);
  annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
            {100,100}}), graphics={Rectangle(
          visible=true,
          fillColor={255,255,255},
          extent={{-100,-100},{100,100}}),Ellipse(
          visible=true,
          fillColor={255,255,255},
          extent={{-56,-58},{55.9318,54}}),Text(
          extent={{-50,48},{50,-52}},
          lineColor={0,0,0},
          textString="M"),Text(
          origin={0,-76.0978},
          fillPattern=FillPattern.Solid,
          extent={{-57.2101,-15.0},{57.2101,15.0}},
          fontName="Arial",
          textString="%name",
          lineColor={0,0,0})}), Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>Induction Machine, PSAT Manual 2.1.8</p></td>
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
</html>

<html>
<pre><span style=\"font-family: Courier New,courier; color: #006400;\">&nbsp;with&nbsp;the&nbsp;problem&nbsp;of&nbsp;a&nbsp;constant&nbsp;offset&nbsp;mismatch&nbsp;-0.00012</span></pre>
</html>"));
end MotorTypeI;
