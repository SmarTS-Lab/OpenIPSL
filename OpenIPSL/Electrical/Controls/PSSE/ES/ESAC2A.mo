within OpenIPSL.Electrical.Controls.PSSE.ES;
model ESAC2A
  import OpenIPSL.NonElectrical.Functions.SE;
  import OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.invFEX;
  extends OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter;
  Modelica.Blocks.Interfaces.RealInput XADIFD "Field current" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={200,-110}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-200,-70})));
  parameter Real T_R=0 "Voltage input time constant (s)";
  parameter Real T_B=0 "AVR lead-lag time constant (s)";
  parameter Real T_C=0 "AVR lead-lag time constant (s)";
  parameter Real K_A=400 "AVR gain";
  parameter Real T_A=0.02 "AVR time constant (s)";
  parameter Real V_AMAX=9 "Maximum AVR output (pu)";
  parameter Real V_AMIN=-5.43 "Minimum AVR output (pu)";
  parameter Real T_E=0.8 "Exciter time constant (s)";
  parameter Real V_FEMAX=-5.43 "Minimum AVR output (pu)";
  parameter Real K_F=0.03 "Rate feedback gain (pu)";
  parameter Real T_F=1 "Rate feedback time const (s)";
  parameter Real K_C=0.2 "Rectifier load factor (pu)";
  parameter Real K_D=0.48 "Exciter demagnetizing factor (pu)";
  parameter Real K_E=1 "Exciter field factor (pu)";
  parameter Real E_1=5.25 "Exciter satutartion point 1 (pu)";
  parameter Real E_2=7 "Exciter saturation point 2 (pu)";
  parameter Real S_EE_1=0.03 "Saturation at E1";
  parameter Real S_EE_2=0.1 "Saturation at E2";
  parameter Real V_RMAX "Maximum AVR output (pu)";
  parameter Real V_RMIN "Minimum AVR output (pu)";
  NonElectrical.Logical.HV_GATE hV_GATE
    annotation (Placement(transformation(extent={{20,46},{44,34}})));
  NonElectrical.Logical.LV_GATE lV_GATE
    annotation (Placement(transformation(extent={{58,46},{82,34}})));
  NonElectrical.Continuous.LeadLag imLeadLag(
    K=1,
    T1=T_C,
    T2=T_B,
    y_start=VR0/K_A,
    x_start=VR0/K_A)
    annotation (Placement(transformation(extent={{-52,30},{-32,50}})));
  NonElectrical.Continuous.SimpleLag imSimpleLag(
    K=1,
    y_start=ECOMP0,
    T=T_R) annotation (Placement(transformation(extent={{-170,-10},{-150,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=V_RMAX, uMin=V_RMIN)
    annotation (Placement(transformation(extent={{94,30},{114,50}})));
  NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=K_A,
    T=T_A,
    y_start=VR0,
    outMax=V_AMAX,
    outMin=V_AMIN)
    annotation (Placement(transformation(extent={{-16,30},{4,50}})));
  Modelica.Blocks.Continuous.Derivative derivative(
    k=K_F,
    T=T_F,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=0,
    x_start=VFE0)
    annotation (Placement(transformation(extent={{40,-10},{20,10}})));
  BaseClasses.RotatingExciterWithDemagnetizationVarLim
    rotatingExciterWithDemagnetization(
    T_E=T_E,
    K_E=K_E,
    E_1=E_1,
    E_2=E_2,
    S_EE_1=S_EE_1,
    S_EE_2=S_EE_2,
    K_D=K_D,
    Efd0=VE0) annotation (Placement(transformation(extent={{124,30},{144,50}})));
  Modelica.Blocks.Math.Add3 add3_1(k3=-1)
    annotation (Placement(transformation(extent={{-88,30},{-68,50}})));
  BaseClasses.RectifierCommutationVoltageDrop rectifierCommutationVoltageDrop(
      K_C=K_C)
    annotation (Placement(transformation(extent={{160,30},{180,50}})));
  Modelica.Blocks.Sources.Constant lowLim(k=0)
    annotation (Placement(transformation(extent={{180,70},{160,90}})));
  Modelica.Blocks.Sources.Constant FEMAX(k=V_FEMAX)
    annotation (Placement(transformation(extent={{40,120},{60,140}})));
  Modelica.Blocks.Math.Add DiffV1(k2=-1)
    annotation (Placement(transformation(extent={{80,120},{100,140}})));
  NonElectrical.Functions.ImSE se1(
    SE1=S_EE_1,
    SE2=S_EE_2,
    E1=E_1,
    E2=E_2) annotation (Placement(transformation(
        extent={{-9,-6},{9,6}},
        rotation=180,
        origin={171,108})));
  Modelica.Blocks.Sources.Constant const(k=K_E)
    annotation (Placement(transformation(extent={{180,120},{160,140}})));
  Modelica.Blocks.Math.Add DiffV2
    annotation (Placement(transformation(extent={{150,108},{130,128}})));
  Modelica.Blocks.Math.Division division annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={110,80})));
protected
  parameter Real VR0(fixed=false);
  parameter Real Efd0(fixed=false);
  parameter Real Ifd0(fixed=false);
  parameter Real VE0(fixed=false);
  parameter Real VFE0(fixed=false);
initial equation
  Ifd0 = XADIFD;
  // Finding initial value of excitation voltage, VE0, via going through conditions of FEX function
  VE0 = invFEX(
    K_C=K_C,
    Efd0=Efd0,
    Ifd0=Ifd0);
  // Case IN>0 not checked because it will be resolved in the next iteration
  VFE0 = VE0*(SE(
    VE0,
    S_EE_1,
    S_EE_2,
    E_1,
    E_2) + K_E) + Ifd0*K_D;
  VR0 = VFE0;
  V_REF = VR0/K_A + ECOMP0;
