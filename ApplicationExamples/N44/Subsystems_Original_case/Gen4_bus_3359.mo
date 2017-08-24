within N44.Subsystems_Original_case;
model Gen4_bus_3359 "Configuration of synchronous generator with regulators: GENROU, STAB2A, IEEET2, IEESGO;
  Nordic 44 model: Buses 3300, 3359, 8500"

  OpenIPSL.Electrical.Machines.PSSE.GENROU gENROU(
    Tppd0=0.05 "d-axis sub-transient open-circuit time constant s",
    Tpq0=1 "q-axis transient open-circuit time constant s",
    Tppq0=0.05 "q-axis transient open-circuit time constant s",
    D=0 "Damping",
    Tpd0=4.75,
    H=4.82,
    Xd=2.13,
    Xq=2.03,
    Xpd=0.31,
    Xpq=0.403,
    Xppd=0.1937,
    Xppq=0.1937,
    Xl=0.14531,
    V_b=420,
    V_0=PSSE_data.voltages.V3359,
    angle_0=PSSE_data.voltages.A3359,
    P_0=PSSE_data.powers.P3359,
    Q_0=PSSE_data.powers.Q3359,
    M_b=1350,
    S10=0.1089,
    S12=0.37795,
    R_a=0) annotation (Placement(transformation(extent={{-56,-24},{6,42}})));
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
        extent={{-30,-13},{30,13}},
        rotation=0,
        origin={-22,71})));

  OpenIPSL.Electrical.Controls.PSSE.ES.SCRX sCRX(
    K=165,
    T_AT_B=0.2,
    T_B=10,
    T_E=0.04,
    E_MIN=0,
    E_MAX=5,
    r_cr_fd=0,
    C_SWITCH=true) annotation (Placement(transformation(
        extent={{-27.5,-33.5},{27.5,33.5}},
        rotation=0,
        origin={58.5,-59.5})));
  OpenIPSL.Electrical.Controls.PSSE.PSS.STAB2A sTAB2A(
    H_LIM=0.03,
    K_2=1,
    T_2=4.5,
    K_3=0,
    T_3=2,
    K_4=0.68,
    K_5=1,
    T_5=0.01) annotation (Placement(transformation(extent={{-61,-61},{-18,-36}})));
  Modelica.Blocks.Sources.Constant cte(k=0) annotation (Placement(transformation(extent={{-10,-63},{0,-53}})));
  OpenIPSL.Interfaces.PwPin pwPin annotation (Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  Data.PSSE_data_Original_case PSSE_data annotation (Placement(transformation(extent={{84,86},{96,98}})));
equation

  connect(gENROU.p, pwPin) annotation (Line(points={{9.1,9},{66,9},{66,0},{110,0}}, color={0,0,255}));
  connect(iEESGO.PMECH, gENROU.PMECH) annotation (Line(points={{9.875,72.8571},{20,72.8571},{20,46},{-66,46},{-66,25.5},{-55.38,25.5}}, color={0,0,127}));
  connect(gENROU.SPEED, iEESGO.SPEED) annotation (Line(points={{8.48,38.7},{24,38.7},{24,88},{-56,88},{-56,78.4286},{-50.5,78.4286}}, color={0,0,127}));
  connect(gENROU.PMECH0, iEESGO.PMECH0) annotation (Line(points={{8.48,-0.9},{30,-0.9},{30,92},{-60,92},{-60,65.4286},{-50.5,65.4286}}, color={0,0,127}));
  connect(sTAB2A.VOTHSG, sCRX.VOTHSG) annotation (Line(points={{-16.0455,-48.5},{8,-48.5},{8,-39.735},{31.2292,-39.735}}, color={0,0,127}));
  connect(gENROU.PELEC, sTAB2A.PELEC) annotation (Line(points={{8.48,-7.5},{18,-7.5},{18,-32},{-68,-32},{-68,-48.5},{-60.4136,-48.5}}, color={0,0,127}));
  connect(sCRX.EFD, gENROU.EFD) annotation (Line(points={{86.9167,-59.165},{92,-59.165},{92,-96},{-80,-96},{-80,-7.5},{-55.38,-7.5}}, color={0,0,127}));
  connect(cte.y, sCRX.VUEL) annotation (Line(points={{0.5,-58},{16,-58},{16,-56.485},{31.2292,-56.485}}, color={0,0,127}));
  connect(gENROU.XADIFD, sCRX.XADIFD) annotation (Line(points={{8.48,-20.7},{14,-20.7},{14,-63.855},{30.7708,-63.855}}, color={0,0,127}));
  connect(gENROU.ETERM, sCRX.ECOMP) annotation (Line(points={{8.48,25.5},{26,25.5},{26,-30.355},{31.2292,-30.355}}, color={0,0,127}));
  connect(gENROU.EFD0, sCRX.EFD0) annotation (Line(points={{8.48,-14.1},{22,-14.1},{22,-86.635},{31.2292,-86.635}}, color={0,0,127}));
  connect(sCRX.VOEL, cte.y) annotation (Line(points={{31.2292,-47.775},{10,-47.775},{10,-58},{0.5,-58}}, color={0,0,127}));
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
end Gen4_bus_3359;
