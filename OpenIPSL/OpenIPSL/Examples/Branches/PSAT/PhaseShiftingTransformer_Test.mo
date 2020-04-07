within OpenIPSL.Examples.Branches.PSAT;
model PhaseShiftingTransformer_Test "Simple model checking the phase shifting transformer."
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Loads.PSAT.LOADPQ lOADPQ annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={70,0})));
  OpenIPSL.Electrical.Branches.PSAT.PhaseShiftingTransformer.PSTransformer
    pSTransformer(
    Vbus1=400000,
    Vn1=400000,
    xT=0,
    m=0.95,
    alpha0=2.0943951023932,
    vk0=0,
    vm0=0,
    anglevk0=0,
    anglevm0=0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  OpenIPSL.Electrical.Buses.Bus B1(displayPF=true)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  OpenIPSL.Electrical.Buses.Bus B2(displayPF=true)
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  inner OpenIPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{-100,80},{-60,100}})));
  Electrical.Buses.InfiniteBus infiniteBus(displayPF=true) annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
equation
  connect(B1.p, pSTransformer.p) annotation (Line(points={{-30,0},{-11,0}}, color={0,0,255}));
  connect(B2.p, pSTransformer.n) annotation (Line(points={{30,0},{11,0}}, color={0,0,255}));
  connect(lOADPQ.p, B2.p) annotation (Line(points={{60,0},{30,0}}, color={0,0,255}));
  connect(infiniteBus.p, B1.p) annotation (Line(points={{-60,0},{-30,0}}, color={0,0,255}));
  connect(pSTransformer.pk, pSTransformer.u) annotation (Line(points={{11,-4},{14,-4},{14,-10},{-18,-10},{-18,5.6},{-12,5.6}}, color={0,0,127}));
  annotation (experiment(stopTime=1));
end PhaseShiftingTransformer_Test;
