within iPSL.Electrical.Controls.PSSE.PSS.PSS2A;


model PSS2A "IEEE Dual-Input Stabilizer Model"
  parameter Real T_w1=10 "Washout 1 time constant";
  parameter Real T_w2=10 "Washout 2 time constant";
  parameter Real T_6=1e-9 "Lag 1 time constant";
  parameter Real T_w3=10 "Washout 3 time constant";
  parameter Real T_w4=1e-9 "Washout 4 time constant";
  parameter Real T_7=10 "Lag 2 time constant";
  parameter Real K_S2=0.99 "Lag 2 gain";
  parameter Real K_S3=1 "gain";
  parameter Real T_8=0.5 "Ramp-tracking filter time constant";
  parameter Real T_9=0.1 "Ramp-tracking filter time constant";
  parameter Real K_S1=20 "PSS gain";
  parameter Real T_1=0.15 "Leadlag1 time constant (data from IEEE std, not representive, need to be tuned following system parameters)";
  parameter Real T_2=0.025 "Leadlag1 time constant";
  parameter Real T_3=0.15 "Leadlag2 time constant";
  parameter Real T_4=0.025 "Leadlag2 time constant";
  parameter Real V_STMAX=0.1 "PSS output limiation";
  parameter Real V_STMIN=-0.1 "PSS output limiation";
  parameter Real M "Ramp tracking filter coefficient";
  parameter Real N "Ramp tracking filter coefficient";
  Modelica.Blocks.Interfaces.RealInput V_S1 "PSS input signal 1" annotation (Placement(transformation(extent={{-186,14},{-174,26}}), iconTransformation(extent={{-186,14},{-174,26}})));
  iPSL.NonElectrical.Continuous.LeadLag Leadlag1(
    K=1,
    T1=T_1,
    T2=T_2,
    y_start=0,
    x_start=0) annotation (Placement(transformation(extent={{80,-10},{100,10}})));
  iPSL.NonElectrical.Continuous.LeadLag Leadlag2(
    K=1,
    T1=T_3,
    T2=T_4,
    y_start=0,
    x_start=0) annotation (Placement(transformation(extent={{112,-10},{132,10}})));
  Modelica.Blocks.Interfaces.RealOutput VOTHSG "PSS output" annotation (Placement(transformation(extent={{200,-6},{212,6}}), iconTransformation(extent={{200,-6},{212,6}})));
  Modelica.Blocks.Interfaces.RealInput V_S2 "PSS input signal 2" annotation (Placement(transformation(extent={{-186,-26},{-174,-14}}), iconTransformation(extent={{-186,-26},{-174,-14}})));
  iPSL.NonElectrical.Continuous.SimpleLag SimpleLag1(
    K=1,
    T=T_6,
    y_start=0) annotation (Placement(transformation(extent={{-80,10},{-60,30}})));
  iPSL.NonElectrical.Continuous.SimpleLag SimpleLag2(
    K=K_S2,
    T=T_7,
    y_start=0) annotation (Placement(transformation(extent={{-80,-30},{-60,-10}})));
  Modelica.Blocks.Math.Add add(k2=+K_S3) annotation (Placement(transformation(extent={{-40,4},{-20,24}})));
  Modelica.Blocks.Math.Add add1(k2=-1) annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Blocks.Math.Gain gain(k=K_S1) annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_STMAX, uMin=V_STMIN) annotation (Placement(transformation(extent={{146,-10},{166,10}})));
  NonElectrical.Continuous.RampTrackingFilter rampTrackingFilter(
    M=M,
    N=N,
    startValue=0,
    T_1=T_8,
    T_2=T_9) annotation (Placement(transformation(extent={{-10,4},{10,24}})));
  NonElectrical.Continuous.DerivativeLag derivativeLag(
    K=T_w1,
    T=T_w1,
    y_start=0) annotation (Placement(transformation(extent={{-160,10},{-140,30}})));
  NonElectrical.Continuous.DerivativeLag derivativeLag1(
    y_start=0,
    K=T_w2,
    T=T_w2) annotation (Placement(transformation(extent={{-120,10},{-100,30}})));
  NonElectrical.Continuous.DerivativeLag derivativeLag2(
    y_start=0,
    K=T_w3,
    T=T_w3) annotation (Placement(transformation(extent={{-160,-30},{-140,-10}})));
  NonElectrical.Continuous.DerivativeLag derivativeLag3(
    y_start=0,
    K=T_w4,
    T=T_w4) annotation (Placement(transformation(extent={{-120,-30},{-100,-10}})));
