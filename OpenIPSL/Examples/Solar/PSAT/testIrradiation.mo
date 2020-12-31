within OpenIPSL.Examples.Solar.PSAT;
model testIrradiation
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant const(k=25) annotation (Placement(transformation(
        origin={0.0,0.0},
        extent={{-59.54669086659841,-39.54669086659841},{-40.45330913340159,-20.45330913340159}},rotation = 0.0)));
  Modelica.Blocks.Sources.Constant const1(k=1000) annotation (Placement(transformation(
        origin={0.0,0.0},
        extent={{-100.04368118521606,39.95631881478396},{-79.95631881478394,60.04368118521604}},rotation = 0.0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine13(
    B=0,
    G=0,
    R=0,
    X=0.04*1/0.63) annotation (Placement(transformation(
        origin={49.0376,0.0024},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine14(
    B=0.001884956/2*100,
    G=0,
    R=0,
    X=0.848230016469244/100) annotation (Placement(transformation(
        origin={83.1777,5.4501},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus8(angle_0=0, v_0=1) annotation (Placement(transformation(
        origin={117.9874,-1.1504},
        extent={{10.0,-10.0},{-10.0,10.0}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine15(
    B=0.001884956/2*100,
    G=0,
    R=0,
    X=0.848230016469244/100) annotation (Placement(transformation(
        origin={83.2752,-9.5499},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Add add1 annotation (Placement(transformation(
        origin={0.0,0.0},
        extent={{-60.0,20.0},{-40.0,40.0}},rotation = 0.0)));
  Modelica.Blocks.Sources.Step step1(startTime=0.3, height=-500) annotation (
      Placement(transformation(
        origin={0.0,0.0},
        extent={{-139.38683701712566,20.613162982874318},{-120.61316298287433,39.386837017125686}},rotation = 0.0)));
  Modelica.Blocks.Sources.Step step2(startTime=0.7, height=500) annotation (
      Placement(transformation(
        origin={0.0,0.0},
        extent={{-139.354843223454,-19.35484322345399},{-120.64515677654602,-0.6451567765460116}},rotation = 0.0)));
  Modelica.Blocks.Math.Add add2 annotation (Placement(transformation(
        origin={0.0,0.0},
        extent={{-99.29945575509079,0.700544244909219},{-80.70054424490921,19.299455755090783}},rotation = 0.0)));
  OpenIPSL.Electrical.Solar.KTH.PFmodelmpptCorrected05MW PFmodel1(
    anglev0=0.030372922116265,
    p0=0.44884,
    q0=0.00003,
    v0=1.00034051839501) annotation (Placement(transformation(
        origin={-7.9875,0.2883},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  inner OpenIPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{50,50},{75,70}})));
equation    connect(pwLine14.n,infiniteBus8.p) annotation(Line(points = {{92.1777,5.450099999999999},{100.08255,5.450099999999999},{100.08255,-1.1503999999999994},{107.9874,-1.1503999999999994}},color = {0,0,255}));
    connect(pwLine13.n,pwLine14.p) annotation(Line(points = {{58.0376,0.0023999999999997357},{66.10765,0.0023999999999997357},{66.10765,5.450099999999999},{74.1777,5.450099999999999}},color = {0,0,255}));
    connect(pwLine15.p,pwLine14.p) annotation(Line(points = {{74.2752,-9.549900000000001},{68.1777,-9.549900000000001},{68.1777,5.450099999999999},{74.1777,5.450099999999999}},color = {0,0,255}));
    connect(pwLine14.n,pwLine15.n) annotation(Line(points = {{92.1777,5.450099999999999},{98.2752,5.450099999999999},{98.2752,-9.549900000000001},{92.2752,-9.549900000000001}},color = {0,0,255}));
    connect(PFmodel1.pwPin1,pwLine13.p) annotation(Line(points = {{3.0124999999999993,0.28829999999999956},{21.52505,0.28829999999999956},{21.52505,0.0023999999999997357},{40.0376,0.0023999999999997357}},color = {0,0,255}));
    connect(add1.y,PFmodel1.E) annotation(Line(points = {{-39,30},{-30.987450000000003,30},{-30.987450000000003,5.2883},{-19.9875,5.2883}},color = {0,0,127}));
    connect(const.y,PFmodel1.T) annotation(Line(points = {{-39.49864004674175,-30},{-39.49864004674175,-4.7117},{-19.9875,-4.7117}},color = {0,0,127}));
    connect(const1.y,add1.u1) annotation(Line(points = {{-78.95195069626234,50},{-74.61811499999999,50},{-74.61811499999999,36},{-62,36}},color = {0,0,127}));
    connect(add2.y,add1.u2) annotation(Line(points = {{-79.77059866940013,10},{-73.477205,10},{-73.477205,24},{-62,24}},color = {0,0,127}));
    connect(step1.y,add2.u1) annotation(Line(points = {{-119.67447928116177,30},{-101.15934690610894,30},{-101.15934690610894,15.579673453054468}},color = {0,0,127}));
    connect(add2.u2,step2.y) annotation(Line(points = {{-101.15934690610894,4.420326546945531},{-98.02413999999999,4.420326546945531},{-98.02413999999999,-10},{-119.70967245420061,-10}},color = {0,0,127}));


  annotation (Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        grid={5,5}), graphics={Text(
          origin={136.1319,30.0},
          fillPattern=FillPattern.Solid,
          extent={{-41.1319,-13.2857},{41.1319,13.2857}},
          textString="VoltageGrid=10000 (1p.u.)",
          fontName="Arial")}));
end testIrradiation;
