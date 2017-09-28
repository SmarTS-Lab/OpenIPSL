within OpenIPSL.Electrical.Wind.GE.Type_3.Turbine;
model Cp_function
  extends Modelica.Blocks.Interfaces.BlockIcon;
  Modelica.Blocks.Interfaces.RealInput Lambda "Lambda" annotation (Placement(
      transformation(
        extent={{-140.0,40.0},{-100.0,80.0}},
        rotation=0,
        origin={0.0,0.0}),
      visible=true,
      iconTransformation(
        origin={0.0,0.0},
        extent={{-140.0,40.0},{-100.0,80.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput Theta "Pitch angle" annotation (
      Placement(
      transformation(
        extent={{-140.0,-80.0},{-100.0,-40.0}},
        rotation=0,
        origin={0.0,0.0}),
      visible=true,
      iconTransformation(
        origin={0.0,0.0},
        extent={{-140.0,-80.0},{-100.0,-40.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput y "Cp" annotation (Placement(
        transformation(extent={{100,-10},{120,10}}, rotation=0)));
protected
  Modelica.Blocks.Math.MatrixGain matrixGain1(K=[-0.41909, 0.21808, -0.012406,
        -0.00013365, 0.000011524; -0.067606, 0.060405, -0.013934, 0.0010683, -0.000023895;
        0.015727, -0.010996, 0.0021495, -0.00014855, 0.0000027937; -0.00086018,
        0.00057051, -0.00010479, 0.0000059924, -0.000000089194; 0.000014788, -0.0000094839,
        0.0000016167, -0.000000071535, 0.00000000049686]) annotation (Placement(
        visible=true, transformation(
        origin={-26.0,50.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Multi_Powers multi_Powers1 annotation (Placement(visible=true, transformation(
        origin={-64.0,50.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Multi_Powers multi_Powers2 annotation (Placement(visible=true, transformation(
        origin={-78.0,-70.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
equation
  connect(Theta, multi_Powers2.u1) annotation (Line(
      visible=true,
      origin={-99.0,-60.5},
      points={{-21.0,0.5},{6.0,0.5},{6.0,-0.5},{9.0,-0.5}},
      color={0,0,127}));
  connect(Lambda, multi_Powers1.u1) annotation (Line(
      visible=true,
      origin={-88.5,59.5},
      points={{-31.5,0.5},{9.5,0.5},{9.5,-0.5},{12.5,-0.5}},
      color={0,0,127}));
  connect(multi_Powers1.y[1], matrixGain1.u[1]) annotation (Line(
      visible=true,
      origin={-45.5,50.0},
      points={{-7.5,-0.8},{0,-0.8},{0,-1.6},{7.5,-1.6}},
      color={0,0,127}));
  connect(multi_Powers1.y[2], matrixGain1.u[2]);
  connect(multi_Powers1.y[3], matrixGain1.u[3]);
  connect(multi_Powers1.y[4], matrixGain1.u[4]);
  connect(multi_Powers1.y[5], matrixGain1.u[5]);
  y = matrixGain1.y[1]*multi_Powers2.y[1] + matrixGain1.y[2]*multi_Powers2.y[2]
     + matrixGain1.y[3]*multi_Powers2.y[3] + matrixGain1.y[4]*multi_Powers2.y[4]
     + matrixGain1.y[5]*multi_Powers2.y[5];
  annotation (
    Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={10,10}), graphics={Text(
          visible=true,
          origin={0.0,-1.2231},
          fillPattern=FillPattern.Solid,
          extent={{-36.5009,-18.7769},{36.5009,18.7769}},
          textString="CP",
          fontName="Arial")}),
    Documentation(info="<html>
<p>
Block has two continuous Real input vectors u1 and u2 and one
continuous Real output vector y.
All vectors have the same number of elements.
</p>
</html>"),
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics),
    Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={5,5})));
end Cp_function;
