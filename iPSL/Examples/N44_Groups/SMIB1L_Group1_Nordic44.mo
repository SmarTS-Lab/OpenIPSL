within iPSL.Examples.N44_Groups;
model SMIB1L_Group1_Nordic44 "Single-Machine Infinite Bus model testing the dynamic configuration of generator and controls,
  from Nordic 44 model: Buses 3000, 7000 to be deleted"

  iPSL.Examples.N44_Groups.Configuration.Group1 group1_1 annotation (Placement(transformation(extent={{-85,-10},{-65,10}})));
  Electrical.Branches.PwLine2Openings pwLine(
    R=0.1,
    X=0.1,
    G=0.1,
    B=0.1,
    t1=100,
    t2=100) annotation (Placement(transformation(extent={{-37,-10},{-17,10}})));
  Electrical.Events.PwFault pwFault(
    R=0,
    t1=2,
    t2=2.15,
    X=-0.5) annotation (Placement(transformation(extent={{-27,18},{-7,38}})));
  Electrical.Branches.PwLine2Openings pwLine1(
    R=0.1,
    X=0.1,
    G=0.1,
    B=0.1,
    t1=100,
    t2=100) annotation (Placement(transformation(extent={{7,4},{27,24}})));
  Electrical.Branches.PwLine2Openings pwLine3(
    R=0.1,
    X=0.1,
    G=0.1,
    B=0.1,
    t2=100,
    t1=100) annotation (Placement(transformation(extent={{-9,-30},{11,-10}})));
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
        origin={4,-44})));
  Electrical.Branches.PwLine2Openings pwLine4(
    R=0.1,
    X=0.1,
    G=0.1,
    B=0.1,
    t2=100,
    t1=100) annotation (Placement(transformation(extent={{17,-30},{37,-10}})));
  Electrical.Machines.PSSE.GENCLS.GENCLS gENCLS(
    M_b=0.1,
    X_d=0.2,
    P_0=0.01*10.01716,
    Q_0=0.01*8.006525,
    V_0=1,
    H=0,
    D=0,
    angle_0=-3.00563e-7) annotation (Placement(transformation(extent={{89,-10},{67,12}})));
equation
  connect(pwFault.p, pwLine.p) annotation (Line(
      points={{-28.6667,28},{-35,28},{-35,0},{-34,0},{-34,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine.n, pwLine1.p) annotation (Line(
      points={{-20,0},{-13,0},{-13,14},{10,14}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.p, pwLine1.p) annotation (Line(
      points={{-6,-20},{-13,-20},{-13,14},{10,14}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.n, pwLine4.p) annotation (Line(
      points={{8,-20},{20,-20}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1.n, gENCLS.p) annotation (Line(
      points={{24,14},{51,14},{51,0.834604},{64.8,0.834604}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine4.n, gENCLS.p) annotation (Line(
      points={{34,-20},{51,-20},{51,0.834604},{64.8,0.834604}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.p, constantLoad.p) annotation (Line(
      points={{-6,-20},{-7,-20},{-7,-57.2},{4,-57.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(group1_1.pwPin, pwLine.p) annotation (Line(
      points={{-64,0},{-34,0}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={1,1}), graphics),
    Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={1,1})),
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
end SMIB1L_Group1_Nordic44;
