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
    angle_0=0,
    ra=0.001,
    x1d=0.302,
    M=10,
    D=0,
    P_0=16035269.8692006,
    Q_0=11859436.505981,
    Sn=370000000,
    v_0=1,
    V_b=200000,
    Vn=200000) annotation (Placement(transformation(extent={{-40,-15},{-10,15}})));
equation
  connect(Generator.p, bus1.p) annotation (Line(points={{-10,0},{-4.25,0},{-4.25,0},{0,0}}, color={0,0,255}));
  connect(TGtypeII1.pm, Generator.pm) annotation (Line(points={{-58.75,-7.5},{-43,-7.5}},
                             color={0,0,127}));
  connect(Generator.pm0, TGtypeII1.pm0) annotation (Line(points={{-37,-16.5},{-37,-25},{-50,-25},{-50,15},{-72.5,15},{-72.5,7.5}},
                                                           color={0,0,127}));
  connect(Generator.vf0, Generator.vf) annotation (Line(points={{-37,16.5},{-37,
          20},{-45,20},{-45,7.5},{-43,7.5}}, color={0,0,127}));
  connect(Generator.w, TGtypeII1.w) annotation (Line(points={{-8.5,13.5},{-4,13.5},{-4,26},{-92,26},{-92,-7.5},{-87.5,-7.5}}, color={0,0,127}));
  annotation (Documentation,experiment(StopTime=20));
end Order4test2_TG;
