within iPSL.Electrical.Machines.Eurostag;
model PwGeneratorM1S "Synchronous machine model according to Park's classical theory (Full model description).
                   The model corresponds to Eurostag's full model for M1S machine 
                   (defined by internal parameters). Developed by RTE and adapted by AIA.
                   2014/03/10. Update and validate by AIA (Change pin_OMEGA to RealOutput). 2016 "

  iPSL.Connectors.PwPin sortie(vr(start = ur0), vi(start = ui0))   annotation (Placement(transformation(extent={{40,10},{60,30}}), iconTransformation(extent={{40,10},{60,30}})));
  Modelica.Blocks.Interfaces.RealInput pin_EFD annotation (Placement(transformation(extent={{-61,-40},{-41,-20}}), iconTransformation(extent={{-61,-40},{-41,-20}})));
  Modelica.Blocks.Interfaces.RealOutput pin_OMEGA annotation (Placement(transformation(extent={{-61,20},{-41,40}}), iconTransformation(extent={{-61,20},{-41,40}})));
  Modelica.Blocks.Interfaces.RealInput pin_CM annotation (Placement(transformation(extent={{-61,-10},{-41,10}}), iconTransformation(extent={{-61,-10},{-41,10}})));
  Modelica.Blocks.Interfaces.RealInput omegaRef;
  Real cm(start = init_cm);
  Real efd(start = init_efd);
  Real ur(start = ur0);
  Real ui(start = ui0);
  Real lambdaf(start = init_lambdaf);
  Real lambdad(start = init_lambdad);
  Real lambdaad(start = init_lambdaad);
  Real lambdaaq(start = init_lambdaaq);
  Real lambdaq1(start = init_lambdaq1);
  Real lambdaq2(start = init_lambdaq2);
  Real id(start = init_id);
  Real iq(start = init_iq);
  Real theta(start = init_theta);
  Real omega(start = init_omega);
  Real E;
  Real Mds;
  Real Mqs;
  Real Md;
  Real Mq;
  Real Mi;
  Real LMD;
  Real LMQ;
  //Initial values
  parameter Real init_lambdaf = 0;
  parameter Real init_lambdad = 0;
  parameter Real init_lambdaad = 0;
  parameter Real init_lambdaaq = 0;
  parameter Real init_lambdaq1 = 0;
  parameter Real init_lambdaq2 = 0;
  parameter Real init_id = 0;
  parameter Real init_iq = 0;
  parameter Real init_theta = 0;
  parameter Real init_omega = 1;
  parameter Real init_cm = 0;
  parameter Real init_efd = 0;
  //parameters coming from .lf
  parameter Real ur0 = 1 
    "Initial real voltage component p.u. in the SNREF base";
  parameter Real ui0 = 0 
    "Initial imaginary voltage component p.u. in the SNREF base";
  //parameter Real ir0 = 1;
  //parameter Real ii0 = 0;
  //parameter Real p0_0 = 0 "Initial active power";
  //parameter Real q0_0 = 0 "Initial active power";
  //General parameters.
  parameter Real omega0 = 2 * 3.14159265 * 50 
    "Nominal network angular frequency";
  parameter Real SNREF = 100 "MVA system base";
  parameter Real SN = 1150 "Nominal apparent power (MVA)";
  parameter Real PN = 1000 "Nominal turbine (active) power (MW)";
  parameter Real PNALT = 1100;
  //per-unit in the machine SN base
  parameter Real rStatIn = 0.004 
    "Stator resistance p.u. in the machine SN base";
  parameter Real lStatIn = 0.219 "Stator leakage p.u. in the machine SN base";
  parameter Real mD0Pu = 2.351 
    "d axis mutual inductance p.u. in the machine SN base";
  parameter Real WLMDVPu = 0.7459 
    "d axis mutual inductance corresponding to magnetic condition taken for setting the voltage regulator";
  parameter Real mCanPu = 0.0 "CANAY's inductance p.u. in the machine SN base";
  parameter Real rDPu = 0.01723 
    "d axis damper winding resistance p.u. in the machine SN base";
  parameter Real lDPu = 0.12825 
    "d axis damper winding leakage p.u. in the machine SN base";
  parameter Real rRotIn = 0.00113 
    "Rotor resistance p.u. in the machine SN base";
  parameter Real lRotIn = 0.24253 "Rotor leakage p.u. in the machine SN base";
  parameter Real mQ0Pu = 2.351 
    "q axis mutual inductance p.u. in the machine SN base";
  parameter Real rQ1Pu = 0.0193 
    "q axis damper 1 winding resistance p.u. in the machine SN base";
  parameter Real lQ1Pu = 0.08921 
    "q axis damper 1 winding leakeage p.u. in the machine SN base";
  parameter Real rQ2Pu = 0.03923 
    "q axis damper 2 winding resistance p.u. in the machine SN base";
  parameter Real lQ2Pu = 1.78484 
    "q axis damper 2 winding leakeage p.u. in the machine SN base";
  parameter Real md = 0.1 "Coefficient md of the saturation curve";
  parameter Real mq = 0.1 "Coefficient mq of the saturation curve";
  parameter Real snd = 6 "Coefficient nd of the saturation curve";
  parameter Real snq = 6 "Coefficient nq of the saturation curve";
  parameter Real DIn = 0.0 "mechanical damping coefficient";
  parameter Real HIn = 6.3 "Constant of inertia";
  parameter Real U1N = 24 "nominal voltage machine side";
  parameter Real V1 = 24 "base voltage machine side";
  parameter Real U2N = 400 "nominal voltage machine side";
  parameter Real V2 = 380 "base voltage machine side";
  parameter Boolean transformerIncluded = false;
  parameter Real RTfoPu = if transformerIncluded then 0.000185 else 0 
    "Machine transoformer resistance p.u. in the SNTfo base";
  parameter Real XTfoPu = if transformerIncluded then 0.00769 else 0 
    "Machine transoformer resistance p.u. in the SNTfo base";
  parameter Integer IWLMDV = 3;
  parameter Boolean Saturated = true;
  //Calculation and per-uniting of parameters.
  //parameter Real yscale=SNREF/SN;
  parameter Real yscale = if RT > 0.0 or XT > 0.0 then SNREF / SN * rtfo * rtfo else SNREF / SN;
  parameter Real SNtfo = 1300 "Machine transformer rating";
  parameter Real r = rStatIn * yscale "Stator Resistance";
  parameter Real rf = rRotIn * yscale "Rotor Resistance";
  parameter Real lld = lStatIn * yscale "Stator leakage";
  parameter Real lf = lRotIn * yscale "Rotor leakage";
  parameter Real mrc = mCanPu * yscale "CANAY's inductance";
  parameter Real lD = lDPu * yscale "d axis damper winding leakage";
  parameter Real rD = rDPu * yscale "d axis damper winding resistance";
  parameter Real rQ1 = rQ1Pu * yscale "q axis damper 1 winding resistance";
  parameter Real rQ2 = rQ2Pu * yscale "q axis damper 2 winding resistance";
  parameter Real lQ1 = lQ1Pu * yscale "q axis damper 1 winding leakeage";
  parameter Real lQ2 = lQ2Pu * yscale "q axis damper 2 winding leakeage";
  parameter Real RT = RTfoPu * SNREF / SNtfo * rtfo * rtfo 
    "Machine transformer resistance (p.u.), enter value*SNREF/SNtfo";
  parameter Real XT = XTfoPu * SNREF / SNtfo * rtfo * rtfo 
    "Machine transformer reactance (p.u.), enter value*SNREF/SNtfo";
  parameter Real Md0 = mD0Pu * yscale "d axis mutual inductance";
  parameter Real Mq0 = mQ0Pu * yscale "q axis mutual inductance";
  parameter Real Mdv = WLMDVPu * yscale;
  parameter Real D = DIn * SN / SNREF "Mechanical damping coefficient";
  parameter Real H = HIn * SN / SNREF "Constant of inertia";
  parameter Real rtfo = if transformerIncluded then (U2N / V2) / (U1N / V1) else 1 
    "Transformer ratio";
  parameter Real DET = lf * lD + mrc * lf + mrc * lD;
  parameter Real Mdif = Md0 - Mq0;
  parameter Real Sdet = lf / DET + lD / DET;
  parameter Real Slq = 1.0 / lQ1 + 1.0 / lQ2;
  parameter Real Lddet = lD / DET;
  parameter Real Lfdet = lf / DET;
  parameter Real Lq1inv = 1.0 / lQ1;
  parameter Real Lq2inv = 1.0 / lQ2;
  parameter Real Sr = r + RT;
  parameter Real Sx = lld + XT;
  parameter Real Coef11 = rtfo * omega0 * rf / Mdv;
  parameter Real Coef12 = rf * omega0 * (lD + mrc) / DET;
  parameter Real Coef13 = rf * omega0 * mrc / DET;
  parameter Real Coef14 = omega0 * rf * lD / DET;
  parameter Real Coef21 = omega0 * rD * mrc / DET;
  parameter Real Coef22 = omega0 * rD * (lf + mrc) / DET;
  parameter Real Coef23 = omega0 * rD * lf / DET;
  parameter Real Coef31 = omega0 * rQ1 / lQ1;
  parameter Real Coef32 = omega0 * rQ1 / lQ1;
  parameter Real Coef41 = omega0 * rQ2 / lQ2;
  parameter Real Coef42 = omega0 * rQ2 / lQ2;
  parameter Real Coef51 = PN / (SNREF * 2 * H);
  parameter Real Coef52 = D / (2 * H);
  parameter Real Coef53 = 1.0 / (2 * H);
  Modelica.Blocks.Interfaces.RealOutput pin_TETA annotation (Placement(transformation(extent={{39,-30},{59,-10}}), iconTransformation(extent={{39,-30},{59,-10}})));
  Modelica.Blocks.Interfaces.RealOutput pin_UR annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-30,-49}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-30,-49})));
  Modelica.Blocks.Interfaces.RealOutput pin_UI annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,-49}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,-49})));
  Modelica.Blocks.Interfaces.RealOutput pin_FieldCurrent annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-30,49}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-30,49})));
  Modelica.Blocks.Interfaces.RealOutput pin_TerminalVoltage annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={30,-49})));
  Modelica.Blocks.Interfaces.RealOutput pin_ActivePowerPNALT annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,49})));
  Modelica.Blocks.Interfaces.RealOutput pin_ActivePowerPN annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={30,49})));
  Modelica.Blocks.Interfaces.RealOutput pin_ActivePowerSNREF;
  Modelica.Blocks.Interfaces.RealOutput pin_ReactivePowerPNALT;
  Modelica.Blocks.Interfaces.RealOutput pin_ReactivePowerPN;
  Modelica.Blocks.Interfaces.RealOutput pin_ReactivePowerSNREF;
  Modelica.Blocks.Interfaces.RealOutput pin_ActivePowerSN;
  Modelica.Blocks.Interfaces.RealOutput pin_ReactivePowerSN;
  Modelica.Blocks.Interfaces.RealOutput pin_Current;
  Modelica.Blocks.Interfaces.RealOutput pin_FRZPU;
  Modelica.Blocks.Interfaces.RealOutput pin_FRZHZ;
