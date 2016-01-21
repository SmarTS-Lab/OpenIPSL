within iPSL.NonElectrical.Continuous;
block DerivativeLag "Derivative lag transfer function blcok"
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Real K "Gain";
  parameter Modelica.SIunits.Time T "Time constan (s)";

  parameter Real y_start "Output start value" annotation (Dialog(group="Initialization"));
  parameter Real x_start=0 "Start value of state variable" annotation (Dialog(group="Initialization"));
protected
  parameter Modelica.SIunits.Time T_dummy=if abs(T) < Modelica.Constants.eps then 1000 else T "Lead time constant";
  parameter Modelica.SIunits.Time K_dummy=if abs(K) < Modelica.Constants.eps then 1 else K "Lead time constant";
public
  Modelica.Blocks.Sources.RealExpression par1(y=T) annotation (Placement(transformation(extent={{-80,54},{-60,74}})));
  Modelica.Blocks.Continuous.TransferFunction TF(
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    x_start={x_start},
    b={K_dummy,0},
    y_start=y_start,
    a={T_dummy,1}) annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
equation
  if (abs(par1.y) < Modelica.Constants.eps) then
    y = u;
  else
    y = TF.y;
  end if;

  connect(TF.u, u) annotation (Line(points={{-10,0},{-120,0}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
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
</html>"),
    Icon(graphics={
        Text(
          extent={{-60,82},{60,22}},
          lineColor={0,0,255},
          textString="Ks"),
        Line(
          points={{-62,0},{66,0}},
          color={0,0,255},
          smooth=Smooth.Bezier,
          thickness=0.5),
        Text(
          extent={{-60,-20},{60,-80}},
          lineColor={0,0,255},
          textString="1+sT")}));
end DerivativeLag;
