within iPSL.Electrical.Controls.PSSE.ES.ESDC1A;


model ESDC1A
  import iPSL.NonElectrical.Functions.SE;
  Modelica.Blocks.Interfaces.RealInput ECOMP "Input, generator terminal voltage" annotation (Placement(transformation(extent={{-80,23},{-70,35}}), iconTransformation(extent={{-80,23},{-70,35}})));
  Modelica.Blocks.Interfaces.RealInput VOTHSG "Upss" annotation (Placement(transformation(extent={{-80,4},{-70,16}}), iconTransformation(extent={{-80,4},{-70,16}})));
  Modelica.Blocks.Interfaces.RealInput VOEL "OEL output" annotation (Placement(transformation(extent={{-80,-16},{-70,-4}}), iconTransformation(extent={{-80,-16},{-70,-4}})));
  Modelica.Blocks.Interfaces.RealOutput EFD "Output,excitation voltage" annotation (Placement(transformation(extent={{100,-6},{110,6}}), iconTransformation(extent={{100,-6},{110,6}})));
  parameter Real T_R=0 "Voltage input time constant (s)";
  parameter Real K_A=400 "AVR gain";
  parameter Real T_A=0.02 "AVR time constant (s)";
  parameter Real T_B=0 "AVR lead-lag time constant (s)";
  parameter Real T_C=0 "AVR lead-lag time constant (s)";
  parameter Real V_RMAX=9 "Maximum AVR output (pu)";
  parameter Real V_RMIN=-5.43 "Minimum AVR output (pu)";
  parameter Real K_E=1 "Exciter field factor (pu)";
  parameter Real T_E=0.8 "Exciter time constant (s)";
  parameter Real K_F=0.03 "Rate feedback gain (pu)";
  parameter Real T_F1=1 "Rate feedback time constant (s)";
  parameter Real E_1=5.25 "Exciter saturation point 1 (pu)";
  parameter Real E_2=7 "Exciter saturation point 2 (pu)";
  parameter Real S_EE_1=0.03 "Saturation at E_1";
  parameter Real S_EE_2=0.1 "Saturation at E_2";
  Modelica.Blocks.Continuous.Derivative imDerivativeLag(
    k=K_F,
    T=T_F1,
    y_start=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    x_start=vf00) annotation (Placement(transformation(extent={{10,-5},{0,5}})));
  NonElectrical.Logical.HV_GATE hV_GATE annotation (Placement(transformation(extent={{7,-32},{23,-24}})));
  Modelica.Blocks.Interfaces.RealInput VUEL "UEL output"
    annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=90,
        origin={-3,-56}), iconTransformation(extent={{-80,-36},{-70,-24}})));
  Modelica.Blocks.Interfaces.RealInput EFD0 annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-75,39}), iconTransformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-10,-34})));
  NonElectrical.Functions.ImSE imSE(
    SE1=S_EE_1,
    SE2=S_EE_2,
    E1=E_1,
    E2=E_2) annotation (Placement(transformation(extent={{89,38},{73,48}})));
  NonElectrical.Continuous.LeadLag imLeadLag(
    K=1,
    T1=T_C,
    T2=T_B,
    y_start=vr0/K_A) annotation (Placement(transformation(extent={{-20,-30},{-10,-20}})));
  Modelica.Blocks.Math.Add add(k1=-1) annotation (Placement(transformation(extent={{60,-30},{70,-20}})));
  Modelica.Blocks.Continuous.LimIntegrator limIntegrator(
    k=1/T_E,
    outMax=Modelica.Constants.inf,
    outMin=0,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=vf00) annotation (Placement(transformation(extent={{80,-30},{90,-20}})));
  Modelica.Blocks.Math.Add add1 annotation (Placement(transformation(extent={{46,20},{36,30}})));
  Modelica.Blocks.Math.Product product annotation (Placement(transformation(extent={{67,35},{57,45}})));
  Modelica.Blocks.Math.Add3 add3_1(k2=-1, k1=-1) annotation (Placement(transformation(extent={{-40,-30},{-30,-20}})));
  NonElectrical.Continuous.SimpleLag imLimitedSimpleLag1(
    K=1,
    T=T_R,
    y_start=ECOMP0) annotation (Placement(transformation(extent={{-60,20},{-50,30}})));
  Modelica.Blocks.Math.Add3 add3_2 annotation (Placement(transformation(extent={{-60,-34},{-50,-24}})));
  Modelica.Blocks.Sources.Constant const1(k=VREF) annotation (Placement(transformation(extent={{-78,-37},{-70,-29}})));
  NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=K_A,
    T=T_A,
    y_start=vr0,
    outMax=V_RMAX0,
    outMin=V_RMIN0) annotation (Placement(transformation(extent={{31,-33},{41,-23}})));
protected
  parameter Real VREF(fixed=false);
  parameter Real vf00(fixed=false) "Initial field voltage";
  parameter Real vr0(fixed=false);
  parameter Real ECOMP0(fixed=false);
  parameter Real V_RMAX0(fixed=false);
  parameter Real K_E0(fixed=false);
  parameter Real V_RMIN0(fixed=false);
  parameter Real SE_Efd0(fixed=false);
public
  Modelica.Blocks.Math.Gain gain(k=K_E0) annotation (Placement(transformation(extent={{67,17},{57,27}})));
  function param_init
    input Real V_RMAX_init;
    input Real K_E_init;
    input Real E_2;
    input Real S_EE_2;
    input Real Efd0;
    input Real SE_Efd0;
    output Real V_RMAX;
    output Real K_E;
  algorithm
    if (V_RMAX_init == 0) then
      if (K_E_init <= 0) then
        V_RMAX := S_EE_2*E_2;
      else
        V_RMAX := S_EE_2 + K_E_init;
      end if;
    else
      V_RMAX := V_RMAX_init;
    end if;

    if (K_E_init == 0) then
      K_E := V_RMAX/(10*Efd0) - SE_Efd0;
    else
      K_E := K_E_init;
    end if;

  end param_init;

