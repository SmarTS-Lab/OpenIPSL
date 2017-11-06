within Tutorial.Example_1.Generator;
partial model Step_1
  extends OpenIPSL.Interfaces.Generator;
  OpenIPSL.Electrical.Machines.PSAT.Order6 machine(
    Vn=400,
    ra=0.003,
    xd=1.81,
    xq=1.76,
    x1d=0.3,
    x1q=0.65,
    x2d=0.23,
    x2q=0.25,
    T1d0=8,
    T1q0=1,
    T2d0=0.03,
    T2q0=0.07,
    Taa=0.002,
    M=7,
    D=0,
    Sn=2220,
    V_b=V_b,
    V_0=V_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0) annotation (Placement(transformation(extent={{0,-30},{60,30}})));
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
          textStyle={TextStyle.Bold})}), Documentation);
end Step_1;
