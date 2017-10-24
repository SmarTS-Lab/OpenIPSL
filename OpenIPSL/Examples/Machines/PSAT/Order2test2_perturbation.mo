within OpenIPSL.Examples.Machines.PSAT;
model Order2test2_perturbation
  extends OpenIPSL.Examples.BaseTest;
  extends Modelica.Icons.Example;
  Modelica.Blocks.Math.Add3 add31 annotation (Placement(visible=true,
        transformation(
        origin={-45,25},
        extent={{-5,-5},{5,5}},
        rotation=0)));
  Modelica.Blocks.Math.Add add1 annotation (Placement(visible=true,
        transformation(
        origin={-74.9999,35},
        extent={{-4.99992,-5.00001},{4.99991,5.00002}},
        rotation=0)));
  Modelica.Blocks.Sources.Step step1(height=0.0005, startTime=2) annotation (
      Placement(visible=true, transformation(
        origin={-95,55},
        extent={{-5,-5},{5,5}},
        rotation=0)));
  Modelica.Blocks.Sources.Step step2(height=-0.0005, startTime=2.1) annotation
    (Placement(visible=true, transformation(
        origin={-95,35},
        extent={{-5,-5},{5,5}},
        rotation=0)));
  Modelica.Blocks.Sources.Sine sine1(amplitude=0.001, freqHz=0.2) annotation (
      Placement(visible=true, transformation(
        origin={-95,20},
        extent={{-5,-5},{5,5}},
        rotation=0)));
  Modelica.Blocks.Math.Add add2(k2=-1) annotation (Placement(visible=true,
        transformation(
        origin={-75,15},
        extent={{-5,-5},{5,5}},
        rotation=0)));
  Modelica.Blocks.Sources.Sine sine2(
    amplitude=0.001,
    freqHz=0.2,
    startTime=5) annotation (Placement(visible=true, transformation(
        origin={-95,5},
        extent={{-5,-5},{5,5}},
        rotation=0)));
  Modelica.Blocks.Sources.Sine sine3(
    amplitude=0.001,
    freqHz=0.2,
    startTime=10) annotation (Placement(visible=true, transformation(
        origin={-95,-75},
        extent={{-5,-5},{5,5}},
        rotation=0)));
  Modelica.Blocks.Math.Add add3(k2=-1) annotation (Placement(visible=true,
        transformation(
        origin={-75,-65},
        extent={{-4.99999,-4.99999},{4.99999,4.99999}},
        rotation=0)));
  Modelica.Blocks.Sources.Sine sine4(
    amplitude=0.001,
    freqHz=0.2,
    startTime=5) annotation (Placement(visible=true, transformation(
        origin={-95,-55},
        extent={{-5,-5},{5,5}},
        rotation=0)));
  Modelica.Blocks.Sources.Step step3(height=-0.0005, startTime=7.1) annotation
    (Placement(visible=true, transformation(
        origin={-95,-35},
        extent={{-5,-5},{5,5}},
        rotation=0)));
  Modelica.Blocks.Sources.Step step4(height=0.0005, startTime=7) annotation (
      Placement(visible=true, transformation(
        origin={-95,-15},
        extent={{-5,-5},{5,5}},
        rotation=0)));
  Modelica.Blocks.Math.Add add4 annotation (Placement(visible=true,
        transformation(
        origin={-75,-25},
        extent={{-5,-5},{5,5}},
        rotation=0)));
  Modelica.Blocks.Math.Add3 add32 annotation (Placement(visible=true,
        transformation(
        origin={-45,-25},
        extent={{-5.00007,-5.00012},{5.00001,4.99999}},
        rotation=0)));
  OpenIPSL.Electrical.Machines.PSAT.Order2 order2_Inputs_Outputs1(
    D=0,
    V_b=400,
    V_0=1,
    angle_0=0,
    Sn=20,
    Vn=400,
    ra=0.001,
    x1d=0.302,
    M=10,
    P_0=16.0352698692006,
    Q_0=11.859436505981) annotation (Placement(visible=true, transformation(
        origin={-20.1083,0.1663},
        extent={{-8.8917,-9.1663},{8.8916,9.1663}},
        rotation=0)));
equation
  connect(step3.y, add4.u2) annotation (Line(
      visible=true,
      origin={-86.308,-30.9083},
      points={{-3.192,-4.0917},{2.3974,-4.0917},{2.3974,2.9083},{5.308,2.9083}},

      color={0,0,127}));

  connect(step4.y, add4.u1) annotation (Line(
      visible=true,
      origin={-86.308,-19.6146},
      points={{-3.192,4.6146},{2.3974,4.6146},{2.3974,-2.3854},{5.308,-2.3854}},

      color={0,0,127}));

  connect(order2_Inputs_Outputs1.p, bus.p) annotation (Line(points={{-11.2167,
          0.1663},{-5.66375,0.1663},{-5.66375,0},{0,0}}, color={0,0,255}));
  connect(add31.y, order2_Inputs_Outputs1.vf) annotation (Line(points={{-39.5,
          25},{-35,25},{-35,4.74945},{-30.7783,4.74945}}, color={0,0,127}));
  connect(order2_Inputs_Outputs1.vf0, add31.u3) annotation (Line(points={{-27.2217,
          10.2492},{-27.2217,14},{-55,14},{-55,21},{-51,21}}, color={0,0,127}));
  connect(add32.y, order2_Inputs_Outputs1.pm) annotation (Line(points={{-39.5,-25.0001},
          {-35,-25.0001},{-35,-4.41685},{-30.7783,-4.41685}}, color={0,0,127}));
  connect(add1.y, add31.u1) annotation (Line(points={{-69.5,35},{-60,35},{-60,
          29},{-51,29}}, color={0,0,127}));
  connect(add2.y, add31.u2) annotation (Line(points={{-69.5,15},{-60,15},{-60,
          25},{-51,25}}, color={0,0,127}));
  connect(step2.y, add1.u2) annotation (Line(points={{-89.5,35},{-87,35},{-87,
          32},{-80.9998,32}}, color={0,0,127}));
  connect(step1.y, add1.u1) annotation (Line(points={{-89.5,55},{-87,55},{-87,
          38},{-80.9998,38}}, color={0,0,127}));
  connect(sine2.y, add2.u2) annotation (Line(points={{-89.5,5},{-86,5},{-86,12},
          {-81,12}}, color={0,0,127}));
  connect(sine1.y, add2.u1) annotation (Line(points={{-89.5,20},{-86,20},{-86,
          18},{-81,18}}, color={0,0,127}));
  connect(order2_Inputs_Outputs1.pm0, add32.u1) annotation (Line(points={{-27.2217,
          -9.91663},{-27.2217,-13},{-54,-13},{-54,-21},{-51.0001,-21}}, color={
          0,0,127}));
  connect(add4.y, add32.u2) annotation (Line(points={{-69.5,-25},{-60,-25},{-60,
          -25.0001},{-51.0001,-25.0001}}, color={0,0,127}));
  connect(sine4.y, add3.u1) annotation (Line(points={{-89.5,-55},{-85,-55},{-85,
          -62},{-81,-62}}, color={0,0,127}));
  connect(sine3.y, add3.u2) annotation (Line(points={{-89.5,-75},{-85,-75},{-85,
          -68},{-81,-68}}, color={0,0,127}));
  connect(add3.y, add32.u3) annotation (Line(points={{-69.5,-65},{-60,-65},{-60,
          -29.0001},{-51.0001,-29.0001}}, color={0,0,127}));
  annotation (Documentation,experiment(StopTime=20));
end Order2test2_perturbation;
