within OpenIPSL.Examples.Machines.PSAT;
model Order4test2_TG
  extends OpenIPSL.Examples.BaseTest;
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Controls.PSAT.TG.TGtypeII TGtypeII1 annotation (Placement(
        visible=true, transformation(
        origin={-72.5,-7.5},
        extent={{-12.5,-12.5},{12.5,12.5}},
        rotation=0)));
  OpenIPSL.Electrical.Machines.PSAT.Order4 Generator(
    V_b=200,
    V_0=1,
    angle_0=0,
    ra=0.001,
    x1d=0.302,
    M=10,
    D=0,
    Sn=370,
    Vn=200,
    P_0=16.0352698692006,
    Q_0=11.859436505981)
    annotation (Placement(transformation(extent={{-40,-15},{-10,15}})));
equation
  connect(Generator.p, bus.p) annotation (Line(points={{-10,0},{-4.25,0},{-4.25,
          0},{0,0}}, color={0,0,255}));
  connect(TGtypeII1.pm, Generator.pm) annotation (Line(points={{-58.75,-7.5},{-43,
          -7.5},{-43,-7.5}}, color={0,0,127}));
  connect(Generator.pm0, TGtypeII1.pm0) annotation (Line(points={{-37,-16.5},{-37,
          -25},{-50,-25},{-50,15},{-72.5,15},{-72.5,7.5}}, color={0,0,127}));
  connect(Generator.vf0, Generator.vf) annotation (Line(points={{-37,16.5},{-37,
          20},{-45,20},{-45,7.5},{-43,7.5}}, color={0,0,127}));
  connect(TGtypeII1.W, Generator.w) annotation (Line(points={{-87.5,-7.5},{-95,
          -7.5},{-95,25},{-5,25},{-5,13.5},{-8.5,13.5}}, color={0,0,127}));
  annotation (Documentation,experiment(StopTime=20));
end Order4test2_TG;
