within N44.Subsystems_Original_case;
model Gen1_bus_7000 "Configuration of synchronous generator with regulators: GENROU, STAB2A, IEEET2, IEESGO;
   Nordic 44 model: Buses 3000, 7000"

  OpenIPSL.Electrical.Machines.PSSE.GENROU gENROU(
    Tppd0=0.05 "d-axis sub-transient open-circuit time constant s",
    Tpq0=1 "q-axis transient open-circuit time constant s",
    Tppq0=0.05 "q-axis transient open-circuit time constant s",
    D=0 "Damping",
    Xd=2.22 "d-axis reactance",
    Xq=2.13 "q-axis reactance",
    Xpd=0.36 "d-axis transient reactance",
    Xpq=0.468 "d-axis transient reactance",
    Xppd=0.225 "d-axis sub-transient reactance",
    Xppq=0.225 "q-axis sub-transient reactance",
    Xl=0.1688 "leakage reactance",
    Tpd0=10,
    H=5.5,
    V_b=420,
    V_0=PSSE_data.voltages.V7000,
    angle_0=PSSE_data.voltages.A7000,
    P_0=PSSE_data.powers.P7000,
    Q_0=PSSE_data.powers.Q7000,
    M_b=1278,
    S10=0.1089,
    S12=0.378,
    R_a=0) annotation (Placement(transformation(extent={{24,-38},{84,39}})));
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
        extent={{-21,-11},{21,11}},
        rotation=0,
        origin={-27,23})));

  OpenIPSL.Electrical.Controls.PSSE.ES.IEEET2 iEEET2(
    T_R=0,
    K_A=800,
    T_A=0.04,
    V_RMAX=5.32,
    V_RMIN=-4.05,
    K_E=1,
    T_E=0.44,
    K_F=0.0667,
    T_F1=2,
    T_F2=0.44,
    E_1=6.5,
    S_EE_1=0.054,
    E_2=8,
    S_EE_2=0.2020) annotation (Placement(transformation(
        extent={{-35,-29},{35,29}},
        rotation=0,
        origin={-28,-30})));
  OpenIPSL.Electrical.Controls.PSSE.PSS.STAB2A sTAB2A(
    H_LIM=0.03,
    K_2=1,
    T_2=1,
    K_3=0,
    T_3=2,
    K_4=0.55,
    K_5=1,
    T_5=0.01) annotation (Placement(transformation(extent={{-23,69},{35,91}})));

  Modelica.Blocks.Sources.Constant cte(k=0) annotation (Placement(transformation(extent={{-90,-35},{-80,-25}})));

  OpenIPSL.Interfaces.PwPin pwPin annotation (Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  Data.PSSE_data_Original_case PSSE_data annotation (Placement(transformation(extent={{85,86},{97,98}})));
equation

  connect(gENROU.p, pwPin) annotation (Line(points={{87,0.5},{95.675,0.5},{95.675,0},{110,0}}, color={0,0,255}));
  connect(iEEET2.EFD, gENROU.EFD) annotation (Line(points={{9.625,-30},{15.3125,-30},{15.3125,-18.75},{24.6,-18.75}}, color={0,0,127}));
  connect(cte.y, iEEET2.VOEL) annotation (Line(points={{-79.5,-30},{-61.8333,-30}}, color={0,0,127}));
  connect(gENROU.EFD0, iEEET2.EFD0) annotation (Line(points={{86.4,-26.45},{91,-26.45},{91,-62},{-67,-62},{-67,-53.2},{-61.8333,-53.2}}, color={0,0,127}));
  connect(gENROU.PMECH0, iEESGO.PMECH0) annotation (Line(points={{86.4,-11.05},{93,-11.05},{93,-67},{-92,-67},{-92,18.2857},{-46.95,18.2857}}, color={0,0,127}));
  connect(gENROU.PELEC, sTAB2A.PELEC) annotation (Line(points={{86.4,-18.75},{96,-18.75},{96,-75},{-96,-75},{-96,80},{-22.2091,80}}, color={0,0,127}));
  connect(sTAB2A.VOTHSG, iEEET2.VOTHSG) annotation (Line(points={{37.6364,80},{37.6364,80},{50,80},{50,50},{-80,50},{-80,-18.4},{-61.8333,-18.4}}, color={0,0,127}));
  connect(gENROU.SPEED, iEESGO.SPEED) annotation (Line(points={{86.4,35.15},{91,35.15},{91,42},{-53,42},{-53,29.2857},{-46.95,29.2857}}, color={0,0,127}));
  connect(gENROU.ETERM, iEEET2.ECOMP) annotation (Line(points={{86.4,19.75},{94,19.75},{94,45},{-73,45},{-73,-6.8},{-61.8333,-6.8}}, color={0,0,127}));
  connect(iEESGO.PMECH, gENROU.PMECH) annotation (Line(points={{-4.6875,24.5714},{9.15625,24.5714},{9.15625,19.75},{24.6,19.75}}, color={0,0,127}));
  connect(iEEET2.VUEL, cte.y) annotation (Line(points={{-61.8333,-41.6},{-73,-41.6},{-73,-30},{-79.5,-30}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={1,1})),
    Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={1,1}), graphics={Line(
          points={{-76,-26},{-28,52},{27,-52},{74,23}},
          color={0,0,255},
          smooth=Smooth.Bezier),Ellipse(extent={{-100,-100},{101,100}}, lineColor={0,0,255})}),
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
end Gen1_bus_7000;
