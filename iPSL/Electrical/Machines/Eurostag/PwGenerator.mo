within iPSL.Electrical.Machines.Eurostag;
model PwGenerator "Synchronous machine model according to Park's classical theory (Full model description).
                   The model corresponds to Eurostag's full model for M1S machine
                   (defined by internal parameters). Initial values must be inserted manually.
                   Developed by RTE and adapted by AIA. 2014/03/10"
  iPSL.Connectors.PwPin sortie(vr(start=1), vi(start=0)) annotation (Placement(transformation(extent={{40,10},{60,30}}), iconTransformation(extent={{40,10},{60,30}})));
  Modelica.Blocks.Interfaces.RealInput eefd annotation (Placement(transformation(extent={{-61,-40},{-41,-20}}), iconTransformation(extent={{-61,-40},{-41,-20}})));
  Modelica.Blocks.Interfaces.RealInput oomega annotation (Placement(transformation(extent={{-61,-10},{-41,10}}), iconTransformation(extent={{-61,-10},{-41,10}})));
  Modelica.Blocks.Interfaces.RealInput ccm annotation (Placement(transformation(extent={{-61,20},{-41,40}}), iconTransformation(extent={{-61,20},{-41,40}})));
  Modelica.Blocks.Interfaces.RealOutput ttheta annotation (Placement(transformation(extent={{39,-30},{59,-10}}), iconTransformation(extent={{39,-30},{59,-10}})));
  Real cm(start=0.60139);
  Real efd(start=0.66174);
  Real ur(start=1);
  Real ui(start=0);
  Real lambdaf(start=-1.0797);
  Real lambdad(start=-0.86452);
  Real lambdaad(start=-0.86452);
  Real lambdaaq(start=0.58946);
  Real lambdaq1(start=0.58946);
  Real lambdaq2(start=0.58946);
  Real id(start=5.4186);
  Real iq(start=3.2618);
  Real theta(start=0.70718);
  Real omega(start=1.0);
  Real E;
  Real Mds;
  Real Mqs;
  Real Md;
  Real Mq;
  Real Mi;
  Real LMD;
  Real LMQ;
  parameter Real omega0=2*3.14159265*50 "Nominal network angular frequency";
  parameter Real SNREF=100 "MVA system base";
  parameter Real SN=1150 "Nominal apparent power (MVA)";
  parameter Real PN=1000 "Nominal turbine (active) power (MW)";
  parameter Real yscale=SNREF/SN;
  parameter Real SNtfo=1300 "Machine transformer rating";
  parameter Real r=0.004*yscale "Stator Resistance";
  parameter Real rf=0.00113*yscale "Rotor Resistance";
  parameter Real lld=0.219*yscale "Stator leakage";
  parameter Real lf=0.24253*yscale "Rotor leakage";
  parameter Real mrc=0.0*yscale "CANAY's inductance";
  parameter Real lD=0.12825*yscale "d axis damper winding leakage";
  parameter Real rD=0.01723*yscale "d axis damper winding resistance";
  parameter Real rQ1=0.0193*yscale "q axis damper 1 winding resistance";
  parameter Real rQ2=0.03923*yscale "q axis damper 2 winding resistance";
  parameter Real lQ1=0.08921*yscale "q axis damper 1 winding leakeage";
  parameter Real lQ2=1.78484*yscale "q axis damper 2 winding leakeage";
  parameter Real RT=0 "Machine transformer resistance (pu), enter value*SNREF/SNtfo";
  parameter Real XT=0 "Machine transformer reactance (pu), enter value*SNREF/SNtfo";
  parameter Real Md0=2.351*yscale "d axis mutual inductance";
  parameter Real Mq0=2.351*yscale "q axis mutual inductance";
  parameter Real Mdv=0.7459*yscale;
  parameter Real md=0.1 "Coefficient md of the saturation curve";
  parameter Real mq=0.1 "Coefficient mq of the saturation curve";
  parameter Real snd=6 "Coefficient nd of the saturation curve";
  parameter Real snq=6 "Coefficient nq of the saturation curve";
  parameter Real D=0.0/yscale "Mechanical damping coefficient";
  parameter Real H=6.3/yscale "Constant of inertia";
  parameter Real rtfo=1 "Transformer ratio";
  parameter Real DET=lf*lD + mrc*lf + mrc*lD;
  parameter Real Mdif=Md0 - Mq0;
  parameter Real Sdet=lf/DET + lD/DET;
  parameter Real Slq=1.0/lQ1 + 1.0/lQ2;
  parameter Real Lddet=lD/DET;
  parameter Real Lfdet=lf/DET;
  parameter Real Lq1inv=1.0/lQ1;
  parameter Real Lq2inv=1.0/lQ2;
  parameter Real Sr=r + RT;
  parameter Real Sx=lld + XT;
  parameter Real Coef11=rtfo*omega0*rf/Mdv;
  parameter Real Coef12=rf*omega0*(lD + mrc)/DET;
  parameter Real Coef13=rf*omega0*mrc/DET;
  parameter Real Coef14=omega0*rf*lD/DET;
  parameter Real Coef21=omega0*rD*mrc/DET;
  parameter Real Coef22=omega0*rD*(lf + mrc)/DET;
  parameter Real Coef23=omega0*rD*lf/DET;
  parameter Real Coef31=omega0*rQ1/lQ1;
  parameter Real Coef32=omega0*rQ1/lQ1;
  parameter Real Coef41=omega0*rQ2/lQ2;
  parameter Real Coef42=omega0*rQ2/lQ2;
  parameter Real Coef51=PN/(SNREF*2*H);
  parameter Real Coef52=D/(2*H);
  parameter Real Coef53=1.0/(2*H);
