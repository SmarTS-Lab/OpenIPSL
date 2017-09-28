within OpenIPSL.NonElectrical.Logical;
model Relay4
  Modelica.Blocks.Interfaces.RealInput in1 annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=-90,
        origin={-40,46}), iconTransformation(
        extent={{-5.5,-6},{5.5,6}},
        rotation=-90,
        origin={-30,45.5})));
  Modelica.Blocks.Interfaces.RealInput in2 annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=-90,
        origin={-14,46}), iconTransformation(
        extent={{-5.5,-6},{5.5,6}},
        rotation=-90,
        origin={-12,45.5})));
  Modelica.Blocks.Interfaces.RealInput in3 annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=-90,
        origin={14,46}), iconTransformation(
        extent={{-5.5,-6},{5.5,6}},
        rotation=-90,
        origin={10,45.5})));
  Modelica.Blocks.Interfaces.RealInput in4 annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=-90,
        origin={38,46}), iconTransformation(
        extent={{-5.5,-6},{5.5,6}},
        rotation=-90,
        origin={30,45.5})));
  Modelica.Blocks.Interfaces.RealInput p1
    annotation (Placement(transformation(extent={{-50,14},{-40,26}})));
  Modelica.Blocks.Interfaces.RealInput p2
    annotation (Placement(transformation(extent={{-50,-26},{-40,-14}})));
  Modelica.Blocks.Interfaces.RealOutput n annotation (Placement(transformation(
          extent={{41,-6},{51,6}}), iconTransformation(extent={{40,-4},{48,4}})));
equation
  n = if in1 == 0 and in2 == 1 and in3 == 0 and in4 == 0 then p1 else p2;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-40,-40},{40,40}}),
        graphics),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-40,-40},{40,40}}),
        graphics={Rectangle(
          extent={{-40,40},{40,-40}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Line(
          points={{-34,20},{-6,20}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{-34,-20},{-6,-20}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),Ellipse(
          extent={{-6,23},{0,17}},
          lineColor={0,0,255},
          lineThickness=0.5),Ellipse(
          extent={{-6,-17},{0,-23}},
          lineColor={0,0,255},
          lineThickness=0.5),Line(
          points={{0,16},{12,0},{40,0}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5)}),
    Documentation);
end Relay4;
