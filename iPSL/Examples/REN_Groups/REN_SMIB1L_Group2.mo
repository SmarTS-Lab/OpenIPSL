within iPSL.Examples.REN_Groups;
model REN_SMIB1L_Group2
  Electrical.Branches.PwLine2Openings pwLine(
    X=0.1,
    t1=100,
    t2=100,
    G=0,
    B=0,
    R=0.01) annotation (Placement(transformation(extent={{-21,-10},{-1,10}})));
  Electrical.Events.PwFault pwFault(
    t1=10,
    t2=10.15,
    R=0.1,
    X=0.1) annotation (Placement(transformation(extent={{63,-52},{74,-38}})));
  Electrical.Branches.PwLine2Openings pwLine1(
    X=0.1,
    t1=100,
    t2=100,
    G=0,
    B=0,
    R=0.01) annotation (Placement(transformation(extent={{23,4},{43,24}})));
  Electrical.Branches.PwLine2Openings pwLine3(
    t2=100,
    t1=100,
    G=0,
    B=0,
    R=0.005,
    X=0.05) annotation (Placement(transformation(extent={{7,-30},{27,-10}})));
  Electrical.Machines.PSSE.GENCLS.GENCLS gENCLS(
    V_0=1,
    D=0,
    angle_0=0,
    X_d=0.2,
    M_b=1200,
    P_0=51.66447,
    Q_0=97.411,
    H=0) annotation (Placement(transformation(extent={{105,-10},{83,12}})));
  iPSL.Examples.REN_Groups.Configuration.RGroup2 group2 annotation (Placement(transformation(rotation=0, extent={{-70,-10},{-50,10}})));
  Electrical.Branches.PwLine2Openings pwLine2(
    t2=100,
    t1=100,
    G=0,
    B=0,
    R=0.005,
    X=0.05) annotation (Placement(transformation(extent={{37,-30},{57,-10}})));
  Electrical.Loads.PSSE.Load_variation constantLoad(
    S_i(im=0, re=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    PQBRAK=0.7,
    d_t=0,
    d_P=0,
    t1=0,
    V_0=0.9948733,
    angle_0=-0.1207206,
    S_p(re=0.45, im=0.1)) annotation (Placement(transformation(extent={{20,-56},{44,-32}})));
  inner Electrical.SystemBase SysData(S_b=1000) annotation (Placement(transformation(extent={{-40,60},{-16,80}})));
equation
  connect(pwLine.n, pwLine1.p) annotation (Line(
      points={{-4,0},{3,0},{3,14},{26,14}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.p, pwLine1.p) annotation (Line(
      points={{10,-20},{3,-20},{3,14},{26,14}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1.n, gENCLS.p) annotation (Line(
      points={{40,14},{67,14},{67,0.834604},{80.8,0.834604}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(group2.p, pwLine.p) annotation (Line(
      points={{-49,0},{-18,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.n, pwLine2.p) annotation (Line(points={{24,-20},{32,-20},{40,-20}}, color={0,0,255}));
  connect(pwLine2.n, gENCLS.p) annotation (Line(points={{54,-20},{68,-20},{68,0},{80.8,0.834604}}, color={0,0,255}));
  connect(constantLoad.p, pwLine3.p) annotation (Line(points={{32,-30.8},{32,-42},{10,-42},{10,-20}}, color={0,0,255}));
  connect(pwFault.p, pwLine2.p) annotation (Line(points={{62.0833,-45},{56,-45},{56,-40},{40,-40},{40,-20}}, color={0,0,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}})), Documentation(revisions="<html>
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
end REN_SMIB1L_Group2;