initial equation
  ECOMP0 = ECOMP;
  vf00 = EFD0;

  SE_Efd0 = iPSL.NonElectrical.Functions.SE(
    vf00,
    S_EE_1,
    S_EE_2,
    E_1,
    E_2);

  (V_RMAX0,K_E0) = param_init(
    V_RMAX,
    K_E,
    E_2,
    S_EE_2,
    vf00,
    SE_Efd0);
  if (V_RMAX == 0) then
    V_RMIN0 = -V_RMAX0;
  else
    V_RMIN0 = V_RMIN;
  end if;

  vr0 = vf00*(K_E0 + SE_Efd0);
  VREF = vr0/K_A + ECOMP0;

equation
  connect(VUEL, hV_GATE.n2) annotation (Line(points={{-3,-56},{-3,-30},{6,-30}}, color={0,0,127}));
  connect(imSE.VE_IN, EFD) annotation (Line(points={{89.8,43},{94,43},{94,0},{105,0}}, color={0,0,127}));
  connect(imLeadLag.y, hV_GATE.n1) annotation (Line(points={{-9.5,-25},{-2,-25},{-2,-26},{6,-26}}, color={0,0,127}));
  connect(add.y, limIntegrator.u) annotation (Line(points={{70.5,-25},{70.5,-25},{79,-25}}, color={0,0,127}));
  connect(limIntegrator.y, EFD) annotation (Line(points={{90.5,-25},{94,-25},{94,0},{105,0}}, color={0,0,127}));
  connect(product.u1, imSE.VE_OUT) annotation (Line(points={{68,43},{68,43},{72.52,43}}, color={0,0,127}));
  connect(product.u2, EFD) annotation (Line(points={{68,37},{94,37},{94,0},{105,0}}, color={0,0,127}));
  connect(product.y, add1.u1) annotation (Line(points={{56.5,40},{50,40},{50,28},{47,28}}, color={0,0,127}));
  connect(ECOMP, imLimitedSimpleLag1.u) annotation (Line(points={{-75,29},{-68,25},{-61,25}}, color={0,0,127}));
  connect(imLimitedSimpleLag1.y, add3_1.u2) annotation (Line(points={{-49.5,25},{-47,25},{-47,-25},{-41,-25}}, color={0,0,127}));
  connect(imDerivativeLag.y, add3_1.u1) annotation (Line(points={{-0.5,0},{-45,0},{-45,-21},{-41,-21}}, color={0,0,127}));
  connect(add3_1.y, imLeadLag.u) annotation (Line(points={{-29.5,-25},{-26,-25},{-21,-25}}, color={0,0,127}));
  connect(imDerivativeLag.u, EFD) annotation (Line(points={{11,0},{11,0},{105,0}}, color={0,0,127}));
  connect(add3_2.y, add3_1.u3) annotation (Line(points={{-49.5,-29},{-49.5,-29},{-41,-29}}, color={0,0,127}));
  connect(VOTHSG, add3_2.u1) annotation (Line(points={{-75,10},{-66,10},{-66,-25},{-61,-25}}, color={0,0,127}));
  connect(VOEL, add3_2.u2) annotation (Line(points={{-75,-10},{-69,-10},{-69,-29},{-61,-29}}, color={0,0,127}));
  connect(const1.y, add3_2.u3) annotation (Line(points={{-69.6,-33},{-61,-33}}, color={0,0,127}));
  connect(hV_GATE.p, simpleLagLim.u) annotation (Line(points={{22,-28},{22,-28},{30,-28}}, color={0,0,127}));
  connect(simpleLagLim.y, add.u2) annotation (Line(points={{41.5,-28},{54,-28},{59,-28}}, color={0,0,127}));
  connect(add.u1, add1.y) annotation (Line(points={{59,-22},{50,-22},{50,10},{30,10},{30,25},{35.5,25}}, color={0,0,127}));
  connect(add1.u2, gain.y) annotation (Line(points={{47,22},{46,22},{56.5,22}}, color={0,0,127}));
  connect(gain.u, EFD) annotation (Line(points={{68,22},{94,22},{94,0},{105,0}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-80,-40},{100,40}},
        grid={1,1})),
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-80,-40},{100,40}},
        grid={1,1}), graphics={
        Rectangle(
          extent={{-80,40},{100,-40}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-68,36},{-38,20}},
          lineColor={0,0,255},
          textString="ECOMP"),
        Text(
          extent={{-68,14},{-36,4}},
          lineColor={0,0,255},
          textString="VOTHSG"),
        Text(
          extent={{-70,-6},{-44,-16}},
          lineColor={0,0,255},
          textString="VOEL"),
        Text(
          extent={{78,4},{100,-6}},
          lineColor={0,0,255},
          textString="EFD"),
        Text(
          extent={{-28,10},{36,-8}},
          lineColor={0,0,255},
          textString="ESDC1A"),
        Text(
          extent={{-74,-26},{-42,-36}},
          lineColor={0,0,255},
          textString="VUEL"),
        Text(
          extent={{-26,-18},{6,-28}},
          lineColor={0,0,255},
          textString="EFD0")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>ESDC1A, PSS/E Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>Major change - 2016-01-19</td>
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
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
end ESDC1A;
