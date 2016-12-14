within OpenIPSL.Electrical.Controls.PSSE.PSS;
model DisabledPSS
  extends BaseClasses.BasePSS;

  Modelica.Blocks.Sources.Constant const
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  connect(const.y, VOTHSG)
    annotation (Line(points={{121,0},{226,0},{226,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end DisabledPSS;
