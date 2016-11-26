within TriPhase;
model IEEE_4_Bus
  OpenIPSL.Electrical.Machines.PSSE.GENCLS gENCLS annotation (Placement(transformation(extent={{-74,-6},{-64,14}})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer annotation (Placement(transformation(extent={{-24,-6},{-4,14}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine annotation (Placement(transformation(extent={{10,0},{22,8}})));
  OpenIPSL.Electrical.Loads.PSAT.LOADPQ lOADPQ annotation (Placement(transformation(extent={{30,-26},{50,-6}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1 annotation (Placement(transformation(extent={{-44,0},{-32,8}})));
equation
  connect(twoWindingTransformer.n, pwLine.p) annotation (Line(points={{-3,4},{9,4}}, color={0,0,255}));
  connect(pwLine.n, lOADPQ.p) annotation (Line(points={{23,4},{40,4},{40,-5}}, color={0,0,255}));
  connect(gENCLS.p, pwLine1.p) annotation (Line(points={{-63,3.84964},{-53.5,3.84964},{-53.5,4},{-45,4}}, color={0,0,255}));
  connect(pwLine1.n, twoWindingTransformer.p) annotation (Line(points={{-31,4},{-25,4}}, color={0,0,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
end IEEE_4_Bus;
