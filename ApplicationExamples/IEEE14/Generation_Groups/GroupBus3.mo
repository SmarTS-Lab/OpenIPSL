within IEEE14.Generation_Groups;
model GroupBus3
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  parameter Real vf0=2.045032675265054 "Initial field voltage";
  parameter Real vref0=1.112638137121514 "Reference voltage AVR";
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVR2TypeII2(
    Ta=0.02,
    Tf=1,
    Ke=1,
    Tr=0.001,
    Ka=20,
    Kf=0.001,
    Te=1.98,
    v0=V_0,
    vrmin=0,
    vrmax=4.38) annotation (Placement(transformation(
        extent={{-30,-32},{30,32}},
        rotation=0,
        origin={-28,-2})));
  OpenIPSL.Electrical.Machines.PSAT.Order6 Syn2(
    Sn=60,
    Vn=69,
    V_b=V_b,
    fn=60,
    ra=0.0031,
    xq=0.98,
    x1d=0.1850,
    x1q=0.36,
    x2d=0.13,
    x2q=0.13,
    T1d0=6.1,
    T1q0=0.3,
    T2q0=0.099,
    M=2*6.54,
    D=2,
    V_0=V_0,
    xd=1.05,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0) annotation (Placement(transformation(
        extent={{-28,-25},{28,25}},
        rotation=0,
        origin={66,1})));
  OpenIPSL.Interfaces.PwPin pwPin annotation (Placement(transformation(extent={
            {120,-12},{140,8}}),iconTransformation(extent={{120,-12},{140,8}})));
equation
  connect(aVR2TypeII2.vf, Syn2.vf) annotation (Line(points={{8,-2},{12,-2},{12,
          13.5},{32.4,13.5}}, color={0,0,127}));
  connect(Syn2.v, aVR2TypeII2.v) annotation (Line(points={{96.8,8.5},{112,8.5},
          {112,-48},{-82,-48},{-82,-21.2},{-64,-21.2}}, color={0,0,127}));
  connect(Syn2.p, pwPin) annotation (Line(points={{94,1},{115.4,1},{115.4,-2},{
          130,-2}}, color={0,0,255}));
  connect(Syn2.pm0, Syn2.pm) annotation (Line(points={{43.6,-26.5},{43.6,-34},{
          2,-34},{2,-11.5},{32.4,-11.5}}, color={0,0,127}));
  connect(aVR2TypeII2.vref0, aVR2TypeII2.vref) annotation (Line(points={{-28,
          36.4},{-28,72},{-28,76},{-86,76},{-86,17.2},{-64,17.2}}, color={0,0,
          127}));
  connect(Syn2.vf0, aVR2TypeII2.vf0) annotation (Line(points={{43.6,28.5},{43.6,
          90},{-92,90},{-92,-86},{-68,-86},{-68,-40.4},{-28,-40.4}}, color={0,0,
          127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            120,100}})),
    Icon(coordinateSystem(extent={{-100,-100},{120,100}}, preserveAspectRatio=
            false), graphics={Ellipse(extent={{-80,78},{112,-74}}, lineColor={
          28,108,200}),Line(points={{-8,26},{18,-6},{36,20}}, color={28,108,200}),
          Line(points={{-24,2},{-8,26}}, color={28,108,200}),Text(
          extent={{-14,-24},{24,-56}},
          lineColor={28,108,200},
          textString="Gen3 6")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSAT Manual 2.1.8</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>13/07/2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad,SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;OpenIPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;OpenIPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The OpenIPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The OpenIPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the OpenIPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
end GroupBus3;
