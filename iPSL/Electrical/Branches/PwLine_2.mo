within iPSL.Electrical.Branches;
model PwLine_2 "Model for a transmission Line based on the pi-equivalent circuit
  with explicit equations for currents. Developed by RTE. 2014/12/16"
  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-80,-10},{-60,10}}), iconTransformation(extent={{-80,-10},{-60,10}})));
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{60,-10},{80,10}}), iconTransformation(extent={{60,-10},{80,10}})));
  parameter Real R "Resistance p.u.";
  parameter Real X "Reactance p.u.";
  parameter Real G "Shunt half conductance p.u.";
  parameter Real B "Shunt half susceptance p.u.";
  parameter Real Y=1/sqrt(R*R + X*X);
  parameter Real angle=atan2(R, X);
  parameter Real S1=B;
  parameter Real S2=B;
  parameter Real C1=G;
  parameter Real C2=G;
  //I=f(U);
  //I1
  parameter Real ir1_dur1=Y*sin(angle) + C1;
  parameter Real ir1_dui1=(-S1) + Y*cos(angle);
  parameter Real ir1_dur2=-Y*sin(angle);
  parameter Real ir1_dui2=-Y*cos(angle);
  parameter Real ii1_dur1=S1 - Y*cos(angle);
  parameter Real ii1_dui1=Y*sin(angle) + C1;
  parameter Real ii1_dur2=Y*cos(angle);
  parameter Real ii1_dui2=-Y*sin(angle);
  // I2
  parameter Real ir2_dur1=-Y*sin(angle);
  parameter Real ir2_dui1=-Y*cos(angle);
  parameter Real ir2_dur2=C2 + Y*sin(angle);
  parameter Real ir2_dui2=(-S2) + Y*cos(angle);
  parameter Real ii2_dur1=Y*cos(angle);
  parameter Real ii2_dui1=-Y*sin(angle);
  parameter Real ii2_dur2=S2 - Y*cos(angle);
  parameter Real ii2_dui2=C2 + Y*sin(angle);
  // Active, Reactive and Apparent power
  Real Ps "Active power at sending";
  Real Pr "Active power at receiving";
  Real Qs "Reactive power at sending";
  Real Qr "Reactive power at receiving";
  Real Ss "Apparent power at sending";
  Real Sr "Apparent power at receiving";
equation
  n.ir = ir1_dur1*n.vr + ir1_dui1*n.vi + ir1_dur2*p.vr + ir1_dui2*p.vi;
  n.ii = ii1_dur1*n.vr + ii1_dui1*n.vi + ii1_dur2*p.vr + ii1_dui2*p.vi;
  p.ir = ir2_dur1*n.vr + ir2_dui1*n.vi + ir2_dur2*p.vr + ir2_dui2*p.vi;
  p.ii = ii2_dur1*n.vr + ii2_dui1*n.vi + ii2_dur2*p.vr + ii2_dui2*p.vi;
  Ps = p.vr*p.ir + p.vi*p.ii;
  Qs = (-p.vr*p.ii) + p.vi*p.ir;
  Ss = sqrt(Ps^2 + Qs^2);
  Pr = n.vr*n.ir + n.vi*n.ii;
  Qr = (-n.vr*n.ii) + n.vi*n.ir;
  Sr = sqrt(Pr^2 + Qr^2);
  annotation (
    Icon(graphics={Rectangle(extent={{-60,40},{60,-42}}, lineColor={0,0,255}),Rectangle(
          extent={{-40,10},{40,-10}},
          lineColor={0,0,255},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid)}),
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
end PwLine_2;
