within iPSL.Examples.N44_Groups.Configuration;
model Group5 "Machine configuration of synchronous machine with regulators: GENSAL, SEXS, HYGOV;
  from Nordic 44 model: Buses 5100, 5400, 5500, 6000, 6500.
  Configuration values at bus 5100"
  Electrical.Machines.PSSE.GENSAL.GENSAL gENSAL(
    V_0=1 "power flow, terminal voltage",
    angle_0=26.54 "power flow, angle in degree",
    P_0=950 "power flow, active power, (MW)",
    Q_0=639.9081 "power flow, reactive power, (Mvar)",
    M_b=1200 "system base power rating (MVA)",
    Tpd0=4.9629 "T'do (> 0)",
    Tppd0=0.05 "T''do (> 0)",
    Tppq0=0.15 "T''qo (> 0)",
    H=3.9871 "Inertia",
    D=0 "Speed Damping",
    Xd=1.1332 "d-axis reactance",
    Xq=0.6832 "q-axis reactance",
    Xpd=0.243 "d-axis transient reactance",
    Xppd=0.1514 "d-axis subtransient reactance",
    Xppq=0.1514 "q-axis subtransient reactance",
    Xl=0.1341 "leakage reactance",
    S10=0.1,
    S12=0.3,
    S_b=1000) annotation (Placement(transformation(extent={{-46,-28},{6,26}})));
  Electrical.Controls.PSSE.TG.HYGOV hYGOV(
    R=0.06 "Permanent droop (pu)",
    r=0.4 "Temporary droop (pu)",
    T_r=5 "Governor time constant, s",
    T_f=0.05 "Filter time constant, s",
    T_g=0.2 "Servo time constant, s",
    VELM=0.2 "Gate open/close velosiy limit, p.u/sec",
    G_MAX=1 "Maximum gate limit (pu)",
    G_MIN=0 "Minimum gate limit (pu)",
    T_w=1 "Water time constant, s",
    A_t=1.1 "Turbine gain (pu)",
    D_turb=0.5 "Turbine damping (pu)",
    q_NL=0.1 "Water flow at no load. p.u") annotation (Placement(transformation(extent={{-94,0},{-38,28}})));
  Electrical.Controls.PSSE.ES.SEXS.SEXS sEXS(
    T_AT_B=0.05,
    T_B=100,
    K=200,
    T_E=0.5,
    E_MIN=0,
    E_MAX=4,
    Ec0=1) annotation (Placement(transformation(extent={{-90,-24},{-42,4}})));
  Modelica.Blocks.Sources.Constant cte(k=0) annotation (Placement(transformation(extent={{-109,-17},{-99,-7}})));
  Connectors.PwPin p annotation (Placement(transformation(rotation=0, extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
equation
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(
      points={{-36.6,14},{-45.9,14},{-45.9,12.5},{-45.48,12.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(
      points={{8.08,23.3},{4,23.3},{4,34},{-92,34},{-92,21},{-93.3,21}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sEXS.EFD, gENSAL.EFD) annotation (Line(
      points={{-40.56,-10},{-48,-10},{-48,-14.5},{-45.48,-14.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cte.y, sEXS.VOEL) annotation (Line(
      points={{-98.5,-12},{-90,-12},{-90,-10},{-88.56,-10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cte.y, sEXS.VUEL) annotation (Line(
      points={{-98.5,-12},{-90,-12},{-90,-15.25},{-88.56,-15.25}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.ETERM, sEXS.ECOMP) annotation (Line(
      points={{8.08,12.5},{10,12.5},{10,42},{-96,42},{-96,-1.25},{-88.56,-1.25}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cte.y, sEXS.VOTHSG) annotation (Line(
      points={{-98.5,-12},{-90,-12},{-90,-4.75},{-88.56,-4.75}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.EFD0, sEXS.EFD0) annotation (Line(
      points={{8.08,-19.9},{4,-19.9},{4,-34},{-84,-34},{-84,-18.75},{-88.56,-18.75}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(p, gENSAL.p) annotation (Line(points={{110,0},{8.6,-1}}, color={0,0,255}));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(
      points={{8.08,-9.1},{6,-9.1},{6,-40},{-114,-40},{-114,7},{-93.3,7}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Icon(graphics={Ellipse(extent={{-14,-42},{74,38}}, lineColor={0,0,255}),Line(
          points={{-2,-12},{18,8},{38,-12},{58,8}},
          color={0,0,255},
          smooth=Smooth.None),Ellipse(extent={{-100,-100},{101,100}}, lineColor={0,0,255}),Text(
          extent={{-91,6},{-22,-12}},
          lineColor={0,0,255},
          textStyle={TextStyle.Italic},
          textString="GENSAL &
SEXS &
HYGOV")}),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics),
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
</html>"));
end Group5;
