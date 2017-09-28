within OpenIPSL.NonElectrical.Continuous;
block IntegratorLimVar
  "Integrator with a non windup limiter and variable limits"
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Real K "Gain" annotation (Evaluate=false);
  parameter Real y_start "Output start value"
    annotation (Dialog(group="Initialization"));
  Modelica.Blocks.Interfaces.RealInput outMax annotation (Placement(
        transformation(extent={{98,106},{138,146}}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={80,140})));
  Modelica.Blocks.Interfaces.RealInput outMin annotation (Placement(
        transformation(extent={{-90,-6},{-50,34}}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-80,-140})));
initial equation
  y = y_start;
equation
  assert(
    outMax > outMin,
    "Upper limit must be greater than lower limit",
    AssertionLevel.error);
  if y >= outMax and u > 0 then
    der(y) = 0;
  elseif y <= outMin and u < 0 then
    der(y) = 0;
  else
    der(y) = K*u;
  end if;
  annotation (
    Icon(graphics={Line(points={{40,100},{60,140},{100,140}}, color={0,0,0}),
          Text(
          extent={{-20,68},{20,8}},
          lineColor={0,0,255},
          textString="K"),Line(
          points={{-80,0},{78,0}},
          color={0,0,255},
          smooth=Smooth.Bezier,
          thickness=0.5),Text(
          extent={{-70,-20},{70,-80}},
          lineColor={0,0,255},
          textString="s"),Line(points={{-100,-140},{-60,-140},{-40,-100}},
          color={0,0,0})}),
    Diagram,
    Documentation);
end IntegratorLimVar;
