within OpenIPSL.Electrical.Controls.PSSE.PSS;
model STAB3
  parameter Real T_t "(s)";
  parameter Real T_X1 ">0 (s)";
  parameter Real T_X2 ">0 (s)";
  parameter Real K_X;
  parameter Real V_LIM;
  Modelica.Blocks.Interfaces.RealInput PELEC "Machine electrical power (pu)"
    annotation (Placement(transformation(extent={{-130,-20},{-90,20}}),
        iconTransformation(extent={{-130,-20},{-90,20}})));
  Modelica.Blocks.Interfaces.RealOutput VOTHSG "PSS output signal" annotation (
      Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(
          extent={{100,-10},{120,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_LIM, uMin=-V_LIM)
    annotation (Placement(transformation(extent={{70,-10},{90,10}})));
  Modelica.Blocks.Sources.Constant const(k=P_REF)
    annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
protected
  parameter Real P_REF(fixed=false);
  parameter Real PELEC0(fixed=false);
  NonElectrical.Continuous.SimpleLag imSimpleLag(
    K=1,
    T=T_t,
    y_start=PELEC0)
    annotation (Placement(transformation(extent={{-76,-10},{-56,10}})));
  Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  NonElectrical.Continuous.SimpleLag imSimpleLag1(
    K=1,
    T=T_X1,
    y_start=0) annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  Modelica.Blocks.Continuous.Derivative imDerivativeLag(
    y_start=0,
    k=-K_X,
    T=T_X2,
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{34,-10},{54,10}})));
initial equation
  PELEC0 = PELEC;
  P_REF = PELEC0;
equation
  connect(imSimpleLag1.y, imDerivativeLag.u)
    annotation (Line(points={{21,0},{32,0}}, color={0,0,127}));
  connect(imSimpleLag.y, feedback.u1)
    annotation (Line(points={{-55,0},{-46.5,0},{-38,0}}, color={0,0,127}));
  connect(imSimpleLag.u, PELEC)
    annotation (Line(points={{-78,0},{-110,0},{-110,0}}, color={0,0,127}));
  connect(feedback.y, imSimpleLag1.u)
    annotation (Line(points={{-21,0},{-11.5,0},{-2,0}}, color={0,0,127}));
  connect(imSimpleLag1.y, imDerivativeLag.u)
    annotation (Line(points={{21,0},{26.5,0},{32,0}}, color={0,0,127}));
  connect(imDerivativeLag.y, limiter.u)
    annotation (Line(points={{55,0},{68,0}}, color={0,0,127}));
  connect(limiter.y, VOTHSG)
    annotation (Line(points={{91,0},{110,0}}, color={0,0,127}));
  connect(const.y, feedback.u2)
    annotation (Line(points={{-39,-30},{-30,-30},{-30,-8}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,
            40}})),
    Icon(coordinateSystem(extent={{-100,-40},{100,40}}, preserveAspectRatio=
            false), graphics={Rectangle(extent={{-100,40},{100,-40}}, lineColor
          ={28,108,200}),Text(
          extent={{-70,20},{70,-20}},
          lineColor={28,108,200},
          textString="STAB3"),Text(
          extent={{-88,10},{-58,-10}},
          lineColor={28,108,200},
          textString="PELEC"),Text(
          extent={{64,14},{98,-12}},
          lineColor={28,108,200},
          textString="VOTHSG")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>STAB3, PSSE Manual</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2015-08-03 </p></td>
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
end STAB3;
