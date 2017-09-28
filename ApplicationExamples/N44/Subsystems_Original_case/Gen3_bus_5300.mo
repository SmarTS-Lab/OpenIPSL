within N44.Subsystems_Original_case;
model Gen3_bus_5300 "Configuration of synchronous generator with regulators: GENSAL, HYGOV, SCRX, STAB2A;
  Nordic 44 model: Buses 3115, 5300, 6100, 6700, 7100"

  OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
    Tppd0=0.05 "T''do (> 0)",
    Tppq0=0.15 "T''qo (> 0)",
    D=0 "Speed Damping",
    Tpd0=6.4,
    H=3.5,
    Xd=1.14,
    Xq=0.84,
    Xpd=0.34,
    Xppd=0.26,
    Xppq=0.26,
    Xl=0.2,
    V_b=300,
    V_0=PSSE_data.voltages.V5300,
    angle_0=PSSE_data.voltages.A5300,
    P_0=PSSE_data.powers.P5300,
    Q_0=PSSE_data.powers.Q5300,
    M_b=1200,
    S10=0.1,
    S12=0.3,
    R_a=0) annotation (Placement(transformation(extent={{-64,-24},{-2,40}})));
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
    q_NL=0.1) annotation (Placement(transformation(extent={{-62,62},{10,90}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.SCRX sCRX(
    K=61 "K",
    T_AT_B=0.25385,
    T_B=13,
    T_E=0.05,
    E_MIN=0,
    E_MAX=4,
    r_cr_fd=0,
    C_SWITCH=true) annotation (Placement(transformation(extent={{22,-82},{80,-34}})));
  Modelica.Blocks.Sources.Constant cte(k=0) annotation (Placement(transformation(extent={{-22,-70},{-10,-58}})));
  OpenIPSL.Electrical.Controls.PSSE.PSS.STAB2A sTAB2A(
    H_LIM=0.03,
    K_2=1,
    T_2=4.5,
    K_3=0,
    T_3=2,
    K_4=0.55,
    K_5=1,
    T_5=0.01) annotation (Placement(transformation(extent={{-66,-54},{-20,-34}})));
  OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(rotation=0, extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  Data.PSSE_data_Original_case PSSE_data annotation (Placement(transformation(extent={{88,88},{98,98}})));
equation

  connect(gENSAL.p, p) annotation (Line(points={{1.1,8},{82,8},{82,0},{110,0}}, color={0,0,255}));
  connect(sTAB2A.VOTHSG, sCRX.VOTHSG) annotation (Line(points={{-17.9091,-44},{-17.9091,-43.84},{22.2417,-43.84}}, color={0,0,127}));
  connect(cte.y, sCRX.VOEL) annotation (Line(points={{-9.4,-64},{-6,-64},{-2,-64},{-2,-49.6},{22.2417,-49.6}}, color={0,0,127}));
  connect(sCRX.EFD, gENSAL.EFD) annotation (Line(points={{80.9667,-57.76},{84,-57.76},{84,-86},{-78,-86},{-78,-8},{-63.38,-8}}, color={0,0,127}));
  connect(gENSAL.PELEC, sTAB2A.PELEC) annotation (Line(points={{0.48,-8},{10,-8},{10,-30},{-72,-30},{-72,-44},{-65.3727,-44}}, color={0,0,127}));
  connect(gENSAL.XADIFD, sCRX.XADIFD) annotation (Line(points={{0.48,-20.8},{8,-20.8},{8,-61.12},{21.7583,-61.12}}, color={0,0,127}));
  connect(gENSAL.EFD0, sCRX.EFD0) annotation (Line(points={{0.48,-14.4},{12,-14.4},{12,-77.44},{22.2417,-77.44}}, color={0,0,127}));
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{11.8,76},{18,76},{18,46},{-76,46},{-76,24},{-63.38,24}}, color={0,0,127}));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{0.48,36.8},{24,36.8},{24,92},{-66,92},{-66,83},{-61.1,83}}, color={0,0,127}));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(points={{0.48,-1.6},{32,-1.6},{32,96},{-78,96},{-78,69},{-61.1,69}}, color={0,0,127}));
  connect(gENSAL.ETERM, sCRX.ECOMP) annotation (Line(points={{0.48,24},{16,24},{16,-37.12},{22.2417,-37.12}}, color={0,0,127}));
  connect(sCRX.VUEL, cte.y) annotation (Line(points={{22.2417,-55.84},{-2,-55.84},{-2,-64},{-9.4,-64}}, color={0,0,127}));
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
end Gen3_bus_5300;
