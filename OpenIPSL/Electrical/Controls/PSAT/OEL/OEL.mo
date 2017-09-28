within OpenIPSL.Electrical.Controls.PSAT.OEL;
model OEL "PSATs Over-Excitation Limiter"

  Modelica.Blocks.Interfaces.RealInput v "Generator terminal voltage (pu)"
    annotation (Placement(transformation(extent={{-112,50},{-92,70}}),
        iconTransformation(extent={{-104,48},{-80,72}})));
  Modelica.Blocks.Interfaces.RealInput p "Active power (pu)" annotation (
      Placement(transformation(extent={{-112,-10},{-92,10}}),iconTransformation(
          extent={{-104,8},{-80,32}})));
  Modelica.Blocks.Interfaces.RealInput q "Reactive power (pu)" annotation (
      Placement(transformation(extent={{-112,-72},{-92,-52}}),
        iconTransformation(extent={{-104,-32},{-80,-8}})));
  FieldCurrent field_current(xd=xd, xq=xq)
    annotation (Placement(transformation(extent={{-76,-12},{-56,12}})));

  Modelica.Blocks.Interfaces.RealOutput v_ref annotation (Placement(
        transformation(extent={{94,-10},{114,10}}), iconTransformation(extent={
            {92,-12},{116,12}})));
  parameter Real T0 "Integrator time constant (s)";
  parameter Real xd "d-axis estimated generator reactance (pu)";
  parameter Real xq "q-axis estimated generator reactance (pu)";
  parameter Real if_lim "Maximum filed current (pu)";
  parameter Real vOEL_max "Maximum output signal (pu)";
  Modelica.Blocks.Math.Feedback add
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  Modelica.Blocks.Sources.Constant currentLimit(k=if_lim) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-40,-60})));
  Modelica.Blocks.Continuous.LimIntegrator limIntegrator(k=1/T0, outMax=
        vOEL_max)
    annotation (Placement(transformation(extent={{12,-10},{32,10}})));
  Modelica.Blocks.Interfaces.RealInput v_ref0 "Generator terminal voltage (pu)"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={2,110}), iconTransformation(
        extent={{-12,-12},{12,12}},
        rotation=-90,
        origin={0,112})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMin=0, uMax=Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Modelica.Blocks.Math.Feedback difference annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={40,68})));
equation
  connect(field_current.ifield, add.u1)
    annotation (Line(points={{-55,0},{-48,0}}, color={0,0,127}));
  connect(currentLimit.y, add.u2)
    annotation (Line(points={{-40,-49},{-40,-49},{-40,-8}}, color={0,0,127}));
  connect(limIntegrator.u, limiter.y)
    annotation (Line(points={{10,0},{1,0}}, color={0,0,127}));
  connect(add.y, limiter.u)
    annotation (Line(points={{-31,0},{-31,0},{-22,0}}, color={0,0,127}));
  connect(v_ref, difference.y) annotation (Line(points={{104,0},{80,0},{80,68},
          {49,68}}, color={0,0,127}));
  connect(p, field_current.p)
    annotation (Line(points={{-102,0},{-76,0}}, color={0,0,127}));
  connect(field_current.v, v) annotation (Line(points={{-76,7.2},{-88,7.2},{-88,
          60},{-102,60}}, color={0,0,127}));
  connect(q, field_current.q) annotation (Line(points={{-102,-62},{-88,-62},{-88,
          -7.2},{-76,-7.2}}, color={0,0,127}));
  connect(limIntegrator.y, difference.u2)
    annotation (Line(points={{33,0},{40,0},{40,60}}, color={0,0,127}));
  connect(difference.u1, v_ref0) annotation (Line(points={{32,68},{32,68},{2,68},
          {2,110}}, color={0,0,127}));
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
