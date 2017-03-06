within OpenIPSL.Electrical.Controls.CGMES.TG;

  class GovHydroIEEE0
    parameter Real K=5 "Governor gain";
    parameter Real T1=0.25 "Governor lag time constant";
    parameter Real T2=0 "Governor lead time constant";
    parameter Real T3=0.1 "Gate actuator time constant";
    parameter Real T4=0.04 "Water starting time";
    parameter Real Pmax=1.5 "Gate maximum";
    parameter Real Pmin=0.5 "Gate minimum";
    NonElectrical.Continuous.LeadLag leadLag1(
      K=K,
      T1=T2,
      T2=T1,
      y_start=0) annotation (Placement(visible=true, transformation(
          origin={-66,0},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    Modelica.Blocks.Math.Add add1 annotation (Placement(visible=true,transformation(
          origin={6,6},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    Modelica.Blocks.Continuous.TransferFunction transferFunction1(a={T3,1}, b={1})
      annotation (Placement(visible=true, transformation(
          origin={-30,0},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    Modelica.Blocks.Continuous.TransferFunction transferFunction2(
      a={0.5*T4,1},
      b={T4,1},
      y_start=0) annotation (Placement(visible=true, transformation(
          origin={74,0},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=Pmax, uMin=Pmin) annotation (Placement(visible=true, transformation(
          origin={40,0},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealInput SPEED annotation (Placement(
        visible=true,
        transformation(
          origin={-120,0},
          extent={{-20,-20},{20,20}},
          rotation=0),
        iconTransformation(
          origin={-103,-20},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealInput Pref annotation (Placement(
        visible=true,
        transformation(
          origin={-120,60},
          extent={{-20,-20},{20,20}},
          rotation=0),
        iconTransformation(
          origin={-103,35},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput PMECH annotation (Placement(
        visible=true,
        transformation(
          origin={110,0},
          extent={{-10,-10},{10,10}},
          rotation=0),
        iconTransformation(
          origin={108,-10},
          extent={{-10,-10},{10,10}},
          rotation=0)));
  equation
    connect(transferFunction2.y, PMECH) annotation (Line(points={{85,0},{102,0},{102,0},{110,0}}, color={0,0,127}));
    connect(limiter1.y, transferFunction2.u) annotation (Line(points={{51,0},{60,0},{60,0},{62,0}}, color={0,0,127}));
    connect(add1.y, limiter1.u) annotation (Line(points={{17,6},{20,6},{20,0},{28,0},{28,0}}, color={0,0,127}));
    connect(transferFunction1.y, add1.u2) annotation (Line(points={{-19,0},{-6,0},{-6,0},{-6,0}}, color={0,0,127}));
    connect(leadLag1.y, transferFunction1.u) annotation (Line(points={{-55,0},{-42,0}}, color={0,0,127}));
    connect(SPEED, leadLag1.u) annotation (Line(points={{-120,0},{-80,0},{-78,0}}, color={0,0,127}));
    connect(Pref, add1.u1) annotation (Line(points={{-120,60},{-12,60},{-12,12},{-6,12},{-6,12}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(
          grid={1,1},
          initialScale=0.1,
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics={
          Text(
            origin={-45.2,76.7186},
            extent={{115.2,-20.7186},{-28.8,5.28123}},
            textString="GovHydroIEEE0",
            fontName="Andalus",
            textStyle={TextStyle.Italic,TextStyle.UnderLine}),
          Text(
            origin={-41.2354,26.125},
            extent={{8.23539,-10.125},{-47.7646,4.875}},
            textString="Pref",
            fontName="Andalus"),
          Text(
            origin={-26.9416,-22.875},
            extent={{12.9416,-10.125},{-75.0584,4.875}},
            textString="SPEED",
            fontName="Andalus"),
          Text(
            origin={70.175,-9.2},
            extent={{22.825,-10.8},{-60.175,5.2}},
            textString="PMECH",
            fontName="Andalus"),
          Rectangle(
            origin={0,20},
            lineThickness=2,
            borderPattern=BorderPattern.Raised,
            extent={{-100,60},{100,-60}})}), uses(OpenIPSL(version="0.8.1"), Modelica(version="3.2.1")),
			Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSS/E Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>Unknown</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Mengjia Zhang,SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>", revisions="<html>
<!--DISCLAIMER-->
<p>OpenIPSL:</p>
<p>Copyright 2016 SmarTS Lab (Sweden)</p>
<ul>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>

<p></p>
<p>iPSL:</p>
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>
"));
  end GovHydroIEEE0;
