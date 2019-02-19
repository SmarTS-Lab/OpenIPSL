within OpenIPSL.Examples.Machines.PSAT;
model Order2test2
  extends OpenIPSL.Examples.BaseTest;
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Machines.PSAT.Order2 order21(
    angle_0=0,
    ra=0.001,
    x1d=0.302,
    M=10,
    D=0,
    P_0=16035269.8692006,
    Q_0=11859436.505981,
    Sn=20000000,
    v_0=1,
    V_b=400000,
    Vn=400000) annotation (Placement(transformation(
        origin={-29.946,0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
equation
  connect(order21.vf, order21.vf0) annotation (Line(points={{-41.946,5},{-46,5},
          {-46,14},{-37.946,14},{-37.946,11}}, color={0,0,127}));
  connect(order21.pm, order21.pm0) annotation (Line(points={{-41.946,-5},{-46,-5},
          {-46,-14},{-37.946,-14},{-37.946,-11}}, color={0,0,127}));
  connect(order21.p, bus1.p) annotation (Line(points={{-19.946,0},{-9.473,0},{-9.473,0},{0,0}}, color={0,0,255}));
  annotation (experiment(StopTime=20));
end Order2test2;