equation
  der(lambdaf) = (-efd*Coef11) - lambdaf*Coef12 + lambdad*Coef13 + lambdaad*Coef14;
  der(lambdad) = lambdaf*Coef21 - lambdad*Coef22 + lambdaad*Coef23;
  der(lambdaq1) = (-lambdaq1*Coef31) + lambdaaq*Coef32;
  der(lambdaq2) = (-lambdaq2*Coef41) + lambdaaq*Coef42;
  der(omega) = cm*Coef51 + (1 - omega)*Coef52 + lambdaad*iq*Coef53 - lambdaaq*id*Coef53;
  der(theta) = (omega - 1)*omega0;
  E = sqrt(lambdaad*lambdaad + lambdaaq*lambdaaq);
  Mds = Md0/(1 + md*E^snd);
  Mqs = Mq0/(1 + mq*E^snq);
  Mi = Mds*lambdaad*lambdaad/(E*E) + Mqs*lambdaaq*lambdaaq/(E*E);
  Md = Mi + Mdif*lambdaaq*lambdaaq/(E*E);
  Mq = Mi - Mdif*lambdaad*lambdaad/(E*E);
  LMD = 1.0/(1.0/Md + Sdet);
  LMQ = 1.0/(1.0/Mq + Slq);
  0 = (-lambdaad) + LMD*(id + lambdaf*Lddet + lambdad*Lfdet);
  0 = (-lambdaaq) + LMQ*(iq + lambdaq1*Lq1inv + lambdaq2*Lq2inv);
  0 = sin(theta)*ur - cos(theta)*ui + id*Sr - iq*omega*Sx - omega*lambdaaq;
  0 = cos(theta)*ur + sin(theta)*ui + iq*Sr + id*omega*Sx + omega*lambdaad;
  sortie.ir = -(sin(theta)*id + cos(theta)*iq);
  sortie.ii = -((-cos(theta)*id) + sin(theta)*iq);
  oomega = omega;
  ccm = cm;
  eefd = efd;
  ttheta = theta;
  sortie.vr = ur;
  sortie.vi = ui;
  annotation (
    Icon(graphics={Rectangle(extent={{-40,40},{40,-40}}, lineColor={0,0,255}),Ellipse(
          extent={{-24,22},{24,-24}},
          lineColor={0,0,255},
          lineThickness=1),Line(
          points={{-16,0},{-12,8},{-6,8},{6,-10},{12,-10},{16,0}},
          color={0,0,255},
          smooth=Smooth.Bezier,
          thickness=1),Text(
          extent={{-68,46},{-60,40}},
          lineColor={0,0,255},
          textString="ccm"),Text(
          extent={{-74,18},{-60,10}},
          lineColor={0,0,255},
          textString="oomega"),Text(
          extent={{-70,-14},{-60,-20}},
          lineColor={0,0,255},
          textString="eefd"),Text(
          extent={{54,38},{68,32}},
          lineColor={0,0,255},
          textString="sortie"),Text(
          extent={{50,-6},{64,-12}},
          lineColor={0,0,255},
          textString="ttheta")}),
    Diagram(graphics),
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
end PwGenerator;
