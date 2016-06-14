within iPSL.Electrical.Machines.Eurostag;
model PwMachineM10 "Induction Machine. The model corresponds to Eurostag's full model for M10 machine.
                  Developed by RTE and adapted by AIA. 2014/03/10"
  // Connectors
  Modelica.Blocks.Interfaces.RealInput omegaRef(start=omegaRef0) annotation (Placement(transformation(extent={{-61,-10},{-41,10}})));
  iPSL.Connectors.PwPin sortie(
    vr(start=ur0),
    vi(start=ui0),
    ir(start=ir0),
    ii(start=ii0)) annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  //
  // Generic parameters for simulation
  // --------------------------------
  parameter Real sNRef(fixed=false);
  // (100.)
  parameter Real omega0(fixed=false);
  // (2*pi*50) different to omega_0=omega(t0)~=1. (in p.u.)
  //
  // Parametres describing the machine
  // --------------------------------------------------
  parameter Real SN(fixed=false);
  //Nominal apparent power (MVA)
  parameter Real HIn(fixed=false);
  // Constant of Inertia (CINERT)
  parameter Real rStatIn(fixed=false);
  // Stator leakage resistance (RESARM)
  parameter Real lStatIn(fixed=false);
  // Stator leakage reactance (READST)
  parameter Real mQ0Pu(fixed=false);
  // Rotor-stator mutual reactance (FMUQST) (le champ REAQST est sautÃ© puis =READST)
  parameter Real rQ1Pu(fixed=false);
  // Leakage resistance - winding 1 (RESQA1)
  parameter Real lQ1Pu(fixed=false);
  // Leakage reactance - winding 1 (REAQA1)
  parameter Real rQ2Pu(fixed=false);
  // Leakage resistance - winding 2 (RESQA2)
  parameter Real lQ2Pu(fixed=false);
  // Leakage reactance - winding 2 (REAQA2)
  parameter Real kSll(fixed=false);
  // Stray load losses factor
  parameter Real eSll(fixed=false);
  // Stray load losses exponent
  parameter Real nbPtsCM(fixed=false);
  // nb of point in CM curve (currently fixed to 3)
  parameter Real cmX1(fixed=false);
  // First Abscissa for CM
  parameter Real cmX2(fixed=false);
  // Second Abscissa for CM
  parameter Real cmX3(fixed=false);
  // Third Abscissa for CM
  parameter Real cmY1(fixed=false);
  // First Ordinate for CM
  parameter Real cmY2(fixed=false);
  // Second Ordinate for CM
  parameter Real cmY3(fixed=false);
  // Third Ordinate for CM
  parameter Real isLoad(fixed=false);
  // 1 if type Load ; -1 if type generator
  // Inputs for initialization calculation: parametres from lf
  // -----------------------------------------------------------
  parameter Real ur0(fixed=false);
  parameter Real ui0(fixed=false);
  parameter Real omegaRef0(fixed=false);
  // Outputs for initialization calculation: initial values for machine
  // ----------------------------------------------------------------------------
  parameter Real psi2R0(fixed=false);
  parameter Real psi2I0(fixed=false);
  parameter Real psi3R0(fixed=false);
  parameter Real psi3I0(fixed=false);
  parameter Real cm0(fixed=false);
  parameter Real omega_0(fixed=false);
  // (~1. in p.u.) do not mix with omega0=2*pi*50Hz
  parameter Real ir0(fixed=false);
  parameter Real ii0(fixed=false);
  // calculation and per unit for parameters
  // ------------------------------------
  parameter Real yScale=sNRef/SN;
  parameter Real yScaleI=SN/sNRef;
  parameter Real r1=rStatIn*yScale;
  parameter Real l1=lStatIn*yScale;
  parameter Real lm=mQ0Pu*yScale;
  parameter Real r2=rQ1Pu*yScale;
  parameter Real l2=lQ1Pu*yScale;
  parameter Real r3=rQ2Pu*yScale;
  parameter Real l3=lQ2Pu*yScale;
  parameter Real H=HIn*yScaleI;
  // attention to per unit
  // Machine's ve
  // ----------------
  Real ur(start=ur0);
  Real ui(start=ui0);
  Real ir(start=ir0);
  Real ii(start=ii0);
  Real psi2R(start=psi2R0);
  Real psi2I(start=psi2I0);
  Real psi3R(start=psi3R0);
  Real psi3I(start=psi3I0);
  Real omega(start=omega_0);
  Real cm(start=cm0);
  // Internal coefficients used in machine's eqs
  // -------------------------------------------------
  parameter Real A=l2*l3 + (l2 + l3)*lm;
  parameter Real B=lm*l2*l3/A;
  parameter Real Coef11=r1;
  parameter Real Coef12=l1 + B;
  parameter Real Coef13=lm*l3/A;
  parameter Real Coef14=lm*l2/A;
  parameter Real Coef31=omega0*r2*B/l2;
  parameter Real Coef32=omega0*r2*(lm + l3)/A;
  parameter Real Coef33=omega0*r2*B/(l2*l3);
  parameter Real Coef51=omega0*r3*B/l3;
  parameter Real Coef52=omega0*r3*B/(l2*l3);
  parameter Real Coef53=omega0*r3*(lm + l2)/A;
  parameter Real Coef71=1.0/(2*H);
  parameter Real Coef72=lm*l3/(2*H*A);
  parameter Real Coef73=lm*l2/(2*H*A);
  parameter Real Coef74=kSll*yScale^(eSll - 1.0)/(2*H);
  parameter Real Coef75=eSll/2.0;
  // coefficients for curve CM
  parameter Real Coefcm1=yScaleI*(cmY2 - cmY1)/(cmX2 - cmX1);
  parameter Real Coefcm2=yScaleI*(cmY3 - cmY2)/(cmX3 - cmX2);
  parameter Real CoefcmY1=yScaleI*cmY1;
  parameter Real CoefcmY2=yScaleI*cmY2;
  parameter Real CoefcmY3=yScaleI*cmY3;
  // outputs
  // -------
  output Real output_Q;
  output Real output_P;
  output Real output_u;
  output Real output_cm;
  output Real output_omega;
  output Real output_omegaRef;
