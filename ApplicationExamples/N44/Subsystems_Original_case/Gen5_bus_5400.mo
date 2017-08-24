within N44.Subsystems_Original_case;
model Gen5_bus_5400 "Configuration of synchronous generator with regulators: GENSAL, SEXS, HYGOV;
  Nordic 44 model: Buses 5100, 5400, 5500, 6000, 6500"

  OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
    Tppd0=0.05 "T''do (> 0)",
    Tppq0=0.15 "T''qo (> 0)",
    D=0 "Speed Damping",
    Tpd0=6.5,
    H=4.1,
    Xd=1.02,
    Xq=0.63,
    Xpd=0.25,
    Xppd=0.16,
    Xppq=0.16,
    Xl=0.13,
    V_b=300,
    V_0=PSSE_data.voltages.V5400,
    angle_0=PSSE_data.voltages.A5400,
    P_0=PSSE_data.powers.P5400,
    Q_0=PSSE_data.powers.Q5400,
    M_b=1225,
    S10=0.1,
    S12=0.3,
    R_a=0) annotation (Placement(transformation(extent={{-64,-18},{0,36}})));
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
    q_NL=0.1) annotation (Placement(transformation(extent={{-60,50},{0,76}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.SEXS sEXS(
    K=200,
    T_AT_B=0.05,
    T_B=100,
    T_E=0.5,
    E_MIN=0,
    E_MAX=4) annotation (Placement(transformation(extent={{14,-76},{86,-29}})));
  Modelica.Blocks.Sources.Constant cte(k=0) annotation (Placement(transformation(extent={{-19,-57},{-9,-47}})));
  OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(rotation=0, extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  Data.PSSE_data_Original_case PSSE_data annotation (Placement(transformation(extent={{88,88},{98,98}})));
equation

  connect(gENSAL.p, p) annotation (Line(points={{3.2,9},{54,9},{54,0},{110,0}}, color={0,0,255}));
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{1.5,63},{10,63},{10,50},{10,40},{-74,40},{-74,22.5},{-63.36,22.5}}, color={0,0,127}));
  connect(sEXS.EFD, gENSAL.EFD) annotation (Line(points={{87.8,-49.8889},{94,-49.8889},{94,-86},{-74,-86},{-74,-4.5},{-63.36,-4.5}}, color={0,0,127}));
  connect(cte.y, sEXS.VOEL) annotation (Line(points={{-8.5,-52},{37.4,-52},{37.4,-76}}, color={0,0,127}));
  connect(gENSAL.EFD0, sEXS.EFD0) annotation (Line(points={{2.56,-9.9},{6,-9.9},{6,-66.8611},{14,-66.8611}}, color={0,0,127}));
  connect(gENSAL.ETERM, sEXS.ECOMP) annotation (Line(points={{2.56,22.5},{10,22.5},{10,-49.8889},{14,-49.8889}}, color={0,0,127}));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{2.56,33.3},{16,33.3},{16,80},{-66,80},{-66,69.5},{-59.25,69.5}}, color={0,0,127}));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(points={{2.56,0.9},{24,0.9},{24,88},{-70,88},{-70,56.5},{-59.25,56.5}}, color={0,0,127}));
  connect(sEXS.VUEL, cte.y) annotation (Line(points={{26.6,-76},{-2,-76},{-2,-52},{-8.5,-52}}, color={0,0,127}));
  connect(sEXS.VOTHSG, cte.y) annotation (Line(points={{14,-38.1389},{-2,-38.1389},{-2,-52},{-8.5,-52}}, color={0,0,127}));
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
end Gen5_bus_5400;
