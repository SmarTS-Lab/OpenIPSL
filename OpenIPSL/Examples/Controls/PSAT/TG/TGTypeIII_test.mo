within OpenIPSL.Examples.Controls.PSAT.TG;
model TGTypeIII_test
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Machines.PSAT.Order3 order3_Inputs_Outputs1(
    P_0=0.16041,
    Q_0=0.12012,
    V_b=400,
    V_0=1,
    angle_0=0,
    Sn=20,
    Vn=400,
    ra=0.001,
    x1d=0.302,
    M=10,
    D=0,
    xd=1.9,
    T1d0=8,
    xq=1.7) annotation (Placement(visible=true, transformation(
        origin={-35.3443,12.6244},
        extent={{-16.6557,-16.6244},{16.6557,16.6244}},
        rotation=0)));
  OpenIPSL.Electrical.Controls.PSAT.TG.TGTypeIII tGTypeIII1(
    Tg=0.2,
    Tp=0.04,
    delta=0.3,
    sigma=0.04,
    Tr=5,
    vmin=-0.1,
    vmax=0.1,
    gmax=1,
    gmin=0,
    Tw=1,
    a11=0.5,
    a13=1,
    a21=1.5,
    a23=1,
    int3=2.712336,
    P_0=0.1) annotation (Placement(transformation(extent={{-88,-4},{-66,14}})));
  Modelica.Blocks.Sources.Sine sine(
    amplitude=0.001,
    offset=1,
    startTime=5,
    freqHz=0.1)
    annotation (Placement(transformation(extent={{-86,-36},{-72,-22}})));
  Modelica.Blocks.Sources.Sine sine1(
    amplitude=-0.001,
    startTime=10,
    offset=0,
    freqHz=0.1)
    annotation (Placement(transformation(extent={{-86,-60},{-72,-46}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-56,-46},{-42,-32}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine2(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={9.8634,12.3286},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine3(
    G=0,
    X=0.1,
    R=0.01,
    B=0.001/2) annotation (Placement(visible=true, transformation(
        origin={35.5,-14},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={10.863,-14.6714},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(V_0=1, angle_0=0)
    annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={54,-14})));
  inner OpenIPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{40,60},{82,80}})));
equation
  connect(order3_Inputs_Outputs1.vf0, order3_Inputs_Outputs1.vf) annotation (
      Line(
      points={{-48.6689,30.9112},{-12,30.9112},{-12,36},{-62,36},{-62,20.9366},
          {-55.3311,20.9366}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(order3_Inputs_Outputs1.w, tGTypeIII1.w) annotation (Line(
      points={{-17.023,27.5864},{-10,27.5864},{-10,-12},{-98,-12},{-98,5},{-87.78,
          5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(tGTypeIII1.Pm, order3_Inputs_Outputs1.pm) annotation (Line(
      points={{-64.46,5.36},{-61.16,5.36},{-61.16,4.3122},{-55.3311,4.3122}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sine.y, add.u1) annotation (Line(
      points={{-71.3,-29},{-64,-29},{-64,-34.8},{-57.4,-34.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sine1.y, add.u2) annotation (Line(
      points={{-71.3,-53},{-64,-53},{-64,-43.2},{-57.4,-43.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pwLine2.n, pwLine1.n) annotation (Line(
      points={{18.8634,12.3286},{22,12.3286},{22,-14.6714},{19.863,-14.6714}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(pwLine1.n, pwLine3.p) annotation (Line(
      points={{19.863,-14.6714},{28,-14.6714},{28,-14},{26.5,-14}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.n, infiniteBus.p) annotation (Line(
      points={{44.5,-14},{48,-14}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(order3_Inputs_Outputs1.p, pwLine2.p) annotation (Line(
      points={{-18.6886,12.6244},{-17.5115,12.6244},{-17.5115,12.3286},{0.8634,
          12.3286}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1.p, pwLine2.p) annotation (Line(
      points={{1.863,-14.6714},{-4,-14.6714},{-4,12.3286},{0.8634,12.3286}},
      color={0,0,255},
      smooth=Smooth.None));

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={Text(
          extent={{44,66},{80,38}},
          lineColor={0,0,255},
          textStyle={TextStyle.Bold},
          textString="Wref perturbation")}), Documentation);
end TGTypeIII_test;
