within iPSL.Electrical.Controls.PSSE.PSS.IEEEST;


model IEEEST "IEEE Stabilizing Model with single Input"
  parameter Real A_1 "Filter Coefficient";
  parameter Real A_2 "Filter Coefficient";
  parameter Real A_3 "Filter Coefficient";
  parameter Real A_4 "Filter Coefficient";
  parameter Real A_5 "Filter Coefficient";
  parameter Real A_6 "Filter Coefficient";
  parameter Real T_1=0 "Lead Time Constant";
  parameter Real T_2=0 "Lag Time Constant";
  parameter Real T_3=0 "Lead Time Constant";
  parameter Real T_4=0 "Lag Time Constant";
  parameter Real T_5=1.65 "Washout Time Constant";
  parameter Real T_6=1.65 "Washout Time Constant";
  parameter Real K_S=6.2 "Stabilizer Gain";
  parameter Real L_SMAX=0.26 "Output Limits";
  parameter Real L_SMIN=-0.1 "Output Limits";
  parameter Real V_CU=999 "Output Limits";
  parameter Real V_CL=-999 "Output Limits";
  Modelica.Blocks.Continuous.TransferFunction Filter(
    b={A6,A5,1},
    a={A2*A4,A1*A4 + A2*A3,A4 + A2 + A1*A3,A3 + A1,1},
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=V_S0) annotation (Placement(transformation(extent={{-86,-12},{-74,0}})));
  iPSL.NonElectrical.Continuous.LeadLag T_1_T_2(
    K=1,
    T1=T_1,
    T2=T_2,
    x_start=V_S0,
    y_start=V_S0) annotation (Placement(transformation(extent={{-12,-10},{8,10}})));
  iPSL.NonElectrical.Continuous.LeadLag T_3_T_4(
    K=1,
    T1=T_3,
    T2=T_4,
    x_start=V_S0,
    y_start=V_S0) annotation (Placement(transformation(extent={{16,-10},{36,10}})));
  output Modelica.Blocks.Interfaces.RealOutput VOTHSG(start=0) "PSS output signal"
    annotation (Placement(transformation(extent={{120,-10},{140,10}}, rotation=0), iconTransformation(extent={{120,-10},{140,10}})));
  input Modelica.Blocks.Interfaces.RealInput V_S(start=0) "PSS input signal"
    annotation (Placement(transformation(extent={{-126,-20},{-98,8}}, rotation=0), iconTransformation(extent={{-128,-30},{-108,-10}})));
  Modelica.Blocks.Nonlinear.Limiter VSS(uMax=L_SMAX, uMin=L_SMIN) annotation (Placement(transformation(extent={{80,-8},{96,8}})));
  Modelica.Blocks.Interfaces.RealInput V_CT "Compensated machine terminal voltage (pu)"
    annotation (Placement(transformation(extent={{-124,0},{-98,26}}, rotation=0), iconTransformation(extent={{-128,10},{-108,30}})));
  Modelica.Blocks.Continuous.Derivative imDerivativeLag(
    T=T_6,
    y_start=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    x_start=V_S0,
    k=K_S*T_5) annotation (Placement(transformation(extent={{48,-10},{68,10}})));
  Modelica.Blocks.Sources.Constant const(k=Switch) annotation (Placement(transformation(extent={{-90,34},{-78,46}})));
  Modelica.Blocks.Logical.Greater greater annotation (Placement(transformation(extent={{-68,20},{-56,32}})));
  Modelica.Blocks.Logical.Switch switch1 annotation (Placement(transformation(extent={{-38,-6},{-26,6}})));
  Modelica.Blocks.Sources.Constant const1(k=0) annotation (Placement(transformation(extent={{-90,16},{-78,28}})));
protected
  Modelica.Blocks.Interfaces.RealOutput Vs "Connector of Real output signal"
    annotation (Placement(transformation(extent={{102,-10},{122,10}}, rotation=0), iconTransformation(extent={{32,-8},{36,-4}})));

  parameter Real V_S0(fixed=false);
  parameter Real A(fixed=false);
  parameter Real Switch(fixed=false);
  parameter Real A1(fixed=false);
  parameter Real A2(fixed=false);
  parameter Real A3(fixed=false);
  parameter Real A4(fixed=false);
  parameter Real A5(fixed=false);
  parameter Real A6(fixed=false);
initial algorithm
  A := A_1 + A_2 + A_3 + A_4 + A_5 + A_6;
  Switch := A;
  A1 := if not A_1 == 0 then A_1 else 1;
  A2 := if not A_2 == 0 then A_2 else 1;
  A3 := if not A_3 == 0 then A_3 else 1;
  A4 := if not A_4 == 0 then A_4 else 1;
  A5 := if not A_5 == 0 then A_5 else 1;
  A6 := if not A_6 == 0 then A_6 else 1;
  V_S0 := V_S;
equation
  if V_CU == 0 and not V_CL == 0 then
    if V_CT > V_CL then
      VOTHSG = Vs;
    else
      VOTHSG = 0;
    end if;
  elseif V_CL == 0 and not V_CU == 0 then
    if V_CT < V_CU then
      VOTHSG = Vs;
    else
      VOTHSG = 0;
    end if;
  elseif V_CU == 0 and V_CL == 0 then
    VOTHSG = Vs;
  elseif V_CT > V_CL and V_CT < V_CU then
    VOTHSG = Vs;
  else
    VOTHSG = 0;
  end if;
  connect(VSS.y, Vs) annotation (Line(
      points={{96.8,0},{112,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(V_S, Filter.u) annotation (Line(
      points={{-112,-6},{-87.2,-6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(T_1_T_2.y, T_3_T_4.u) annotation (Line(points={{9,0},{14,0}}, color={0,0,127}));
  connect(imDerivativeLag.y, VSS.u) annotation (Line(points={{69,0},{78.4,0}}, color={0,0,127}));
  connect(const.y, greater.u1) annotation (Line(points={{-77.4,40},{-69.2,40},{-69.2,26}}, color={0,0,127}));
  connect(greater.y, switch1.u2) annotation (Line(points={{-55.4,26},{-46,26},{-46,0},{-39.2,0}}, color={255,0,255}));
  connect(const1.y, greater.u2) annotation (Line(points={{-77.4,22},{-69.2,22},{-69.2,21.2}}, color={0,0,127}));
  connect(switch1.y, T_1_T_2.u) annotation (Line(points={{-25.4,0},{-14,0}}, color={0,0,127}));
  connect(T_3_T_4.y, imDerivativeLag.u) annotation (Line(points={{37,0},{41.5,0},{46,0}}, color={0,0,127}));
  connect(Filter.y, switch1.u3) annotation (Line(points={{-73.4,-6},{-39.2,-6},{-39.2,-4.8}}, color={0,0,127}));
  connect(switch1.u1, Filter.u) annotation (Line(points={{-39.2,4.8},{-92,4.8},{-92,-6},{-87.2,-6}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,-40},{120,40}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-120,-40},{120,40}}), graphics={
        Rectangle(extent={{-120,40},{120,-40}}, lineColor={0,0,255}),
        Text(
          extent={{-46,40},{54,-44}},
          lineColor={0,0,255},
          textString="IEEEST"),
        Text(
          extent={{-106,-10},{-84,-30}},
          lineColor={0,0,255},
          textString="V_S"),
        Text(
          extent={{84,14},{118,-16}},
          lineColor={0,0,255},
          textString="VOTHSG"),
        Text(
          extent={{-106,32},{-78,8}},
          lineColor={0,0,255},
          textString="V_CT")}),
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
end IEEEST;
