within Tutorial.Example_1.Generator;
partial model Step_3
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
    P_0=19.979999999936396,
    Q_0=9.679249699065775,
    V_0=1,
    angle_0=0.494677176989154,
    Sn=2220) annotation (Placement(transformation(extent={{8,-30},{68,30}})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII avr(
    vfmax=7,
    vfmin=-6.40,
    K0=200,
    T2=1,
    T1=1,
    Te=0.0001,
    Tr=0.015) annotation (Placement(transformation(extent={{-52,-6},{-12,34}})));
protected
  OpenIPSL.Connectors.PwPin terminal annotation (Placement(transformation(extent={{90,-10},{110,10}}), iconTransformation(extent={{90,-10},{110,10}})));
public
  Modelica.Blocks.Sources.Constant pss_off(k=0) annotation (Placement(transformation(extent={{-100,-4},{-80,16}})));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Rectangle(
          extent={{80,20},{120,-20}},
          lineColor={255,0,0},
          lineThickness=1),Text(
          extent={{-92,104},{98,86}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Solid,
          fontSize=15,
          textStyle={TextStyle.Bold},
          textString="Step 3: Power terminal of the generator model"),Text(
          extent={{50,34},{152,18}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Solid,
          fontSize=12,
          textString="Connectors.PwPin")}));
end Step_3;
