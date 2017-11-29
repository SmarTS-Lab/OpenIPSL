within OpenIPSL.Examples.Machines.PSSE;
model GENSAE "SMIB system with one load and GENSAE model"
  extends OpenIPSL.Examples.SMIBpartial;
  OpenIPSL.Electrical.Machines.PSSE.GENSAE gENSAE(
    M_b=100,
    Tpd0=5,
    Tppd0=0.07,
    Tppq0=0.09,
    H=4.28,
    D=0,
    Xd=1.84,
    Xq=1.75,
    Xpd=0.41,
    Xppd=0.2,
    Xl=0.12,
    S10=0.11,
    S12=0.39,
    V_0=1,
    P_0=40,
    angle_0=4.046276,
    Q_0=5.416582,
    Xppq=0.2,
    R_a=0) annotation (Placement(transformation(extent={{-100,-20},{-60,20}})));
equation
  connect(gENSAE.PMECH, gENSAE.PMECH0) annotation (Line(points={{-104,10},{-112,
          10},{-112,26},{-54,26},{-54,10},{-58,10}}, color={0,0,127}));
  connect(gENSAE.EFD, gENSAE.EFD0) annotation (Line(points={{-104,-10},{-112,-10},
          {-112,-30},{-54,-30},{-54,-10},{-58,-10}}, color={0,0,127}));
  connect(gENSAE.p, GEN1.p)
    annotation (Line(points={{-60,0},{-60,0},{-40,0}}, color={0,0,255}));
  annotation (Documentation, experiment(StopTime=10));
end GENSAE;
