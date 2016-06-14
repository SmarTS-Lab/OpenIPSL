within Tutorial.Example_1;
model Example_1
  OpenIPSL.Electrical.Buses.Bus B1 annotation (Placement(transformation(extent={{-92,-12},{-68,12}})));
  OpenIPSL.Electrical.Buses.Bus B2 annotation (Placement(transformation(extent={{-32,-12},{-8,12}})));
  OpenIPSL.Electrical.Buses.Bus B3 annotation (Placement(transformation(extent={{48,-12},{72,12}})));
  Generator.Generator G1(
    angle_0=0.494677176989154,
    V_b=400,
    V_0=1,
    P_0=1997.9999999936396,
    Q_0=967.9249699065775) annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer transformer(
    Sn=2220,
    fn=60,
    x=0.15,
    r=0,
    V_b=400,
    Vn=400) annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  OpenIPSL.Electrical.Branches.PwLine line_1(
    R=0,
    G=0,
    B=0,
    S_b=100,
    X=0.5*100/2220) annotation (Placement(transformation(extent={{14,16},{26,24}})));
  OpenIPSL.Electrical.Buses.InfiniteBus infinite_bus(
    V_0=0.90081,
    angle_0=0,
    P_0=-1998,
    Q_0=87.066) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={90,0})));
  OpenIPSL.Electrical.Events.PwFault fault(
    R=0,
    t1=0.5,
    t2=0.57,
    X=0.01*100/2220) annotation (Placement(transformation(extent={{0,-60},{20,-40}})));
  OpenIPSL.Electrical.Branches.PwLine line_2(
    R=0,
    G=0,
    B=0,
    S_b=100,
    X=0.93*100/2220) annotation (Placement(transformation(extent={{14,-24},{26,-16}})));
  inner OpenIPSL.Electrical.SystemBase SysData(fn=60) annotation (Placement(transformation(extent={{40,-100},{120,-60}})));
equation
  connect(G1.pwPin, B1.p) annotation (Line(points={{-99,0},{-80,0}}, color={0,0,255}));
  connect(B1.p, transformer.p) annotation (Line(points={{-80,0},{-70,0},{-61,0}}, color={0,0,255}));
  connect(transformer.n, B2.p) annotation (Line(points={{-39,0},{-20,0}}, color={0,0,255}));
  connect(B2.p, line_1.p) annotation (Line(points={{-20,0},{-14,0},{-10,0},{-10,20},{13,20}}, color={0,0,255}));
  connect(line_1.n, B3.p) annotation (Line(points={{27,20},{50,20},{50,0},{60,0}}, color={0,0,255}));
  connect(B3.p, infinite_bus.p) annotation (Line(points={{60,0},{72,0},{72,1.33227e-015},{79,1.33227e-015}}, color={0,0,255}));
  connect(fault.p, line_1.p) annotation (Line(points={{-1.66667,-50},{-14,-50},{-14,0},{-10,0},{-10,20},{13,20}}, color={0,0,255}));
  connect(line_2.n, B3.p) annotation (Line(points={{27,-20},{50,-20},{50,0},{60,0}}, color={0,0,255}));
  connect(line_2.p, line_1.p) annotation (Line(points={{13,-20},{-10,-20},{-10,20},{13,20}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(extent={{-140,-100},{120,100}}, preserveAspectRatio=false), graphics={Text(
          extent={{-120,100},{100,80}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Solid,
          fontSize=15,
          textStyle={TextStyle.Bold},
          textString="Example 1: Single-machine infinite bus model*"),Text(
          extent={{-164,-88},{54,-106}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Solid,
          fontSize=12,
          textString="*P. Kundur, \"Power System Stability and Control\", Example 13.2")}),
    Icon(coordinateSystem(extent={{-140,-100},{120,100}})),
    experiment(
      StartTime=0,
      StopTime=10,
      Tolerance=1e-6,
      Interval=1e-4));
end Example_1;
