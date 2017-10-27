within OpenCPSD5d3B.Controls;
model VOLT_CTRL

  Modelica.Blocks.Math.Add add(k2=-1)
    annotation (Placement(transformation(extent={{-70,30},{-50,50}})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
  Modelica.Blocks.Sources.BooleanStep booleanStep(startValue=false, startTime=2)
    annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-70,-50},{-50,-30}})));
  Modelica.Blocks.Interfaces.RealInput u1 annotation (Placement(transformation(
          rotation=0, extent={{-110,36},{-90,56}}), iconTransformation(extent={
            {-100,40},{-80,60}})));
  Modelica.Blocks.Interfaces.RealInput u2 annotation (Placement(transformation(
          rotation=0, extent={{-110,-10},{-90,10}}), iconTransformation(extent=
            {{-100,-60},{-80,-40}})));
  Modelica.Blocks.Math.Gain gain(k=1)
    annotation (Placement(transformation(extent={{20,20},{40,40}})));
  Modelica.Blocks.Math.Add add1(k2=1)
    annotation (Placement(transformation(extent={{70,-10},{90,10}})));
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Continuous.Integrator integrator(k=2)
    annotation (Placement(transformation(extent={{22,-40},{42,-20}})));
equation
  connect(const1.y, switch1.u3) annotation (Line(points={{-49,-40},{-44,-40},{-44,
          -8},{-32,-8}}, color={0,0,127}));
  connect(u1, add.u1)
    annotation (Line(points={{-100,46},{-72,46}}, color={0,0,127}));
  connect(u2, add.u2) annotation (Line(points={{-100,0},{-86,0},{-86,34},{-72,
          34}}, color={0,0,127}));
  connect(gain.u, switch1.y)
    annotation (Line(points={{18,30},{0,30},{0,0},{-9,0}}, color={0,0,127}));
  connect(add.y, switch1.u1) annotation (Line(points={{-49,40},{-44,40},{-44,8},
          {-32,8}}, color={0,0,127}));
  connect(integrator.u, switch1.y)
    annotation (Line(points={{20,-30},{0,-30},{0,0},{-9,0}}, color={0,0,127}));
  connect(add1.y, y)
    annotation (Line(points={{91,0},{110,0},{110,0}}, color={0,0,127}));
  connect(integrator.y, add1.u2) annotation (Line(points={{43,-30},{43,-30},{60,
          -30},{60,-6},{68,-6}}, color={0,0,127}));
  connect(gain.y, add1.u1)
    annotation (Line(points={{41,30},{60,30},{60,6},{68,6}}, color={0,0,127}));
  connect(booleanStep.y, switch1.u2)
    annotation (Line(points={{-49,0},{-32,0}}, color={255,0,255}));
  annotation (Icon(graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-50,100},{50,80}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="VOLT CTRL"),Text(
          extent={{18,12},{100,-8}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="V_REF"),Text(
          extent={{-96,60},{-14,40}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="V_IB"),Text(
          extent={{-96,-40},{-14,-60}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="V_DN")}), Diagram(coordinateSystem(preserveAspectRatio=
            false, extent={{-100,-100},{100,100}})));
end VOLT_CTRL;
