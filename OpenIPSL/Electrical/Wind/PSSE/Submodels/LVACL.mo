within OpenIPSL.Electrical.Wind.PSSE.Submodels;
model LVACL
  //The Low Voltage Active Current Management block is designed to capture the characteristic
  //of active power under very low voltage scenarios. This low voltage limit is designed to reduce active current in a linear fashion.
  //  The protection function is activated when
  //the terminal voltage drops below 0.8 pu and strangling power completely if the terminal voltage is lower than
  //0.4 pu. For voltages between 0.8 pu and 0.4 pu to reduce the active power is linear according to equation
  Modelica.Blocks.Interfaces.RealOutput Ip_LVACL annotation (Placement(transformation(extent={{100,-8},{118,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput Vt annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=90,
        origin={-3,-29}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-90})));
  Modelica.Blocks.Interfaces.RealInput Ip_LVPL
    annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=0,
        origin={-33,-3}), iconTransformation(extent={{-100,-10},{-80,10}})));
equation
  if Vt < 0.4 then
    Ip_LVACL = 0;
  elseif Vt > 0.8 then
    Ip_LVACL = Ip_LVPL;
  else
    Ip_LVACL = Ip_LVPL*1.25*Vt;
  end if;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-26,18},{20,-22}}, lineColor={0,0,255})}),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-44,114},{44,54}},
          lineColor={0,0,255},
          textString="LVACL"),Line(
          points={{-60,-60},{-42,-60},{0,20},{20,20}},
          color={0,128,255},
          thickness=0.5),Line(
          points={{0,20},{0,-4},{0,-60}},
          color={0,0,0},
          pattern=LinePattern.Dot),Line(
          points={{-60,20},{-30,20},{0,20}},
          color={0,0,0},
          pattern=LinePattern.Dot),Line(
          points={{-60,60},{-60,-60},{60,-60}},
          color={0,0,0},
          thickness=0.5,
          arrow={Arrow.Filled,Arrow.Filled}),Text(
          extent={{-98,-8},{-68,-22}},
          lineColor={0,0,255},
          textString="IP_LVLP"),Text(
          extent={{64,6},{98,-8}},
          lineColor={0,0,255},
          textString="IP_LVACL"),Text(
          extent={{4,-78},{22,-92}},
          lineColor={0,0,255},
          textString="V")}),
    Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>OpenIPSL:</p>
<p>Copyright 2016 SmarTS Lab (Sweden)</p>
<ul>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>

<p></p>
<p>iPSL:</p>
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
</html>
"));
end LVACL;

