within iPSL.Examples.DevelopmentExamples.Electrical.Machines.PSAT;
model Order3test2_TG
  iPSL.Electrical.Machines.PSAT.ThirdOrder.Order3 order3_Inputs_Outputs1(
    V_b=400,
    V_0=1,
    angle_0=0,
    Sn=20,
    Vn=400,
    ra=0.01,
    xd1=0.302,
    M=10,
    D=0,
    xd=1.9,
    Td10=8,
    xq=1.7,
    P_0=0.200012000627281,
    Q_0=0.0518626935184656) annotation (Placement(visible=true, transformation(
        origin={3.3113,-20.7513},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ1(
    P_0=0.08,
    Q_0=0.06,
    V_0=1,
    angle_0=0) annotation (Placement(visible=true, transformation(
        origin={123.1468,-15.6714},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine1(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={39.8634,-35.6714},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Events.PwFault pwFault1(
    R=20,
    X=1,
    t1=3,
    t2=3.1) annotation (Placement(visible=true, transformation(
        origin={132.5,-77.3},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLinewithOpeningReceiving pwLinewithOpening1(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1,
    t1=8,
    t2=8.1) annotation (Placement(visible=true, transformation(
        origin={84.8634,-25.6714},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine2(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={39.8634,-15.6714},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine3(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={87.5,-50.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine4(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={84.8634,-10.6714},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ2(
    P_0=0.08,
    Q_0=0.06,
    V_0=1,
    angle_0=0) annotation (Placement(visible=true, transformation(
        origin={127.5,-50.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Controls.PSAT.TG.TGtypeII TGtypeII1 annotation (Placement(visible=true, transformation(
        origin={-50.0,-40.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  inner iPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{100,80},{135,100}})));
equation
  connect(order3_Inputs_Outputs1.vf0, order3_Inputs_Outputs1.vf) annotation (Line(
      visible=true,
      origin={3.3742,-9.512},
      points={{-8.0629,-0.2393},{13.9371,-0.2393},{13.9371,7.8232},{-13.3742,7.8232},{-13.3742,-6.2393},{-10.0629,-6.2393}},
      color={0,0,127}));
  connect(order3_Inputs_Outputs1.pm, TGtypeII1.pm)
    annotation (Line(
      visible=true,
      origin={-29.9222,-32.3757},
      points={{23.2335,6.6244},{-6.0778,6.6244},{-6.0778,-7.6243},{-9.0778,-7.6243}},
      color={0,0,127}));
  connect(order3_Inputs_Outputs1.pm0, TGtypeII1.pm0) annotation (Line(
      visible=true,
      origin={-23.7162,-4.1558},
      points={{19.0275,-27.5955},{45.412,-27.5955},{45.412,34.1558},{-51.2838,34.1558},{-51.2838,-23.8442},{-26.2838,-23.8442}},
      color={0,0,127}));
  connect(order3_Inputs_Outputs1.w, TGtypeII1.W) annotation (Line(
      visible=true,
      origin={-23.7171,-43.5838},
      points={{38.0284,31.8325},{51.4102,31.8325},{51.4102,-21.4162},{-51.2829,-21.4162},{-51.2829,3.5838},{-38.2829,3.5838}},
      color={0,0,127}));
  connect(pwLine4.n, pwLoadPQ1.p) annotation (Line(
      visible=true,
      origin={107.0759,-12.6714},
      points={{-15.2125,2},{3.0709,2},{3.0709,8},{16.0709,8}}));
  connect(pwLine4.p, pwLinewithOpening1.p) annotation (Line(
      visible=true,
      origin={77.8634,-18.1714},
      points={{0.0,7.5},{0.0,-7.5}}));
  connect(pwFault1.p, pwLine3.n) annotation (Line(
      visible=true,
      origin={105.25,-63.15},
      points={{15.5833,-14.15},{-4.75,-14.15},{-4.75,13.15},{-10.75,13.15}}));
  connect(pwLine3.n, pwLoadPQ2.p) annotation (Line(
      visible=true,
      origin={111.0,-49.5},
      points={{-16.5,-0.5},{3.5,-0.5},{3.5,10.5},{16.5,10.5}}));
  connect(pwLinewithOpening1.n, pwLine4.n) annotation (Line(
      visible=true,
      origin={91.8634,-18.1714},
      points={{0.0,-7.5},{0.0,7.5}}));
  connect(pwLine2.n, pwLine4.p) annotation (Line(
      visible=true,
      origin={67.1134,-13.1714},
      points={{-20.25,-2.5},{4.75,-2.5},{4.75,2.5},{10.75,2.5}}));
  connect(pwLine1.n, pwLine3.p) annotation (Line(
      visible=true,
      origin={69.0909,-42.8357},
      points={{-22.2275,7.1643},{5.4091,7.1643},{5.4091,-7.1643},{11.4091,-7.1643}}));
  connect(pwLine1.n, pwLine2.n) annotation (Line(
      visible=true,
      origin={46.8634,-25.6714},
      points={{0.0,-10.0},{0.0,10.0}}));
  connect(order3_Inputs_Outputs1.p, pwLine2.p) annotation (Line(
      visible=true,
      origin={25.2254,-18.2865},
      points={{-10.9141,-2.41516},{1.638,-2.41516},{1.638,2.6151},{7.638,2.6151}}));
  connect(pwLine2.p, pwLine1.p) annotation (Line(
      visible=true,
      origin={32.8634,-25.6714},
      points={{0.0,10.0},{0.0,-10.0}}));
  annotation (Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={5,5})), Documentation(revisions="<html>
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
end Order3test2_TG;
