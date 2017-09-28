within Tutorial.Example_1;
model Example_1
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Buses.Bus B1(displayPF=false)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  OpenIPSL.Electrical.Buses.Bus B2(displayPF=false)
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  OpenIPSL.Electrical.Buses.Bus B3(displayPF=false)
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Generator.Generator G1(
    angle_0=0.494677176989154,
    V_0=1,
    P_0=1997.9999999936396,
    Q_0=967.9249699065775,
    displayPF=false)
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer transformer(
    Sn=2220,
    fn=60,
    x=0.15,
    r=0,
    V_b=400,
    Vn=400) annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  OpenIPSL.Electrical.Branches.PwLine line_1(
    R=0,
    G=0,
    B=0,
    S_b=100,
    X=0.5*100/2220,
    displayPF=false)
    annotation (Placement(transformation(extent={{20,10},{40,30}})));
  OpenIPSL.Electrical.Buses.InfiniteBus infinite_bus(
    V_0=0.90081,
    angle_0=0,
    P_0=-1998,
    Q_0=87.066,
    displayPF=false) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={100,0})));
  OpenIPSL.Electrical.Events.PwFault fault(
    R=0,
    t1=0.5,
    t2=0.57,
    X=0.01*100/2220)
    annotation (Placement(transformation(extent={{20,-60},{40,-40}})));
  OpenIPSL.Electrical.Branches.PwLine line_2(
    R=0,
    G=0,
    B=0,
    S_b=100,
    X=0.93*100/2220)
    annotation (Placement(transformation(extent={{20,-30},{40,-10}})));
  inner OpenIPSL.Electrical.SystemBase SysData(fn=60)
    annotation (Placement(transformation(extent={{60,-100},{120,-60}})));
equation
  connect(G1.pwPin, B1.p)
    annotation (Line(points={{-89,0},{-89,0},{-70,0}}, color={0,0,255}));
  connect(B1.p, transformer.p)
    annotation (Line(points={{-70,0},{-70,0},{-51,0}}, color={0,0,255}));
  connect(transformer.n, B2.p)
    annotation (Line(points={{-29,0},{-10,0}}, color={0,0,255}));
  connect(line_1.n, B3.p)
    annotation (Line(points={{39,20},{60,20},{60,0},{70,0}}, color={0,0,255}));
  connect(B3.p, infinite_bus.p) annotation (Line(points={{70,0},{82,0},{82,
          1.33227e-15},{90,1.33227e-15}}, color={0,0,255}));
  connect(line_2.n, B3.p) annotation (Line(points={{39,-20},{60,-20},{60,0},{70,
          0}}, color={0,0,255}));
  connect(fault.p, B2.p) annotation (Line(points={{18.3333,-50},{10,-50},{10,0},
          {-10,0}}, color={0,0,255}));
  connect(line_2.p, B2.p) annotation (Line(points={{21,-20},{10,-20},{10,0},{-10,
          0}}, color={0,0,255}));
  connect(line_1.p, B2.p) annotation (Line(points={{21,20},{10,20},{10,0},{-10,
          0}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(
        extent={{-120,-100},{120,100}},
        preserveAspectRatio=false,
        initialScale=0.1), graphics={Text(
          origin={40,0},
          fillPattern=FillPattern.Solid,
          lineThickness=1,
          extent={{-160,-80},{0,-100}},
          textString=
            "*P. Kundur, \"Power System Stability and Control\", Example 13.2",
          fontSize=12),Text(
          fillPattern=FillPattern.Solid,
          lineThickness=1,
          extent={{-100,100},{100,80}},
          textString="Example 1: Single-machine infinite bus model*",
          fontSize=15,
          textStyle={TextStyle.Bold})}),
    Icon(coordinateSystem(extent={{-120,-100},{120,100}})),
    experiment(
      StartTime=0,
      StopTime=10,
      Tolerance=1e-6,
      Interval=1e-4),
    Documentation);
end Example_1;
