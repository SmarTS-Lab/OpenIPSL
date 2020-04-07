within OpenIPSL.Examples.Machines.PSSE;
model GENROU
  extends OpenIPSL.Examples.SMIBpartial;
  OpenIPSL.Electrical.Machines.PSSE.GENROU gENROU(
    Tpd0=5,
    Tppd0=0.07,
    Tpq0=0.9,
    Tppq0=0.09,
    D=0,
    Xd=1.84,
    Xq=1.75,
    Xpd=0.41,
    Xpq=0.6,
    Xppd=0.2,
    Xl=0.12,
    S10=0.11,
    S12=0.39,
    angle_0=4.046276,
    Xppq=0.2,
    R_a=0,
    Xpp=0.2,
    H=4.28,
    M_b=100000000,
    P_0=40000000,
    Q_0=5416582,
    v_0=1) annotation (Placement(transformation(extent={{-100,-20},{-60,20}})));
equation
  connect(gENROU.PMECH, gENROU.PMECH0) annotation (Line(points={{-104,10},{-112,
          10},{-112,26},{-54,26},{-54,10},{-58,10}}, color={0,0,127}));
  connect(gENROU.EFD, gENROU.EFD0) annotation (Line(points={{-104,-10},{-112,-10},
          {-112,-30},{-54,-30},{-54,-10},{-58,-10}}, color={0,0,127}));
  connect(gENROU.p, GEN1.p)
    annotation (Line(points={{-60,0},{-60,0},{-40,0}}, color={0,0,255}));
  annotation (experiment(StopTime=10));
end GENROU;
