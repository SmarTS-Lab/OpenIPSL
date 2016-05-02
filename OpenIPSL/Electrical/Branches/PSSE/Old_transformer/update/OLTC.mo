within OpenIPSL.Electrical.Branches.PSSE.Old_transformer.update;
model OLTC
  "Original developed by Mengjia and has been improved by Jan from KTH"
  //outer parameter Boolean ControlledOnFromSide;
  outer parameter Real initialtapratio=1;
  parameter Real Vmax=1.1;
  parameter Real Vmin=0.9;
  parameter Real rmax=1.1;
  parameter Real rmin=0.9;
  parameter Real Ntap=33 "Number of tap positions";
  parameter Real Td=17.0 "Regulator delay";
  parameter Real TC=5 "motor delay";
  parameter Real TSD "delay between two subsequent tap changes";
  parameter Real dtap=(rmax - rmin)/(Ntap - 1);
  parameter Real Rmax=1 + (rmax - rmin)/2;
  parameter Real Rmin=1 - (rmax - rmin)/2;
  Modelica.Blocks.Interfaces.RealInput u "Measured input, typically Voltage" annotation (Placement(transformation(extent={{-124,-6},{-84,34}})));
  Modelica.Blocks.Interfaces.RealOutput y(start=initialtapratio, fixed=true)
    "Tap-ratio output"                                                                          annotation (Placement(transformation(extent={{84,4},{104,24}})));
  Real RegulatorTimer(start=0, fixed=true) "Timer for the regulator";
  Integer voltageDiff(start=0, fixed=true)
    "Direction of the voltage difference";
  Integer tapMoved(start=0, fixed=true) "Number of steps the taps has moved.";
  Integer tapDirection(start=0, fixed=true);
  discrete Real m(start=initialtapratio, fixed=true);
  Boolean MotorEnabled(start=false, fixed=true);
  Real MotorTimer(start=0, fixed=true);
  Boolean ResetTimer(start=false, fixed=true);
  Boolean StartTimer(start=true, fixed=true);
equation
  // Check difference between scheduled and measured voltage.
  if u - Vmax > 0 then
    voltageDiff = -1;
  elseif Vmin - u > 0 then
    voltageDiff = 1;
  else
    voltageDiff = 0;
  end if;
  // Set resetRegulatorTimer if difference exists.
  when ResetTimer then
    reinit(MotorTimer, 0);
  end when;
  // Let timer run if we have a large enough difference
  when voltageDiff <> 0 and StartTimer then
    tapDirection = if RegulatorTimer <= 0 then voltageDiff else pre(tapDirection);
  end when;
  when RegulatorTimer <= 0 or RegulatorTimer >= 1 then
    MotorEnabled = if RegulatorTimer >= 1 then true else false;
  end when;
  if RegulatorTimer <= 0 then
    der(RegulatorTimer) = if voltageDiff <> 0 then 1/Td else 0;
    ResetTimer = false;
    StartTimer = true;
  elseif RegulatorTimer >= 1 then
    der(RegulatorTimer) = if tapDirection == voltageDiff then 0 else -1/Td;
    ResetTimer = true;
    StartTimer = false;
  elseif RegulatorTimer < 1 then
    der(RegulatorTimer) = if tapDirection == voltageDiff then 1/Td else -1/Td;
    ResetTimer = false;
    StartTimer = false;
  else
    der(RegulatorTimer) = 0;
    ResetTimer = false;
    StartTimer = true;
  end if;
  if MotorEnabled and MotorTimer < 1 then
    der(MotorTimer) = 1/TC;
  elseif MotorEnabled then
    der(MotorTimer) = if TSD > 0 then 1/TSD else 1/TC;
  else
    der(MotorTimer) = 0;
  end if;
  tapMoved = integer(MotorTimer);
  when change(tapMoved) and tapMoved <> 0 and pre(MotorEnabled) then
    m = pre(m) + dtap*pre(tapDirection);
  end when;
  if m >= Rmax then
    y = Rmax;
  elseif m <= Rmin then
    y = Rmin;
  else
    y = m;
  end if;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-94,70},{90,-80}}, lineColor={0,0,255}),Text(
          extent={{-50,34},{54,-50}},
          lineColor={0,0,255},
          textString="OLTC")}),
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
end OLTC;
