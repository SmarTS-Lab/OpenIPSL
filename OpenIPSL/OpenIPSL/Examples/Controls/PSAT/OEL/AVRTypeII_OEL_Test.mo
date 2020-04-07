within OpenIPSL.Examples.Controls.PSAT.OEL;
model AVRTypeII_OEL_Test
  extends OpenIPSL.Examples.BaseTest(
    pwLoadPQ2(
      t_start_1=1,
      t_end_1=21,
      dQ1=3.2,
      forcePQ=true),
    pwLinewithOpening1(t1=100, t2=100),
    pwLoadPQ1(forcePQ=false));
  extends Modelica.Icons.Example;
  Electrical.Machines.PSAT.Order4 generator(
    angle_0=0,
    ra=0.001,
    x1d=0.302,
    M=10,
    D=0,
    P_0=16035269.869201,
    Q_0=11859436.505981,
    Sn=20000000,
    v_0=1,
    V_b=400000,
    Vn=370000) annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  Electrical.Controls.PSAT.AVR.AVRTypeII exciter_Type_II(
    vrmin=-5,
    vrmax=5,
    Ta=0.1,
    Te=1,
    Tr=0.001,
    Ae=0.0006,
    Be=0.9,
    Kf=0.45,
    Tf=1,
    Ka=400,
    Ke=0.01) annotation (Placement(transformation(extent={{-70,20},{-90,40}})));
  Electrical.Controls.PSAT.OEL.OEL oXL(
    vOEL_max=0.05,
    T0=5,
    xd=generator.xd,
    xq=generator.xq,
    Sn=generator.Sn,
    Vn=generator.Vn,
    if_lim=3.07) annotation (Placement(transformation(extent={{-20,20},{-40,40}})));
equation
  connect(generator.pm0, generator.pm) annotation (Line(points={{-48,-11},{-48,-14},{-56,-14},{-56,-5},{-52,-5}}, color={0,0,127}));
  connect(generator.vf, exciter_Type_II.vf) annotation (Line(points={{-52,5},{-94.875,5},{-94.875,30},{-92,30}}, color={0,0,127}));
  connect(exciter_Type_II.vf0, generator.vf0) annotation (Line(points={{-80,18},{-80,14},{-48,14},{-48,11}}, color={0,0,127}));
  connect(exciter_Type_II.vref0, oXL.v_ref0) annotation (Line(points={{-80,42},{-80,50},{-30,50},{-30,41.2}},
                                                     color={0,0,127}));
  connect(oXL.v, generator.v) annotation (Line(points={{-18,36},{-8,36},{-8,3},{-29,3}}, color={0,0,127}));
  connect(generator.P, oXL.p) annotation (Line(points={{-29,-3},{-11,-3},{-11,30},{-18,30}}, color={0,0,127}));
  connect(generator.Q, oXL.q) annotation (Line(points={{-29,-7},{-14,-7},{-14,24},{-18,24}}, color={0,0,127}));
  connect(exciter_Type_II.v, generator.v) annotation (Line(points={{-68,24},{-44,24},{-44,16},{-20,16},{-20,3},{-29,3}}, color={0,0,127}));
  connect(oXL.v_ref, exciter_Type_II.vref)
    annotation (Line(points={{-41,30},{-60,30},{-60,36},{-68,36}},
                                                            color={0,0,127}));
  connect(bus1.p, generator.p) annotation (Line(points={{0,0},{-30,0}}, color={0,0,255}));
  annotation (
    experiment(StopTime=50));
end AVRTypeII_OEL_Test;
