within N44.Subsystems_Original_case;
model Gen4_bus_3300 "Configuration of synchronous generator with regulators: GENROU, STAB2A, IEEET2, IEESGO;
  Nordic 44 model: Buses 3300, 3359, 8500"

  OpenIPSL.Electrical.Machines.PSSE.GENROU gENROU(
    Tpd0=10.8 "d-axis transient open-circuit time constant s",
    Tppd0=0.05 "d-axis sub-transient open-circuit time constant s",
    Tpq0=1 "q-axis transient open-circuit time constant s",
    Tppq0=0.05 "q-axis transient open-circuit time constant s",
    H=6 "inertia constant s",
    D=0 "Damping",
    Xd=2.42 "d-axis reactance",
    Xq=2 "q-axis reactance",
    Xpd=0.23 "d-axis transient reactance",
    Xpq=0.4108 "d-axis transient reactance",
    Xppd=0.16 "d-axis sub-transient reactance",
    Xppq=0.16 "q-axis sub-transient reactance",
    Xl=0.1481 "leakage reactance",
    V_b=420,
    V_0=PSSE_data.voltages.V3300,
    angle_0=PSSE_data.voltages.A3300,
    P_0=PSSE_data.powers.P3300,
    Q_0=PSSE_data.powers.Q3300,
    M_b=1100,
    S10=0.1089,
    S12=0.378,
    R_a=0) annotation (Placement(transformation(extent={{-58,-26},{6,44}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.IEESGO iEESGO(
    T_1=0.01,
    T_2=0,
    T_3=0.15,
    T_4=0.3,
    T_5=8,
    T_6=0.4,
    K_1=0,
    K_2=0.7,
    K_3=0.43,
    P_MAX=1,
    P_MIN=0) annotation (Placement(transformation(
        extent={{-28,-12},{28,12}},
        rotation=0,
        origin={-26,76})));

  OpenIPSL.Electrical.Controls.PSSE.ES.SCRX sCRX(
    K=10 "K",
    T_AT_B=0,
    T_B=0.04,
    T_E=0.04,
    E_MIN=0,
    E_MAX=5,
    r_cr_fd=0,
    C_SWITCH=true) annotation (Placement(transformation(
        extent={{-28,-23},{28,23}},
        rotation=0,
        origin={62,-61})));
  OpenIPSL.Electrical.Controls.PSSE.PSS.STAB2A sTAB2A(
    H_LIM=0.03,
    K_2=1,
    T_2=4.5,
    K_3=0,
    T_3=2,
    K_4=0.55,
    K_5=1,
    T_5=0.01) annotation (Placement(transformation(extent={{-75,-60},{-32,-35}})));
  Modelica.Blocks.Sources.Constant cte(k=0) annotation (Placement(transformation(extent={{-20,-65},{-9,-54}})));
  OpenIPSL.Interfaces.PwPin pwPin annotation (Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  Data.PSSE_data_Original_case PSSE_data annotation (Placement(transformation(extent={{88,88},{98,98}})));
equation

  connect(cte.y, sCRX.VUEL) annotation (Line(points={{-8.45,-59.5},{24.775,-59.5},{24.775,-58.93},{34.2333,-58.93}}, color={0,0,127}));
  connect(sCRX.VOEL, cte.y) annotation (Line(points={{34.2333,-52.95},{-2,-52.95},{-2,-54},{-2,-59.5},{-8.45,-59.5}}, color={0,0,127}));
  connect(sTAB2A.VOTHSG, sCRX.VOTHSG) annotation (Line(points={{-30.0455,-47.5},{1.97725,-47.5},{1.97725,-47.43},{34.2333,-47.43}}, color={0,0,127}));
  connect(gENROU.SPEED, iEESGO.SPEED) annotation (Line(points={{8.56,40.5},{20,40.5},{20,92},{-60,92},{-60,82.8571},{-52.6,82.8571}}, color={0,0,127}));
  connect(gENROU.PMECH0, iEESGO.PMECH0) annotation (Line(points={{8.56,-1.5},{20,-1.5},{20,-28},{-70,-28},{-70,70.8571},{-52.6,70.8571}}, color={0,0,127}));
  connect(sCRX.EFD, gENROU.EFD) annotation (Line(points={{90.9333,-60.77},{96,-60.77},{96,-90},{-90,-90},{-90,-8.5},{-57.36,-8.5}}, color={0,0,127}));
  connect(iEESGO.PMECH, gENROU.PMECH) annotation (Line(points={{3.75,77.7143},{12,77.7143},{12,50},{-66,50},{-66,26.5},{-57.36,26.5}}, color={0,0,127}));
  connect(gENROU.ETERM, sCRX.ECOMP) annotation (Line(points={{8.56,26.5},{28,26.5},{28,-40.99},{34.2333,-40.99}}, color={0,0,127}));
  connect(gENROU.EFD0, sCRX.EFD0) annotation (Line(points={{8.56,-15.5},{16,-15.5},{16,-80},{26,-80},{26,-79.63},{34.2333,-79.63}}, color={0,0,127}));
  connect(gENROU.XADIFD, sCRX.XADIFD) annotation (Line(points={{8.56,-22.5},{12,-22.5},{12,-63.99},{33.7667,-63.99}}, color={0,0,127}));
  connect(gENROU.p, pwPin) annotation (Line(points={{9.2,9},{76,9},{76,0},{110,0}}, color={0,0,255}));
  connect(gENROU.PELEC, sTAB2A.PELEC) annotation (Line(points={{8.56,-8.5},{34,-8.5},{34,-32},{-82,-32},{-82,-47.5},{-74.4136,-47.5}}, color={0,0,127}));
  annotation (
    Icon(graphics={Line(
          points={{-76,-26},{-28,52},{27,-52},{74,23}},
          color={0,0,255},
          smooth=Smooth.Bezier),Ellipse(extent={{-100,-100},{101,100}}, lineColor={0,0,255})}),
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
end Gen4_bus_3300;
