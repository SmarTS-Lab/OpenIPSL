within OpenIPSL.Electrical.Controls.PSAT.OEL;
model FieldCurrent

  Modelica.Blocks.Interfaces.RealInput v "generator terminal voltage"
    annotation (Placement(transformation(extent={{-70,30},{-50,50}}),
        iconTransformation(extent={{-116,43},{-84,77}})));
  Modelica.Blocks.Interfaces.RealInput p "active power " annotation (Placement(
        transformation(extent={{-70,-10},{-50,10}}),iconTransformation(extent={
            {-117,-17},{-83,17}})));
  Modelica.Blocks.Interfaces.RealInput q "reactive power" annotation (Placement(
        transformation(extent={{-70,-50},{-50,-30}}), iconTransformation(extent
          ={{-117,-77},{-83,-43}})));
  Modelica.Blocks.Interfaces.RealOutput ifield annotation (Placement(
        transformation(extent={{96,-10},{116,10}}), iconTransformation(extent={
            {94,-17},{126,17}})));
  parameter Real xd;
  parameter Real xq;
protected
  Real gamma_p;
  Real gamma_q;
equation
  gamma_p = xq*p/v;
  gamma_q = xq*q/v;
  ifield = sqrt((v + gamma_q)^2 + p^2) + (xd/xq + 1)*(gamma_q*(v + gamma_q) +
    gamma_p)/sqrt((v + gamma_q)^2 + p^2);
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={
        Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255}),
        Text(
          extent={{-90,80},{-58,60}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="v"),
        Text(
          extent={{-90,-44},{-62,-60}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="p"),
        Text(
          extent={{-88,16},{-60,0}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="q"),
        Text(
          extent={{64,16},{92,0}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="if")}),
    Documentation);
end FieldCurrent;
