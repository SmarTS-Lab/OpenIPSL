within N44.Subsystems_Original_case;
model Gen5_bus_6500 "Configuration of synchronous generator with regulators: GENSAL, SEXS, HYGOV;
  Nordic 44 model: Buses 5100, 5400, 5500, 6000, 6500"

public
  OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
    Tppd0=0.05 "T''do (> 0)",
    Tppq0=0.15 "T''qo (> 0)",
    D=0 "Speed Damping",
    Tpd0=5.4855,
    H=3.558,
    Xd=1.0679,
    Xq=0.642,
    Xpd=0.23865,
    Xppd=0.15802,
    Xppq=0.15802,
    Xl=0.13514,
    V_b=300,
    M_b=1100,
    V_0=PSSE_data.voltages.V6500,
    angle_0=PSSE_data.voltages.A6500,
    P_0=PSSE_data.powers.P6500,
    Q_0=PSSE_data.powers.Q6500,
    S10=0.1,
    S12=0.3,
    R_a=0) annotation (Placement(transformation(extent={{-70,-22},{-10,42}})));
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
    q_NL=0.1) annotation (Placement(transformation(extent={{-68,62},{-14,88}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.SEXS sEXS(
    K=200,
    T_AT_B=0.05,
    T_B=100,
    T_E=0.5,
    E_MIN=0,
    E_MAX=4) annotation (Placement(transformation(extent={{6,-78},{80,-30}})));
  Modelica.Blocks.Sources.Constant cte(k=0) annotation (Placement(transformation(extent={{-40,-59},{-30,-49}})));
  OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(rotation=0, extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  Data.PSSE_data_Original_case PSSE_data annotation (Placement(transformation(extent={{86,86},{98,98}})));
equation

  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{-12.65,75},{0,75},{0,46},{-82,46},{-82,26},{-69.4,26}}, color={0,0,127}));
  connect(gENSAL.p, p) annotation (Line(points={{-7,10},{72,10},{72,0},{110,0}}, color={0,0,255}));
  connect(cte.y, sEXS.VOEL) annotation (Line(points={{-29.5,-54},{0,-54},{0,-78},{30.05,-78}}, color={0,0,127}));
  connect(gENSAL.EFD0, sEXS.EFD0) annotation (Line(points={{-7.6,-12.4},{0,-12.4},{0,-68.6667},{6,-68.6667}}, color={0,0,127}));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{-7.6,38.8},{6,38.8},{6,92},{-72,92},{-72,81.5},{-67.325,81.5}}, color={0,0,127}));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(points={{-7.6,0.4},{14,0.4},{14,96},{-78,96},{-78,68.5},{-67.325,68.5}}, color={0,0,127}));
  connect(sEXS.EFD, gENSAL.EFD) annotation (Line(points={{81.85,-51.3333},{86,-51.3333},{86,-56},{86,-92},{-82,-92},{-82,-6},{-69.4,-6}}, color={0,0,127}));
  connect(gENSAL.ETERM, sEXS.ECOMP) annotation (Line(points={{-7.6,26},{2,26},{2,-51.3333},{6,-51.3333}}, color={0,0,127}));
  connect(sEXS.VOTHSG, cte.y) annotation (Line(points={{6,-39.3333},{-18,-39.3333},{-18,-54},{-29.5,-54}}, color={0,0,127}));
  connect(sEXS.VUEL, cte.y) annotation (Line(points={{18.95,-78},{-18,-78},{-18,-54},{-29.5,-54}},color={0,0,127}));
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
end Gen5_bus_6500;
