within OpenIPSL.Electrical.Controls.PSSE.ES;
model IEEET1 "IEEE Type 1 excitation system"
  extends OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter;
  import OpenIPSL.NonElectrical.Functions.SE;
  import
    OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.calculate_dc_exciter_params;
  parameter Real T_R=1 "Voltage input time constant (s)";
  parameter Real K_A=40 "AVR gain";
  parameter Real T_A=0.04 "AVR time constant (s)";
  parameter Real V_RMAX=7.3 "Maximum AVR output (pu)";
  parameter Real V_RMIN=-7.3 "Minimum AVR output (pu)";
  parameter Real K_E=1 "Exciter field gain, s";
  parameter Real T_E=0.8 "Exciter time constant (s)";
  parameter Real K_F=0.03 "Rate feedback gain (pu)";
  parameter Real T_F=1 "Rate feedback time constant (s)";
  parameter Real E_1=2.400 "Exciter saturation point 1 (pu)";
  parameter Real S_EE_1=0.30000E-01 "Saturation at E1";
  parameter Real E_2=5.0000 "Exciter saturation point 2 (pu)";
  parameter Real S_EE_2=0.50000 "Saturation at E2";
  Modelica.Blocks.Math.Add3 sum2
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Blocks.Math.Add sum3(k2=-1)
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Modelica.Blocks.Continuous.Derivative derivativeLag(
    k=K_F,
    T=T_F,
    y_start=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    x_start=Efd0)
    annotation (Placement(transformation(extent={{80,-60},{60,-40}})));
  NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=K_A,
    T=T_A,
    y_start=VR0,
    outMax=V_RMAX,
    outMin=V_RMIN)
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  BaseClasses.RotatingExciter rotatingExciter(
    T_E=T_E,
    E_1=E_1,
    E_2=E_2,
    S_EE_1=S_EE_1,
    S_EE_2=S_EE_2,
    Efd0=Efd0,
    K_E=KE0) annotation (Placement(transformation(extent={{140,-10},{160,10}})));
  NonElectrical.Continuous.SimpleLag TransducerDelay(
    K=1,
    T=T_R,
    y_start=ECOMP0)
    annotation (Placement(transformation(extent={{-170,-10},{-150,10}})));
  Modelica.Blocks.Math.Add DiffV1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-100,-130})));
protected
  parameter Real VRMAX0(fixed=false) "Maximum AVR output (pu)";
  parameter Real VRMIN0(fixed=false) "Minimum AVR output (pu)";
  parameter Real KE0(fixed=false) "Exciter field gain, s";
  parameter Real SE_Efd0(fixed=false);
  parameter Real VR0(fixed=false);
initial equation
  SE_Efd0 = SE(
    Efd0,
    S_EE_1,
    S_EE_2,
    E_1,
    E_2);
  (VRMAX0,VRMIN0,KE0) = calculate_dc_exciter_params(
    V_RMAX,
    V_RMIN,
    K_E,
    E_2,
    S_EE_2,
    Efd0,
    SE_Efd0);
  VR0 = Efd0*(KE0 + SE_Efd0);
  V_REF = VR0/K_A + ECOMP0;
equation
  connect(sum3.u2, derivativeLag.y) annotation (Line(points={{-22,-6},{-34,-6},
          {-34,-28},{-34,-50},{59,-50}}, color={0,0,127}));
  connect(sum3.y, simpleLagLim.u)
    annotation (Line(points={{1,0},{58,0}}, color={0,0,127}));
  connect(rotatingExciter.EFD, EFD)
    annotation (Line(points={{161.25,0},{210,0}}, color={0,0,127}));
  connect(simpleLagLim.y, rotatingExciter.I_C)
    annotation (Line(points={{81,0},{138.75,0}}, color={0,0,127}));
  connect(derivativeLag.u, EFD) annotation (Line(points={{82,-50},{180,-50},{
          180,0},{210,0}}, color={0,0,127}));
  connect(ECOMP, TransducerDelay.u)
    annotation (Line(points={{-200,0},{-172,0}}, color={0,0,127}));
  connect(TransducerDelay.y, DiffV.u2) annotation (Line(points={{-149,0},{-140,
          0},{-132,0},{-132,-6},{-122,-6}}, color={0,0,127}));
  connect(sum2.y, sum3.u1) annotation (Line(points={{-39,0},{-34,0},{-34,6},{-22,
          6}}, color={0,0,127}));
  connect(DiffV.y, sum2.u2)
    annotation (Line(points={{-99,0},{-62,0},{-62,0}}, color={0,0,127}));
  connect(VOTHSG, sum2.u1) annotation (Line(points={{-200,90},{-138,90},{-80,90},
          {-80,8},{-62,8}}, color={0,0,127}));
  connect(DiffV1.u1, VUEL) annotation (Line(points={{-106,-142},{-106,-142},{-106,
          -160},{-130,-160},{-130,-200}}, color={0,0,127}));
  connect(DiffV1.u2, VOEL) annotation (Line(points={{-94,-142},{-94,-160},{-70,
          -160},{-70,-200}}, color={0,0,127}));
  connect(DiffV1.y, sum2.u3) annotation (Line(points={{-100,-119},{-100,-20},{-80,
          -20},{-80,-8},{-62,-8}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-200,-200},{200,160}}, initialScale=0.1)),

    Icon(coordinateSystem(extent={{-200,-200},{200,160}}, initialScale=0.1),
        graphics={Text(
          extent={{-100,154},{100,94}},
          lineColor={28,108,200},
          textString="IEEET1")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSS/E Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2016-04-29</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Tin Rabuzin,SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end IEEET1;
