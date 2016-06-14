within Tutorial.Example_1.Network;
model Step_5
  OpenIPSL.Electrical.Buses.Bus B1 annotation (Placement(visible=true, transformation(extent={{-100,-12},{-76,12}}, rotation=0)));
  OpenIPSL.Electrical.Buses.Bus B2 annotation (Placement(visible=true, transformation(extent={{-40,-12},{-16,12}}, rotation=0)));
  OpenIPSL.Electrical.Buses.Bus B3 annotation (Placement(visible=true, transformation(extent={{40,-12},{64,12}}, rotation=0)));
  Generator.Generator G1 annotation (Placement(visible=true, transformation(extent={{-128,-10},{-108,10}}, rotation=0)));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer(
    Sn=2220,
    fn=60,
    x=0.15,
    r=0,
    V_b=400,
    Vn=400) annotation (Placement(visible=true, transformation(extent={{-68,-10},{-48,10}}, rotation=0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine(
    R=0,
    G=0,
    B=0,
    X=0.5*100/2220,
    S_b=100) annotation (Placement(visible=true, transformation(extent={{4,16},{16,24}}, rotation=0)));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(V_0=0.90081, angle_0=0)
    annotation (Placement(visible=true, transformation(
        origin={90,0},
        extent={{10,10},{-10,-10}},
        rotation=180)));
  OpenIPSL.Electrical.Events.PwFault pwFault(
    R=0,
    t1=0.5,
    t2=0.57,
    X=0.01*100/2220) annotation (Placement(visible=true, transformation(extent={{-8,-60},{12,-40}}, rotation=0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    R=0,
    G=0,
    B=0,
    S_b=100,
    X=0.93*100/2220) annotation (Placement(visible=true, transformation(extent={{4,-24},{16,-16}}, rotation=0)));
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=100, fn=60)
    annotation (Placement(visible=true, transformation(
        origin={75.3331,-102},
        extent={{-33.3331,-20},{46.6669,20}},
        rotation=0)));
equation
  connect(pwLine1.p, pwLine.p) annotation (Line(points={{3,-20},{-18,-20},{-18,20},{3,20}}, color={0,0,255}));
  connect(pwLine1.n, B3.p) annotation (Line(points={{17,-20},{42,-20},{42,0},{52,0}}, color={0,0,255}));
  connect(pwFault.p, pwLine.p) annotation (Line(points={{-9.66667,-50},{-22,-50},{-22,0},{-18,0},{-18,20},{3,20}}, color={0,0,255}));
  connect(B3.p, infiniteBus.p) annotation (Line(points={{52,0},{79,0}}, color={0,0,255}));
  connect(pwLine.n, B3.p) annotation (Line(points={{17,20},{42,20},{42,0},{52,0}}, color={0,0,255}));
  connect(B2.p, pwLine.p) annotation (Line(points={{-28,0},{-22,0},{-18,0},{-18,20},{3,20}}, color={0,0,255}));
  connect(twoWindingTransformer.n, B2.p) annotation (Line(points={{-47,0},{-28,0},{-28,0},{-28,0},{-28,0}}, color={0,0,255}));
  connect(B1.p, twoWindingTransformer.p) annotation (Line(points={{-88,0},{-78,0},{-78,0},{-69,0}}, color={0,0,255}));
  connect(G1.pwPin, B1.p) annotation (Line(points={{-107,0},{-88,0},{-88,0}}, color={0,0,255}));
  annotation (Diagram(coordinateSystem(extent={{-140,-100},{120,100}}, preserveAspectRatio=false), graphics={Text(
          extent={{-106,102},{84,84}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Solid,
          fontSize=15,
          textStyle={TextStyle.Bold},
          textString="Step 5: Connecting network components")}), Icon(coordinateSystem(extent={{-140,-100},{120,100}})));
end Step_5;
