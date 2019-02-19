within OpenIPSL.Examples.Machines.PSAT;
model Order4test2
  extends OpenIPSL.Examples.BaseTest;
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Machines.PSAT.Order4 Generator(
    angle_0=0,
    ra=0.001,
    M=10,
    D=0,
    x1d=0.302,
    P_0=16035269.8692006,
    Q_0=11859436.505981,
    Sn=100000000,
    v_0=1,
    V_b=400000,
    Vn=20000) annotation (Placement(transformation(extent={{-60,-20},{-20,20}})));
equation
  connect(Generator.vf0, Generator.vf) annotation (Line(points={{-56,22},{-56,
          28},{-76,28},{-76,10},{-64,10}}, color={0,0,127}));
  connect(Generator.pm, Generator.pm0) annotation (Line(points={{-64,-10},{-72,
          -10},{-72,-18},{-72,-28},{-56,-28},{-56,-22}}, color={0,0,127}));
  connect(Generator.p, bus1.p) annotation (Line(points={{-20,0},{-20,0},{0,0}}, color={0,0,255}));
  annotation (experiment(StopTime=20), Documentation);
end Order4test2;
