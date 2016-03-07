within REN_AIA.REN_Groups;
model REN_SMIB1L_Group1_1
  iPSL.Electrical.Branches.PwLine2Openings pwLine(
    X=0.1,
    t1=100,
    t2=100,
    R=0.01,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-21,-10},{-1,10}})));
  iPSL.Electrical.Events.PwFault pwFault(
    R=0,
    X=-0.5,
    t1=10,
    t2=10.15) annotation (Placement(transformation(extent={{-11,18},{0,30}})));
  iPSL.Electrical.Branches.PwLine2Openings pwLine1(
    X=0.1,
    t1=100,
    t2=100,
    R=0.01,
    G=0,
    B=0) annotation (Placement(transformation(extent={{23,4},{43,24}})));
  iPSL.Electrical.Branches.PwLine2Openings pwLine3(
    t2=100,
    t1=100,
    R=0.005,
    X=0.05,
    G=0,
    B=0) annotation (Placement(transformation(extent={{7,-30},{27,-10}})));
  iPSL.Electrical.Loads.PSSE.Load_variation constantLoad(
    S_i(im=0, re=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    PQBRAK=0.7,
    d_t=0,
    d_P=0,
    t1=0,
    S_p(re=50/1000, im=50/1000),
    V_0=0.9981618,
    angle_0=-0.119942) annotation (Placement(transformation(
        extent={{11,-12},{-11,12}},
        rotation=180,
        origin={20,-44})));
  iPSL.Electrical.Branches.PwLine2Openings pwLine4(
    t2=100,
    t1=100,
    R=0.005,
    X=0.05,
    G=0,
    B=0) annotation (Placement(transformation(extent={{33,-30},{53,-10}})));
  iPSL.Electrical.Machines.PSSE.GENCLS.GENCLS gENCLS(
    X_d=0.2,
    V_0=1,
    D=0,
    angle_0=0,
    M_b=1000,
    H=4,
    P_0=45.0213,
    Q_0=32.30648) annotation (Placement(transformation(extent={{105,-10},{83,12}})));
  REN.REN_Groups.Configuration.RGroup1_1 group1_1 annotation (Placement(transformation(rotation=0, extent={{-84,-10},{-64,10}})));
  inner iPSL.Electrical.SystemBase SysData(S_b=1000) annotation (Placement(transformation(extent={{-78,62},{-54,82}})));
equation
  connect(pwFault.p, pwLine.p) annotation (Line(
      points={{-11.9167,24},{-19,24},{-19,0},{-18,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine.n, pwLine1.p) annotation (Line(
      points={{-4,0},{3,0},{3,14},{26,14}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.p, pwLine1.p) annotation (Line(
      points={{10,-20},{3,-20},{3,14},{26,14}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.n, pwLine4.p) annotation (Line(
      points={{24,-20},{36,-20}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1.n, gENCLS.p) annotation (Line(
      points={{40,14},{67,14},{67,0.834604},{80.8,0.834604}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine4.n, gENCLS.p) annotation (Line(
      points={{50,-20},{67,-20},{67,0.834604},{80.8,0.834604}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.p, constantLoad.p) annotation (Line(
      points={{10,-20},{9,-20},{9,-57.2},{20,-57.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(group1_1.p, pwLine.p) annotation (Line(
      points={{-63,0},{-18,0}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics), Documentation(revisions="<html>
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
end REN_SMIB1L_Group1_1;
