within iPSL.Examples.Controls.PSAT.TG;
model TGTypeVI_test
  iPSL.Electrical.Controls.PSAT.TG.TGTypeVI tGModel6_1(
    Ka=3.33333,
    Ta=0.07,
    vmin=-0.1,
    vmax=0.1,
    gmax=0.97518,
    gmin=0.01,
    Rp=0.05,
    Kp=1.163,
    Ki=0.105,
    Kd=0,
    Td=0.01,
    beta=0.1,
    Tw=2.67,
    dref=0,
    po=0.16074) annotation (Placement(transformation(extent={{-44,16},{-10,50}})));
  iPSL.Electrical.Machines.PSAT.ThirdOrder.Order3 order3_Inputs_Outputs1(
    P_0=0.16041,
    Q_0=0.12012,
    V_b=400,
    V_0=1,
    angle_0=0,
    Sn=20,
    Vn=400,
    ra=0.001,
    xd1=0.302,
    M=10,
    D=0,
    xd=1.9,
    Td10=8,
    xq=1.7) annotation (Placement(visible=true, transformation(
        origin={-25.3443,-17.3756},
        extent={{-16.6557,-16.6244},{16.6557,16.6244}},
        rotation=0)));
  iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ1(
    P_0=0.08,
    Q_0=0.06,
    V_0=1,
    angle_0=0) annotation (Placement(visible=true, transformation(
        origin={63.147,-19.6714},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine1(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={17.8634,-37.6714},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine2(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={17.8634,-17.6714},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine3(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={39.5,-38},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine4(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={40.8634,-18.6714},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ2(
    P_0=0.08,
    Q_0=0.06,
    V_0=1,
    angle_0=0) annotation (Placement(visible=true, transformation(
        origin={63.5,-38},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Sources.Sine sine3(
    freqHz=0.2,
    startTime=10,
    amplitude=-0.001,
    offset=0) annotation (Placement(visible=true, transformation(
        origin={-90.0594,49.8126},
        extent={{-5.9406,-5.8126},{5.9406,5.8126}},
        rotation=0)));
  Modelica.Blocks.Math.Add Perturbation(k2=+1) annotation (Placement(visible=true, transformation(
        origin={-64.3229,61.327},
        extent={{-6.3229,-6.3229},{6.3229,6.3229}},
        rotation=0)));
  Modelica.Blocks.Sources.Sine sine4(
    freqHz=0.2,
    startTime=5,
    amplitude=0.001,
    offset=1) annotation (Placement(visible=true, transformation(
        origin={-90.2599,69.8051},
        extent={{-5.7401,-5.8051},{5.7401,5.8051}},
        rotation=0)));
  inner iPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{0,80},{60,100}})));
equation
  connect(pwLine4.n, pwLoadPQ1.p) annotation (Line(
      visible=true,
      origin={63.076,-14.6714},
      points={{-15.2126,-4},{-15.2126,6},{0.071,6}}));
  connect(pwLine3.n, pwLoadPQ2.p) annotation (Line(
      visible=true,
      origin={67,-51.5},
      points={{-20.5,13.5},{-3.5,13.5},{-3.5,24.5}}));
  connect(pwLine2.n, pwLine4.p) annotation (Line(
      visible=true,
      origin={23.1134,-15.1714},
      points={{1.75,-2.5},{4.75,-2.5},{4.75,-3.5},{10.75,-3.5}}));
  connect(pwLine1.n, pwLine3.p) annotation (Line(
      visible=true,
      origin={23.0909,-44.8357},
      points={{1.7725,7.1643},{5.4091,7.1643},{5.4091,6.8357},{9.4091,6.8357}}));
  connect(pwLine1.n, pwLine2.n) annotation (Line(
      visible=true,
      origin={24.8634,-27.6714},
      points={{0.0,-10.0},{0.0,10.0}}));
  connect(order3_Inputs_Outputs1.p, pwLine2.p) annotation (Line(
      visible=true,
      origin={3.2254,-20.2865},
      points={{-10.2484,2.99342},{1.638,2.99342},{1.638,2.6151},{7.638,2.6151}}));
  connect(pwLine2.p, pwLine1.p) annotation (Line(
      visible=true,
      origin={10.8634,-27.6714},
      points={{-0.00000000000000177636,10},{-0.00000000000000177636,5},{-0.00000000000000355272,5},{-0.00000000000000355272,0},{-0.00000000000000177636,0},{-0.00000000000000177636,-10}}));
  connect(order3_Inputs_Outputs1.w, tGModel6_1.we)
    annotation (Line(
      points={{-7.02303,-2.41364},{-7.02303,-40},{-58,-40},{-58,35.72},{-46.72,35.72}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(order3_Inputs_Outputs1.vf0, tGModel6_1.Pe)
    annotation (Line(
      points={{-38.6689,0.91124},{6,0.91124},{6,-46},{-66,-46},{-66,29.26},{-46.72,29.26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(order3_Inputs_Outputs1.vf0, order3_Inputs_Outputs1.vf)
    annotation (Line(
      points={{-38.6689,0.91124},{0,0.91124},{0,6},{-52,6},{-52,-9.0634},{-42,-9.0634}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(order3_Inputs_Outputs1.pm0, tGModel6_1.Pref)
    annotation (Line(
      points={{-38.6689,-35.6624},{8,-35.6624},{8,12},{-56,12},{-56,22.12},{-46.72,22.12}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(tGModel6_1.Pm, order3_Inputs_Outputs1.pm)
    annotation (Line(
      points={{-7.79,35.89},{-4,35.89},{-4,52},{-78,52},{-78,-25.6878},{-42,-25.6878}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Perturbation.u2, sine3.y)
    annotation (Line(
      visible=true,
      origin={-78.886,58.468},
      points={{6.97562,-0.93474},{2.886,-0.93474},{2.886,-4.4679},{-4.63874,-4.4679},{-4.63874,-8.6554}},
      color={0,0,127}));
  connect(sine4.y, Perturbation.u1) annotation (Line(
      points={{-83.9458,69.8051},{-82,69.8051},{-82,65.1207},{-71.9104,65.1207}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Perturbation.y, tGModel6_1.wref) annotation (Line(
      points={{-57.3677,61.327},{-52,61.327},{-52,42.86},{-46.72,42.86}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,-80},{80,120}})),
    Icon(coordinateSystem(extent={{-120,-80},{80,120}})),
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
end TGTypeVI_test;
