within Tutorial.Example_1.Network;
partial model Step_2
  OpenIPSL.Electrical.Buses.Bus B1(displayPF=false)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  OpenIPSL.Electrical.Buses.Bus B2(displayPF=false)
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  OpenIPSL.Electrical.Buses.Bus B3(displayPF=false)
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Generator.Generator G1
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer(
    Sn=2220,
    V_b=400,
    Vn=400,
    kT=1,
    x=0.15,
    r=0) annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine(
    R=0,
    G=0,
    B=0,
    X=0.5*100/2220,
    S_b=100) annotation (Placement(transformation(extent={{20,10},{40,30}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    R=0,
    G=0,
    B=0,
    S_b=100,
    X=0.93*100/2220)
    annotation (Placement(transformation(extent={{20,-30},{40,-10}})));
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=100, fn=60) annotation (
      Placement(visible=true, transformation(
        origin={85.0003,-80},
        extent={{-25.0003,-20},{34.9997,20}},
        rotation=0)));
  annotation (
    Diagram(coordinateSystem(extent={{-120,-100},{120,100}},
          preserveAspectRatio=false), graphics={Text(
          extent={{-100,100},{100,80}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Solid,
          fontSize=15,
          textStyle={TextStyle.Bold},
          textString="Step 2: Adding transformer and line models"),Rectangle(
          extent={{-56,10},{-24,-10}},
          lineColor={255,0,0},
          lineThickness=1),Text(
          extent={{-10,44},{66,34}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Solid,
          fontSize=12,
          textString="Electrical.Branches.PwLine"),Rectangle(
          extent={{14,34},{46,-32}},
          lineColor={255,0,0},
          lineThickness=1),Text(
          extent={{-118,26},{18,14}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Solid,
          fontSize=12,
          textString="Electrical.Branches.PSAT.TwoWindingTransformer")}),
    Icon(coordinateSystem(extent={{-120,-100},{120,100}})),
    Documentation);
end Step_2;
