within OpenIPSL.Examples.Wind.PSSE.WT4G;
model WT4G1
  extends Modelica.Icons.Example;
  constant Real pi=Modelica.Constants.pi;
  parameter Real V1=1.00000;
  parameter Real A1=-1.570655e-005;
  parameter Real V3=0.9999999;
  parameter Real A3=0.02574992;
  parameter Real P1=-1.4988;
  parameter Real Q1=-4.3340;
  parameter Real Zr=0.00000E+0;
  parameter Real Zi=2.00000E-1;
  parameter Real P3=1.500;
  parameter Real Q3=-5.6658;
  parameter Real R1=2.50000E-2;
  parameter Real X1=2.50000E-2;
  parameter Real B1=0.05000;
  parameter Real dyrw[1, 9]=[0.20000E-01, 0.20000E-01, 0.40000, 0.90000, 1.1100,
      1.2000, 2.0000, 2.0000, 0.20000E-01];
  OpenIPSL.Electrical.Branches.PwLine pwLine(
    R=R1,
    X=X1,
    G=0,
    B=B1/2) annotation (Placement(transformation(extent={{30,10},{50,30}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    R=R1,
    X=X1,
    G=0,
    B=B1/2) annotation (Placement(transformation(extent={{30,-30},{50,-10}})));
  OpenIPSL.Electrical.Machines.PSSE.GENCLS gENCLS2_1(
    V_0=V1,
    angle_0=A1,
    P_0=P1,
    Q_0=Q1,
    R_a=Zr,
    X_d=Zi,
    M_b=100) annotation (Placement(transformation(extent={{102,-12},{90,12}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine2(
    G=0,
    B=0,
    R=2.50000E-3,
    X=2.50000E-3)
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  OpenIPSL.Electrical.Wind.PSSE.WT4G.WT4G1 wT4G1(
    V_0=V3,
    angle_0=A3,
    M_b=100,
    P_0=P3,
    Q_0=Q3,
    T_IQCmd=0.02,
    T_IPCmd=0.02,
    V_LVPL1=0.4,
    V_LVPL2=0.9,
    G_LVPL=1.11,
    V_HVRCR=1.2,
    CUR_HVRCR=2,
    RIp_LVPL=2,
    T_LVPL=0.02) annotation (Placement(transformation(
        extent={{12,12},{-12,-12}},
        rotation=180,
        origin={-52,0})));
  OpenIPSL.Electrical.Events.PwFault pwFault(
    R=0.5,
    X=0.5,
    t1=1,
    t2=1.5) annotation (Placement(transformation(extent={{20,-60},{40,-40}})));
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=100, fn=60)
    annotation (Placement(transformation(extent={{-100,80},{-48,100}})));
  OpenIPSL.Electrical.Buses.Bus GEN
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  OpenIPSL.Electrical.Buses.Bus BUS1
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  OpenIPSL.Electrical.Buses.Bus INF
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
equation
  connect(wT4G1.p, GEN.p) annotation (Line(points={{-38.8,-1.77636e-015},{-40,-1.77636e-015},
          {-40,0},{-30,0}}, color={0,0,255}));
  connect(GEN.p, pwLine2.p)
    annotation (Line(points={{-30,0},{-21.6667,0}}, color={0,0,255}));
  connect(pwLine2.n, BUS1.p) annotation (Line(points={{1.66667,0},{1.66667,0},{
          10,0}}, color={0,0,255}));
  connect(BUS1.p, pwLine.p) annotation (Line(points={{10,0},{20,0},{20,20},{
          28.3333,20}}, color={0,0,255}));
  connect(pwLine1.p, pwLine.p) annotation (Line(points={{28.3333,-20},{20,-20},
          {20,20},{28.3333,20}}, color={0,0,255}));
  connect(pwFault.p, BUS1.p) annotation (Line(points={{18.3333,-50},{14,-50},{
          14,0},{10,0}}, color={0,0,255}));
  connect(pwLine.n, INF.p) annotation (Line(points={{51.6667,20},{60,20},{60,0},
          {70,0}}, color={0,0,255}));
  connect(pwLine1.n, INF.p) annotation (Line(points={{51.6667,-20},{60,-20},{60,
          0},{70,0}}, color={0,0,255}));
  connect(INF.p, gENCLS2_1.p) annotation (Line(points={{70,0},{88.8,0},{88.8,-0.180432}},
        color={0,0,255}));
  connect(wT4G1.I_qcmd, wT4G1.I_qcmd0) annotation (Line(points={{-62.8,9.6},{-66,
          9.6},{-66,16},{-59.2,16},{-59.2,13.2}}, color={0,0,127}));
  connect(wT4G1.I_pcmd, wT4G1.I_pcmd0) annotation (Line(points={{-62.8,4.8},{-68,
          4.8},{-68,18},{-54.4,18},{-54.4,13.2}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})), Documentation);
end WT4G1;
