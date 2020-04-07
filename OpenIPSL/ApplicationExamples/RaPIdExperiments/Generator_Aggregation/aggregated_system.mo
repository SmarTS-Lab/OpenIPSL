within RaPIdExperiments.Generator_Aggregation;
model aggregated_system "SMIB system with one load and GENROE model"

  OpenIPSL.Electrical.Branches.PwLine pwLine(
    R=0.001,
    G=0,
    B=0,
    X=0.1) annotation (Placement(transformation(extent={{46,-6},{66,14}})));
  OpenIPSL.Electrical.Machines.PSSE.GENROE gENROE(
    M_b=100,
    Tpd0=5,
    Tppd0=0.07,
    Tpq0=0.9,
    Tppq0=0.09,
    H=4.28,
    D=0,
    Xd=1.84,
    Xq=1.75,
    Xpd=0.41,
    Xpq=0.6,
    Xppd=0.2,
    Xl=0.12,
    S10=0.11,
    S12=0.39,
    angle_0=-0.1696705,
    P_0=50,
    Q_0=54.87792,
    V_0=1.05,
    Xppq=0.2) annotation (Placement(transformation(extent={{-16,-16},{24,24}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-78,-10},{-58,10}})));
  Modelica.Blocks.Sources.Step step(
    startTime=2,
    offset=0,
    height=0.1)
    annotation (Placement(transformation(extent={{-112,-4},{-92,16}})));
  Modelica.Blocks.Sources.Step step1(height=-0.1, startTime=10)
    annotation (Placement(transformation(extent={{-112,-42},{-92,-22}})));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{-48,-16},{-28,4}})));
  OpenIPSL.Electrical.Machines.PSSE.GENROE gENROE1(
    Tpd0=7.6969,
    Tppd0=0.0413,
    Tpq0=1.6732,
    Tppq0=0.0763,
    H=7.92,
    D=0,
    Xd=1.003,
    Xq=1.3005,
    Xpd=0.1638,
    Xpq=0.8517,
    Xppd=0.1331,
    Xl=0.1111,
    S10=0.11,
    S12=0.39,
    V_0=1,
    angle_0=0,
    M_b=1000,
    P_0=2*25.03128,
    Q_0=2*1.317227,
    Xppq=0.2)
    annotation (Placement(transformation(extent={{158,-16},{118,24}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    R=0.001,
    G=0,
    B=0,
    X=0.2) annotation (Placement(transformation(extent={{78,-6},{98,14}})));
  OpenIPSL.Electrical.Loads.PSSE.Load_variation constantLoad(
    PQBRAK=0.7,
    d_t=0,
    d_P=0,
    t1=0,
    V_0=0.9983706,
    angle_0=-2.873504,
    P_0=1,
    Q_0=0.5) annotation (Placement(transformation(extent={{70,-54},{92,-30}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine2(
    R=0.001,
    G=0,
    B=0,
    X=0.2) annotation (Placement(transformation(extent={{78,-24},{98,-4}})));
equation
  connect(gENROE.p, pwLine.p)
    annotation (Line(points={{24,4},{47,4}}, color={0,0,255}));
  connect(step.y, add.u1)
    annotation (Line(points={{-91,6},{-85.5,6},{-80,6}}, color={0,0,127}));
  connect(step1.y, add.u2) annotation (Line(points={{-91,-32},{-86,-32},{-86,-6},
          {-80,-6}}, color={0,0,127}));
  connect(add.y, add1.u1)
    annotation (Line(points={{-57,0},{-54,0},{-50,0}}, color={0,0,127}));
  connect(add1.y, gENROE.EFD)
    annotation (Line(points={{-27,-6},{-20,-6}}, color={0,0,127}));
  connect(add1.u2, gENROE.EFD0) annotation (Line(points={{-50,-12},{-58,-12},{-58,
          -38},{30,-38},{30,-6},{26,-6}}, color={0,0,127}));
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-20,14},{-28,
          14},{-28,34},{42,34},{42,14},{26,14}}, color={0,0,127}));
  connect(gENROE1.EFD0, gENROE1.EFD) annotation (Line(points={{116,-6},{112,-6},
          {112,-22},{164,-22},{164,-6},{162,-6}}, color={0,0,127}));
  connect(gENROE1.PMECH, gENROE1.PMECH0) annotation (Line(points={{162,14},{168,
          14},{168,-26},{108,-26},{108,14},{116,14}}, color={0,0,127}));
  connect(pwLine.n, pwLine1.p)
    annotation (Line(points={{65,4},{65,4},{79,4}}, color={0,0,255}));
  connect(pwLine1.n, gENROE1.p)
    annotation (Line(points={{97,4},{97,4},{118,4}}, color={0,0,255}));
  connect(constantLoad.p, pwLine1.p) annotation (Line(points={{81,-30},{68,-30},
          {68,4},{79,4}}, color={0,0,255}));
  connect(pwLine2.p, pwLine1.p) annotation (Line(points={{79,-14},{72,-14},{72,
          4},{79,4}}, color={0,0,255}));
  connect(pwLine2.n, gENROE1.p) annotation (Line(points={{97,-14},{98,-14},{98,
          -12},{102,-12},{102,4},{118,4}}, color={0,0,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})));
end aggregated_system;
