within OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses;
partial model BaseExciter
  Modelica.Blocks.Interfaces.RealInput VUEL annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-130,-200}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-130,-200})));
  Modelica.Blocks.Interfaces.RealInput VOEL annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-70,-200}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-70,-200})));
  Modelica.Blocks.Interfaces.RealOutput EFD "Excitation Voltage (pu)" annotation (Placement(transformation(extent={{200,-10},{220,10}})));
  Modelica.Blocks.Interfaces.RealInput EFD0
    annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-200,-130}), iconTransformation(extent={{-10,-10},{10,10}}, origin={-200,-130})));
  Modelica.Blocks.Interfaces.RealInput VOTHSG
    annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-200,90}), iconTransformation(extent={{-10,-10},{10,10}}, origin={-200,90})));
  Modelica.Blocks.Interfaces.RealInput ECOMP
    annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-200,0}), iconTransformation(extent={{-10,-10},{10,10}}, origin={-200,0})));
  Modelica.Blocks.Sources.Constant VoltageReference(k=V_REF) annotation (Placement(transformation(extent={{-170,40},{-150,60}})));
  Modelica.Blocks.Math.Add DiffV(k2=-1) annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
protected
  parameter Real Efd0(fixed=false);
  parameter Real V_REF(fixed=false);
  parameter Real ECOMP0(fixed=false);
initial equation
  Efd0 = EFD0;
  ECOMP0 = ECOMP;
equation
  connect(VoltageReference.y, DiffV.u1) annotation (Line(points={{-149,50},{-132,50},{-132,6},{-122,6}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(extent={{-200,-200},{200,160}}, initialScale=0.1), graphics={Rectangle(
          extent={{-200,160},{200,-200}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-154,-170},{-102,-190}},
          lineColor={28,108,200},
          textString="VUEL"),Text(
          extent={{-92,-170},{-40,-190}},
          lineColor={28,108,200},
          textString="VOEL"),Text(
          extent={{-184,8},{-114,-12}},
          lineColor={28,108,200},
          textString="ECOMP"),Text(
          extent={{-188,100},{-106,80}},
          lineColor={28,108,200},
          textString="VOTHSG"),Text(
          extent={{-182,-122},{-130,-142}},
          lineColor={28,108,200},
          textString="EFD0"),Text(
          extent={{152,12},{194,-8}},
          lineColor={28,108,200},
          textString="EFD")}),
    Diagram(coordinateSystem(extent={{-200,-200},{200,160}}, initialScale=0.1)),
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
end BaseExciter;
