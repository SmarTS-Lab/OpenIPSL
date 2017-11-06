within OpenIPSL.Electrical.Controls.PSAT.OEL;
model OEL "PSATs Over-Excitation Limiter"
  outer OpenIPSL.Electrical.SystemBase SysData;
  Modelica.Blocks.Interfaces.RealInput v "Generator terminal voltage (pu)"
    annotation (Placement(transformation(extent={{-112,50},{-92,70}}),
        iconTransformation(extent={{-104,48},{-80,72}})));
  Modelica.Blocks.Interfaces.RealInput p "Active power (pu)" annotation (
      Placement(transformation(extent={{-112,-10},{-92,10}}),iconTransformation(
          extent={{-104,8},{-80,32}})));
  Modelica.Blocks.Interfaces.RealInput q "Reactive power (pu)" annotation (
      Placement(transformation(extent={{-112,-70},{-92,-50}}),
        iconTransformation(extent={{-104,-32},{-80,-8}})));
  FieldCurrent field_current(xd=xd, xq=xq)
    annotation (Placement(transformation(extent={{-56,-12},{-36,12}})));
  Modelica.Blocks.Interfaces.RealOutput v_ref annotation (Placement(
        transformation(extent={{94,-10},{114,10}}), iconTransformation(extent={
            {92,-12},{116,12}})));
  parameter Real T0=10 "Integrator time constant (s)";
  parameter Real xd "d-axis estimated generator reactance (pu, machine base)";
  parameter Real xq "q-axis estimated generator reactance (pu, machine base)";
  parameter Real if_lim "Maximum field current (pu, machine base)";
  parameter Real vOEL_max "Maximum output signal (pu, machine base)";
  parameter OpenIPSL.Types.ApparentPowerMega S_mb=SysData.S_b
    "Machine base power";
protected
  parameter Real CoB=SysData.S_b/S_mb "ratio of system base and machine base";
public
  Modelica.Blocks.Math.Feedback add
    annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
  Modelica.Blocks.Sources.Constant currentLimit(k=if_lim) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-20,-60})));
  Modelica.Blocks.Continuous.LimIntegrator limIntegrator(k=1/T0, outMax=
        vOEL_max)
    annotation (Placement(transformation(extent={{46,10},{66,30}})));
  Modelica.Blocks.Interfaces.RealInput v_ref0 "Generator terminal voltage (pu)"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={2,110}), iconTransformation(
        extent={{-12,-12},{12,12}},
        rotation=-90,
        origin={0,112})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMin=0, uMax=Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{2,-10},{22,10}})));
  Modelica.Blocks.Math.Feedback difference annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={80,20})));
  Modelica.Blocks.Math.Gain CoBq(k=CoB)
    annotation (Placement(transformation(extent={{-86,-66},{-74,-54}})));
  Modelica.Blocks.Math.Gain CoBp(k=CoB)
    annotation (Placement(transformation(extent={{-86,-6},{-74,6}})));
equation
  connect(field_current.ifield, add.u1)
    annotation (Line(points={{-35,0},{-28,0}}, color={0,0,127}));
  connect(currentLimit.y, add.u2)
    annotation (Line(points={{-20,-49},{-20,-8}}, color={0,0,127}));
  connect(limIntegrator.u, limiter.y)
    annotation (Line(points={{44,20},{40,20},{40,0},{23,0}}, color={0,0,127}));
  connect(add.y, limiter.u)
    annotation (Line(points={{-11,0},{-11,0},{0,0}}, color={0,0,127}));
  connect(v_ref, difference.y)
    annotation (Line(points={{104,0},{80,0},{80,11}}, color={0,0,127}));
  connect(field_current.v, v) annotation (Line(points={{-56,7.2},{-60,7.2},{-60,
          60},{-102,60}}, color={0,0,127}));
  connect(limIntegrator.y, difference.u2)
    annotation (Line(points={{67,20},{67,20},{72,20}}, color={0,0,127}));
  connect(difference.u1, v_ref0) annotation (Line(points={{80,28},{80,76},{2,76},
          {2,110}}, color={0,0,127}));
  connect(CoBp.u, p)
    annotation (Line(points={{-87.2,0},{-87.2,0},{-102,0}}, color={0,0,127}));
  connect(CoBp.y, field_current.p)
    annotation (Line(points={{-73.4,0},{-73.4,0},{-56,0}}, color={0,0,127}));
  connect(q, CoBq.u) annotation (Line(points={{-102,-60},{-94,-60},{-87.2,-60}},
        color={0,0,127}));
  connect(CoBq.y, field_current.q) annotation (Line(points={{-73.4,-60},{-60,-60},
          {-60,-7.2},{-56,-7.2}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={
        Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255}),
        Text(
          extent={{-88,82},{-50,46}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="v"),
        Text(
          extent={{-84,42},{-50,8}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="p"),
        Text(
          extent={{-82,-2},{-54,-36}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="q"),
        Text(
          extent={{10,98},{46,66}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="vref0"),
        Text(
          extent={{60,-4},{94,-38}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="v_ref"),
        Text(
          extent={{-26,38},{36,-40}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="OXL")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Over Excitation Limiter, PSAT manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-10-02</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Le Qi, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end OEL;
