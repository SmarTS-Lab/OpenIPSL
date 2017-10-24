within Tutorial.Example_3.Generation_Groups;
model Gen1
  extends OpenIPSL.Interfaces.Generator;
  parameter Real vf0=1.755517086537914;
  parameter Real vref0=1.118023800520641;
  parameter Real height annotation (Dialog(group="AVR Disturbance"));
  parameter Real tstart annotation (Dialog(group="AVR Disturbance"));
  parameter Boolean refdisturb annotation (Dialog(group="AVR Disturbance"));
  OpenIPSL.Electrical.Machines.PSAT.Order4 gen(
    Sn=100,
    Vn=18,
    V_b=V_b,
    V_0=V_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0,
    ra=0,
    xd=0.8958,
    xq=0.8645,
    x1d=0.1198,
    x1q=0.1969,
    T1d0=6,
    T1q0=0.5350,
    M=12.8,
    D=0) annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={60,0})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII AVR(
    vrmin=-5,
    vrmax=5,
    v0=V_0,
    Ka=20,
    Ta=0.2,
    Kf=0.063,
    Tf=0.35,
    Ke=1,
    Te=0.314,
    Tr=0.001,
    Ae=0.0039,
    Be=1.555) annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=0,
        origin={16,10})));
  Modelica.Blocks.Sources.Step step(
    startTime=tstart,
    offset=vref0,
    height=height) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-70,50})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=refdisturb)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  OpenIPSL.Interfaces.PwPin pwPin
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  connect(gen.v, AVR.v) annotation (Line(
      points={{82,6},{90,6},{90,-40},{-10,-40},{-10,2.8},{1.6,2.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch1.y, AVR.vref) annotation (Line(points={{-19,0},{-20,0},{-14,0},
          {-14,0},{-14,17.2},{1.6,17.2}}, color={0,0,127}));
  connect(booleanConstant.y, switch1.u2)
    annotation (Line(points={{-59,0},{-66,0},{-42,0}}, color={255,0,255}));
  connect(step.y, switch1.u1) annotation (Line(points={{-59,50},{-59,50},{-50,
          50},{-50,8},{-42,8}}, color={0,0,127}));
  connect(gen.p, pwPin)
    annotation (Line(points={{80,0},{80,0},{110,0}}, color={0,0,255}));
  connect(AVR.vf, gen.vf)
    annotation (Line(points={{30.4,10},{30.4,10},{36,10}}, color={0,0,127}));
  connect(gen.pm0, gen.pm) annotation (Line(points={{44,-22},{44,-30},{30,-30},
          {30,-10},{36,-10}},color={0,0,127}));
  connect(gen.vf0, AVR.vf0) annotation (Line(points={{44,22},{42,22},{42,36},{-18,
          36},{-18,-26},{16,-26},{16,-4.4}}, color={0,0,127}));
  connect(AVR.vref0, switch1.u3) annotation (Line(points={{16,24.4},{16,24.4},{
          16,58},{10,58},{10,72},{-88,72},{-88,-36},{-42,-36},{-42,-8}}, color=
          {0,0,127}));
  annotation (Documentation, Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}})));
end Gen1;
