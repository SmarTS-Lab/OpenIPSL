within OpenIPSL.Electrical.Controls.PSSE.ES;
model ConstantExcitation
extends OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter;
initial equation
  V_REF = 0;
equation
  connect(DiffV.u2, DiffV.u1) annotation (Line(points={{-122,-6},{-132,-6},{-132,
          6},{-122,6}}, color={0,0,127}));
  connect(EFD0, EFD) annotation (Line(points={{-200,-130},{-20,-130},{160,-130},
          {160,0},{210,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ConstantExcitation;