equation
  // outputs
  // -------
  output_u = sqrt(sortie.vr*sortie.vr + sortie.vi*sortie.vi);
  output_Q = sortie.vi*sortie.ir - sortie.vr*sortie.ii;
  output_P = sortie.vr*sortie.ir + sortie.vi*sortie.ii;
  output_cm = cm;
  output_omega = omega;
  output_omegaRef = omegaRef;
  // asynchronous machine
  // ------------------
  // Interconnexion equations
  ur = Coef11*ir - omegaRef*(Coef12*ii + Coef13*psi2I + Coef14*psi3I);
  ui = Coef11*ii + omegaRef*(Coef12*ir + Coef13*psi2R + Coef14*psi3R);
  // Park's equations
  der(psi2R) = Coef31*ir - Coef32*psi2R + (omegaRef - omega)*psi2I*omega0 + Coef33*psi3R;
  der(psi2I) = Coef31*ii - Coef32*psi2I - (omegaRef - omega)*psi2R*omega0 + Coef33*psi3I;
  der(psi3R) = Coef51*ir + Coef52*psi2R + (omegaRef - omega)*psi3I*omega0 - Coef53*psi3R;
  der(psi3I) = Coef51*ii + Coef52*psi2I - (omegaRef - omega)*psi3R*omega0 - Coef53*psi3I;
  // equation of the rotating masses
  if omega < cmX2 then
    cm = isLoad*(Coefcm1*(omega - cmX1) + CoefcmY1);
  else
    cm = isLoad*(Coefcm2*(omega - cmX2) + CoefcmY2);
  end if;
  der(omega) = (-Coef71*cm) + Coef72*(psi2R*ii - psi2I*ir) + Coef73*(psi3R*ii - psi3I*ir) - Coef74*(ir*ir + ii*ii)^Coef75;
  // connecteur PwPin
  // ----------------
  ur = sortie.vr;
  ui = sortie.vi;
  ir = sortie.ir;
  ii = sortie.ii;
  annotation (
    Diagram(graphics),
    Icon(graphics={Rectangle(extent={{-40,40},{40,-40}}, lineColor={0,0,255}),Ellipse(
          extent={{-24,22},{24,-24}},
          lineColor={0,0,255},
          lineThickness=1),Text(
          extent={{-12,-7},{12,7}},
          lineColor={0,0,255},
          textString="M10")}),
    Documentation(revisions="<html>
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
end PwMachineM10;
