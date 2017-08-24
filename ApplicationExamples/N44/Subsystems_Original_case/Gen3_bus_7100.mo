within N44.Subsystems_Original_case;
model Gen3_bus_7100 "Configuration of synchronous generator with regulators: GENSAL, HYGOV, SCRX, STAB2A;
  Nordic 44 model: Buses 3115, 5300, 6100, 6700, 7100"

  OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
    D=0 "Speed Damping",
    Tpd0=5,
    Tppd0=0.06,
    Tppq0=0.1,
    H=3.2,
    Xd=0.75,
    Xq=0.5,
    Xpd=0.25,
    Xppd=0.15385,
    Xppq=0.15385,
    Xl=0.11538,
    V_b=420,
    M_b=1000,
    V_0=PSSE_data.voltages.V7100,
    angle_0=PSSE_data.voltages.A7100,
    P_0=PSSE_data.powers.P7100,
    Q_0=PSSE_data.powers.Q7100,
    S10=0.10239,
    S12=0.2742,
    R_a=0) annotation (Placement(transformation(extent={{-56,-20},{4,32}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
    R=0.06 "Permanent droop, p.u",
    r=0.4 "Temporary droop, p.u",
    VELM=0.1,
    T_r=5,
    T_f=0.05,
    T_g=0.2,
    G_MAX=1,
    G_MIN=0,
    T_w=1,
    A_t=1.01,
    D_turb=0.5,
    q_NL=0.1) annotation (Placement(transformation(extent={{-50,50},{0,72}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.SCRX sCRX(
    K=61 "K",
    T_AT_B=0.25385,
    T_B=13,
    T_E=0.05,
    E_MIN=0,
    E_MAX=4,
    r_cr_fd=0,
    C_SWITCH=true) annotation (Placement(transformation(extent={{30,-80},{86,-34}})));
  Modelica.Blocks.Sources.Constant cte(k=0) annotation (Placement(transformation(extent={{-7,-59},{3,-49}})));
  OpenIPSL.Electrical.Controls.PSSE.PSS.STAB2A sTAB2A(
    H_LIM=0.03,
    K_2=1,
    T_2=4.5,
    K_3=0,
    T_3=2,
    K_4=0.55,
    K_5=1,
    T_5=0.01) annotation (Placement(transformation(extent={{-58,-50},{-12,-30}})));
  OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(rotation=0, extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  Data.PSSE_data_Original_case PSSE_data annotation (Placement(transformation(extent={{86,88},{96,98}})));
equation

  connect(gENSAL.p, p) annotation (Line(points={{7,6},{56,6},{56,0},{110,0}}, color={0,0,255}));
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{1.25,61},{10,61},{10,36},{-64,36},{-64,19},{-55.4,19}}, color={0,0,127}));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{6.4,29.4},{16,29.4},{16,80},{-58,80},{-58,66.5},{-49.375,66.5}}, color={0,0,127}));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(points={{6.4,-1.8},{22,-1.8},{22,88},{-68,88},{-68,55.5},{-49.375,55.5}}, color={0,0,127}));
  connect(sCRX.EFD, gENSAL.EFD) annotation (Line(points={{86.9333,-56.77},{94,-56.77},{94,-86},{-76,-86},{-76,-7},{-55.4,-7}}, color={0,0,127}));
  connect(gENSAL.PELEC, sTAB2A.PELEC) annotation (Line(points={{6.4,-7},{12,-7},{12,-26},{-64,-26},{-64,-40},{-57.3727,-40}}, color={0,0,127}));
  connect(sTAB2A.VOTHSG, sCRX.VOTHSG) annotation (Line(points={{-9.90909,-40},{4,-40},{4,-43.43},{30.2333,-43.43}}, color={0,0,127}));
  connect(cte.y, sCRX.VOEL) annotation (Line(points={{3.5,-54},{6,-54},{6,-48.95},{30.2333,-48.95}}, color={0,0,127}));
  connect(gENSAL.XADIFD, sCRX.XADIFD) annotation (Line(points={{6.4,-17.4},{14,-17.4},{14,-59.99},{29.7667,-59.99}}, color={0,0,127}));
  connect(gENSAL.EFD0, sCRX.EFD0) annotation (Line(points={{6.4,-12.2},{18,-12.2},{18,-75.63},{30.2333,-75.63}}, color={0,0,127}));
  connect(gENSAL.ETERM, sCRX.ECOMP) annotation (Line(points={{6.4,19},{24,19},{24,-36.99},{30.2333,-36.99}}, color={0,0,127}));
  connect(sCRX.VUEL, cte.y) annotation (Line(points={{30.2333,-54.93},{6,-54.93},{6,-54},{3.5,-54}}, color={0,0,127}));
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
end Gen3_bus_7100;
