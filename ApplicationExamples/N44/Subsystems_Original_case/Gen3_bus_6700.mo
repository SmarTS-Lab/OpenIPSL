within N44.Subsystems_Original_case;
model Gen3_bus_6700 "Configuration of synchronous generator with regulators: GENSAL, HYGOV, SCRX, STAB2A;
  Nordic 44 model: Buses 3115, 5300, 6100, 6700, 7100"

  OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
    Tpd0=5.24 "T'do (> 0)",
    Tppd0=0.05 "T''do (> 0)",
    Tppq0=0.15 "T''qo (> 0)",
    H=3.592 "Inertia",
    D=0 "Speed Damping",
    Xd=1.1044 "d-axis reactance",
    Xq=0.66186,
    Xpd=0.25484,
    Xppd=0.17062,
    Xppq=0.17062,
    Xl=0.14737,
    V_b=300,
    V_0=PSSE_data.voltages.V6700,
    angle_0=PSSE_data.voltages.A6700,
    P_0=PSSE_data.powers.P6700,
    Q_0=PSSE_data.powers.Q6700,
    M_b=1200,
    S10=0.1,
    S12=0.3,
    R_a=0) annotation (Placement(transformation(extent={{-44,-22},{18,34}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
    R=0.06 "Permanent droop, p.u",
    r=0.4 "Temporary droop, p.u",
    VELM=0.2 "Gate open/close velosiy limit, p.u/sec",
    T_r=5,
    T_f=0.05,
    T_g=0.2,
    G_MAX=1,
    G_MIN=0,
    T_w=1,
    A_t=1.1,
    D_turb=0.5,
    q_NL=0.1) annotation (Placement(transformation(extent={{-38,54},{20,80}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.SCRX sCRX(
    K=61 "K",
    T_AT_B=0.25385,
    T_B=13,
    T_E=0.05,
    E_MIN=0,
    E_MAX=4,
    r_cr_fd=0,
    C_SWITCH=true) annotation (Placement(transformation(extent={{34,-82},{92,-34}})));
  Modelica.Blocks.Sources.Constant cte(k=0) annotation (Placement(transformation(extent={{-13,-69},{-3,-59}})));
  OpenIPSL.Electrical.Controls.PSSE.PSS.STAB2A sTAB2A(
    H_LIM=0.03,
    K_2=1,
    T_2=4.5,
    K_3=0,
    T_3=2,
    K_4=0.55,
    K_5=1,
    T_5=0.01) annotation (Placement(transformation(extent={{-54,-54},{-6,-34}})));
  OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(rotation=0, extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  Data.PSSE_data_Original_case PSSE_data annotation (Placement(transformation(extent={{88,88},{98,98}})));
equation

  connect(gENSAL.p, p) annotation (Line(points={{21.1,6},{78,6},{78,0},{110,0}}, color={0,0,255}));
  connect(sTAB2A.VOTHSG, sCRX.VOTHSG) annotation (Line(points={{-3.81818,-44},{-3.81818,-43.84},{34.2417,-43.84}}, color={0,0,127}));
  connect(sCRX.EFD, gENSAL.EFD) annotation (Line(points={{92.9667,-57.76},{96,-57.76},{96,-84},{-72,-84},{-72,-8},{-43.38,-8}}, color={0,0,127}));
  connect(gENSAL.PELEC, sTAB2A.PELEC) annotation (Line(points={{20.48,-8},{26,-8},{26,-32},{-62,-32},{-62,-44},{-53.3455,-44}}, color={0,0,127}));
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{21.45,67},{28,67},{28,40},{-52,40},{-52,20},{-43.38,20}}, color={0,0,127}));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(points={{20.48,-2.4},{42,-2.4},{42,90},{-50,90},{-50,60.5},{-37.275,60.5}}, color={0,0,127}));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{20.48,31.2},{36,31.2},{36,84},{-44,84},{-44,73.5},{-37.275,73.5}}, color={0,0,127}));
  connect(gENSAL.XADIFD, sCRX.XADIFD) annotation (Line(points={{20.48,-19.2},{24,-19.2},{24,-61.12},{33.7583,-61.12}}, color={0,0,127}));
  connect(cte.y, sCRX.VOEL) annotation (Line(points={{-2.5,-64},{14,-64},{14,-49.6},{34.2417,-49.6}}, color={0,0,127}));
  connect(gENSAL.EFD0, sCRX.EFD0) annotation (Line(points={{20.48,-13.6},{28,-13.6},{28,-77.44},{34.2417,-77.44}}, color={0,0,127}));
  connect(gENSAL.ETERM, sCRX.ECOMP) annotation (Line(points={{20.48,20},{30,20},{30,-37.12},{34.2417,-37.12}}, color={0,0,127}));
  connect(sCRX.VUEL, cte.y) annotation (Line(points={{34.2417,-55.84},{14,-55.84},{14,-64},{-2.5,-64}}, color={0,0,127}));
  annotation (
    Icon(graphics={Ellipse(extent={{-100,-100},{101,100}}, lineColor={0,0,255}),Line(
          points={{-76,-26},{-28,52},{27,-52},{74,23}},
          color={0,0,255},
          smooth=Smooth.Bezier)}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
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
end Gen3_bus_6700;
