within TriPhase;
model IEEE_4_Bus_1

  ThreePhaseInfiniteBus threePhaseInfiniteBus
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  ThreePhaseBus threePhaseBus
    annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
equation
  connect(threePhaseInfiniteBus.p3, threePhaseBus.p3)
    annotation (Line(points={{-81,-9},{-70.5,-9},{-60,-9}}, color={0,0,255}));
  connect(threePhaseInfiniteBus.p2, threePhaseBus.p2)
    annotation (Line(points={{-81,0},{-70.5,0},{-60,0}}, color={0,0,255}));
  connect(threePhaseInfiniteBus.p1, threePhaseBus.p1)
    annotation (Line(points={{-81,9},{-70.5,9},{-60,9}}, color={0,0,255}));
  annotation (
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})));
end IEEE_4_Bus_1;
