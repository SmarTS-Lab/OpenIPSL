within Tutorial.Example_1.Network;
partial model Step_1
  OpenIPSL.Electrical.Buses.Bus B1 annotation (Placement(transformation(extent={{-92,-12},{-68,12}})));
  OpenIPSL.Electrical.Buses.Bus B2 annotation (Placement(transformation(extent={{-32,-12},{-8,12}})));
  OpenIPSL.Electrical.Buses.Bus B3 annotation (Placement(transformation(extent={{48,-12},{72,12}})));
  Generator.Generator G1 annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=100, fn=60)
    annotation (Placement(visible=true, transformation(
        origin={65.3332,-80},
        extent={{-33.3332,-20},{46.6668,20}},
        rotation=0)));
  annotation (Diagram(coordinateSystem(extent={{-140,-100},{120,100}}, preserveAspectRatio=false), graphics={Text(
          extent={{-106,102},{84,84}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Solid,
          fontSize=15,
          textStyle={TextStyle.Bold},
          textString="Step 1: Adding generator and bus models"),Rectangle(
          extent={{-126,14},{-94,-14}},
          lineColor={255,0,0},
          lineThickness=1),Rectangle(
          extent={{-86,20},{66,-22}},
          lineColor={255,0,0},
          lineThickness=1),Text(
          extent={{-104,36},{86,18}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Solid,
          fontSize=12,
          textString="Electrical.Buses.Bus")}), Icon(coordinateSystem(extent={{-140,-100},{120,100}})));
end Step_1;
