within OpenIPSL.Examples.Machines.PSAT;
model Order5test2
  extends OpenIPSL.Examples.BaseTest;
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Machines.PSAT.Order5_Type1 order5Type1_Inputs_Outputs(
    Sn=370,
    Vn=200,
    ra=0.001,
    x1d=0.302,
    M=10,
    D=0,
    V_b=400,
    V_0=1,
    angle_0=0,
    P_0=16.0352698692006,
    Q_0=11.859436505981,
    xd=1.9,
    xq=1.7,
    x1q=0.5,
    T1d0=8,
    T1q0=0.8,
    T2q0=0.02)
    annotation (Placement(transformation(extent={{-32,-10},{-12,10}})));
equation
  connect(order5Type1_Inputs_Outputs.vf, order5Type1_Inputs_Outputs.vf0)
    annotation (Line(points={{-34,5},{-37,5},{-37,15},{-30,15},{-30,11}},color=
          {0,0,127}));
  connect(order5Type1_Inputs_Outputs.pm, order5Type1_Inputs_Outputs.pm0)
    annotation (Line(points={{-34,-5},{-37,-5},{-37,-15},{-30,-15},{-30,-11}},
        color={0,0,127}));
  connect(order5Type1_Inputs_Outputs.p, bus.p)
    annotation (Line(points={{-12,0},{-6,0},{-6,0},{0,0}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={1,1})),
    experiment(StopTime=20),
    Documentation);
end Order5test2;
