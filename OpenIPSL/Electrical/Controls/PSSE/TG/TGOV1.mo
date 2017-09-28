within OpenIPSL.Electrical.Controls.PSSE.TG;
model TGOV1 "Steam Turbine-Governor"
  Modelica.Blocks.Interfaces.RealInput SPEED
    "Machine speed deviation from nominal (pu)" annotation (Placement(
        transformation(extent={{-85,-20},{-75,-8}}), iconTransformation(extent=
            {{-80,20},{-60,40}})));
  OpenIPSL.NonElectrical.Continuous.LeadLag imLeadLag(
    T1=T_2,
    T2=T_3,
    K=1,
    y_start=P0) annotation (Placement(transformation(extent={{30,7},{40,17}})));
  Modelica.Blocks.Interfaces.RealOutput PMECH "Turbine mechanical power (pu)"
    annotation (Placement(transformation(extent={{80,-6},{90,6}}),
        iconTransformation(extent={{80,-10},{100,10}})));
  parameter Real R "Governor gain, 1/R (pu)";
  parameter Real D_t "(pu)";
  parameter Real T_1 "Control time constant (s)";
  parameter Real T_2 "Control time constant (s)";
  parameter Real T_3 "Control time constant (s)";
  parameter Real V_MAX "Max. valve position (p.u. on M_b)";
  parameter Real V_MIN "min. valve position (p.u. on M_b)";
  Modelica.Blocks.Math.Gain imGain9(k=1/R)
    annotation (Placement(transformation(extent={{-30,7},{-20,17}})));
  Modelica.Blocks.Math.Gain imGain1(k=D_t)
    annotation (Placement(transformation(extent={{-16,-19},{-6,-9}})));
  Modelica.Blocks.Math.Add add(k2=-1)
    annotation (Placement(transformation(extent={{-50,7},{-40,17}})));
  Modelica.Blocks.Math.Add add1(k2=-1)
    annotation (Placement(transformation(extent={{60,-5},{70,5}})));
  Modelica.Blocks.Sources.Constant REF(k=P_REF)
    annotation (Placement(transformation(extent={{-80,10},{-70,20}})));
  Modelica.Blocks.Interfaces.RealInput PMECH0 annotation (Placement(
        transformation(extent={{-85,-41},{-75,-31}}), iconTransformation(extent
          ={{-80,-40},{-60,-20}})));
  NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=1,
    T=T_1,
    y_start=P0,
    outMax=V_MAX,
    outMin=V_MIN) annotation (Placement(transformation(extent={{0,7},{10,17}})));
protected
  parameter Real P0(fixed=false) "Power reference of the governor";
  parameter Real P_REF(fixed=false);
initial equation
  P0 = PMECH0;
  P_REF = P0*R;
equation
  connect(add.y, imGain9.u)
    annotation (Line(points={{-39.5,12},{-31,12}}, color={0,0,127}));
  connect(add.u2, SPEED) annotation (Line(points={{-51,9},{-60,9},{-60,-14},{-80,
          -14}}, color={0,0,127}));
  connect(imGain1.u, SPEED)
    annotation (Line(points={{-17,-14},{-80,-14}}, color={0,0,127}));
  connect(add1.y, PMECH)
    annotation (Line(points={{70.5,0},{85,0}}, color={0,0,127}));
  connect(imLeadLag.y, add1.u1) annotation (Line(points={{40.5,12},{54,12},{54,
          3},{59,3}}, color={0,0,127}));
  connect(imGain1.y, add1.u2) annotation (Line(points={{-5.5,-14},{54,-14},{54,
          -3},{59,-3}}, color={0,0,127}));
  connect(REF.y, add.u1)
    annotation (Line(points={{-69.5,15},{-51,15}}, color={0,0,127}));
  connect(simpleLagLim.u, imGain9.y)
    annotation (Line(points={{-1,12},{-10,12},{-19.5,12}}, color={0,0,127}));
  connect(simpleLagLim.y, imLeadLag.u)
    annotation (Line(points={{10.5,12},{29,12}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(
        extent={{-80,-60},{80,60}},
        preserveAspectRatio=false,
        grid={1,1})),
    Icon(coordinateSystem(
        extent={{-80,-60},{80,60}},
        preserveAspectRatio=false,
        grid={1,1}), graphics={Rectangle(extent={{-80,60},{80,-60}}, lineColor=
          {0,0,255}),Text(
          extent={{-64,36},{-19,25}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="SPEED"),Text(
          extent={{44,7},{79,-8}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="PMECH"),Text(
          extent={{-48,14},{42,-14}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="TGOV1"),Text(
          extent={{-61,-25},{-16,-36}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="PMECH0")}),
    Documentation);
end TGOV1;
