within Tutorial.Example_1.Generator;
partial model Step_1
  OpenIPSL.Electrical.Machines.PSAT.Order6 machine(
    Vn=400,
    V_b=400,
    ra=0.003,
    xd=1.81,
    xq=1.76,
    xd1=0.3,
    xq1=0.65,
    xd2=0.23,
    xq2=0.25,
    Td10=8,
    Tq10=1,
    Td20=0.03,
    Tq20=0.07,
    Taa=0.002,
    M=7,
    D=0,
    P_0=199.79999999936396,
    Q_0=96.79249699065775,
    V_0=1,
    angle_0=0.494677176989154,
    Sn=2220) annotation (Placement(transformation(extent={{0,-30},{60,30}})));
  annotation (Diagram(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={2,2}), graphics={Rectangle(
          lineColor={255,0,0},
          lineThickness=1,
          extent={{-26,46},{80,-46}}),Text(
          fillPattern=FillPattern.Solid,
          lineThickness=1,
          extent={{-72,60},{118,42}},
          fontSize=12,
          textString="Electrical.Machines.PSAT.Order6",
          lineColor={0,0,0}),Text(
          fillPattern=FillPattern.Solid,
          lineThickness=1,
          extent={{-96,104},{94,86}},
          textString="Step 1: Machine model and parameters",
          fontSize=15,
          textStyle={TextStyle.Bold})}));
end Step_1;
