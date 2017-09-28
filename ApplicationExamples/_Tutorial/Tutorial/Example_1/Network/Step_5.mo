within Tutorial.Example_1.Network;
model Step_5
  OpenIPSL.Electrical.Buses.Bus B1(displayPF=false) annotation (Placement(
        visible=true, transformation(extent={{-80,-10},{-60,10}}, rotation=0)));
  OpenIPSL.Electrical.Buses.Bus B2(displayPF=false) annotation (Placement(
        visible=true, transformation(extent={{-20,-10},{0,10}}, rotation=0)));
  OpenIPSL.Electrical.Buses.Bus B3(displayPF=false) annotation (Placement(
        visible=true, transformation(extent={{60,-10},{80,10}}, rotation=0)));
  Generator.Generator G1(
    V_0=1,
    angle_0=0.4946,
    P_0=1997.999,
    Q_0=967.92) annotation (Placement(visible=true, transformation(extent={{-110,
            -10},{-90,10}}, rotation=0)));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer(
    Sn=2220,
    fn=60,
    x=0.15,
    r=0,
    V_b=400,
    Vn=400) annotation (Placement(visible=true, transformation(extent={{-50,-10},
            {-30,10}}, rotation=0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine(
    R=0,
    G=0,
    B=0,
    X=0.5*100/2220,
    S_b=100) annotation (Placement(visible=true, transformation(extent={{20,10},
            {40,30}}, rotation=0)));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(
    V_0=0.90081,
    angle_0=0,
    P_0=-1998,
    Q_0=87.066) annotation (Placement(visible=true, transformation(
        origin={100,0},
        extent={{-10,10},{10,-10}},
        rotation=180)));
  OpenIPSL.Electrical.Events.PwFault pwFault(
    R=0,
    t1=0.5,
    t2=0.57,
    X=0.01*100/2220) annotation (Placement(visible=true, transformation(extent=
            {{20,-60},{40,-40}}, rotation=0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    R=0,
    G=0,
    B=0,
    S_b=100,
    X=0.93*100/2220) annotation (Placement(visible=true, transformation(extent=
            {{20,-30},{40,-10}}, rotation=0)));
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=100, fn=60) annotation (
      Placement(visible=true, transformation(
        origin={85.0001,-80},
        extent={{-25.0001,-20},{34.9999,20}},
        rotation=0)));
equation
  connect(pwLine1.n, B3.p) annotation (Line(points={{39,-20},{52,-20},{52,0},{
          70,0}}, color={0,0,255}));
  connect(B3.p, infiniteBus.p)
    annotation (Line(points={{70,0},{76,0},{90,0}}, color={0,0,255}));
  connect(pwLine.n, B3.p)
    annotation (Line(points={{39,20},{52,20},{52,0},{70,0}}, color={0,0,255}));
  connect(B2.p, pwLine.p) annotation (Line(points={{-10,0},{-10,0},{0,0},{0,20},
          {21,20}}, color={0,0,255}));
  connect(twoWindingTransformer.n, B2.p)
    annotation (Line(points={{-29,0},{-20,0},{-10,0}}, color={0,0,255}));
  connect(B1.p, twoWindingTransformer.p)
    annotation (Line(points={{-70,0},{-70,0},{-51,0}}, color={0,0,255}));
  connect(G1.pwPin, B1.p)
    annotation (Line(points={{-89,0},{-89,0},{-70,0}}, color={0,0,255}));
  connect(pwLine1.p, B2.p) annotation (Line(points={{21,-20},{0,-20},{0,0},{-10,
          0}}, color={0,0,255}));
  connect(pwFault.p, B2.p) annotation (Line(points={{18.3333,-50},{0,-50},{0,0},
          {-10,0}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(extent={{-120,-100},{120,100}},
          preserveAspectRatio=false), graphics={Text(
          extent={{-100,100},{100,80}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Solid,
          fontSize=15,
          textStyle={TextStyle.Bold},
          textString="Step 5: Connecting network components")}),
    Icon(coordinateSystem(extent={{-120,-100},{120,100}})),
    Documentation);
end Step_5;
