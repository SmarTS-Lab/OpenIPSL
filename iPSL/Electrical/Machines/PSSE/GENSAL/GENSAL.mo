within iPSL.Electrical.Machines.PSSE.GENSAL;


model GENSAL "SALIENT POLE GENERATOR MODEL (QUADRATIC SATURATION ON D-AXIS)"
  // Import of Dependencies
  import iPSL.NonElectrical.Functions.SE;
  import Modelica.Constants.pi;
  import Complex;
  import Modelica.ComplexMath.arg;
  import Modelica.ComplexMath.real;
  import Modelica.ComplexMath.imag;
  import Modelica.ComplexMath.'abs';
  import Modelica.ComplexMath.conj;
  import Modelica.ComplexMath.fromPolar;
  //Extending machine base class
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
  Real Epq(start=Epq0) "q-axis voltage behind transient reactance (pu)";
  Real PSIkd(start=PSIkd0) "d-axis rotor flux linkage (pu)";
  Real PSIppq(start=PSIppq0) "q-axis subtransient flux linkage (pu)";
  Real PSIppd(start=PSIppd0) "d-axis subtransient flux linkage (pu)";
  Real PSId(start=PSId0) "d-axis flux linkage (pu)";
  Real PSIq(start=PSIq0) "q-axis flux linkage (pu)";
  Real XadIfd(start=efd0) "Machine field current (pu)";
protected
  parameter Complex Zs(re=R_a, im=Xppd) "Equivalent impedance";
  parameter Complex Is=It + VT/Zs;
  parameter Complex PSIpp0=Zs*Is;
  parameter Complex a(re=0, im=Xq - Xppd);
  parameter Complex Epqp=PSIpp0 + a*It;
  parameter Real delta0=arg(Epqp) "rotor angle in radians";
  parameter Complex VT(re=V_0*cos(anglev_rad), im=V_0*sin(anglev_rad)) "Complex terminal voltage";
  parameter Complex S(re=p0, im=q0) "Complex power on machine base";
  parameter Complex It=conj(S/VT) "Terminal current";
  parameter Complex DQ_dq(re=cos(delta0), im=-sin(delta0)) "Parks transformation";
  parameter Complex I_dq=conj(It*DQ_dq);
  //Initialization of current and voltage components in synchronous reference frame.
  parameter Real iq0=real(I_dq) "q-axis component of intitial current";
  parameter Real id0=imag(I_dq) "d-axis component of intitial current";
  parameter Real ud0=V_0*cos(anglev_rad - delta0 + pi/2) "d-axis component of intitial voltage";
  parameter Real uq0=V_0*sin(anglev_rad - delta0 + pi/2) "q-axis component of intitial voltage";
  parameter Complex PSIpp0_dq=PSIpp0*DQ_dq "Flux linkage in rotor reference frame";
  parameter Real PSIppq0=-imag(PSIpp0_dq) "q-axis component of the sub-transient flux linkage";
  parameter Real PSIppd0=real(PSIpp0_dq) "d-axis component of the sub-transient flux linkage";
  parameter Real PSIkd0=(PSIppd0 - (Xpd - Xl)*K3d*id0)/(K3d + K4d) "d-axis initial rotor flux linkage";
  parameter Real PSId0=PSIppd0 - Xppd*id0;
  parameter Real PSIq0=(-PSIppq0) - Xppq*iq0;
  //Initialization mechanical power and field voltage.
  parameter Real Epq0=uq0 + Xpd*id0 + R_a*iq0;
  parameter Real dsat=SE(
      Epq0,
      S10,
      S12,
      1,
      1.2);
  parameter Real efd0=Epq0*(1 + dsat) + (Xd - Xpd)*id0 "Initial field voltage magnitude";
  parameter Real pm0=p0 + R_a*iq0*iq0 + R_a*id0*id0 "Initial mechanical power, machine base";
  // Constants
  parameter Real K1d=(Xpd - Xppd)*(Xd - Xpd)/(Xpd - Xl)^2;
  parameter Real K2d=(Xpd - Xl)*(Xppd - Xl)/(Xpd - Xppd);
  parameter Real K3d=(Xppd - Xl)/(Xpd - Xl);
  parameter Real K4d=(Xpd - Xppd)/(Xpd - Xl);
initial equation
  der(Epq) = 0;
  der(PSIkd) = 0;
  der(PSIppq) = 0;
  delta = delta0;
  w = 0;
equation
  //Interfacing outputs with the internal variables
  XADIFD = XadIfd;
  PMECH0 = pm0;
  EFD0 = efd0;
  ISORCE = XadIfd;
  der(Epq) = 1/Tpd0*(EFD - XadIfd);
  der(PSIkd) = 1/Tppd0*(Epq - PSIkd - (Xpd - Xl)*id);
  der(PSIppq) = 1/Tppq0*((-PSIppq) + (Xq - Xppq)*iq);
  PSIppd = Epq*K3d + PSIkd*K4d;
  PSId = PSIppd - Xppd*id;
  PSIq = (-PSIppq) - Xppq*iq;
  XadIfd = K1d*(Epq - PSIkd - (Xpd - Xl)*id) + (Xd - Xpd)*id + (SE(
    Epq,
    S10,
    S12,
    1,
    1.2) + 1)*Epq;
  Te = PSId*iq - PSIq*id;
  ud = (-PSIq) - R_a*id;
  uq = PSId - R_a*iq;
  //flow, changed from machine base to system bas
  annotation (
    Placement(transformation(extent={{74,6},{94,26}}), iconTransformation(extent={{58,-90},{74,-74}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Text(
          extent={{-58,62},{52,-64}},
          lineColor={0,0,255},
          textString="GENSAL")}),
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
end GENSAL;
