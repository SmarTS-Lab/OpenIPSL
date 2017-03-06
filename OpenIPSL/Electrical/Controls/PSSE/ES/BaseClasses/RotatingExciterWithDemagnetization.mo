within OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses;
model RotatingExciterWithDemagnetization
  extends OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.RotatingExciterBase(redeclare Modelica.Blocks.Math.Add3 Sum(k3=K_D), redeclare replaceable Modelica.Blocks.Continuous.Integrator sISO(
      k=1/T_E,
      initType=Modelica.Blocks.Types.Init.InitialOutput,
      y_start=Efd0));
  parameter Real K_D "Exciter demagnetizing factor (pu)";
  Modelica.Blocks.Interfaces.RealInput XADIFD annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={10,-100}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-90})));
  Modelica.Blocks.Interfaces.RealOutput V_FE
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-90,-40}), iconTransformation(extent={{-80,-60},{-100,-40}})));
equation
  connect(XADIFD, Sum.u3) annotation (Line(points={{10,-100},{0,-100},{0,-38},{-18,-38}}, color={0,0,127}));
  connect(V_FE, feedback.u2) annotation (Line(points={{-90,-40},{-50,-40},{-50,12}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(initialScale=0.05, extent={{-80,-80},{80,80}}), graphics={Rectangle(
          extent={{-80,80},{80,-80}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-50,70},{46,56}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Rotating Exciter"),Text(
          extent={{-81,4},{-57,-6}},
          lineColor={28,108,200},
          textString="I_C"),Text(
          extent={{56,6},{77,-4}},
          lineColor={28,108,200},
          textString="V_E"),Text(
          extent={{-56,60},{52,44}},
          lineColor={255,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="with Demagnetization Effect"),Text(
          extent={{-19,-64},{18,-74}},
          lineColor={28,108,200},
          textString="XADIFD"),Text(
          extent={{-77,-44},{-53,-54}},
          lineColor={28,108,200},
          textString="V_FE")}),
    Diagram(coordinateSystem(initialScale=0.05, extent={{-80,-80},{80,80}})),
    Documentation(revisions="<html>
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
end RotatingExciterWithDemagnetization;
