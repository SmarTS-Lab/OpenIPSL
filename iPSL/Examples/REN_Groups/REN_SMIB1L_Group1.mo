within iPSL.Examples.REN_Groups;
model REN_SMIB1L_Group1 "test"
  Electrical.Branches.PwLine2Openings pwLine(
    X=0.1,
    t1=100,
    t2=100,
    R=0.01,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-33,18},{-13,38}})));
  Electrical.Events.PwFault pwFault(
    R=0,
    t1=2,
    t2=2.1,
    X=0) annotation (Placement(transformation(extent={{35,-22},{48,-10}})));
  Electrical.Branches.PwLine2Openings pwLine1(
    X=0.1,
    t1=100,
    t2=100,
    R=0.01,
    G=0,
    B=0) annotation (Placement(transformation(extent={{11,32},{31,52}})));
  Electrical.Branches.PwLine2Openings pwLine3(
    t2=100,
    t1=100,
    R=0.005,
    X=0.05,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-5,-2},{15,18}})));
  Electrical.Loads.PSSE.Load_variation constantLoad(
    S_i(im=0, re=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    PQBRAK=0.7,
    d_t=0,
    d_P=0,
    t1=0,
    S_p(re=0.45, im=0.1),
    V_0=0.9948733,
    angle_0=-0.1207206) annotation (Placement(transformation(
        extent={{11,-12},{-11,12}},
        rotation=180,
        origin={8,-16})));
  Electrical.Branches.PwLine2Openings pwLine4(
    t2=100,
    t1=100,
    R=0.005,
    X=0.05,
    G=0,
    B=0) annotation (Placement(transformation(extent={{21,-2},{41,18}})));
  Electrical.Machines.PSSE.GENCLS.GENCLS gENCLS(
    X_d=0.2,
    D=0,
    V_0=1,
    angle_0=0,
    M_b=1200,
    P_0=51.66447,
    Q_0=97.41116,
    H=0) annotation (Placement(transformation(extent={{93,18},{71,40}})));
  iPSL.Examples.REN_Groups.Configuration.RGroup1 group1 annotation (Placement(transformation(rotation=0, extent={{-68,18},{-48,38}})));
  inner Electrical.SystemBase SysData(S_b=1000) annotation (Placement(transformation(extent={{-80,80},{-34,100}})));
equation
  connect(pwLine.n, pwLine1.p) annotation (Line(
      points={{-16,28},{-9,28},{-9,42},{14,42}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.p, pwLine1.p) annotation (Line(
      points={{-2,8},{-9,8},{-9,42},{14,42}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.n, pwLine4.p) annotation (Line(
      points={{12,8},{24,8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1.n, gENCLS.p) annotation (Line(
      points={{28,42},{55,42},{55,28.8346},{68.8,28.8346}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine4.n, gENCLS.p) annotation (Line(
      points={{38,8},{55,8},{55,28.8346},{68.8,28.8346}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.p, constantLoad.p) annotation (Line(
      points={{-2,8},{-3,8},{-3,-29.2},{8,-29.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(group1.p, pwLine.p) annotation (Line(
      points={{-47,28},{-40,28},{-40,28},{-30,28}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwFault.p, pwLine4.p) annotation (Line(points={{33.9167,-16},{33.9167,-16},{24,-16},{24,8}}, color={0,0,255}));
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
end REN_SMIB1L_Group1;
