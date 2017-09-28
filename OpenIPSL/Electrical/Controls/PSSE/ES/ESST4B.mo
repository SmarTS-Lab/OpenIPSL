within OpenIPSL.Electrical.Controls.PSSE.ES;
model ESST4B " IEEE type ST4B potential or compounded
  source-controlled rectifier exciter "
  extends OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter;
  import Modelica.ComplexMath.j;
  import Modelica.ComplexMath.'abs';
  parameter Real T_R=0.3;
  parameter Real K_PR=2.97;
  parameter Real K_IR=2.97;
  parameter Real V_RMAX=1;
  parameter Real V_RMIN=-0.87;
  parameter Real T_A=0.01;
  parameter Real K_PM=1;
  parameter Real K_IM=0.2;
  parameter Real V_MMAX=1;
  parameter Real V_MMIN=-0.87;
  parameter Real K_G=0.1;
  parameter Real K_P=6.73;
  parameter Real K_I=0.1;
  parameter Real V_BMAX=8.41;
  parameter Real K_C=0.1;
  parameter Real X_L=0;
  parameter Real THETAP=0;
  NonElectrical.Logical.LV_GATE lV_Gate
    annotation (Placement(transformation(extent={{120,-70},{144,-58}})));
  Modelica.Blocks.Interfaces.RealInput XADIFD annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={50,-180}), iconTransformation(extent={{-10,-10},{10,10}},
          origin={-200,-70})));
  Modelica.Blocks.Math.Product product
    annotation (Placement(transformation(extent={{160,-80},{180,-60}})));
  NonElectrical.Continuous.SimpleLag VA(
    K=1,
    T=T_A,
    y_start=VR0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={60,0})));
  Modelica.Blocks.Continuous.LimIntegrator VR1(
    outMax=V_RMAX/K_PR,
    outMin=V_RMIN/K_PR,
    k=K_IR,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=VR0)
    annotation (Placement(transformation(extent={{-40,-30},{-20,-10}})));
  Modelica.Blocks.Math.Gain Gain1(k=K_PR)
    annotation (Placement(transformation(extent={{-40,10},{-20,30}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_RMAX, uMin=V_RMIN)
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Math.Add add1(k1=-1)
    annotation (Placement(transformation(extent={{80,-10},{100,10}})));
  Modelica.Blocks.Math.Gain gain(k=K_G) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={120,60})));
  Modelica.Blocks.Continuous.LimIntegrator VM1(
    outMax=V_MMAX/K_PM,
    outMin=V_MMIN/K_PM,
    k=K_IR,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=VA0)
    annotation (Placement(transformation(extent={{110,-30},{130,-10}})));
  Modelica.Blocks.Math.Gain Gain2(k=K_PM)
    annotation (Placement(transformation(extent={{110,10},{130,30}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=V_RMAX, uMin=V_RMIN)
    annotation (Placement(transformation(extent={{170,-10},{190,10}})));
  Modelica.Blocks.Math.Add add2
    annotation (Placement(transformation(extent={{140,-10},{160,10}})));
  Modelica.Blocks.Nonlinear.Limiter maxLimiter(uMin=-Modelica.Constants.inf,
      uMax=V_BMAX)
    annotation (Placement(transformation(extent={{100,-120},{120,-100}})));
  OpenIPSL.Interfaces.PwPin Gen_terminal annotation (Placement(transformation(
          extent={{-180,120},{-160,140}}), iconTransformation(extent={{-180,120},
            {-160,140}})));
  OpenIPSL.Interfaces.PwPin Bus annotation (Placement(transformation(extent={{
            160,120},{180,140}}), iconTransformation(extent={{160,120},{180,140}})));
  Modelica.Blocks.Math.Add3 add3_1
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  NonElectrical.Continuous.SimpleLag TransducerDelay(
    K=1,
    T=T_R,
    y_start=ECOMP0)
    annotation (Placement(transformation(extent={{-170,-10},{-150,10}})));
  BaseClasses.RectifierCommutationVoltageDrop rectifierCommutationVoltageDrop(
      K_C=K_C)
    annotation (Placement(transformation(extent={{40,-120},{60,-100}})));
protected
  Modelica.Blocks.Interfaces.RealOutput VE
    annotation (Placement(transformation(extent={{10,-120},{30,-100}})));
  Complex V_T;
  Complex I_T;
  parameter Complex K_P_comp=K_P*cos(THETAP) + j*K_P*sin(THETAP);
  parameter Real Ifd0(fixed=false);
  parameter Real IN0(fixed=false);
  parameter Real VB0(fixed=false);
  parameter Real VA0(fixed=false);
  parameter Real VR0(fixed=false);
  parameter Real VE0(fixed=false);
initial equation
  Ifd0 = XADIFD;
  VE0 = VE;
  IN0 = K_C*Ifd0/VE0;
  if IN0 <= 0 then
    VB0 = IN0*1;
  elseif IN0 > 0 and IN0 <= 0.433 then
    VB0 = IN0*(1 - 0.577*IN0);
  elseif IN0 > 0.433 and IN0 < 0.75 then
    VB0 = IN0*sqrt(0.75 - IN0^2);
  elseif IN0 >= 0.75 and IN0 <= 1 then
    VB0 = IN0*1.732*(1 - IN0);
  else
    VB0 = IN0*0;
  end if;
  VA0 = Efd0/VB0;
  VR0 = Efd0*K_G;
  V_REF = ECOMP;
equation
  VE = 'abs'(K_P_comp*V_T + j*(K_I + K_P_comp*X_L)*I_T);
  V_T = Gen_terminal.vr + j*Gen_terminal.vi;
  I_T = Gen_terminal.ir - Bus.ir + j*(Gen_terminal.ii - Bus.ii);
  connect(add.y, limiter.u) annotation (Line(
      points={{11,0},{18,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(maxLimiter.y, product.u2) annotation (Line(
      points={{121,-110},{148,-110},{148,-76},{158,-76}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(lV_Gate.p, product.u1) annotation (Line(
      points={{142.5,-64},{158,-64}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add3_1.y, Gain1.u) annotation (Line(points={{-59,0},{-52,0},{-52,20},
          {-42,20}}, color={0,0,127}));
  connect(VR1.u, Gain1.u) annotation (Line(points={{-42,-20},{-52,-20},{-52,20},
          {-42,20}}, color={0,0,127}));
  connect(ECOMP, TransducerDelay.u)
    annotation (Line(points={{-200,0},{-172,0},{-172,0}}, color={0,0,127}));
  connect(TransducerDelay.y, DiffV.u2) annotation (Line(points={{-149,0},{-132,
          0},{-132,-6},{-122,-6}}, color={0,0,127}));
  connect(DiffV.y, add3_1.u2)
    annotation (Line(points={{-99,0},{-82,0},{-82,0}}, color={0,0,127}));
  connect(VOTHSG, add3_1.u1) annotation (Line(points={{-200,90},{-92,90},{-92,8},
          {-82,8}}, color={0,0,127}));
  connect(VUEL, add3_1.u3) annotation (Line(points={{-130,-200},{-130,-20},{-92,
          -20},{-92,-8},{-82,-8}}, color={0,0,127}));
  connect(VR1.y, add.u2) annotation (Line(points={{-19,-20},{-16,-20},{-16,-6},
          {-12,-6}}, color={0,0,127}));
  connect(Gain1.y, add.u1) annotation (Line(points={{-19,20},{-16,20},{-16,6},{
          -12,6}}, color={0,0,127}));
  connect(limiter.y, VA.u)
    annotation (Line(points={{41,0},{44.5,0},{48,0}}, color={0,0,127}));
  connect(VA.y, add1.u2)
    annotation (Line(points={{71,0},{74,0},{74,-6},{78,-6}}, color={0,0,127}));
  connect(add1.y, Gain2.u) annotation (Line(points={{101,0},{104,0},{104,20},{
          108,20}}, color={0,0,127}));
  connect(VM1.u, Gain2.u) annotation (Line(points={{108,-20},{104,-20},{104,20},
          {108,20}}, color={0,0,127}));
  connect(Gain2.y, add2.u1) annotation (Line(points={{131,20},{134,20},{134,6},
          {138,6}}, color={0,0,127}));
  connect(VM1.y, add2.u2) annotation (Line(points={{131,-20},{134,-20},{134,-6},
          {138,-6}}, color={0,0,127}));
  connect(add2.y, limiter1.u)
    annotation (Line(points={{161,0},{164.5,0},{168,0}}, color={0,0,127}));
  connect(product.y, EFD) annotation (Line(points={{181,-70},{198,-70},{198,0},
          {210,0}}, color={0,0,127}));
  connect(lV_Gate.n2, VOEL) annotation (Line(points={{118.5,-67},{0,-67},{0,-160},
          {-70,-160},{-70,-200}}, color={0,0,127}));
  connect(limiter1.y, lV_Gate.n1) annotation (Line(points={{191,0},{194,0},{194,
          -50},{112,-50},{112,-61},{118.5,-61}}, color={0,0,127}));
  connect(gain.u, EFD) annotation (Line(points={{132,60},{198,60},{198,0},{210,
          0}}, color={0,0,127}));
  connect(gain.y, add1.u1) annotation (Line(points={{109,60},{74,60},{74,6},{78,
          6}}, color={0,0,127}));
  connect(XADIFD, rectifierCommutationVoltageDrop.XADIFD)
    annotation (Line(points={{50,-180},{50,-180},{50,-121}}, color={0,0,127}));
  connect(rectifierCommutationVoltageDrop.EFD, maxLimiter.u)
    annotation (Line(points={{61,-110},{98,-110}}, color={0,0,127}));
  connect(VE, rectifierCommutationVoltageDrop.V_EX)
    annotation (Line(points={{20,-110},{39,-110}}, color={0,0,127}));
  connect(Gen_terminal, Bus) annotation (Line(points={{-170,130},{170,130},{170,
          130}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(extent={{-200,-200},{200,160}}, initialScale=0.1),
        graphics={Text(
          extent={{210,-4},{234,-18}},
          lineColor={255,0,0},
          textString="VB")}),
    Icon(coordinateSystem(extent={{-200,-200},{200,160}}, initialScale=0.1),
        graphics={Text(
          extent={{-146,158},{-96,100}},
          lineColor={0,0,255},
          textString="GenT"),Text(
          extent={{-186,-60},{-116,-80}},
          lineColor={28,108,200},
          textString="XADIFD")}),
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
end ESST4B;