equation 
  der(lambdaf) = (-efd * Coef11) - lambdaf * Coef12 + lambdad * Coef13 + lambdaad * Coef14;
  der(lambdad) = lambdaf * Coef21 - lambdad * Coef22 + lambdaad * Coef23;
  der(lambdaq1) = (-lambdaq1 * Coef31) + lambdaaq * Coef32;
  der(lambdaq2) = (-lambdaq2 * Coef41) + lambdaaq * Coef42;
  der(omega) = cm * Coef51 + (omegaRef - omega) * Coef52 + lambdaad * iq * Coef53 - lambdaaq * id * Coef53;
  der(theta) = (omega - omegaRef) * omega0;
  E = sqrt(lambdaad * lambdaad + lambdaaq * lambdaaq);
  if Saturated then
    Mds = Md0 / (1 + md / rtfo ^ snd * E ^ snd);
    Mqs = Mq0 / (1 + mq / rtfo ^ snq * E ^ snq);
  else
    Mds = Md0;
    Mqs = Mq0;
  end if;
  Mi = Mds * lambdaad * lambdaad / (E * E) + Mqs * lambdaaq * lambdaaq / (E * E);
  Md = Mi + Mdif * lambdaaq * lambdaaq / (E * E);
  Mq = Mi - Mdif * lambdaad * lambdaad / (E * E);
  LMD = 1.0 / (1.0 / Md + Sdet);
  LMQ = 1.0 / (1.0 / Mq + Slq);
  0 = (-lambdaad) + LMD * (id + lambdaf * Lddet + lambdad * Lfdet);
  0 = (-lambdaaq) + LMQ * (iq + lambdaq1 * Lq1inv + lambdaq2 * Lq2inv);
  0 = sin(theta) * ur - cos(theta) * ui + id * Sr - iq * Sx - omega * lambdaaq;
  0 = cos(theta) * ur + sin(theta) * ui + iq * Sr + id * Sx + omega * lambdaad;
  sortie.ir = -(sin(theta) * id + cos(theta) * iq);
  sortie.ii = -((-cos(theta) * id) + sin(theta) * iq);
  pin_TETA = theta;
  pin_OMEGA = omega;
  pin_CM = cm;
  pin_EFD = efd;
  pin_UR = ur;
  pin_UI = ui;
  sortie.vr = ur;
  sortie.vi = ui;
  //Terminal Voltage
  pin_TerminalVoltage = sqrt((sortie.vr - RT * sortie.ir + XT * sortie.ii) * (sortie.vr - RT * sortie.ir + XT * sortie.ii) + (sortie.vi - RT * sortie.ii - XT * sortie.ir) * (sortie.vi - RT * sortie.ii - XT * sortie.ir)) * 1 / rtfo;
  //TerminalVoltage = sqrt(sortie.vr*sortie.vr+sortie.vi*sortie.vi);
  //ActivePower PN-base
  pin_ActivePowerPN = (sortie.vr * (-sortie.ir) + sortie.vi * (-sortie.ii)) * SNREF / PN;
  //ActivePower PNALT-base
  if PNALT == 0 then
    pin_ActivePowerPNALT = 0;
  else
    pin_ActivePowerPNALT = (sortie.vr * (-sortie.ir) + sortie.vi * (-sortie.ii)) * SNREF / PNALT;
  end if;
  //ActivePower SNREF-base
  pin_ActivePowerSNREF = sortie.vr * (-sortie.ir) + sortie.vi * (-sortie.ii);
  //ReactivePower PN-base
  pin_ReactivePowerPN = (sortie.vi * (-sortie.ir) - sortie.vr * (-sortie.ii)) * SNREF / PN;
  //ReactivePower PNALT-base
  if PNALT == 0 then
    pin_ReactivePowerPNALT = 0;
  else
    pin_ReactivePowerPNALT = (sortie.vi * (-sortie.ir) - sortie.vr * (-sortie.ii)) * SNREF / PNALT;
  end if;
  //ReactivePower SNREF-base
  pin_ReactivePowerSNREF = sortie.vi * (-sortie.ir) - sortie.vr * (-sortie.ii);
  //ActivePower SN
  pin_ActivePowerSN = (sortie.vr * (-sortie.ir) + sortie.vi * (-sortie.ii)) * SNREF / SN;
  //ReactivePower SN
  pin_ReactivePowerSN = (sortie.vi * (-sortie.ir) - sortie.vr * (-sortie.ii)) * SNREF / SN;
  //Field Current
  if md == 0 and mq == 0 and snd == 0 and snq == 0 then
    pin_FieldCurrent = -Mdv / rtfo * ((Md0 + lD + mrc) * lambdaf - (Md0 + mrc) * lambdad - Md0 * lD * id) / ((Md0 + mrc) * (lf + lD) + lf * lD);
  else
    pin_FieldCurrent = -Mdv / rtfo * ((lD + mrc) * lambdaf - mrc * lambdad - lD * lambdaad) / (mrc * (lf + lD) + lf * lD);
  end if;
  //Current module
  pin_Current = sqrt(sortie.ir * sortie.ir + sortie.ii * sortie.ii);
  //Frequency
  pin_FRZPU = omegaRef;
  pin_FRZHZ = omegaRef * omega0;
  annotation (
    Icon(graphics={Rectangle(extent={{-40,40},{40,-40}}, lineColor={0,0,255}),Ellipse(
          extent={{-24,22},{24,-24}},
          lineColor={0,0,255},
          lineThickness=1),Line(
          points={{-16,0},{-12,8},{-6,8},{6,-10},{12,-10},{16,0}},
          color={0,0,255},
          smooth=Smooth.Bezier,
          thickness=1),Text(
          extent={{-74,48},{-54,42}},
          lineColor={0,0,255},
          textString="pin_OMEGA"),Text(
          extent={{-70,16},{-60,10}},
          lineColor={0,0,255},
          textString="pin_CM"),Text(
          extent={{-70,-14},{-60,-20}},
          lineColor={0,0,255},
          textString="pin_EFD"),Text(
          extent={{54,38},{70,32}},
          lineColor={0,0,255},
          textString="sortie"),Text(
          extent={{52,-8},{70,-16}},
          lineColor={0,0,255},
          textString="pin_THETA"),Text(
          extent={{-52,-46},{-42,-52}},
          lineColor={0,0,255},
          textString="ur"),Text(
          extent={{4,-48},{14,-54}},
          lineColor={0,0,255},
          textString="ui
"),Text(  extent={{-56,56},{-36,52}},
          lineColor={0,0,255},
          textString="FieldCurrent"),Text(
          extent={{34,-50},{54,-54}},
          lineColor={0,0,255},
          textString="TerminalVoltage"),Text(
          extent={{-24,56},{-4,52}},
          lineColor={0,0,255},
          textString="ActivePowerPNALT"),Text(
          extent={{8,56},{28,52}},
          lineColor={0,0,255},
          textString="ActivePowerPN")}),
    Diagram(graphics),
     Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>None</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p></p>2016-03-14</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>RTE-AIA</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>modelica@aia.es<a href=\"mailto:modelica@aia.es\"></a></p></td>
</tr>
</table>
</html>", revisions="<html>
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
end PwGeneratorM1S;
