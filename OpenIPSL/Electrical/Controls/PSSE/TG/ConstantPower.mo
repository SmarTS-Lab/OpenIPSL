within OpenIPSL.Electrical.Controls.PSSE.TG;
model ConstantPower
extends BaseClasses.BaseGovernor;
equation
  connect(PMECH0, PMECH) annotation (Line(points={{-100,-50},{0,-50},{0,0},{110,
          0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ConstantPower;
