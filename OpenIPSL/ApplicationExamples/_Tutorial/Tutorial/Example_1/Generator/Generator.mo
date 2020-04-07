within Tutorial.Example_1.Generator;
model Generator
  extends OpenIPSL.Interfaces.Generator;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII avr(
    vfmax=7,
    vfmin=-6.40,
    K0=200,
    T2=1,
    T1=1,
    Te=0.0001,
    Tr=0.015) annotation (Placement(transformation(extent={{-40,-10},{0,30}})));
  OpenIPSL.Electrical.Machines.PSAT.Order6 machine(
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
    Q_0=Q_0,
    Vn=400) annotation (Placement(transformation(extent={{40,-20},{80,20}})));
  Modelica.Blocks.Sources.Constant pss_off(k=0)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
equation
  connect(avr.vf, machine.vf) annotation (Line(points={{1.66667,10},{1.66667,10},
          {36,10}}, color={0,0,127}));
  connect(avr.v, machine.v) annotation (Line(points={{-38.3333,20},{-72,20},{-72,
          50},{94,50},{94,6},{82,6}}, color={0,0,127}));
  connect(machine.pm0, machine.pm) annotation (Line(points={{44,-22},{44,-22},{
          44,-30},{30,-30},{30,-10},{36,-10}}, color={0,0,127}));
  connect(pss_off.y, avr.vs)
    annotation (Line(points={{-59,0},{-38.3333,0}}, color={0,0,127}));
  connect(avr.vf0, machine.vf0) annotation (Line(points={{-20,28.3333},{-20,40},
          {44,40},{44,22}}, color={0,0,127}));
  connect(machine.p, pwPin)
    annotation (Line(points={{80,0},{80,0},{110,0}}, color={0,0,255}));
  annotation (Documentation);
end Generator;
