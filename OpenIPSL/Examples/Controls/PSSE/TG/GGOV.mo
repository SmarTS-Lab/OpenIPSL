within OpenIPSL.Examples.Controls.PSSE.TG;
model GGOV "three phase to ground fault test of GGOV"
  extends OpenIPSL.Examples.SMIBpartial;
  OpenIPSL.Electrical.Machines.PSSE.GENROU generator(
    Xppd=0.2,
    Xppq=0.2,
    Xpp=0.2,
    Xl=0.12,
    M_b=100,
    Tpd0=5,
    Tppd0=0.50000E-01,
    Tppq0=0.1,
    H=4.0000,
    D=0,
    Xd=1.41,
    Xq=1.3500,
    Xpd=0.3,
    S10=0.1,
    S12=0.5,
    Xpq=0.6,
    Tpq0=0.7,
    V_0=1,
    angle_0=4.05,
    P_0=39.99995,
    Q_0=5.416571)
    annotation (Placement(transformation(extent={{-100,-16},{-60,18}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.GGOV1.GGOV1 gGOV1pele(
    R=0.04,
    T_pelec=1,
    maxerr=0.05,
    minerr=-0.05,
    Kpgov=10,
    Kigov=2,
    Kdgov=0,
    Tdgov=1,
    Vmax=1,
    Vmin=0.15,
    Tact=0.5,
    Kturb=1.5,
    Wfnl=0.2,
    Tb=0.1,
    Tc=0,
    Teng=0,
    Tfload=3,
    Kpload=2,
    Kiload=0.67,
    Ldref=1,
    Dm=0,
    Ropen=0.1,
    Rclose=-0.1,
    Kimw=0,
    Aset=0.1,
    Ka=10,
    Ta=0.1,
    Trate=0,
    db=0,
    Tsa=4,
    Tsb=5,
    Rup=99,
    Rdown=-99,
    DELT=0.005,
    Flag=0) annotation (Placement(transformation(
        extent={{-20,-18},{20,18}},
        rotation=180,
        origin={-68,40})));
equation
  connect(gGOV1pele.PELEC, generator.PELEC) annotation (Line(
      points={{-47.3793,46.9652},{-34,46.9652},{-34,6.1},{-58,6.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(generator.EFD0, generator.EFD) annotation (Line(
      points={{-58,-7.5},{-52,-7.5},{-52,-30},{-102,-30},{-102,-7.5},{-104,-7.5}},

      color={0,0,127},
      smooth=Smooth.None));

  connect(gGOV1pele.PMECH, generator.PMECH) annotation (Line(points={{-88.6897,
          39.2174},{-106,39.2174},{-106,9.5},{-104,9.5}}, color={0,0,127}));
  connect(generator.SPEED, gGOV1pele.SPEED) annotation (Line(points={{-58,12.9},
          {-40,12.9},{-40,29.8261},{-47.4483,29.8261}}, color={0,0,127}));
  connect(generator.p, GEN1.p) annotation (Line(points={{-60,1},{-50,1},{-50,0},
          {-40,0}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
    Documentation,
    experiment(StopTime=10));
end GGOV;
