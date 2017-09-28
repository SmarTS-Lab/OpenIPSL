within OpenIPSL.NonElectrical.Logical;
model LV_GATE
  Modelica.Blocks.Interfaces.RealInput n1 annotation (Placement(transformation(
          extent={{-86,-2},{-46,38}}), iconTransformation(extent={{-100,10},{-80,
            30}})));
  Modelica.Blocks.Interfaces.RealInput n2 annotation (Placement(transformation(
          extent={{-86,-50},{-46,-10}}), iconTransformation(extent={{-100,-30},
            {-80,-10}})));
  Modelica.Blocks.Interfaces.RealOutput p annotation (Placement(transformation(
          extent={{-208,58},{-188,78}}), iconTransformation(extent={{60,-10},{
            80,10}})));
equation
  p = if n1 > n2 then n2 else n1;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-80,-40},{80,40}}),
        graphics),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-80,-40},{80,40}}),
        graphics={Polygon(
          points={{-80,40},{-80,-40},{0,-40},{80,0},{0,40},{-80,40}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-60,20},{0,-20}},
          lineColor={0,0,255},
          textString="LV
Gate")}),
    Documentation);
end LV_GATE;
