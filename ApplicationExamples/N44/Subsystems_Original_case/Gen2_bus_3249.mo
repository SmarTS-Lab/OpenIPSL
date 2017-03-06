within N44.Subsystems_Original_case;
model Gen2_bus_3249 "Configuration of synchronous generator with regulators: GENSAL, HYGOV, SCRX;
  Nordic 44 model: Buses 3245, 3249, 5600"

  OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
    Tppd0=0.06 "T''do (> 0)",
    Tppq0=0.1 "T''qo (> 0)",
    D=0 "Speed Damping",
    Tpd0=10.13,
    H=4.543,
    Xd=1.036,
    Xq=0.63,
    Xpd=0.28,
    Xppd=0.21,
    Xppq=0.21,
    Xl=0.11538,
    V_b=420,
    V_0=PSSE_data.voltages.V3249,
    angle_0=PSSE_data.voltages.A3249,
    P_0=PSSE_data.powers.P3249,
    Q_0=PSSE_data.powers.Q3249,
    M_b=1357,
    S10=0.10239,
    S12=0.2742,
    R_a=0) annotation (Placement(transformation(extent={{-60,-20},{6,48}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
    R=0.06 "Permanent droop, p.u",
    r=0.4 "Temporary droop, p.u",
    VELM=0.1 "Gate open/close velosiy limit, p.u/sec",
    T_r=5,
    T_f=0.05,
    T_g=0.2,
    G_MAX=1,
    G_MIN=0,
    T_w=1,
    A_t=1.1,
    D_turb=0.5,
    q_NL=0.1) annotation (Placement(transformation(extent={{-62,62},{-2,88}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.SCRX sCRX(
    K=31,
    T_AT_B=0.25385,
    T_B=13,
    T_E=0.05,
    E_MIN=0,
    E_MAX=4,
    r_cr_fd=0,
    C_SWITCH=true) annotation (Placement(transformation(extent={{26,-90},{81,-30}})));
  Modelica.Blocks.Sources.Constant cte(k=0) annotation (Placement(transformation(extent={{-21,-55},{-11,-45}})));
  OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(rotation=0, extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  Data.PSSE_data_Original_case PSSE_data annotation (Placement(transformation(extent={{88,88},{98,98}})));
equation

  connect(cte.y, sCRX.VOEL) annotation (Line(points={{-10.5,-50},{8,-50},{8,-49.5},{26.2292,-49.5}}, color={0,0,127}));
  connect(sCRX.VOTHSG, cte.y) annotation (Line(points={{26.2292,-42.3},{8,-42.3},{8,-50},{-10.5,-50}}, color={0,0,127}));
  connect(gENSAL.XADIFD, sCRX.XADIFD) annotation (Line(points={{8.64,-16.6},{14,-16.6},{14,-63.9},{25.7708,-63.9}}, color={0,0,127}));
  connect(gENSAL.EFD0, sCRX.EFD0) annotation (Line(points={{8.64,-9.8},{18,-9.8},{18,-84.3},{26.2292,-84.3}}, color={0,0,127}));
  connect(sCRX.EFD, gENSAL.EFD) annotation (Line(points={{81.9167,-59.7},{86,-59.7},{86,-94},{-72,-94},{-72,-3},{-59.34,-3}}, color={0,0,127}));
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{-0.5,75},{8,75},{8,50},{-70,50},{-70,31},{-59.34,31}}, color={0,0,127}));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{8.64,44.6},{16,44.6},{16,92},{-68,92},{-68,81.5},{-61.25,81.5}}, color={0,0,127}));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(points={{8.64,3.8},{30,3.8},{30,96},{-72,96},{-72,68.5},{-61.25,68.5}}, color={0,0,127}));
  connect(gENSAL.p, p) annotation (Line(points={{9.3,14},{54,14},{54,0},{110,0}}, color={0,0,255}));
  connect(sCRX.VUEL, cte.y) annotation (Line(points={{26.2292,-57.3},{8,-57.3},{8,-50},{-10.5,-50}}, color={0,0,127}));
  connect(sCRX.ECOMP, gENSAL.ETERM) annotation (Line(points={{26.2292,-33.9},{22,-33.9},{22,31},{8.64,31}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Ellipse(extent={{-100,-100},{101,100}}, lineColor={0,0,255}),Line(
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
end Gen2_bus_3249;
