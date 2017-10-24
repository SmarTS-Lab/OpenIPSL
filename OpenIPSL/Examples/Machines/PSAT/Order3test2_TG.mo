within OpenIPSL.Examples.Machines.PSAT;
model Order3test2_TG
  extends OpenIPSL.Examples.BaseTest;
  extends Modelica.Icons.Example;
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
        origin={-29.9999,0},
        extent={{-10.0001,-10},{9.99991,10}},
        rotation=0)));
  OpenIPSL.Electrical.Controls.PSAT.TG.TGtypeII TGtypeII1 annotation (Placement(
        visible=true, transformation(
        origin={-63,-5},
        extent={{-9,-9},{9,9}},
        rotation=0)));
equation
  connect(TGtypeII1.pm, order3_Inputs_Outputs1.pm) annotation (Line(points={{-53.1,
          -5},{-50,-5},{-50,-5},{-42,-5}}, color={0,0,127}));
  connect(order3_Inputs_Outputs1.vf0, order3_Inputs_Outputs1.vf) annotation (
      Line(points={{-38,11},{-38,16},{-48,16},{-48,6},{-48,5},{-42,5}}, color={
          0,0,127}));
  connect(order3_Inputs_Outputs1.pm0, TGtypeII1.pm0) annotation (Line(points={{
          -38,-11},{-38,-28},{-42,-28},{-86,-28},{-86,10},{-63,10},{-63,5.8}},
        color={0,0,127}));
  connect(order3_Inputs_Outputs1.w, TGtypeII1.W) annotation (Line(points={{-19,
          9},{-16,9},{-16,20},{-80,20},{-80,-5},{-73.8,-5}}, color={0,0,127}));
  connect(order3_Inputs_Outputs1.p, bus.p)
    annotation (Line(points={{-20,0},{-20,0},{0,0}}, color={0,0,255}));
  annotation (Documentation,experiment(StopTime=20));
end Order3test2_TG;
