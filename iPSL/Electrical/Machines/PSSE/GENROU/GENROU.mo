within iPSL.Electrical.Machines.PSSE.GENROU;


model GENROU "ROUND ROTOR GENERATOR MODEL (QUADRATIC SATURATION)"
  extends iPSL.Electrical.Essentials.pfComponent;
  //Import of dependencies
  import Complex;
  import Modelica.ComplexMath.arg;
  import Modelica.ComplexMath.real;
  import Modelica.ComplexMath.imag;
  import Modelica.ComplexMath.'abs';
  import Modelica.ComplexMath.conj;
  import Modelica.ComplexMath.fromPolar;
  import iPSL.NonElectrical.Functions.SE;
  import Modelica.Constants.pi;
  extends BaseClasses.baseMachine(
    w(start=0),
    EFD(start=efd0),
    XADIFD(start=efd0),
    PMECH(start=pm0),
    ANGLE(start=delta0),
    delta(start=delta0),
    id(start=id0),
    iq(start=iq0),
    ud(start=ud0),
    uq(start=uq0),
    Te(start=pm0));
  //Machine parameters
  parameter Real Xpq "Sub-transient reactance (pu)" annotation (Dialog(group="Machine parameters"));
  parameter Real Tpq0 "q-axis transient open-circuit time constant (s)" annotation (Dialog(group="Machine parameters"));
  parameter Real Xpp=Xppd "Sub-transient reactance (pu)" annotation (Dialog(group="Machine parameters"));
  Real Epd(start=Epd0) "d-axis voltage behind transient reactance (pu)";
  Real Epq(start=Epq0) "q-axis voltage behind transient reactance ";
  Real PSIkd(start=PSIkd0) "d-axis rotor flux linkage (pu)";
  Real PSIkq(start=PSIkq0) "q-axis rotor flux linkage (pu)";
  //State variables
  Real PSId(start=PSId0) "d-axis flux linkage (pu)";
  Real PSIq(start=PSIq0) "q-axis flux linkage (pu)";
  Real PSIppd(start=PSIppd0) "d-axis subtransient flux linkage (pu)";
  Real PSIppq(start=PSIppq0) "q-axis subtransient flux linkage (pu)";
  Real PSIpp "Air-gap flux (pu)";
  Real XadIfd(start=efd0) "d-axis machine field current (pu)";
  Real XaqIlq(start=0) "q-axis Machine field current (pu)";
