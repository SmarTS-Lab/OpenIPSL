within OpenIPSL.Examples.Machines.PSAT;
model Order3test2
  extends OpenIPSL.Examples.BaseTest;
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Machines.PSAT.Order3 order31(
    V_b=400,
    V_0=1,
    angle_0=0,
    Sn=20,
    Vn=400,
    ra=0.01,
    x1d=0.302,
    M=10,
    D=0,
    xd=1.9,
    T1d0=8,
    xq=1.7,
    P_0=16.0352698692006,
    Q_0=11.859436505981) annotation (Placement(visible=true, transformation(
        origin={-25,0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
equation
  connect(order31.vf, order31.vf0) annotation (Line(points={{-37,5},{-40,5},{-40,
          15},{-33,15},{-33,11}}, color={0,0,127}));
  connect(order31.pm, order31.pm0) annotation (Line(points={{-37,-5},{-40,-5},{
          -40,-15},{-33,-15},{-33,-11}}, color={0,0,127}));
  connect(order31.p, bus.p)
    annotation (Line(points={{-15,0},{-7,0},{-7,0},{0,0}}, color={0,0,255}));
  annotation (Documentation,experiment(StopTime=20));
end Order3test2;
