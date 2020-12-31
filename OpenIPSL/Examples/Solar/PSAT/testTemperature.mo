within OpenIPSL.Examples.Solar.PSAT;
model testTemperature
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant const(k=1000) annotation (Placement(transformation(
        origin={0.0,0.0},
        extent={{-79.36014120497015,20.639858795029873},{-60.63985879502985,39.36014120497013}},rotation = 0.0)));
  Modelica.Blocks.Sources.Constant const1(k=25) annotation (Placement(transformation(
        origin={0.0,0.0},
        extent={{-119.80171774261535,0.19828225738466188},{-100.19828225738465,19.801717742615338}},rotation = 0.0)));
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
        origin={-50.0,-16.424},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Sources.Step step1(startTime=0.3, height=15) annotation (
      Placement(transformation(
        origin={0.0,0.0},
        extent={{-139.96095957097845,-39.96095957097846},{-120.03904042902155,-20.03904042902154}},rotation = 0.0)));
  Modelica.Blocks.Sources.Step step2(startTime=0.7, height=-15) annotation (
      Placement(transformation(
        origin={0.0,0.0},
        extent={{-139.39389363815832,-79.3938936381583},{-120.6061063618417,-60.60610636184169}},rotation = 0.0)));
  Modelica.Blocks.Math.Add add2 annotation (Placement(transformation(
        origin={0.0,0.0},
        extent={{-99.58979054067834,-39.589790540678344},{-80.41020945932166,-20.410209459321656}},rotation = 0.0)));
  OpenIPSL.Electrical.Solar.KTH.PFmodelmpptCorrected05MW PFmodel1(
    anglev0=0.030372922116265,
    p0=0.44884,
    q0=0.00003,
    v0=1.0003436) annotation (Placement(transformation(
        origin={-7.9875,0.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  inner OpenIPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{50,50},{70,70}})));
equation    connect(PFmodel1.pwPin1,pwLine13.p) annotation(Line(points = {{3.0124999999999993,0},{21.52505,0},{21.52505,0.0023999999999997357},{40.0376,0.0023999999999997357}},color = {0,0,255}));
    connect(pwLine13.n,pwLine14.p) annotation(Line(points = {{58.0376,0.0023999999999997357},{66.10765,0.0023999999999997357},{66.10765,5.450099999999999},{74.1777,5.450099999999999}},color = {0,0,255}));
    connect(pwLine14.p,pwLine15.p) annotation(Line(points = {{74.1777,5.450099999999999},{74.1777,-9.549900000000001},{74.2752,-9.549900000000001}},color = {0,0,255}));
    connect(pwLine14.n,pwLine15.n) annotation(Line(points = {{92.1777,5.450099999999999},{92.1777,-9.549900000000001},{92.2752,-9.549900000000001}},color = {0,0,255}));
    connect(pwLine14.n,infiniteBus8.p) annotation(Line(points = {{92.1777,5.450099999999999},{100.08255,5.450099999999999},{100.08255,-1.1503999999999994},{107.9874,-1.1503999999999994}},color = {0,0,255}));
    connect(PFmodel1.E,const.y) annotation(Line(points = {{-19.9875,5},{-39.84567233726642,5},{-39.84567233726642,30},{-59.70384467453284,30}},color = {0,0,127}));
    connect(add1.y,PFmodel1.T) annotation(Line(points = {{-39,-16.424},{-29.49375,-16.424},{-29.49375,-5},{-19.9875,-5}},color = {0,0,127}));
    connect(const1.y,add1.u1) annotation(Line(points = {{-99.21811048312311,10},{-80.60905524156155,10},{-80.60905524156155,-10.424},{-62,-10.424}},color = {0,0,127}));
    connect(step1.y,add2.u1) annotation(Line(points = {{-119.0429444719237,-30},{-110.27534656036886,-30},{-110.27534656036886,-24.246125675592992},{-101.507748648814,-24.246125675592992}},color = {0,0,127}));
    connect(step2.y,add2.u2) annotation(Line(points = {{-119.66671699802586,-70},{-110.58723282341992,-70},{-110.58723282341992,-35.75387432440701},{-101.507748648814,-35.75387432440701}},color = {0,0,127}));
    connect(add2.y,add1.u2) annotation(Line(points = {{-79.45123040525382,-30},{-70.72561520262691,-30},{-70.72561520262691,-22.424},{-62,-22.424}},color = {0,0,127}));


  annotation (Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        grid={5,5}), graphics={Text(
          origin={136.1319,30.0},
          fillPattern=FillPattern.Solid,
          extent={{-41.1319,-13.2857},{41.1319,13.2857}},
          textString="VoltageGrid=10000 (1p.u.)",
          fontName="Arial")}));
end testTemperature;
