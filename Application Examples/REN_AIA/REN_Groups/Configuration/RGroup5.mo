within REN_AIA.REN_Groups.Configuration;
model RGroup5 "Machine configuration of synchronous machine with regulators: GENSAL, IEEEX1;
  from REN: Buses XXX
  Configuration values at bus 75119
  Regulator reg_ieeex1_8d80288e_f9a2_11e4_b5b1_78acc0ae2875"
  iPSL.Electrical.Machines.PSSE.GENROU.GENROU gENROU(
    Tpd0=6.5,
    Tppd0=0.04,
    Tpq0=1.1,
    Tppq0=0.04,
    H=2.5,
    D=0.0,
    Xd=1.35,
    Xq=1.3,
    Xpd=0.25,
    Xpq=0.5,
    Xppd=0.21,
    Xppq=0.21,
    Xl=0.1,
    S10=0.03,
    S12=0.4,
    V_0=1,
    angle_0=-0.1014632,
    P_0=5,
    Q_0=17.8822,
    M_b=40.400001525878906) annotation (Placement(transformation(extent={{6,-28},{58,26}})));
  iPSL.Electrical.Controls.PSSE.ES.IEEEX1.IEEEX1 iEEEX1(
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
    S_EE_2=0.47,
    Ec0=1) annotation (Placement(transformation(extent={{-58,-10},{-10,18}})));
  Modelica.Blocks.Sources.Constant cte(k=0) annotation (Placement(transformation(extent={{-85,9},{-75,19}})));
  iPSL.Connectors.PwPin p annotation (Placement(transformation(rotation=0, extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
equation
  connect(cte.y, iEEEX1.VOTHSG) annotation (Line(
      points={{-74.5,14},{-64,14},{-64,-1.83333},{-57,-1.83333}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.EFD0, iEEEX1.EFD0) annotation (Line(
      points={{60.08,-19.9},{64,-19.9},{64,-42},{-62,-42},{-62,-6.5},{-57,-6.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(p, gENROU.p) annotation (Line(points={{110,0},{60.6,-1}}, color={0,0,255}));
  connect(gENROU.PMECH, gENROU.PMECH0) annotation (Line(points={{6.52,12.5},{-2,12.5},{-2,52},{68,52},{68,-9.1},{60.08,-9.1}}, color={0,0,127}));
  connect(iEEEX1.ECOMP, gENROU.ETERM) annotation (Line(points={{-57,4},{-66,4},{-66,-46},{72,-46},{72,12.5},{60.08,12.5}}, color={0,0,127}));
  connect(iEEEX1.VOEL, iEEEX1.VOTHSG) annotation (Line(points={{-57,9.83333},{-64,9.83333},{-64,-1.83333},{-57,-1.83333}}, color={0,0,127}));
  connect(iEEEX1.VUEL, iEEEX1.VOTHSG) annotation (Line(points={{-57,14.5},{-64,14.5},{-64,-1.83333},{-57,-1.83333}}, color={0,0,127}));
  connect(iEEEX1.EFD, gENROU.EFD) annotation (Line(points={{-9,4},{-9,-14.5},{6.52,-14.5}}, color={0,0,127}));
  annotation (
    Icon(graphics={Ellipse(extent={{-14,-42},{74,38}}, lineColor={0,0,255}),Line(
          points={{-2,-12},{18,8},{38,-12},{58,8}},
          color={0,0,255},
          smooth=Smooth.None),Ellipse(extent={{-100,-100},{101,100}}, lineColor={0,0,255}),Text(
          extent={{-91,6},{-22,-12}},
          lineColor={0,0,255},
          textStyle={TextStyle.Italic},
          textString="GENROU &
IEEEX1")}),
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
end RGroup5;
