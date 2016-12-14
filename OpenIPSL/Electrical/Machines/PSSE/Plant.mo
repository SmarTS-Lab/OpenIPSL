within OpenIPSL.Electrical.Machines.PSSE;
model Plant

  redeclare replaceable OpenIPSL.Electrical.Machines.PSSE.BaseClasses.baseMachine machine
    annotation (choicesAllMatching=true,
                Placement(transformation(extent={{40,-10},
            {60,10}})));
  replaceable Controls.PSSE.ES.BaseClasses.BaseExciter exciter
    annotation (choicesAllMatching=true,
      Placement(transformation(extent={{-28,-24},{10,10}})));
  Connectors.PwPin pwPin
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-40,-54},{-32,-46}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-40,-72},{-32,-64}})));
  replaceable Controls.PSSE.TG.BaseClasses.BaseGovernor governor
    annotation (choicesAllMatching=true,
    Placement(transformation(extent={{-30,40},{-10,60}})));
  replaceable Controls.PSSE.PSS.BaseClasses.BasePSS pss
    annotation (choicesAllMatching=true,
    Placement(transformation(extent={{-90,-6},{-50,12}})));
equation
  connect(exciter.EFD, machine.EFD) annotation (Line(points={{10.95,-5.11111},{
          40.2,-5.11111},{40.2,-5}},  color={0,0,127}));
  connect(machine.p, pwPin)
    annotation (Line(points={{61,0},{110,0}},         color={0,0,255}));
  connect(exciter.XADIFD, machine.XADIFD) annotation (Line(points={{-0.45,
          -23.6222},{-0.45,-30},{64,-30},{64,-9},{60.8,-9}},
                                                   color={0,0,127}));
  connect(machine.EFD0, exciter.EFD0) annotation (Line(points={{60.8,-7},{66,-7},
          {66,-34},{-32,-34},{-32,-17.3889},{-28,-17.3889}},     color={0,0,127}));
  connect(exciter.ECOMP, machine.ETERM) annotation (Line(points={{-28,-5.11111},
          {-32,-5.11111},{-32,20},{68,20},{68,5},{60.8,5}}, color={0,0,127}));
  connect(const.y, exciter.VUEL) annotation (Line(points={{-31.6,-50},{-21.35,
          -50},{-21.35,-24}}, color={0,0,127}));
  connect(const1.y, exciter.VOEL) annotation (Line(points={{-31.6,-68},{-15.65,
          -68},{-15.65,-24}}, color={0,0,127}));
  connect(governor.PMECH, machine.PMECH) annotation (Line(points={{-9,50},{28,
          50},{28,5},{40.2,5}}, color={0,0,127}));
  connect(governor.SPEED, machine.SPEED) annotation (Line(points={{-30,55},{
          -40,55},{-40,68},{80,68},{80,9},{60.8,9}}, color={0,0,127}));
  connect(machine.PMECH0, governor.PMECH0) annotation (Line(points={{60.8,-3},
          {74,-3},{74,30},{-40,30},{-40,45},{-30,45}}, color={0,0,127}));
  connect(pss.VOTHSG, exciter.VOTHSG) annotation (Line(points={{-51.4737,3},{
          -40,3},{-40,3.38889},{-28,3.38889}},  color={0,0,127}));
  connect(pss.V_S1, machine.SPEED) annotation (Line(points={{-92.1053,5.25},{
          -98,5.25},{-98,68},{80,68},{80,9},{60.8,9}},  color={0,0,127}));
  connect(pss.V_S2, governor.PMECH0) annotation (Line(points={{-92.1053,0.75},{
          -94,0.75},{-94,30},{-40,30},{-40,45},{-30,45}},  color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={                      Ellipse(extent={{
              -100,-100},{100,100}},                                                                                                    lineColor=
              {28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),                                                                                                                       Line(points={{
              -60,-20},{-20,20},{20,-20},{60,20}},
                    color={28,108,200}),Text(
          extent={{-34,-32},{38,-52}},
          lineColor={28,108,200},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="%name")}),                                 Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Plant;
