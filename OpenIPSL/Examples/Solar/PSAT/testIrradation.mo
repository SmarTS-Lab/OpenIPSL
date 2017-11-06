within OpenIPSL.Examples.Solar.PSAT;
model testIrradation
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant const(k=25) annotation (Placement(visible=
          true, transformation(
        origin={-59.5887,-17.0499},
        extent={{-3.3987,-3.3987},{3.3987,3.3987}},
        rotation=0)));
  Modelica.Blocks.Sources.Constant const1(k=1000) annotation (Placement(visible
        =true, transformation(
        origin={-87.9874,22.9501},
        extent={{-3.3987,-3.3987},{3.3987,3.3987}},
        rotation=0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine13(
    B=0,
    G=0,
    R=0,
    X=0.04*1/0.63) annotation (Placement(visible=true, transformation(
        origin={49.0376,0.0024},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine14(
    B=0.001884956/2*100,
    G=0,
    R=0,
    X=0.848230016469244/100) annotation (Placement(visible=true, transformation(
        origin={83.1777,5.4501},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus8(angle_0=0, V_0=1)
    annotation (Placement(visible=true, transformation(
        origin={117.9874,-1.1504},
        extent={{10.0,-10.0},{-10.0,10.0}},
        rotation=0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine15(
    B=0.001884956/2*100,
    G=0,
    R=0,
    X=0.848230016469244/100) annotation (Placement(visible=true, transformation(
        origin={83.2752,-9.5499},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Math.Add add1 annotation (Placement(visible=true,
        transformation(
        origin={-52.9874,14.9248},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Sources.Step step1(startTime=0.3, height=-500) annotation (
      Placement(visible=true, transformation(
        origin={-113.885,0.0201},
        extent={{-4.1024,-4.1024},{4.1024,4.1024}},
        rotation=0)));
  Modelica.Blocks.Sources.Step step2(startTime=0.7, height=500) annotation (
      Placement(visible=true, transformation(
        origin={-112.9874,-30.0},
        extent={{-5.0,-5.0},{5.0,5.0}},
        rotation=0)));
  Modelica.Blocks.Math.Add add2 annotation (Placement(visible=true,
        transformation(
        origin={-85.1206,-12.0499},
        extent={{-2.8669,-2.8669},{2.8669,2.8669}},
        rotation=0)));
  OpenIPSL.Electrical.Solar.KTH.PFmodelmpptCorrected05MW PFmodel1(
    anglev0=0.030372922116265,
    p0=0.44884,
    q0=0.00003,
    v0=1.00034051839501) annotation (Placement(visible=true, transformation(
        origin={-7.9875,0.2883},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  inner OpenIPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{50,50},{75,70}})));
equation
  connect(const1.y, add1.u1) annotation (Line(
      visible=true,
      origin={-71.3029,21.9375},
      points={{-12.9459,1.0126},{3.3154,1.0126},{3.3154,-1.0127},{6.3155,-1.0127}},

      color={0,0,127}));

  connect(add2.y, add1.u2) annotation (Line(
      visible=true,
      origin={-76.3072,1.9333},
      points={{-5.65981,-13.9832},{-5.65981,6.9915},{11.3198,6.9915}},
      color={0,0,127}));
  connect(step1.y, add2.u1) annotation (Line(
      visible=true,
      origin={-95.2638,-5.1548},
      points={{-14.1086,5.1749},{3.7029,5.1749},{3.7029,-5.17496},{6.70292,-5.17496}},

      color={0,0,127}));

  connect(add2.u2, step2.y) annotation (Line(
      visible=true,
      origin={-101.2558,-21.885},
      points={{12.6949,8.11496},{-3.2317,8.11496},{-3.2317,-8.115},{-6.2316,-8.115}},

      color={0,0,127}));

  connect(pwLine13.n, pwLine14.p) annotation (Line(
      visible=true,
      origin={68.1427,2.7263},
      points={{-7.43843,-2.7239},{2.035,-2.7239},{2.035,2.7238},{3.36833,2.7238}}));
  connect(pwLine14.n, pwLine15.n) annotation (Line(
      visible=true,
      origin={90.2103,-4.5499},
      points={{4.63407,10},{4.63407,-5},{4.73157,-5}}));
  connect(pwLine14.p, pwLine15.p) annotation (Line(
      visible=true,
      origin={76.2102,-4.5499},
      points={{-4.69917,10},{-4.69917,-5},{-4.60167,-5}}));
  connect(infiniteBus8.p, pwLine14.n) annotation (Line(
      visible=true,
      origin={97.3801,2.1498},
      points={{31.6073,-3.3002},{-1.2024,-3.3002},{-1.2024,3.3003},{-2.53573,
          3.3003}}));
  connect(const.y, PFmodel1.T) annotation (Line(
      visible=true,
      origin={-30.4532,-10.8808},
      points={{-25.3969,-6.1691},{7.4657,-6.1691},{7.4657,6.1691},{10.4657,
          6.1691}},
      color={0,0,127}));
  connect(PFmodel1.pwPin1, pwLine13.p) annotation (Line(
      visible=true,
      origin={32.2688,0.1454},
      points={{-29.2563,0.1429},{9.7437,0.1429},{9.7437,-0.143},{5.10213,-0.143}}));
  connect(add1.y, PFmodel1.E) annotation (Line(
      visible=true,
      origin={-26.9875,10.1066},
      points={{-14.9999,4.8182},{4,4.8183},{4,-4.8183},{7,-4.8183}},
      color={0,0,127}));
  annotation (Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={5,5}), graphics={Text(
          visible=true,
          origin={136.1319,30.0},
          fillPattern=FillPattern.Solid,
          extent={{-41.1319,-13.2857},{41.1319,13.2857}},
          textString="VoltageGrid=10000 (1p.u.)",
          fontName="Arial")}), Documentation);
end testIrradation;
