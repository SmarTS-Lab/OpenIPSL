within RaPIdExperiments;
model Mostar "System with the original generator parameters"
  OpenIPSL.Electrical.Branches.PwLine pwLine(
    B=0,
    G=0,
    R=0,
    X=0.1169,
    displayPF=true)
    annotation (Placement(transformation(extent={{14,-4},{26,4}})));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(angle_0=0, V_0=0.9617)
    annotation (Placement(transformation(extent={{80,-10},{60,10}})));
  OpenIPSL.Electrical.Loads.PSSE.Load constantLoad(
    PQBRAK=0.7,
    V_0=0.97042,
    angle_0=0,
    P_0=5.19486)
    annotation (Placement(transformation(extent={{-6,-32},{6,-20}})));
  OpenIPSL.Electrical.Buses.Bus bus(displayPF=false)
    annotation (Placement(transformation(extent={{-18,-10},{2,10}})));
  OpenIPSL.Electrical.Buses.Bus bus1
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
    M_b=30,
    Tpd0=3.77,
    Tppd0=0.0552,
    Tppq0=0.0823,
    D=0,
    Xd=1.183,
    Xq=0.62,
    Xpd=0.371,
    Xppd=0.215,
    Xppq=0.241,
    Xl=0.1,
    S10=0.1,
    S12=0.4,
    R_a=0.017637/(10.5^2/30),
    H=2.137,
    angle_0=0,
    Q_0=0.07332*30,
    V_0=0.9705,
    P_0=5.19486)
    annotation (Placement(transformation(extent={{-72,-12},{-48,12}})));
  Modelica.Blocks.Sources.Constant const(k=-Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{-80,-76},{-70,-66}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.ST5B sT5B(
    T_C1=1.071137,
    T_B1=10.7561,
    T_C2=3.414283,
    T_B2=1.701033,
    K_R=358.6086,
    T_1=0.004361481)
    annotation (Placement(transformation(extent={{-54,-38},{-74,-20}})));
  Modelica.Blocks.Sources.Constant const1(k=Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{-80,-56},{-70,-46}})));
  Modelica.Blocks.Sources.Constant const2(k=0)
    annotation (Placement(transformation(extent={{-28,-58},{-40,-46}})));
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=30, fn=50) annotation (
      Placement(visible=true, transformation(extent={{18,-76},{78,-56}},
          rotation=0)));
  Modelica.Blocks.Sources.Step step(startTime=1.7, height=-0.05)
    annotation (Placement(transformation(extent={{-16,-24},{-24,-16}})));
  Modelica.Blocks.Sources.Step step1(startTime=10.25, height=0.05)
    annotation (Placement(transformation(extent={{-16,-38},{-24,-30}})));
  Modelica.Blocks.Math.Add3 add3_1
    annotation (Placement(transformation(extent={{-30,-32},{-38,-24}})));
equation
  connect(bus.p, pwLine.p)
    annotation (Line(points={{-8,0},{14.6,0}}, color={0,0,255}));
  connect(constantLoad.p, pwLine.p) annotation (Line(points={{0,-20},{0,-20},{0,
          0},{14.6,0}}, color={0,0,255}));
  connect(pwLine.n, bus1.p)
    annotation (Line(points={{25.4,0},{25.4,0},{50,0}}, color={0,0,255}));
  connect(bus1.p, infiniteBus.p)
    annotation (Line(points={{50,0},{60,0}}, color={0,0,255}));
  connect(gENSAL.p, bus.p)
    annotation (Line(points={{-48,0},{-48,0},{-8,0}}, color={0,0,255}));
  connect(const.y, sT5B.VUEL) annotation (Line(points={{-69.5,-71},{-57.5,-71},
          {-57.5,-38}}, color={0,0,127}));
  connect(const1.y, sT5B.VOEL) annotation (Line(points={{-69.5,-51},{-60.5,-51},
          {-60.5,-38}}, color={0,0,127}));
  connect(sT5B.EFD, gENSAL.EFD) annotation (Line(points={{-74.5,-28},{-86,-28},
          {-86,-6},{-74.4,-6}}, color={0,0,127}));
  connect(gENSAL.PMECH, gENSAL.PMECH0) annotation (Line(points={{-74.4,6},{-80,
          6},{-80,16},{-42,16},{-42,6},{-46.8,6}}, color={0,0,127}));
  connect(gENSAL.EFD0, sT5B.EFD0) annotation (Line(points={{-46.8,-6},{-42,-6},
          {-42,-34.5},{-54,-34.5}}, color={0,0,127}));
  connect(sT5B.XADIFD, gENSAL.XADIFD) annotation (Line(points={{-54,-31},{-40,-31},
          {-40,-10.8},{-47.04,-10.8}}, color={0,0,127}));
  connect(step.y, add3_1.u2) annotation (Line(points={{-24.4,-20},{-26,-20},{-26,
          -28},{-29.2,-28}}, color={0,0,127}));
  connect(gENSAL.ETERM, add3_1.u1) annotation (Line(points={{-46.8,-3.6},{-28,-3.6},
          {-28,-24.8},{-29.2,-24.8}}, color={0,0,127}));
  connect(add3_1.y, sT5B.ECOMP) annotation (Line(points={{-38.4,-28},{-38.4,-28},
          {-54,-28}}, color={0,0,127}));
  connect(sT5B.VOTHSG, const2.y) annotation (Line(points={{-54,-23.5},{-52,-23.5},
          {-52,-24},{-52,-52},{-40.6,-52}}, color={0,0,127}));
  connect(add3_1.u3, step1.y) annotation (Line(points={{-29.2,-31.2},{-26,-31.2},
          {-26,-34},{-24.4,-34}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,40}})),
    experiment(
      StartTime=0,
      StopTime=20,
      Tolerance=1e-06,
      Interval=0.04),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            40}})));
end Mostar;
