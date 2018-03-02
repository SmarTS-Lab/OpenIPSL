within OpenIPSL.Electrical.Controls.PSAT.OEL;
model OEL "PSATs Over-Excitation Limiter"
  outer OpenIPSL.Electrical.SystemBase SysData;
  Modelica.Blocks.Interfaces.RealInput v "Generator terminal voltage (pu)"
    annotation (Placement(transformation(extent={{-112,50},{-92,70}}),
        iconTransformation(extent={{-104,48},{-80,72}})));
  Modelica.Blocks.Interfaces.RealInput p "Active power (pu)" annotation (
      Placement(transformation(extent={{-112,-10},{-92,10}}),
        iconTransformation(extent={{-104,8},{-80,32}})));
  Modelica.Blocks.Interfaces.RealInput q "Reactive power (pu)" annotation (
      Placement(transformation(extent={{-112,-70},{-92,-50}}),
        iconTransformation(extent={{-104,-32},{-80,-8}})));
  FieldCurrent field_current(xd=Z_MBtoSB*xd, xq=Z_MBtoSB*xq)
    annotation (Placement(transformation(extent={{-40,-32},{-20,-8}})));
  Modelica.Blocks.Interfaces.RealOutput v_ref annotation (Placement(
        transformation(extent={{94,-10},{114,10}}), iconTransformation(extent={
            {92,-12},{116,12}})));
  parameter Modelica.SIunits.Time T0=10 "Integrator time constant (s)";
  parameter Modelica.SIunits.PerUnit xd
    "d-axis estimated generator reactance (pu, machine base)";
  parameter Modelica.SIunits.PerUnit xq
    "q-axis estimated generator reactance (pu, machine base)";
  parameter Modelica.SIunits.PerUnit if_lim
    "Maximum field current (pu, system base)";
  parameter Modelica.SIunits.PerUnit vOEL_max
    "Maximum output signal (pu, machine base)";
  parameter OpenIPSL.Types.ApparentPowerMega Sn=SysData.S_b
    "Power rating (MVA)" annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.VoltageKilo Vn=V_b "Voltage rating (kV)"
    annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.VoltageKilo V_b=400 "Base voltage of the bus (kV)";
protected
  parameter Real Z_MBtoSB=(SysData.S_b*Vn^2)/(Sn*V_b^2)
    "Z(machine base) -> Z(system base)";
  parameter Real I_MBtoSB=(Sn*V_b)/(SysData.S_b*Vn)
    "I(machine base) -> I(system base)";
public
  Modelica.Blocks.Math.Feedback add
    annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));
  Modelica.Blocks.Sources.Constant currentLimit(k=if_lim) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-60})));
  Modelica.Blocks.Continuous.LimIntegrator limIntegrator(
    k=1/T0,
    outMax=vOEL_max,
    outMin=0,
    strict=true)
    annotation (Placement(transformation(extent={{22,-30},{42,-10}})));
  Modelica.Blocks.Interfaces.RealInput v_ref0 "Generator terminal voltage (pu)"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,110}), iconTransformation(
        extent={{-12,-12},{12,12}},
        rotation=-90,
        origin={-2,112})));
  Modelica.Blocks.Math.Feedback difference annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={80,0})));
equation
  connect(field_current.ifield, add.u1)
    annotation (Line(points={{-19,-20},{-19,-20},{-8,-20}}, color={0,0,127}));
  connect(currentLimit.y, add.u2) annotation (Line(points={{8.88178e-016,-49},{
          8.88178e-016,-38},{8.88178e-016,-28},{0,-28}}, color={0,0,127}));
  connect(v_ref, difference.y)
    annotation (Line(points={{104,0},{89,0}}, color={0,0,127}));
  connect(field_current.v, v) annotation (Line(points={{-40,-12.8},{-60,-12.8},
          {-60,60},{-102,60}},color={0,0,127}));
  connect(limIntegrator.y, difference.u2) annotation (Line(points={{43,-20},{44,
          -20},{80,-20},{80,-8}}, color={0,0,127}));
  connect(difference.u1, v_ref0) annotation (Line(points={{72,0},{72,0},{40,0},
          {40,60},{0,60},{0,110}},color={0,0,127}));
  connect(p, field_current.p) annotation (Line(points={{-102,0},{-102,0},{-80,0},
          {-80,-20},{-40,-20}}, color={0,0,127}));
  connect(q, field_current.q) annotation (Line(points={{-102,-60},{-60,-60},{-60,
          -27.2},{-40,-27.2}}, color={0,0,127}));
  connect(add.y, limIntegrator.u)
    annotation (Line(points={{9,-20},{9,-20},{20,-20}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(extent={{-100,100},{100,-100}},
          lineColor={0,0,255}),Text(
          extent={{-88,82},{-50,46}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="v"),Text(
          extent={{-84,42},{-50,8}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="p"),Text(
          extent={{-82,-2},{-54,-36}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="q"),Text(
          extent={{10,98},{46,66}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="vref0"),Text(
          extent={{60,-4},{94,-38}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="v_ref"),Text(
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
