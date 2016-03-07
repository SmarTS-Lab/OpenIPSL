within iPSL.Electrical.Branches.PSSE.Old_transformer;
model TwoWindingTapRatio
  constant Real pi=Modelica.Constants.pi;
  parameter Complex Zeq "equivalent impedance";
  parameter Real COD;
  inner parameter Real initialtapratio "initial tap ration";
  parameter Real angle_d "angel shift in degree";
  parameter Real Vmax=1.1;
  parameter Real Vmin=0.9;
  parameter Real rmax=1.1;
  parameter Real rmin=0.9;
  parameter Real Ntap=33;
  //total tap position
  parameter Real dV=0.001;
  //dead band
  parameter Real tau=17.0;
  //regulator delay
  parameter Real TC=5;
  //motor delay
  Connectors.PwPin P1 annotation (Placement(transformation(extent={{-104,2},{-84,22}}), iconTransformation(extent={{-104,2},{-84,22}})));
  Connectors.PwPin P2 annotation (Placement(transformation(extent={{78,6},{100,26}}), iconTransformation(extent={{80,6},{100,26}})));
  iPSL.Electrical.Branches.PSSE.Old_transformer.Zeq pwLine1(R=Zeq.re, X=Zeq.im) annotation (Placement(transformation(
        extent={{-29,-22},{29,22}},
        rotation=0,
        origin={-39,0})));
  update.OLTC tap_ratio(
    Vmax=Vmax,
    Vmin=Vmin,
    rmax=rmax,
    rmin=rmin,
    Ntap=Ntap,
    TC=TC,
    TSD=dV) "base on controlled bus voltage base" annotation (Placement(transformation(
        extent={{-14,-9},{14,9}},
        rotation=180,
        origin={56,67})));
  Modelica.Blocks.Interfaces.RealInput sensored_voltage(start=(tap_ratio.Vmax + tap_ratio.Vmin)/2) annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={100,66}), iconTransformation(
        extent={{-12,-12},{12,12}},
        rotation=180,
        origin={88,-18})));
  Real v;
  Modelica.Blocks.Sources.Constant const(k=1) annotation (Placement(transformation(
        extent={{-13,-13},{13,13}},
        rotation=180,
        origin={75,35})));
  update.ImRelay imRelay(COD=COD) annotation (Placement(transformation(
        extent={{-22,-21},{22,21}},
        rotation=180,
        origin={-2,41})));
  iPSL.Electrical.Branches.PSSE.Old_transformer.phaseShift phaseship(phase=0) annotation (Placement(transformation(extent={{4,-16},{58,14}})));
protected
  parameter Real angle=angle_d/180*pi "angel shift in rad";
protected
  Modelica.Blocks.Interfaces.RealOutput ti annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-106,66}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={14,-6})));
equation
  v = sqrt(P2.vr^2 + P2.vi^2);
  connect(ti, tap_ratio.y) annotation (Line(
      points={{-106,66},{45,66},{45,65.74},{42.84,65.74}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(tap_ratio.u, sensored_voltage) annotation (Line(
      points={{70.56,65.74},{77.28,65.74},{77.28,66},{100,66}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pwLine1.p, P1) annotation (Line(
      points={{-59.3,0},{-76,0},{-76,12},{-94,12}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(imRelay.p2, const.y) annotation (Line(
      points={{8.45,35.75},{8.45,34.625},{60.7,34.625},{60.7,35}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imRelay.p1, tap_ratio.y) annotation (Line(
      points={{8.45,44.99},{8.45,45.685},{42.84,45.685},{42.84,65.74}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imRelay.n1, pwLine1.t) annotation (Line(
      points={{-12.78,41},{-13.135,41},{-13.135,8.8},{-21.6,8.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(phaseship.n, P2) annotation (Line(
      points={{54.76,0.5},{74.16,0.5},{74.16,16},{89,16}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(phaseship.p, pwLine1.n) annotation (Line(
      points={{6.7,0.5},{6.7,0},{-18.7,0}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
        Text(
          extent={{26,54},{114,2}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="*",
          textStyle={TextStyle.Bold}),
        Ellipse(
          extent={{-74,44},{6,-40}},
          lineColor={0,0,255},
          lineThickness=0.5),
        Ellipse(
          extent={{-10,44},{70,-40}},
          lineColor={0,0,255},
          lineThickness=0.5)}),
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
</html>"));
end TwoWindingTapRatio;
