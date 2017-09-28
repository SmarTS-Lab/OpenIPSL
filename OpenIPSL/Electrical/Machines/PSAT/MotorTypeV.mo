within OpenIPSL.Electrical.Machines.PSAT;
model MotorTypeV "Induction Machine - Order V"
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
  parameter Real Rr2=0.001 "2nd cage rotor resistance (pu)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real Xr2=0.04 "2nd cage rotor reactance (pu)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real Xm=5 "Magnetizing reactance (pu)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real Hm=3 "Inertia constant (s)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real a=0.13 "1st coefficient of tau_m(w) (pu)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real b=0.02 "2nd coefficient of tau_m(w) (pu)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real c=0.024 "3rd coefficient of tau_m(w) (pu)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real tup=0 "Start up time"
    annotation (Dialog(group="Machine parameters"));
  Real v(start=V_0) "Bus voltage magnitude";
  Real anglev(start=angle_0) " Bus voltage angle";
  Real s(start=S0);
  //(start=Rr1*P_0*(Q_0+V_0*V_0/Xm)/(V_0*V_0*V_0*V_0*(Xs + Xr1)));
  Real Tm;
  Real Te;
  Real P(start=P_0);
  Real Q(start=Q_0);
  Real e1r(start=epr0);
  Real e1m(start=epm0);
  Real e2r(start=0.0353);
  Real e2m(start=0.9995);
  Real Vr;
  Real Vm;
  Real Ir;
  Real Im;
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
  parameter Real A=a + b + c;
  parameter Real B=(-b) - 2*c;
  parameter Real C=c;
  parameter Real X0=Xs + Xm;
  parameter Real X1=Xs + Xr1*Xm/(Xr1 + Xm);
  parameter Real T10=(Xr1 + Xm)/(Omegab*Rr1);
  parameter Real X2=Xs + Xr1*Xm*Xr2/(Xr1*Xr2 + Xr1*Xm + Xr2*Xm);
  parameter Real T20=(Xr2 + Xr1*Xm/(Xr1 + Xm))/(Omegab*Rr2);
  parameter Real a05=Rs^2 + X2^2;
  parameter Real a15=Rs/a05;
  parameter Real a25=X2/a05;
  parameter Real a35=X0 - X1;
  parameter Real a45=X1 - X2;
  parameter Real i2=ir0*ir0 + ii0*ii0;
  parameter Real K=Rr1/((Xr1 + Xm)*A);
  parameter Real K2=1 + T10*T10*Omegab*Omegab*S0*S0;
  parameter Real K1=T10*Omegab*S0;
  parameter Real S0=K*((-Q_0) + X0*i2);
  parameter Real epm0=(K1*(X0 - X1)*ir0 + (X0 - X1)*(-1)*ii0)/K2;
  parameter Real epr0=(K1*(X0 - X1)*(-1)*ii0 - (X0 - X1)*ir0)/K2;
initial equation
  der(e2r) = 0;
  der(e2m) = 0;
  der(s) = 0;
  der(e1r) = 0;
  der(e1m) = 0;
equation
  anglev = atan2(p.vi, p.vr);
  v = sqrt(p.vr^2 + p.vi^2);
  Vr = p.vi;
  Vm = p.vr;
  Im = p.ir;
  Ir = -p.ii;
  P = p.vr*p.ir + p.vi*p.ii;
  Q = (-p.vr*p.ii) + p.vi*p.ir;
  Ir = a15*((-Vr) - e2r) + a25*(Vm - e2m);
  Im = (-a25*((-Vr) - e2r)) + a15*(Vm - e2m);
  der(s) = (Tm - Te)/(2*Hm);
  Te = e2r*Ir + e2m*Im;
  der(e1r) = Omegab*s*e1m - (e1r + a35*Im)/T10;
  der(e1m) = (-Omegab*s*e1r) - (e1m - a35*Ir)/T10;
  der(e2r) = (-Omegab*s*(e1m - e2m)) + der(e1r) + (e1r - e2r - a45*Im)/T20;
  der(e2m) = Omegab*s*(e1r - e2r) + der(e1m) + (e1m - e2m + a45*Ir)/T20;
  Tm = A + B*s + C*s*s;
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
end MotorTypeV;
