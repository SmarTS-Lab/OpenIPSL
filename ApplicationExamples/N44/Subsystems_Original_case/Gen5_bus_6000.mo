within N44.Subsystems_Original_case;
model Gen5_bus_6000 "Configuration of synchronous generator with regulators: GENSAL, SEXS, HYGOV;
  Nordic 44 model: Buses 5100, 5400, 5500, 6000, 6500"

  OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
    Tppd0=0.05 "T''do (> 0)",
    Tppq0=0.15 "T''qo (> 0)",
    D=0 "Speed Damping",
    Tpd0=9.7,
    H=3.5,
    Xd=1.28,
    Xq=0.94,
    Xpd=0.37,
    Xppd=0.28,
    Xppq=0.28,
    Xl=0.2,
    V_b=300,
    M_b=680,
    angle_0=PSSE_data.voltages.A6000,
    P_0=PSSE_data.powers.P6000,
    Q_0=PSSE_data.powers.Q6000,
    S10=0.1,
    S12=0.3,
    R_a=0,
    V_0=PSSE_data.voltages.V6000) annotation (Placement(transformation(extent={{-58,-16},{0,32}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
    R=0.06 "Permanent droop, p.u",
    VELM=0.2 "Gate open/close velosiy limit, p.u/sec",
    r=0.3,
    T_r=5,
    T_f=0.05,
    T_g=0.2,
    G_MAX=1,
    G_MIN=0,
    T_w=1,
    A_t=1.1,
    D_turb=0.5,
    q_NL=0.1) annotation (Placement(transformation(extent={{-58,48},{2,78}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.SEXS sEXS(
    K=20,
    T_AT_B=1,
    T_B=0.1,
    T_E=0.1,
    E_MIN=-4,
    E_MAX=4) annotation (Placement(transformation(extent={{24,-66},{86,-26}})));
  Modelica.Blocks.Sources.Constant cte(k=0) annotation (Placement(transformation(extent={{-23,-51},{-13,-41}})));
  OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(rotation=0, extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  Data.PSSE_data_Original_case PSSE_data annotation (Placement(transformation(extent={{88,88},{98,98}})));
equation

  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{3.5,63},{8,63},{8,36},{-64,36},{-64,20},{-57.42,20}}, color={0,0,127}));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{2.32,29.6},{14,29.6},{14,82},{-66,82},{-66,70.5},{-57.25,70.5}}, color={0,0,127}));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(points={{2.32,0.8},{20,0.8},{20,88},{-70,88},{-70,55.5},{-57.25,55.5}}, color={0,0,127}));
  connect(sEXS.EFD, gENSAL.EFD) annotation (Line(points={{87.55,-43.7778},{92,-43.7778},{92,-76},{-70,-76},{-70,-4},{-57.42,-4}}, color={0,0,127}));
  connect(cte.y, sEXS.VOEL) annotation (Line(points={{-12.5,-46},{16,-46},{16,-66},{44.15,-66}}, color={0,0,127}));
  connect(gENSAL.EFD0, sEXS.EFD0) annotation (Line(points={{2.32,-8.8},{10,-8.8},{10,-58.2222},{24,-58.2222}}, color={0,0,127}));
  connect(gENSAL.ETERM, sEXS.ECOMP) annotation (Line(points={{2.32,20},{16,20},{16,-43.7778},{24,-43.7778}}, color={0,0,127}));
  connect(gENSAL.p, p) annotation (Line(points={{2.9,8},{62,8},{62,0},{110,0}}, color={0,0,255}));
  connect(sEXS.VOTHSG, cte.y) annotation (Line(points={{24,-33.7778},{2,-33.7778},{2,-46},{-12.5,-46}}, color={0,0,127}));
  connect(sEXS.VUEL, cte.y) annotation (Line(points={{34.85,-66},{2,-66},{2,-46},{-12.5,-46}}, color={0,0,127}));
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
end Gen5_bus_6000;
