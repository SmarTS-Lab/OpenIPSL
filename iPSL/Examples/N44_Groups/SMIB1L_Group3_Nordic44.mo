within iPSL.Examples.N44_Groups;
model SMIB1L_Group3_Nordic44
  Electrical.Branches.PwLine2Openings pwLine(
    R=0.1,
    X=0.1,
    G=0.1,
    B=0.1,
    t1=100,
    t2=100) annotation (Placement(transformation(extent={{-41,-10},{-21,10}})));
  Electrical.Events.PwFault pwFault(
    R=0,
    t1=2,
    t2=2.15,
    X=-0.5) annotation (Placement(transformation(extent={{-31,18},{-11,38}})));
  Electrical.Branches.PwLine2Openings pwLine1(
    R=0.1,
    X=0.1,
    G=0.1,
    B=0.1,
    t1=100,
    t2=100) annotation (Placement(transformation(extent={{3,4},{23,24}})));
  Electrical.Branches.PwLine2Openings pwLine3(
    R=0.1,
    X=0.1,
    G=0.1,
    B=0.1,
    t2=100,
    t1=100) annotation (Placement(transformation(extent={{-13,-30},{7,-10}})));
  Electrical.Loads.PSSE.Load_variation constantLoad(
    angle_0=-0.57627,
    S_p(re=0.5, im=0.1),
    S_i(im=0, re=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    PQBRAK=0.7,
    V_0=0.991992,
    t1=2,
    d_P=5*0.01,
    d_t=0) annotation (Placement(transformation(
        extent={{11,-12},{-11,12}},
        rotation=180,
        origin={0,-42})));
  Electrical.Branches.PwLine2Openings pwLine4(
    R=0.1,
    X=0.1,
    G=0.1,
    B=0.1,
    t2=100,
    t1=100) annotation (Placement(transformation(extent={{13,-30},{33,-10}})));
  Electrical.Machines.PSSE.GENCLS.GENCLS gENCLS(
    M_b=0.1,
    X_d=0.2,
    P_0=0.01*10.01716,
    Q_0=0.01*8.006525,
    V_0=1,
    H=0,
    D=0,
    angle_0=-3.00563e-7) annotation (Placement(transformation(extent={{85,-10},{63,12}})));
  iPSL.Examples.N44_Groups.Configuration.Group3 group3 annotation (Placement(transformation(rotation=0, extent={{-94,-10},{-74,10}})));
equation
  connect(pwFault.p, pwLine.p) annotation (Line(
      points={{-32.6667,28},{-39,28},{-39,0},{-38,0},{-38,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine.n, pwLine1.p) annotation (Line(
      points={{-24,0},{-17,0},{-17,14},{6,14}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.p, pwLine1.p) annotation (Line(
      points={{-10,-20},{-17,-20},{-17,14},{6,14}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.n, pwLine4.p) annotation (Line(
      points={{4,-20},{16,-20}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1.n, gENCLS.p) annotation (Line(
      points={{20,14},{47,14},{47,0.834604},{60.8,0.834604}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine4.n, gENCLS.p) annotation (Line(
      points={{30,-20},{47,-20},{47,0.834604},{60.8,0.834604}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.p, constantLoad.p) annotation (Line(
      points={{-10,-20},{-11,-20},{-11,-55.2},{-1.77636e-015,-55.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(group3.p, pwLine.p) annotation (Line(
      points={{-73,0},{-38,0}},
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
end SMIB1L_Group3_Nordic44;
