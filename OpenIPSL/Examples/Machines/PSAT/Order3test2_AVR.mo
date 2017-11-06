within OpenIPSL.Examples.Machines.PSAT;
model Order3test2_AVR
  extends Modelica.Icons.Example;
  extends OpenIPSL.Examples.BaseTest;
  OpenIPSL.Electrical.Machines.PSAT.Order3 order3_Inputs_Outputs1(
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
        origin={-30,0},
        extent={{-9.99992,-10},{10,10}},
        rotation=0)));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII AVRtypeIII1 annotation (
      Placement(visible=true, transformation(
        origin={-68,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-98,-4},{-90,4}})));
equation
  connect(order3_Inputs_Outputs1.p, bus.p)
    annotation (Line(points={{-20,0},{-20,0},{0,0}}, color={0,0,255}));
  connect(AVRtypeIII1.vf, order3_Inputs_Outputs1.vf) annotation (Line(points={{
          -57.1667,0},{-50.5,0},{-50.5,5},{-41.9999,5}}, color={0,0,127}));
  connect(AVRtypeIII1.v, order3_Inputs_Outputs1.v) annotation (Line(points={{-77.1667,
          5},{-88,5},{-88,22},{-15,22},{-15,3},{-19,3}}, color={0,0,127}));
  connect(order3_Inputs_Outputs1.pm0, order3_Inputs_Outputs1.pm) annotation (
      Line(points={{-37.9999,-11},{-37.9999,-14},{-47,-14},{-47,-5},{-41.9999,-5}},
        color={0,0,127}));
  connect(AVRtypeIII1.vf0, order3_Inputs_Outputs1.vf0) annotation (Line(points=
          {{-68,9.16667},{-68,16},{-37.9999,16},{-37.9999,11}},color={0,0,127}));
  connect(AVRtypeIII1.vs, const.y) annotation (Line(points={{-77.1667,-5},{-86,
          -5},{-86,0},{-89.6,0}}, color={0,0,127}));
  annotation (Documentation,experiment(StopTime=20));
end Order3test2_AVR;
