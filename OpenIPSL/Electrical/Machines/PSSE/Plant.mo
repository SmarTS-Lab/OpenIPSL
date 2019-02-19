within OpenIPSL.Electrical.Machines.PSSE;
model Plant
  extends Interfaces.Generator;

  replaceable OpenIPSL.Electrical.Machines.PSSE.BaseClasses.baseMachine machine
    annotation (choicesAllMatching=true,
                Placement(transformation(extent={{40,-10},
            {60,10}})));
  replaceable Controls.PSSE.ES.BaseClasses.BaseExciter exciter
    annotation (choicesAllMatching=true,
      Placement(transformation(extent={{-28,-24},{10,10}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-40,-54},{-32,-46}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-40,-72},{-32,-64}})));
  replaceable Controls.PSSE.TG.BaseClasses.BaseGovernor governor
    annotation (choicesAllMatching=true,
    Placement(transformation(extent={{-30,40},{-10,60}})));
  replaceable OpenIPSL.Electrical.Controls.PSSE.PSS.BaseClasses.BasePSS pss
    annotation (Placement(transformation(extent = {{-88, -6}, {-48, 12}})));
equation
  connect(pss.V_S2, governor.PMECH0) annotation (
    Line(points={{-87.3684,-1.5},{-94,-1.5},{-94,30},{-40,30},{-40,45.4545},{-29.1667,45.4545}},
                                                                                          color = {0, 0, 127}));
  connect(pss.V_S1, machine.SPEED) annotation (
    Line(points={{-87.3684,7.5},{-98,7.5},{-98,68},{80,68},{80,7},{61,7}},           color = {0, 0, 127}));
  connect(pss.VOTHSG, exciter.VOTHSG) annotation (
    Line(points={{-47.3684,3},{-40,3},{-40,3.38889},{-28,3.38889}},     color = {0, 0, 127}));
  connect(exciter.EFD, machine.EFD) annotation (Line(points={{10.95,-5.11111},{38,-5.11111},{38,-5}},
                                      color={0,0,127}));
  connect(machine.p, pwPin)
    annotation (Line(points={{60,0},{110,0}},         color={0,0,255}));
  connect(exciter.XADIFD, machine.XADIFD) annotation (Line(points={{-0.45,-23.6222},{-0.45,-30},{64,-30},{64,-9},{60.8,-9}},
                                                   color={0,0,127}));
  connect(machine.EFD0, exciter.EFD0) annotation (Line(points={{61,-5},{66,-5},{66,-34},{-32,-34},{-32,-17.3889},{-28,-17.3889}},
                                                                 color={0,0,127}));
  connect(exciter.ECOMP, machine.ETERM) annotation (Line(points={{-28,-5.11111},{-32,-5.11111},{-32,20},{68,20},{68,-3},{61,-3}},
                                                            color={0,0,127}));
  connect(const.y, exciter.VUEL) annotation (Line(points={{-31.6,-50},{-21.35,
          -50},{-21.35,-24}}, color={0,0,127}));
  connect(const1.y, exciter.VOEL) annotation (Line(points={{-31.6,-68},{-15.65,
          -68},{-15.65,-24}}, color={0,0,127}));
  connect(governor.PMECH, machine.PMECH) annotation (Line(points={{-9.58333,50.9091},{28,50.9091},{28,5},{38,5}},
                                color={0,0,127}));
  connect(governor.SPEED, machine.SPEED) annotation (Line(points={{-29.1667,55.4545},{-40,55.4545},{-40,68},{80,68},{80,7},{61,7}},
                                                     color={0,0,127}));
  connect(machine.PMECH0, governor.PMECH0) annotation (Line(points={{61,5},{74,5},{74,30},{-40,30},{-40,45.4545},{-29.1667,45.4545}},
                                                       color={0,0,127}));

end Plant;
