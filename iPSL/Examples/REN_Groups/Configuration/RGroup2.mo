within iPSL.Examples.REN_Groups.Configuration;
model RGroup2 "Machine configuration of synchronous machine with regulators: GENSAL, IEEEX1;
  from REN: Buses XXX
  Configuration values at bus 77016
  Regulator reg_ieeex1_8d80289e_f9a2_11e4_b5b1_78acc0ae2875"
  Electrical.Machines.PSSE.GENSAL.GENSAL gENSAL(
    V_0=1 "power flow, terminal voltage",
    Tpd0=4.9629 "T'do (> 0)",
    Tppd0=0.05 "T''do (> 0)",
    Tppq0=0.15 "T''qo (> 0)",
    H=3.9871 "Inertia",
    D=0 "Speed Damping",
    Xd=1.1332 "d-axis reactance",
    Xq=0.6832 "q-axis reactance",
    Xpd=0.243 "d-axis transient reactance",
    Xl=0.1341 "leakage reactance",
    S10=0.1,
    S12=0.3,
    w(start=0),
    M_b=1000,
    angle_0=2.172457,
    P_0=400,
    Q_0=19.23391,
    Xppd=0.2,
    Xppq=0.2) annotation (Placement(transformation(extent={{-46,-28},{6,26}})));
  Electrical.Controls.PSSE.ES.IEEEX1.IEEEX1 iEEEX1(
    Ec0=1,
    T_R=0.04,
    K_A=75.0,
    T_A=0.05,
    T_B=1.0,
    T_C=1.0,
    V_RMAX=3.9,
    V_RMIN=-3.9,
    K_E=0.0,
    T_E=0.5,
    K_F=0.07,
    T_F1=1.0,
    E_1=2.47,
    S_EE_1=0.035,
    E_2=4.5,
    S_EE_2=0.47) annotation (Placement(transformation(extent={{-100,-16},{-52,12}})));
  Modelica.Blocks.Sources.Constant cte(k=0) annotation (Placement(transformation(extent={{-129,3},{-119,13}})));
  Connectors.PwPin p annotation (Placement(transformation(rotation=0, extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
equation
  connect(gENSAL.EFD0, iEEEX1.EFD0) annotation (Line(
      points={{8.08,-19.9},{-4,-19.9},{-4,-36},{-106,-36},{-106,-12.5},{-99,-12.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(p, gENSAL.p) annotation (Line(points={{110,0},{8.6,-1}}, color={0,0,255}));
  connect(gENSAL.PMECH0, gENSAL.PMECH) annotation (Line(points={{8.08,-9.1},{12,-9.1},{12,44},{-44,44},{-44,12.5},{-45.48,12.5}}, color={0,0,127}));
  connect(iEEEX1.ECOMP, gENSAL.ETERM) annotation (Line(points={{-99,-2},{-102,-2},{-102,-44},{0,-44},{0,12.5},{8.08,12.5}}, color={0,0,127}));
  connect(gENSAL.EFD, iEEEX1.EFD) annotation (Line(points={{-45.48,-14.5},{-51,-14.5},{-51,-2}}, color={0,0,127}));
  connect(cte.y, iEEEX1.VOTHSG) annotation (Line(points={{-118.5,8},{-99,8},{-99,-7.83333}}, color={0,0,127}));
  connect(iEEEX1.VOEL, iEEEX1.VOTHSG) annotation (Line(points={{-99,3.83333},{-104,3.83333},{-104,8},{-99,8},{-99,-7.83333}}, color={0,0,127}));
  connect(iEEEX1.VUEL, iEEEX1.VOTHSG) annotation (Line(points={{-99,8.5},{-104,8.5},{-104,8},{-99,8},{-99,-7.83333}}, color={0,0,127}));
  annotation (
    Icon(graphics={Ellipse(extent={{-14,-42},{74,38}}, lineColor={0,0,255}),Line(
          points={{-2,-12},{18,8},{38,-12},{58,8}},
          color={0,0,255},
          smooth=Smooth.None),Ellipse(extent={{-100,-100},{101,100}}, lineColor={0,0,255}),Text(
          extent={{-91,6},{-22,-12}},
          lineColor={0,0,255},
          textStyle={TextStyle.Italic},
          textString="GENSAL &
IEEEX1")}),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}})),
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
end RGroup2;
