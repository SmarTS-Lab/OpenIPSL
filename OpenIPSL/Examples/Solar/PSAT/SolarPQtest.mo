within OpenIPSL.Examples.Solar.PSAT;
model SolarPQtest
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Solar.PSAT.ConstantPQPV.PQ1 PQ11(
    P_0=0.4,
    Q_0=0.3,
    v_0=1.00018548610126,
    angle_0=-0.0000253046024029618) annotation (Placement(transformation(
        origin={35.0,10.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(transformation(
        origin={-70.0,-10.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  OpenIPSL.Electrical.Events.PwFault pwFault1(
    R=20,
    X=1,
    t1=3,
    t2=3.1) annotation (Placement(transformation(
        origin={25,-57.3},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  OpenIPSL.Electrical.Branches.PwLine pwLinewithOpening1(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1,
    t1=8,
    t2=8.1) annotation (Placement(transformation(
        origin={-25.0,0.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine2(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(transformation(
        origin={-70.0,10.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine3(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(transformation(
        origin={-25.0,-30.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine4(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(transformation(
        origin={-25.0,15.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  OpenIPSL.Electrical.Loads.PSAT.PQ pwLoadPQ2(
    angle_0=0,
    P_0=80000,
    Q_0=60000,
    v_0=1) annotation (Placement(transformation(
        origin={15.0,-30.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  OpenIPSL.Electrical.Machines.PSAT.Order3 order31(
    angle_0=0,
    ra=0.001,
    x1d=0.302,
    M=10,
    D=0,
    xd=1.9,
    T1d0=8,
    xq=1.7,
    P_0=40125.6732154526,
    Q_0=26272.5307404601,
    Sn=20000000,
    v_0=1,
    V_b=400000,
    Vn=400000) annotation (Placement(transformation(
        origin={-110.0,10.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  OpenIPSL.Electrical.Buses.Bus bus2 annotation (Placement(transformation(
        origin={-46.7243,11.8063},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  OpenIPSL.Electrical.Buses.Bus bus1 annotation (Placement(transformation(
        origin={-87.5421,10.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  OpenIPSL.Electrical.Buses.Bus bus3 annotation (Placement(transformation(
        origin={5.0,12.1033},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  OpenIPSL.Electrical.Buses.Bus bus4 annotation (Placement(transformation(
        origin={-3.3112,-30.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  inner OpenIPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{50,50},{75,70}})));
equation
  connect(order31.vf0, order31.vf) annotation (Line(points={{-118,21},{-118,25},{-125,25},{-125,15},{-122,15}},
                                          color={0,0,127}));
  connect(order31.pm, order31.pm0) annotation (Line(points={{-122,5},{-125,5},{-125,-5},{-118,-5},{-118,-1}},
                                         color={0,0,127}));
  connect(order31.p, bus1.p)
    annotation (Line(points={{-100,10},{-87.5421,10}}, color={0,0,255}));
  connect(bus1.p, pwLine2.p)
    annotation (Line(points={{-87.5421,10},{-79,10}}, color={0,0,255}));
  connect(pwLine2.p, pwLine1.p)
    annotation (Line(points={{-79,10},{-79,10},{-79,-10}}, color={0,0,255}));
  connect(pwLine2.n, pwLine1.n)
    annotation (Line(points={{-61,10},{-61,10},{-61,-10}}, color={0,0,255}));
  connect(pwLine2.n, bus2.p) annotation (Line(points={{-61,10},{-55,10},{-55,
          11.8063},{-46.7243,11.8063}}, color={0,0,255}));
  connect(bus2.p, pwLine3.p) annotation (Line(points={{-46.7243,11.8063},{
          -46.7243,-9.09685},{-34,-9.09685},{-34,-30}}, color={0,0,255}));
  connect(pwLinewithOpening1.p, bus2.p) annotation (Line(points={{-34,0},{-45,0},
          {-45,11.8063},{-46.7243,11.8063}}, color={0,0,255}));
  connect(bus2.p, pwLine4.p) annotation (Line(points={{-46.7243,11.8063},{
          -40.8621,11.8063},{-40.8621,15},{-34,15}}, color={0,0,255}));
  connect(pwLine4.p, pwLinewithOpening1.p)
    annotation (Line(points={{-34,15},{-34,15},{-34,0}}, color={0,0,255}));
  connect(pwLine4.n, pwLinewithOpening1.n)
    annotation (Line(points={{-16,15},{-16,15},{-16,0}}, color={0,0,255}));
  connect(pwLine4.n, bus3.p) annotation (Line(points={{-16,15},{-5,15},{-5,
          12.1033},{5,12.1033}}, color={0,0,255}));
  connect(bus3.p, PQ11.p) annotation (Line(points={{5,12.1033},{15,12.1033},{15,
          10},{24,10}}, color={0,0,255}));
  connect(pwLine3.n, bus4.p)
    annotation (Line(points={{-16,-30},{-3.3112,-30}}, color={0,0,255}));
  connect(bus4.p, pwLoadPQ2.p) annotation (Line(points={{-3.3112,-30},{5,-30},{
          5,-20},{15,-20}}, color={0,0,255}));
  connect(bus4.p, pwFault1.p) annotation (Line(points={{-3.3112,-30},{0,-30},{0,
          -57.3},{13.3333,-57.3}}, color={0,0,255}));
  annotation (Diagram(coordinateSystem(
        extent={{-148.5,-105},{148.5,105}},
        preserveAspectRatio=false,
        grid={5,5})));
end SolarPQtest;
