within OpenIPSL.Examples;
partial model SMIBpartial "SMIB system with one load"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Branches.PwLine pwLine(
    R=0.001,
    X=0.2,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-26,-4},{-14,4}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    R=0.001,
    G=0,
    B=0,
    X=0.2) annotation (Placement(transformation(extent={{34,26},{46,34}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine3(
    R=0.0005,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{14,-34},{26,-26}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine4(
    R=0.0005,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{54,-34},{66,-26}})));
  OpenIPSL.Electrical.Machines.PSSE.GENCLS gENCLS(
    M_b=100,
    D=0,
    V_0=1,
    angle_0=0,
    X_d=0.2,
    P_0=10.01711,
    Q_0=8.006544,
    H=0) annotation (Placement(transformation(extent={{112,-12},{98,12}})));
  OpenIPSL.Electrical.Loads.PSSE.Load_variation constantLoad(
    PQBRAK=0.7,
    d_t=0,
    d_P=0,
    V_0=0.9919935,
    angle_0=-0.5762684,
    t1=0,
    characteristic=2,
    P_0=50,
    Q_0=10) annotation (Placement(transformation(extent={{-4,-52},{8,-40}})));
  OpenIPSL.Electrical.Events.PwFault pwFault(
    t1=2,
    t2=2.15,
    R=0,
    X=0) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={44,-60})));
  OpenIPSL.Electrical.Buses.Bus GEN1
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  inner OpenIPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{-100,80},{-40,100}})));
  OpenIPSL.Electrical.Buses.Bus LOAD
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  OpenIPSL.Electrical.Buses.Bus GEN2
    annotation (Placement(transformation(extent={{70,-10},{90,10}})));
  OpenIPSL.Electrical.Buses.Bus FAULT
    annotation (Placement(transformation(extent={{30,-40},{50,-20}})));
equation
  connect(GEN1.p, pwLine.p)
    annotation (Line(points={{-40,0},{-40,0},{-25.4,0}}, color={0,0,255}));
  connect(pwLine.n, LOAD.p)
    annotation (Line(points={{-14.6,0},{-14.6,0},{0,0}}, color={0,0,255}));
  connect(pwLine3.p, LOAD.p) annotation (Line(points={{14.6,-30},{4,-30},{4,0},
          {0,0}},color={0,0,255}));
  connect(constantLoad.p, LOAD.p)
    annotation (Line(points={{2,-40},{2,0},{0,0}}, color={0,0,255}));
  connect(pwLine1.p, LOAD.p)
    annotation (Line(points={{34.6,30},{4,30},{4,0},{0,0}}, color={0,0,255}));
  connect(GEN2.p, gENCLS.p)
    annotation (Line(points={{80,0},{98,0},{98,0}}, color={0,0,255}));
  connect(pwLine4.n, GEN2.p) annotation (Line(points={{65.4,-30},{76,-30},{76,0},
          {80,0}}, color={0,0,255}));
  connect(pwLine1.n, GEN2.p) annotation (Line(points={{45.4,30},{76,30},{76,0},
          {80,0}},color={0,0,255}));
  connect(FAULT.p, pwLine4.p)
    annotation (Line(points={{40,-30},{54.6,-30}}, color={0,0,255}));
  connect(FAULT.p, pwLine3.n)
    annotation (Line(points={{40,-30},{25.4,-30}}, color={0,0,255}));
  connect(pwFault.p, pwLine4.p)
    annotation (Line(points={{44,-53},{44,-30},{54.6,-30}}, color={0,0,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})), Documentation);
end SMIBpartial;
