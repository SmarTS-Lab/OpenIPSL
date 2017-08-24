within OpenIPSL.Electrical.Wind.PSSE.WT1G;
model IIIorderWind "IM order III"
  constant Real pi=Modelica.Constants.pi;
  parameter Real wbase=2*pi*60 "System base speed";
  parameter Real Rs=0 "Stator resistance";
  parameter Real X;
  parameter Real Xp;
  parameter Real T;
  parameter Real Hm=1;
  parameter Real p0;
  parameter Real q0 "Actual reactive power consumption";
  parameter Real S0;
  parameter Real v0 "Power flow, node voltage";
  parameter Real anglev0 "Power flow, node angle";
  parameter Real CoB;
  parameter Real epm0=(K1*(X - Xp)*ir0 + (X - Xp)*(-1)*ii0)/K2;
  parameter Real epr0=(K1*(X - Xp)*(-1)*ii0 - (X - Xp)*ir0)/K2;
  Real v(start=v0) "Bus voltage magnitude";
  Real anglev(start=anglev0) " Bus voltage angle";
  Real s(start=S0);
  Real Te;
  Real P(start=p0);
  Real Q(start=q0);
  Real Vr;
  Real Vm;
  Real Vq;
  Real Vd;
  Real Ir;
  Real Im;
  Real epr(start=epr0);
  Real epm(start=epm0);
  Real epq(start=epr0);
  Real epd(start=epm0);
  Real I;
  Real anglei;
  OpenIPSL.Interfaces.PwPin p(
    vr(start=vr0),
    vi(start=vi0),
    ir(start=ir0),
    ii(start=ii0)) annotation (Placement(transformation(extent={{74,-10},{94,10}})));
protected
  parameter Real vr0=v0*cos(anglev0);
  parameter Real vi0=v0*sin(anglev0);
  parameter Real ir0=(p0*vr0 + q0*vi0)/(vr0^2 + vi0^2);
  parameter Real ii0=(p0*vi0 - q0*vr0)/(vr0^2 + vi0^2);
  parameter Real i2=ir0*ir0 + ii0*ii0;
  parameter Real a03=Rs*Rs + Xp*Xp;
  //r1^2+(xS +xR1xm/(xR1 + xm))^2
  parameter Real a13=Rs/a03;
  parameter Real a23=Xp/a03;
  parameter Real K2=1 + T*T*wbase*wbase*S0*S0;
  parameter Real K1=T*wbase*S0;
initial equation
  der(s) = 0;
  der(epr) = 0;
  der(epm) = 0;
equation
  anglev = atan2(p.vi, p.vr);
  anglei = atan2(p.ii, p.ir);
  v = sqrt(p.vr^2 + p.vi^2);
  I = sqrt(p.ii^2 + p.ir^2);
  Vq = Vr;
  Vd = Vm;
  epq = epr;
  epd = epm;
  Vr = p.vi;
  Vm = p.vr;
  Im*CoB = p.ir;
  Ir*CoB = p.ii;
  -P = p.vr*p.ir + p.vi*p.ii;
  -Q = (-p.vr*p.ii) + p.vi*p.ir;
  der(s) = (p0 - Te)/(2*Hm);
  Te = epr*Ir + epm*Im;
  der(epr) = wbase*s*epm - (epr + (X - Xp)*(-1)*Im)/T;
  der(epm) = (-wbase*s*epr) - (epm - (X - Xp)*(-1)*Ir)/T;
  Im = (-a23*(-1)*((-Vr) - epr)) + a13*(-1)*(Vm - epm);
  Ir = a13*(-1)*((-Vr) - epr) + a23*(-1)*(Vm - epm);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Rectangle(
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
          lineColor={0,0,0})}), Documentation(revisions="<html>
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
end IIIorderWind;