equation
  connect(imLeadLag.y, simpleLagLim.u)
    annotation (Line(points={{-31,40},{-18,40}}, color={0,0,127}));
  connect(limiter1.y, rotatingExciterWithDemagnetization.I_C)
    annotation (Line(points={{115,40},{122.75,40}}, color={0,0,127}));
  connect(ECOMP, imSimpleLag.u)
    annotation (Line(points={{-200,0},{-172,0}}, color={0,0,127}));
  connect(simpleLagLim.y, hV_GATE.n1) annotation (Line(points={{5,40},{12,40},{
          12,37},{18.5,37}}, color={0,0,127}));
  connect(VUEL, hV_GATE.n2) annotation (Line(points={{-130,-200},{-130,-40},{14,
          -40},{14,43},{18.5,43}}, color={0,0,127}));
  connect(imSimpleLag.y, DiffV.u2) annotation (Line(points={{-149,0},{-132,0},{
          -132,-6},{-122,-6}}, color={0,0,127}));
  connect(add3_1.y, imLeadLag.u)
    annotation (Line(points={{-67,40},{-54,40}}, color={0,0,127}));
  connect(DiffV.y, add3_1.u2) annotation (Line(points={{-99,0},{-96,0},{-96,40},
          {-90,40}}, color={0,0,127}));
  connect(VOTHSG, add3_1.u1) annotation (Line(points={{-200,90},{-150,90},{-96,
          90},{-96,48},{-90,48}}, color={0,0,127}));
  connect(derivative.y, add3_1.u3) annotation (Line(points={{19,0},{-94,0},{-94,
          32},{-90,32}}, color={0,0,127}));
  connect(derivative.u, rotatingExciterWithDemagnetization.V_FE) annotation (
      Line(points={{42,0},{82,0},{120,0},{120,33.75},{122.75,33.75}}, color={0,
          0,127}));
  connect(XADIFD, rotatingExciterWithDemagnetization.XADIFD) annotation (Line(
        points={{200,-110},{134,-110},{134,28.75}}, color={0,0,127}));
  connect(rotatingExciterWithDemagnetization.EFD,
    rectifierCommutationVoltageDrop.V_EX)
    annotation (Line(points={{145.25,40},{159,40}}, color={0,0,127}));
  connect(rectifierCommutationVoltageDrop.XADIFD,
    rotatingExciterWithDemagnetization.XADIFD) annotation (Line(points={{170,29},
          {170,30},{170,-110},{134,-110},{134,28.75}}, color={0,0,127}));
  connect(rectifierCommutationVoltageDrop.EFD, EFD) annotation (Line(points={{
          181,40},{190,40},{190,0},{210,0}}, color={0,0,127}));
  connect(hV_GATE.p, lV_GATE.n2) annotation (Line(points={{42.5,40},{50,40},{50,
          43},{56.5,43}}, color={0,0,127}));
  connect(VOEL, lV_GATE.n1) annotation (Line(points={{-70,-200},{-70,-200},{-70,
          -60},{50,-60},{50,37},{56.5,37}}, color={0,0,127}));
  connect(lV_GATE.p, limiter1.u)
    annotation (Line(points={{80.5,40},{92,40},{92,40}}, color={0,0,127}));
  connect(lowLim.y, rotatingExciterWithDemagnetization.outMin) annotation (Line(
        points={{159,80},{150,80},{150,47.5},{145.25,47.5}}, color={0,0,127}));
  connect(FEMAX.y, DiffV1.u1) annotation (Line(points={{61,130},{68,130},{68,
          136},{78,136}}, color={0,0,127}));
  connect(DiffV1.u2, rotatingExciterWithDemagnetization.XADIFD) annotation (
      Line(points={{78,124},{66,124},{66,100},{86,100},{86,-20},{134,-20},{134,
          28.75}}, color={0,0,127}));
  connect(se1.VE_IN, EFD) annotation (Line(points={{180.9,108},{190,108},{190,0},
          {210,0}}, color={0,0,127}));
  connect(DiffV2.u1, const.y) annotation (Line(points={{152,124},{156,124},{156,
          130},{159,130}}, color={0,0,127}));
  connect(DiffV2.u2, se1.VE_OUT) annotation (Line(points={{152,112},{156,112},{
          156,108},{161.46,108}}, color={0,0,127}));
  connect(division.u1, DiffV1.y) annotation (Line(points={{116,92},{116,92},{
          116,128},{116,130},{101,130}}, color={0,0,127}));
  connect(DiffV2.y, division.u2)
    annotation (Line(points={{129,118},{104,118},{104,92}}, color={0,0,127}));
  connect(division.y, rotatingExciterWithDemagnetization.outMax) annotation (
      Line(points={{110,69},{110,60},{118,60},{118,47.5},{122.75,47.5}}, color=
          {0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-200,-200},{200,160}}, initialScale=0.1)),

    Icon(coordinateSystem(extent={{-200,-200},{200,160}}, initialScale=0.1),
        graphics={Text(
          extent={{-186,-60},{-116,-80}},
          lineColor={28,108,200},
          textString="XADIFD"),Text(
          extent={{-100,152},{100,92}},
          lineColor={28,108,200},
          textString="ESAC1A")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>ESAC1A, PSS/E Manual</td>
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
</html>"));
end ESAC2A;