equation
  connect(SimpleLag1.y, add.u1) annotation (Line(points={{-59,20},{-50,20},{-42,20}}, color={0,0,127}));
  connect(SimpleLag2.y, add.u2) annotation (Line(points={{-59,-20},{-52,-20},{-52,8},{-42,8}}, color={0,0,127}));
  connect(add1.u2, add.u2) annotation (Line(points={{18,-6},{14,-6},{14,-20},{-52,-20},{-52,8},{-42,8}}, color={0,0,127}));
  connect(add1.y, gain.u) annotation (Line(points={{41,0},{48,0}}, color={0,0,127}));
  connect(gain.y, Leadlag1.u) annotation (Line(points={{71,0},{78,0}}, color={0,0,127}));
  connect(Leadlag1.y, Leadlag2.u) annotation (Line(points={{101,0},{110,0}}, color={0,0,127}));
  connect(Leadlag2.y, limiter.u) annotation (Line(points={{133,0},{144,0}}, color={0,0,127}));
  connect(limiter.y, VOTHSG) annotation (Line(points={{167,0},{206,0}}, color={0,0,127}));
  connect(add.y, rampTrackingFilter.u) annotation (Line(points={{-19,14},{-15.5,14},{-12,14}}, color={0,0,127}));
  connect(rampTrackingFilter.y, add1.u1) annotation (Line(points={{11,14},{14,14},{14,6},{18,6}}, color={0,0,127}));
  connect(V_S1, derivativeLag.u) annotation (Line(points={{-180,20},{-172,20},{-162,20}}, color={0,0,127}));
  connect(derivativeLag.y, derivativeLag1.u) annotation (Line(points={{-139,20},{-130.5,20},{-122,20}}, color={0,0,127}));
  connect(derivativeLag1.y, SimpleLag1.u) annotation (Line(points={{-99,20},{-82,20},{-82,20}}, color={0,0,127}));
  connect(derivativeLag2.u, V_S2) annotation (Line(points={{-162,-20},{-180,-20}}, color={0,0,127}));
  connect(derivativeLag3.u, derivativeLag2.y) annotation (Line(points={{-122,-20},{-139,-20}}, color={0,0,127}));
  connect(derivativeLag3.y, SimpleLag2.u) annotation (Line(points={{-99,-20},{-82,-20}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-180,-40},{200,40}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-180,-40},{200,40}}), graphics={
        Rectangle(extent={{-180,40},{200,-40}}, lineColor={0,0,255}),
        Text(
          extent={{-34,16},{32,-14}},
          lineColor={0,0,255},
          textString="PSS2A"),
        Text(
          extent={{-170,30},{-142,10}},
          lineColor={0,0,255},
          textString="V_S1"),
        Text(
          extent={{-170,-10},{-142,-30}},
          lineColor={0,0,255},
          textString="V_S2"),
        Text(
          extent={{140,10},{196,-10}},
          lineColor={0,0,255},
          textString="VOTHSG")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td></td>
PSS2A, PSS/E Manual
</tr>
<tr>
<td><p>Last update</p></td>
<td></td>
2015-08-03
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Tin Rabuzin, SmarTS Lab, KTH Royal Institute of Technology</p></td>
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
end PSS2A;
