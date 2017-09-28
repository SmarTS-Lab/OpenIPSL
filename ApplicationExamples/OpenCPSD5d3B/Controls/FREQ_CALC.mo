within OpenCPSD5d3B.Controls;
model FREQ_CALC
  parameter Real T_w;
  parameter Real T_f;
  parameter Real fi_0;

  Modelica.Blocks.Interfaces.RealInput ANGLE annotation (Placement(
        transformation(rotation=0, extent={{-110,-10},{-90,10}}),
        iconTransformation(extent={{-100,-10},{-80,10}})));
  Modelica.Blocks.Math.Add add(k2=-1)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Blocks.Sources.Constant const1(k=fi_0)
    annotation (Placement(transformation(extent={{-90,-50},{-70,-30}})));
  Modelica.Blocks.Math.Gain gain(k=1/2/Modelica.Constants.pi/50)
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Modelica.Blocks.Continuous.Derivative derivative(k=1, T=T_f)
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(k=1, T=T_w)
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Modelica.Blocks.Interfaces.RealOutput d_FREQ
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  connect(const1.y, add.u2) annotation (Line(points={{-69,-40},{-66,-40},{-66,-6},
          {-62,-6}}, color={0,0,127}));
  connect(ANGLE, add.u1) annotation (Line(points={{-100,0},{-66,0},{-66,6},{-62,
          6}}, color={0,0,127}));
  connect(gain.u, add.y)
    annotation (Line(points={{-22,0},{-39,0}}, color={0,0,127}));
  connect(derivative.u, gain.y)
    annotation (Line(points={{18,0},{1,0}}, color={0,0,127}));
  connect(derivative.y, firstOrder.u)
    annotation (Line(points={{41,0},{49.5,0},{58,0}}, color={0,0,127}));
  connect(firstOrder.y, d_FREQ)
    annotation (Line(points={{81,0},{110,0}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})));
end FREQ_CALC;
