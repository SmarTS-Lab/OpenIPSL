within iPSL.Electrical.Wind.PSSE.WT4G.Submodels;
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
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-44,114},{44,54}},
          lineColor={0,0,255},
          textString="LVACL"),
        Line(
          points={{-60,-60},{-42,-60},{0,20},{20,20}},
          color={0,128,255},
          thickness=0.5),
        Line(
          points={{0,20},{0,-4},{0,-60}},
          color={0,0,0},
          pattern=LinePattern.Dot),
        Line(
          points={{-60,20},{-30,20},{0,20}},
          color={0,0,0},
          pattern=LinePattern.Dot),
        Line(
          points={{-60,60},{-60,-60},{60,-60}},
          color={0,0,0},
          thickness=0.5,
          arrow={Arrow.Filled,Arrow.Filled}),
        Text(
          extent={{-98,-8},{-68,-22}},
          lineColor={0,0,255},
          textString="IP_LVLP"),
        Text(
          extent={{64,6},{98,-8}},
          lineColor={0,0,255},
          textString="IP_LVACL"),
        Text(
          extent={{4,-78},{22,-92}},
          lineColor={0,0,255},
          textString="V")}),
    Documentation(info="<html>
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
end LVACL;