protected
  parameter Complex Zs(re=R_a, im=Xpp) "Equivalent impedance";
  parameter Complex VT(re=V_0*cos(anglev_rad), im=V_0*sin(anglev_rad)) "Complex terminal voltage";
  parameter Complex S(re=p0, im=q0) "Complex power on machine base";
  parameter Complex It=conj(S/VT) "Complex current, machine base";
  parameter Complex Is=It + VT/Zs "Equivalent internal current source";
  parameter Complex PSIpp0=Zs*Is "Sub-transient flux linkage in stator reference frame";
  parameter Real ang_PSIpp0=arg(PSIpp0) "flux angle";
  parameter Real ang_It=arg(It) "current angle";
  parameter Real ang_PSIpp0andIt=ang_PSIpp0 - ang_It "angle difference";
  parameter Real abs_PSIpp0='abs'(PSIpp0) "magnitude of sub-transient flux linkage";
  parameter Real dsat=SE(
      abs_PSIpp0,
      S10,
      S12,
      1,
      1.2) "To include saturation of during initialization";
  parameter Real a=abs_PSIpp0 + abs_PSIpp0*dsat*(Xq - Xl)/(Xd - Xl);
  parameter Real b=(It.re^2 + It.im^2)^0.5*(Xpp - Xq);
  //Initializion rotor angle position
  parameter Real delta0=atan(b*cos(ang_PSIpp0andIt)/(b*sin(ang_PSIpp0andIt) - a)) + ang_PSIpp0 "intial rotor angle in radians";
  parameter Complex DQ_dq(re=cos(delta0), im=-sin(delta0)) "Parks transformation, from stator to rotor reference frame";
  parameter Complex PSIpp0_dq=PSIpp0*DQ_dq "Flux linkage in rotor reference frame";
  parameter Complex I_dq=conj(It*DQ_dq);
  //"The terminal current in rotor reference frame"
  parameter Real PSIppq0=imag(PSIpp0_dq) "q-axis component of the sub-transient flux linkage";
  parameter Real PSIppd0=real(PSIpp0_dq) "d-axis component of the sub-transient flux linkage";
  //Initialization of current and voltage components in rotor reference frame (dq-axes).
  parameter Real delta1=delta0*180/pi "rotor angle in degrees";
  parameter Real iq0=real(I_dq) "q-axis component of intitial current";
  parameter Real id0=imag(I_dq) "d-axis component of intitial current";
  parameter Real ud0=(-(PSIppq0 - Xppq*iq0)) - R_a*id0 "d-axis component of intitial voltage";
  parameter Real uq0=PSIppd0 - Xppd*id0 - R_a*iq0 "q-axis component of intitial voltage";
  //Initialization current and voltage components in synchronous reference frame.
  parameter Real vr0=V_0*cos(anglev_rad) "Real component of initial terminal voltage";
  parameter Real vi0=V_0*sin(anglev_rad) "Imaginary component of intitial terminal voltage";
  parameter Real ir0=-CoB*(p0*vr0 + q0*vi0)/(vr0^2 + vi0^2) "Real component of initial armature current, systembase";
  parameter Real ii0=-CoB*(p0*vi0 - q0*vr0)/(vr0^2 + vi0^2) "Imaginary component of initial armature current, systembase";
  //Initialization mechanical power and field voltage.
  parameter Real pm0=p0 + R_a*iq0*iq0 + R_a*id0*id0 "Initial mechanical power, machine base";
  parameter Real efd0=dsat*PSIppd0 + PSIppd0 + (Xpd - Xpp)*id0 + (Xd - Xpd)*id0 "Initial field voltage magnitude";
  parameter Real Epq0=PSIkd0 + (Xpd - Xl)*id0;
  parameter Real Epd0=PSIkq0 - (Xpq - Xl)*iq0;
  //Initialize remaining states:
  parameter Real PSIkd0=(PSIppd0 - (Xpd - Xl)*K3d*id0)/(K3d + K4d) "d-axis initial rotor flux linkage";
  parameter Real PSIkq0=((-PSIppq0) + (Xpq - Xl)*K3q*iq0)/(K3q + K4q) "q-axis initial rotor flux linkage";
  parameter Real PSId0=PSIppd0 - Xppd*id0;
  parameter Real PSIq0=-PSIppq0 - Xppq*iq0;
  // Constants
  parameter Real K1d=(Xpd - Xppd)*(Xd - Xpd)/(Xpd - Xl)^2;
  parameter Real K2d=(Xpd - Xl)*(Xppd - Xl)/(Xpd - Xppd);
  parameter Real K1q=(Xpq - Xppq)*(Xq - Xpq)/(Xpq - Xl)^2;
  parameter Real K2q=(Xpq - Xl)*(Xppq - Xl)/(Xpq - Xppq);
  parameter Real K3d=(Xppd - Xl)/(Xpd - Xl);
  parameter Real K4d=(Xpd - Xppd)/(Xpd - Xl);
  parameter Real K3q=(Xppq - Xl)/(Xpq - Xl);
  parameter Real K4q=(Xpq - Xppq)/(Xpq - Xl);
  parameter Real CoB=M_b/S_b "Constant to change from system base to machine base";
initial equation
  der(Epd) = 0;
  der(Epq) = 0;
  der(PSIkd) = 0;
  der(PSIkq) = 0;
  delta = delta0;
  w = 0;
equation
  //Interfacing outputs with the internal variables
  XADIFD = XadIfd;
  ISORCE = XadIfd;
  EFD0 = efd0;
  PMECH0 = pm0;
  der(Epq) = 1/Tpd0*(EFD - XadIfd);
  der(Epd) = 1/Tpq0*(-1)*XaqIlq;
  der(PSIkd) = 1/Tppd0*(Epq - PSIkd - (Xpd - Xl)*id);
  der(PSIkq) = 1/Tppq0*(Epd - PSIkq + (Xpq - Xl)*iq);
  Te = PSId*iq - PSIq*id;
  PSId = PSIppd - Xppd*id;
  PSIq = (-PSIppq) - Xppq*iq;
  PSIppd = Epq*K3d + PSIkd*K4d;
  -PSIppq = (-Epd*K3q) - PSIkq*K4q;
  PSIpp = sqrt(PSIppd*PSIppd + PSIppq*PSIppq);
  XadIfd = K1d*(Epq - PSIkd - (Xpd - Xl)*id) + Epq + id*(Xd - Xpd) + SE(
    PSIpp,
    S10,
    S12,
    1,
    1.2)*PSIppd;
  XaqIlq = K1q*(Epd - PSIkq + (Xpq - Xl)*iq) + Epd - iq*(Xq - Xpq) - SE(
    PSIpp,
    S10,
    S12,
    1,
    1.2)*(-1)*PSIppq*(Xq - Xl)/(Xd - Xl);
  //change sign for PSIppq 3/3
  ud = (-PSIq) - R_a*id;
  uq = PSId - R_a*iq;
  //flow
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Text(
          extent={{-54,24},{54,-26}},
          lineColor={0,0,255},
          textString="GENROU")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSS/E Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>Unknown</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Mengjia Zhang,SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
end GENROU;
