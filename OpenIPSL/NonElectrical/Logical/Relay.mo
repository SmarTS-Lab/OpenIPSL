within OpenIPSL.NonElectrical.Logical;
model Relay "Relay"
  Modelica.Blocks.Interfaces.RealInput u1 annotation (Placement(transformation(
          extent={{-61,20},{-41,40}}), iconTransformation(extent={{-60,20},{-40,
            40}})));
  Modelica.Blocks.Interfaces.RealInput u2 annotation (Placement(transformation(
          extent={{-61,-10},{-41,10}}), iconTransformation(extent={{-60,-10},{-40,
            10}})));
  Modelica.Blocks.Interfaces.RealInput u3 annotation (Placement(transformation(
          extent={{-61,-40},{-41,-20}}), iconTransformation(extent={{-60,-40},{
            -40,-20}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(
          extent={{39,-10},{59,10}}), iconTransformation(extent={{40,-8},{56,8}})));
equation
  y = if u1 > 0 then u2 else u3;
  annotation (
    Icon(coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=true),
        graphics={Rectangle(
          extent={{-40,40},{40,-40}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Line(
          points={{-28,0},{-8,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-28,-20},{-8,-20}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-12,-2},{4,-12},{24,-12}},
          color={0,0,255},
          smooth=Smooth.None),Ellipse(extent={{-8,2},{-4,-2}}, lineColor={0,0,
          255}),Ellipse(extent={{-8,-18},{-4,-22}}, lineColor={0,0,255}),
          Rectangle(
          extent={{-12,36},{12,24}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Line(points={{-12,30},{-28,30}}, color
          ={0,0,255}),Line(points={{28,30},{12,30}}, color={0,0,255}),Line(
          points={{0,24},{0,-10}},
          color={0,0,255},
          pattern=LinePattern.Dash),Text(
          extent={{-110,58},{110,42}},
          lineColor={0,0,255},
          textString="%name")}),
    Diagram(coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=
            true)),
    Documentation);
end Relay;
