within iPSL.NonElectrical.Continuous;
block SimpleLagRateLimVar "First order lag transfer function block with a non windup limiter, rate limits, variable output limits and blocking input"
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Modelica.SIunits.Time T "Lag time constant" annotation (Evaluate=false);
  parameter Real y_start "Output start value" annotation (Dialog(group="Initialization"));
  parameter Real rmin "Minimum rate limit";
  parameter Real rmax "Maximum rate limit";
  Real rate "Rate";
  Real x;
  Modelica.Blocks.Interfaces.RealInput outMin
    annotation (Placement(transformation(extent={{-90,-6},{-50,34}}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-80,-140})));
  Modelica.Blocks.Interfaces.RealInput outMax
    annotation (Placement(transformation(extent={{98,106},{138,146}}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={80,140})));
initial equation
  x = y_start;
  y = y_start;
equation
  assert(
    T >= 1e-10,
    "Time constant must be greater than 0",
    AssertionLevel.error);
  rate = if u > outMax then (outMax - x)/T elseif u < outMin then (outMin - x)/T else (u - x)/T;
  der(x) = if rate > rmax then rmax elseif rate < rmin then rmin else rate;
  y = if x > outMax then outMax elseif x < outMin then outMin else x;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
        Line(points={{-100,-140},{-60,-140},{-40,-100}}, color={0,0,0}),
        Line(points={{40,100},{60,140},{100,140}}, color={0,0,0}),
        Text(
          extent={{-20,68},{20,8}},
          lineColor={0,0,255},
          textString="K"),
        Line(
          points={{-80,0},{78,0}},
          color={0,0,255},
          smooth=Smooth.Bezier,
          thickness=0.5),
        Text(
          extent={{-70,-20},{70,-80}},
          lineColor={0,0,255},
          textString="1 + Ts"),
        Line(points={{-60,100},{-80,140},{-120,140}}, color={255,0,0}),
        Line(points={{120,-140},{80,-140},{60,-100}}, color={255,0,0})}),
    Documentation(info="<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
end SimpleLagRateLimVar;

