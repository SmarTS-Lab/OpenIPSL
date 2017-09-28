within OpenIPSL.Electrical.Machines.PSAT;
model MotorTypeIII "Induction Machine - Order III"
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  parameter Integer Sup=1 "Start up control" annotation (Dialog(group=
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
  parameter Real Hm=3 "Inertia constant (s)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real a=0.25 "1st coefficient of tau_m(w) (pu)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real b=0.00 "2nd coefficient of tau_m(w) (pu)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real c=0.00 "3rd coefficient of tau_m(w) (pu)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real tup=0 "Start up time (s)"
    annotation (Dialog(group="Machine parameters"));
  Real v(start=V_0) "Bus voltage magnitude";
  Real anglev(start=angle_0) " Bus voltage angle";
  Real s(start=S0);
  Real Tm;
  Real Te;
  Real P(start=P_0);
  Real Q(start=Q_0);
  Real Vr;
  Real Vm;
  Real Ir;
  Real Im;
  Real epr(start=epr0);
  Real epm(start=epm0);
  Real I;
  Real anglei;
  OpenIPSL.Interfaces.PwPin p(
    vr(start=vr0),
    vi(start=vi0),
    ir(start=ir0),
    ii(start=ii0))
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
protected
  constant Real pi=Modelica.Constants.pi;
  parameter Real Omegab=2*pi*fn "Base freq in rad/s";
  parameter Real vr0=V_0*cos(angle_0);
  parameter Real vi0=V_0*sin(angle_0);
  parameter Real ir0=(P_0*vr0 + Q_0*vi0)/(vr0^2 + vi0^2);
  parameter Real ii0=(P_0*vi0 - Q_0*vr0)/(vr0^2 + vi0^2);
  parameter Real i2=ir0*ir0 + ii0*ii0;
  parameter Real A=a + b + c;
  parameter Real B=(-b) - 2*c;
  parameter Real C=c;
  parameter Real X0=Xs + Xm;
  parameter Real Xp=Xs + Xr1*Xm/(Xr1 + Xm);
  parameter Real Tp0=(Xr1 + Xm)/(Omegab*Rr1);
  parameter Real RZs2=1/(Rs*Rs + Xp*Xp);
  parameter Real K=Rr1/((Xr1 + Xm)*A);
  parameter Real K2=1 + Tp0*Tp0*Omegab*Omegab*S0*S0;
  parameter Real K1=Tp0*Omegab*S0;
  parameter Real a03=Rs*Rs + Xp*Xp;
  //r1^2+(xS +xR1xm/(xR1 + xm))^2
  parameter Real a13=Rs/a03;
  parameter Real a23=Xp/a03;
  parameter Real S0=K*((-Q_0) + X0*i2);
  parameter Real epm0=(K1*(X0 - Xp)*ir0 + (X0 - Xp)*(-1)*ii0)/K2;
  parameter Real epr0=(K1*(X0 - Xp)*(-1)*ii0 - (X0 - Xp)*ir0)/K2;
initial equation
  der(s) = 0;
  der(epr) = 0;
  der(epm) = 0;
equation
  anglev = atan2(p.vi, p.vr);
  anglei = atan2(p.ii, p.ir);
  v = sqrt(p.vr^2 + p.vi^2);
  I = sqrt(p.ii^2 + p.ir^2);
  Vr = p.vi;
  Vm = p.vr;
  Im = p.ir;
  Ir = -p.ii;
  P = p.vr*p.ir + p.vi*p.ii;
  Q = (-p.vr*p.ii) + p.vi*p.ir;
  der(s) = (Tm - Te)/(2*Hm);
  Tm = A + B*s + C*s*s;
  Te = epr*Ir + epm*Im;
  der(epr) = Omegab*s*epm - (epr + (X0 - Xp)*Im)/Tp0;
  der(epm) = (-Omegab*s*epr) - (epm - (X0 - Xp)*Ir)/Tp0;
  Im = (-a23*((-Vr) - epr)) + a13*(Vm - epm);
  Ir = a13*((-Vr) - epr) + a23*(Vm - epm);
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
</html>"));
end MotorTypeIII;
