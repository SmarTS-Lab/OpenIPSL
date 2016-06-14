within Tutorial.Example_1.Network;
partial model Step_3
  OpenIPSL.Electrical.Buses.Bus B1 annotation (Placement(transformation(extent={{-92,-12},{-68,12}})));
  OpenIPSL.Electrical.Buses.Bus B2 annotation (Placement(transformation(extent={{-32,-12},{-8,12}})));
  OpenIPSL.Electrical.Buses.Bus B3 annotation (Placement(transformation(extent={{48,-12},{72,12}})));
  Generator.Generator G1 annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer(
    Sn=2220,
    fn=60,
    x=0.15,
    r=0,
    V_b=400,
    Vn=400) annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine(
    R=0,
    G=0,
    B=0,
    X=0.5*100/2220,
    S_b=100) annotation (Placement(transformation(extent={{14,16},{26,24}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    R=0,
    G=0,
    B=0,
    S_b=100,
    X=0.93*100/2220) annotation (Placement(transformation(extent={{14,-24},{26,-16}})));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(V_0=0.90081, angle_0=0)
    annotation (Placement(visible=true, transformation(
        origin={90,0},
        extent={{10,10},{-10,-10}},
        rotation=180)));
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=100, fn=60)
    annotation (Placement(visible=true, transformation(
        origin={73.3331,-80},
        extent={{-33.3331,-20},{46.6669,20}},
        rotation=0)));
  annotation (Icon(coordinateSystem(extent={{-140,-100},{120,100}})), Diagram(coordinateSystem(
        extent={{-140,-100},{120,100}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={2,2}), graphics={Text(
          fillPattern=FillPattern.Solid,
          lineThickness=1,
          extent={{-106,102},{84,84}},
          textString="Step 3: Adding infinite bus model",
          fontSize=15,
          textStyle={TextStyle.Bold}),Rectangle(
          lineColor={255,0,0},
          lineThickness=1,
          extent={{78,14},{102,-12}}),Text(
          origin={-16,-2},
          fillPattern=FillPattern.Solid,
          lineThickness=1,
          extent={{62,24},{146,14}},
          textString="Electrical.Buses.InfiniteBus",
          fontSize=12)}));
end Step_3;
