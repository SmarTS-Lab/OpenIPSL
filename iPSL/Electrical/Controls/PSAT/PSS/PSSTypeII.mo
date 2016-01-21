within iPSL.Electrical.Controls.PSAT.PSS;


model PSSTypeII "PSAT PSS TypeII"
  parameter Real vsmax "Max stabilizer output signal (pu)";
  parameter Real vsmin "Min stabilizer output signal (pu)";
  parameter Real Kw "Stabilizer gain (pu/pu)";
  parameter Real Tw "Wash-out time constant (s)";
  parameter Real T1 "First stabilizer time constant (s)";
  parameter Real T2 "Second stabilizer time constant (s)";
  parameter Real T3 "Third stabilizer time constant (s)";
  parameter Real T4 "Fourth stabilizer time constant (s)";
  Modelica.Blocks.Interfaces.RealInput vSI "PSS input signal " annotation (Placement(transformation(extent={{-130,-20},{-90,20}})));
  Modelica.Blocks.Interfaces.RealOutput vs "PSS output signal" annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Continuous.Derivative derivative(
    T=Tw,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=0,
    k=Kw*Tw) annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  NonElectrical.Continuous.LeadLag imLeadLag(
    K=1,
    T1=T1,
    T2=T2,
    y_start=0) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  NonElectrical.Continuous.LeadLag imLeadLag1(
    K=1,
    T1=T3,
    T2=T4,
    y_start=0) annotation (Placement(transformation(extent={{28,-10},{48,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=vsmax, uMin=vsmin) annotation (Placement(transformation(extent={{60,-10},{80,10}})));
equation
  connect(vSI, derivative.u) annotation (Line(points={{-110,0},{-62,0}}, color={0,0,127}));
  connect(vs, limiter.y) annotation (Line(points={{110,0},{96,0},{81,0}}, color={0,0,127}));
  connect(imLeadLag1.y, limiter.u) annotation (Line(points={{49,0},{53.5,0},{58,0}}, color={0,0,127}));
  connect(imLeadLag.y, imLeadLag1.u) annotation (Line(points={{11,0},{26,0}}, color={0,0,127}));
  connect(derivative.y, imLeadLag.u) annotation (Line(points={{-39,0},{-12,0}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})), Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSS Type II, PSAT manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-08-24</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Tin Rabuzin, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
end PSSTypeII;
