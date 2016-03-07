within N44_AIA.N44_Groups.Configuration;
model Group2 "Machine configuration of synchronous machine with regulators: GENSAL, HYGOV, SCRX;
  from Nordic 44 model: Buses 3100, 3245, 3249, 5600
  Configuration from Bus 3249"
  iPSL.Electrical.Machines.PSSE.GENSAL.GENSAL gENSAL(
    V_0=1 "power flow, terminal voltage",
    angle_0=42.77 "power flow, angle in degree",
    P_0=643 "power flow, active power, (MW)",
    Q_0=54.8304 "power flow, reactive power, (Mvar)",
    M_b=1357 "system base power rating (MVA)",
    Tpd0=5.0 "T'do (> 0)",
    Tppd0=0.06 "T''do (> 0)",
    Tppq0=0.1 "T''qo (> 0)",
    H=3.3 "Inertia",
    D=0 "Speed Damping",
    Xd=0.75 "d-axis reactance",
    Xq=0.5 "q-axis reactance",
    Xpd=0.25 "d-axis transient reactance",
    Xppd=0.1538 "d-axis subtransient reactance",
    Xppq=0.1538 "q-axis subtransient reactance",
    Xl=0.1154 "leakage reactance",
    S10=0.1024,
    S12=0.2742,
    S_b=1000) annotation (Placement(transformation(extent={{-80,-28},{-28,26}})));
  Modelica.Blocks.Sources.Constant cte(k=0) annotation (Placement(transformation(extent={{-143,-17},{-133,-7}})));
  iPSL.Connectors.PwPin p annotation (Placement(transformation(rotation=0, extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
equation
  connect(p, gENSAL.p) annotation (Line(points={{110,0},{32,0},{32,-1},{-25.4,-1}}, color={0,0,255}));
  connect(p, p) annotation (Line(
      points={{110,0},{104,0},{104,0},{110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gENSAL.EFD, gENSAL.EFD0) annotation (Line(points={{-79.48,-14.5},{-92,-14.5},{-92,-44},{-14,-44},{-14,-19.9},{-25.92,-19.9}}, color={0,0,127}));
  connect(gENSAL.PMECH, gENSAL.PMECH0) annotation (Line(points={{-79.48,12.5},{-92,12.5},{-92,42},{-8,42},{-8,-9.1},{-25.92,-9.1}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Ellipse(extent={{-14,-42},{74,38}}, lineColor={0,0,255}),Line(
          points={{-2,-12},{18,8},{38,-12},{58,8}},
          color={0,0,255},
          smooth=Smooth.None),Ellipse(extent={{-100,-100},{101,100}}, lineColor={0,0,255}),Text(
          extent={{-91,6},{-22,-12}},
          lineColor={0,0,255},
          textStyle={TextStyle.Italic},
          textString="GENSAL &
SCRX &
HYGOV")}),
    Documentation(revisions="<html>
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
</html>"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
end Group2;
