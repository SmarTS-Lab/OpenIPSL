within N44.Subsystems_Original_case;
model Gen4_bus_8500 "Configuration of synchronous generator with regulators: GENROU, STAB2A, IEEET2, IEESGO;
  Nordic 44 model: Buses 3300, 3359, 8500"

  OpenIPSL.Electrical.Machines.PSSE.GENROU gENROU(
    Tppd0=0.05 "d-axis sub-transient open-circuit time constant s",
    Tpq0=1 "q-axis transient open-circuit time constant s",
    Tppq0=0.05 "q-axis transient open-circuit time constant s",
    D=0 "Damping",
    Xd=2.42 "d-axis reactance",
    Xq=2 "q-axis reactance",
    Xpd=0.23 "d-axis transient reactance",
    Xpq=0.4108 "d-axis transient reactance",
    Tpd0=10,
    H=7,
    Xppd=0.17062,
    Xppq=0.17062,
    Xl=0.14812,
    V_b=420,
    V_0=PSSE_data.voltages.V8500,
    angle_0=PSSE_data.voltages.A8500,
    P_0=PSSE_data.powers.P8500,
    Q_0=PSSE_data.powers.Q8500,
    M_b=1300,
    S10=0.1089,
    S12=0.37795,
    R_a=0) annotation (Placement(transformation(extent={{-54,-16},{4,46}})));
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
        extent={{-25.5,-10.5},{25.5,10.5}},
        rotation=0,
        origin={-23.5,69.5})));

  OpenIPSL.Electrical.Controls.PSSE.ES.SCRX sCRX(
    K=10 "K",
    T_AT_B=0,
    T_B=0.04,
    T_E=0.04,
    E_MIN=0,
    E_MAX=5,
    r_cr_fd=0,
    C_SWITCH=true) annotation (Placement(transformation(
        extent={{-27.5,-30.5},{27.5,30.5}},
        rotation=0,
        origin={52.5,-52.5})));
  OpenIPSL.Electrical.Controls.PSSE.PSS.STAB2A sTAB2A(
    H_LIM=0.03,
    K_2=1,
    T_2=4.5,
    K_3=0,
    T_3=2,
    K_4=0.55,
    K_5=1,
    T_5=0.01) annotation (Placement(transformation(extent={{-74,-51},{-34,-34}})));
  Modelica.Blocks.Sources.Constant cte(k=0) annotation (Placement(transformation(extent={{-21,-61},{-11,-51}})));
  OpenIPSL.Interfaces.PwPin pwPin annotation (Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  Data.PSSE_data_Original_case PSSE_data annotation (Placement(transformation(extent={{88,88},{98,98}})));
equation

  connect(sTAB2A.VOTHSG, sCRX.VOTHSG) annotation (Line(points={{-32.1818,-42.5},{-4.0909,-42.5},{-4.0909,-34.505},{25.2292,-34.505}}, color={0,0,127}));
  connect(cte.y, sCRX.VOEL) annotation (Line(points={{-10.5,-56},{4,-56},{4,-41.825},{25.2292,-41.825}}, color={0,0,127}));
  connect(gENROU.p, pwPin) annotation (Line(points={{6.9,15},{62,15},{62,0},{110,0}}, color={0,0,255}));
  connect(iEESGO.PMECH, gENROU.PMECH) annotation (Line(points={{3.59375,71},{16,71},{16,50},{-68,50},{-68,30.5},{-53.42,30.5}}, color={0,0,127}));
  connect(gENROU.SPEED, iEESGO.SPEED) annotation (Line(points={{6.32,42.9},{20,42.9},{20,82},{-56,82},{-56,75.5},{-47.725,75.5}}, color={0,0,127}));
  connect(gENROU.PMECH0, iEESGO.PMECH0) annotation (Line(points={{6.32,5.7},{24,5.7},{24,86},{-62,86},{-62,65},{-47.725,65}}, color={0,0,127}));
  connect(gENROU.PELEC, sTAB2A.PELEC) annotation (Line(points={{6.32,-0.5},{18,-0.5},{18,-22},{-80,-22},{-80,-42.5},{-73.4545,-42.5}}, color={0,0,127}));
  connect(gENROU.XADIFD, sCRX.XADIFD) annotation (Line(points={{6.32,-12.9},{12,-12.9},{12,-56.465},{24.7708,-56.465}}, color={0,0,127}));
  connect(gENROU.EFD0, sCRX.EFD0) annotation (Line(points={{6.32,-6.7},{16,-6.7},{16,-77.205},{25.2292,-77.205}}, color={0,0,127}));
  connect(gENROU.ETERM, sCRX.ECOMP) annotation (Line(points={{6.32,30.5},{22,30.5},{22,-25.965},{25.2292,-25.965}}, color={0,0,127}));
  connect(sCRX.EFD, gENROU.EFD) annotation (Line(points={{80.9167,-52.195},{86,-52.195},{86,-86},{-84,-86},{-84,-0.5},{-53.42,-0.5}}, color={0,0,127}));
  connect(sCRX.VUEL, cte.y) annotation (Line(points={{25.2292,-49.755},{14,-49.755},{14,-50},{4,-50},{4,-56},{-10.5,-56}}, color={0,0,127}));
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
end Gen4_bus_8500;
