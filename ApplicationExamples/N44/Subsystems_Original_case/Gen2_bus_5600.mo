within N44.Subsystems_Original_case;
model Gen2_bus_5600 "Configuration of synchronous generator with regulators: GENSAL, HYGOV, SCRX;
  Nordic 44 model: Buses 3245, 3249, 5600"

  OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
    D=0 "Speed Damping",
    Tpd0=7.85,
    Tppd0=0.05,
    Tppq0=0.15,
    H=3.5,
    Xd=1,
    Xq=0.51325,
    Xpd=0.38,
    Xppd=0.28,
    Xppq=0.28,
    Xl=0.21,
    V_b=300,
    V_0=PSSE_data.voltages.V5600,
    angle_0=PSSE_data.voltages.A5600,
    P_0=PSSE_data.powers.P5600,
    Q_0=PSSE_data.powers.Q5600,
    M_b=1650,
    S10=0.1,
    S12=0.3,
    R_a=0) annotation (Placement(transformation(extent={{-62,-28},{0,34}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
    R=0.06 "Permanent droop, p.u",
    r=0.3,
    VELM=0.2,
    T_r=5,
    T_f=0.05,
    T_g=0.2,
    G_MAX=1,
    G_MIN=0,
    T_w=1,
    A_t=1.1,
    D_turb=0.5,
    q_NL=0.1) annotation (Placement(transformation(extent={{-60,48},{2,76}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.SCRX sCRX(
    K=61,
    T_AT_B=0.25385,
    T_B=13,
    T_E=0.05,
    E_MIN=0,
    E_MAX=4,
    r_cr_fd=0,
    C_SWITCH=true) annotation (Placement(transformation(extent={{26,-90},{84,-28}})));
  Modelica.Blocks.Sources.Constant cte(k=0) annotation (Placement(transformation(extent={{-17,-53},{-7,-43}})));
  OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(rotation=0, extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  Data.PSSE_data_Original_case PSSE_data annotation (Placement(transformation(extent={{86,86},{98,98}})));
equation

  connect(gENSAL.p, p) annotation (Line(points={{3.1,3},{54.55,3},{54.55,0},{110,0}}, color={0,0,255}));
  connect(cte.y, sCRX.VOEL) annotation (Line(points={{-6.5,-48},{26.2417,-48},{26.2417,-48.15}}, color={0,0,127}));
  connect(gENSAL.EFD0, sCRX.EFD0) annotation (Line(points={{2.48,-18.7},{10,-18.7},{10,-84.11},{26.2417,-84.11}}, color={0,0,127}));
  connect(gENSAL.XADIFD, sCRX.XADIFD) annotation (Line(points={{2.48,-24.9},{14,-24.9},{14,-63.03},{25.7583,-63.03}}, color={0,0,127}));
  connect(gENSAL.ETERM, sCRX.ECOMP) annotation (Line(points={{2.48,18.5},{22,18.5},{22,-32.03},{26.2417,-32.03}}, color={0,0,127}));
  connect(sCRX.EFD, gENSAL.EFD) annotation (Line(points={{84.9667,-58.69},{92,-58.69},{92,-94},{-72,-94},{-72,-12.5},{-61.38,-12.5}}, color={0,0,127}));
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{3.55,62},{8,62},{8,60},{8,40},{-68,40},{-68,18.5},{-61.38,18.5}}, color={0,0,127}));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{2.48,30.9},{12,30.9},{12,82},{-66,82},{-66,69},{-59.225,69}}, color={0,0,127}));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(points={{2.48,-6.3},{18,-6.3},{18,88},{-72,88},{-72,55},{-59.225,55}}, color={0,0,127}));
  connect(sCRX.VOTHSG, cte.y) annotation (Line(points={{26.2417,-40.71},{4,-40.71},{4,-48},{-6.5,-48}}, color={0,0,127}));
  connect(sCRX.VUEL, cte.y) annotation (Line(points={{26.2417,-56.21},{4,-56.21},{4,-48},{-6.5,-48}}, color={0,0,127}));
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
end Gen2_bus_5600;
