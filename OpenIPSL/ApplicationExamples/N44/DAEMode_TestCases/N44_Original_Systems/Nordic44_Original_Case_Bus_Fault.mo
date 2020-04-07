within N44.DAEMode_TestCases.N44_Original_Systems;
model Nordic44_Original_Case_Bus_Fault
  "Bus 3100 bus fault test case, several state events triggered."
  extends N44.Original.Nordic44_Original_Case(bus_3100(np=3));
  OpenIPSL.Electrical.Events.PwFault pwFault(
    R=0,
    X=0,
    t1=2,
    t2=2.2) annotation (Placement(transformation(extent={{-164,66},{-152,78}})));
equation
  connect(bus_3100.p[3], pwFault.p) annotation (Line(points={{-176,46},{-170,46},
          {-170,72},{-165,72}}, color={0,0,255}));
  annotation (
      experiment(
      StopTime=5,
      Tolerance=1e-04,
      __Dymola_fixedstepsize=0.01),
      __Dymola_experimentFlags(Advanced(Define(DAEsolver=true))));
end Nordic44_Original_Case_Bus_Fault;
