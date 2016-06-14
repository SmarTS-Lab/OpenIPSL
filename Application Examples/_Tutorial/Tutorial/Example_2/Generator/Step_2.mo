within Tutorial.Example_2.Generator;
partial model Step_2
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII avr(
    vfmax=7,
    vfmin=-6.40,
    K0=200,
    T2=1,
    T1=1,
    Te=0.0001,
    Tr=0.015) annotation (Placement(transformation(extent={{0,0},{20,20}})));
  OpenIPSL.Electrical.Machines.PSAT.Order6 machine(
    Vn=400,
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
    Sn=2220,
    V_b=V_b,
    V_0=V_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0) annotation (Placement(transformation(extent={{40,-20},{80,20}})));
  OpenIPSL.Connectors.PwPin pwPin annotation (Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  OpenIPSL.Electrical.Controls.PSAT.PSS.PSSTypeII pss(
    vsmax=0.2,
    vsmin=-0.2,
    Kw=9.5,
    Tw=1.41,
    T1=0.154,
    T2=0.033,
    T3=1,
    T4=1) annotation (Placement(transformation(extent={{-40,-4},{-20,16}})));
equation
  connect(avr.vf, machine.vf) annotation (Line(points={{21,10},{40,10},{40,10}}, color={0,0,127}));
  connect(machine.p, pwPin) annotation (Line(points={{82,0.09928},{92,0.09928},{92,0},{110,0}}, color={0,0,255}));
  connect(pss.vSI, machine.w) annotation (Line(points={{-41,6},{-60,6},{-60,-40},{96,-40},{96,18},{82,18}}, color={0,0,127}));
  connect(pss.vs, avr.vs) annotation (Line(points={{-19,6},{-2,6}}, color={0,0,127}));
  connect(avr.v, machine.v) annotation (Line(points={{-2,15},{-10,15},{-10,-34},{92,-34},{92,6},{82,6}}, color={0,0,127}));
  connect(machine.pm, machine.pm0) annotation (Line(points={{40,-10},{32,-10},{32,-26},{44,-26},{44,-22}}, color={0,0,127}));
  connect(avr.vf0, machine.vf0) annotation (Line(points={{10,22},{10,28},{44,28},{44,22}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Ellipse(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Line(
          points={{-48,2},{-20,56},{2,4},{24,-28},{48,22}},
          color={0,0,0},
          smooth=Smooth.Bezier),Text(
          extent={{-52,-18},{56,-66}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="%name")}), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Text(
          extent={{-92,102},{98,84}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Solid,
          fontSize=15,
          textStyle={TextStyle.Bold},
          textString="Step 2: Connecting model's signals"),Text(
          extent={{-94,86},{88,40}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Solid,
          fontSize=12,
          horizontalAlignment=TextAlignment.Left,
          textString="1. Generator terminal voltage to voltage input of the AVR

2. PSS output to PSS input of the AVR

3. Generator speed to the input signal of the PSS")}));
end Step_2;
