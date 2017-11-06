within PSAT_Systems.ThreeArea.BaseClasses;
partial model BaseNetwork

  OpenIPSL.Electrical.Machines.PSAT.Order3 order3_2(
    Sn=900,
    Vn=1,
    ra=0,
    xd=1.8,
    x1d=0.3,
    M=7,
    V_0=1.05,
    angle_0=0.755059086011694,
    P_0=50.0000000000002,
    Q_0=21.9157659600514,
    D=2,
    T1d0=8,
    xq=1.7,
    V_b=1000)
    annotation (Placement(transformation(extent={{152,-10},{132,10}})));
  OpenIPSL.Electrical.Machines.PSAT.Order2 order2(
    Sn=900,
    V_0=1.050000000000000,
    ra=0,
    M=14,
    D=2,
    x1d=0.3,
    P_0=-99.9999999999999,
    Q_0=41.3913357523525,
    V_b=1000,
    Vn=1000) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-84,-80})));
  OpenIPSL.Electrical.Buses.Bus B100 annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=90,
        origin={-84,-60})));
  OpenIPSL.Electrical.Buses.Bus B200 annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=90,
        origin={-84,-40})));
  OpenIPSL.Electrical.Buses.Bus B300 annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=90,
        origin={-84,-20})));
  OpenIPSL.Electrical.Buses.Bus B400 annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=0,
        origin={0,0})));
  OpenIPSL.Electrical.Buses.Bus B500 annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=90,
        origin={-84,20})));
  OpenIPSL.Electrical.Buses.Bus B600 annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=90,
        origin={-84,40})));
  OpenIPSL.Electrical.Buses.Bus B700 annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=180,
        origin={-80,80})));
  OpenIPSL.Electrical.Buses.Bus B800 annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=0,
        origin={-100,80})));
  OpenIPSL.Electrical.Buses.Bus B900
    annotation (Placement(transformation(extent={{12,-8},{28,8}})));
  OpenIPSL.Electrical.Buses.Bus B1000
    annotation (Placement(transformation(extent={{72,-8},{88,8}})));
  OpenIPSL.Electrical.Buses.Bus B1100
    annotation (Placement(transformation(extent={{92,-8},{108,8}})));
  OpenIPSL.Electrical.Buses.Bus B1200
    annotation (Placement(transformation(extent={{112,-8},{128,8}})));
  OpenIPSL.Electrical.Buses.Bus B1300
    annotation (Placement(transformation(extent={{32,-8},{48,8}})));
  OpenIPSL.Electrical.Buses.Bus B1400
    annotation (Placement(transformation(extent={{52,-8},{68,8}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1to4(
    R=0,
    G=0,
    B=0,
    X=0.1) annotation (Placement(transformation(
        extent={{-3.5,-2.50002},{3.5,2.50002}},
        rotation=-90,
        origin={-84.5,-50.5})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1to1(
    R=0,
    G=0,
    B=0,
    X=0.1) annotation (Placement(transformation(
        extent={{-3,-2},{3,2}},
        rotation=-90,
        origin={-84,-31})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1to2(
    R=0,
    G=0,
    B=0,
    X=0.2) annotation (Placement(transformation(extent={{-54,-2},{-48,2}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1to3(
    R=0,
    G=0,
    B=0,
    X=0.1) annotation (Placement(transformation(extent={{6,-2},{12,2}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1to5(
    R=0,
    G=0,
    B=0,
    X=1.2) annotation (Placement(transformation(extent={{46,18},{52,22}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1to6(
    R=0,
    G=0,
    B=0,
    X=0.1) annotation (Placement(transformation(
        extent={{-3,-2},{3,2}},
        rotation=0,
        origin={31,0})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1to7(
    R=0,
    G=0,
    B=0,
    X=0.2) annotation (Placement(transformation(extent={{46,-2},{52,2}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1to8(
    R=0,
    G=0,
    B=0,
    X=0.2) annotation (Placement(transformation(extent={{66,-2},{72,2}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1to9(
    R=0,
    G=0,
    B=0,
    X=0.1) annotation (Placement(transformation(extent={{86,-2},{92,2}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1to10(
    R=0,
    G=0,
    B=0,
    X=0.1) annotation (Placement(transformation(extent={{106,-2},{112,2}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1to11(
    R=0,
    G=0,
    B=0,
    X=0.4) annotation (Placement(transformation(
        extent={{-3.5,-2.50001},{3.5,2.50003}},
        rotation=90,
        origin={-84.5,31.5})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1to12(
    R=0,
    G=0,
    B=0,
    X=0.1) annotation (Placement(transformation(
        extent={{-3.50001,-2.50002},{3.50001,2.50002}},
        rotation=90,
        origin={-83.5,56.5})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1to13(
    R=0,
    G=0,
    B=0,
    X=0.2) annotation (Placement(transformation(extent={{-92,78},{-86,82}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1to14(
    R=0,
    G=0,
    B=0,
    X=0.2) annotation (Placement(transformation(
        extent={{-2.99999,-1.99996},{2.99998,2}},
        rotation=180,
        origin={-50,9})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1to15(
    R=0,
    G=0,
    B=0,
    X=1.3) annotation (Placement(transformation(extent={{-50,78},{-44,82}})));
  OpenIPSL.Electrical.Events.PwFault pwFault(
    R=0.15,
    X=0,
    t1=2,
    t2=2.1) annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=-90,
        origin={84,-24})));
  inner OpenIPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{-180,100},{-120,120}})));
equation
  connect(pwLine1to4.n, B100.p) annotation (Line(
      points={{-84.5,-54.5833},{-84,-54.5833},{-84,-60}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1to4.p, B200.p) annotation (Line(
      points={{-84.5,-46.4167},{-84,-46.4167},{-84,-40}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1to1.p, B300.p) annotation (Line(
      points={{-84,-27.5},{-84,-20}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B500.p, pwLine1to11.p) annotation (Line(
      points={{-84,20},{-84,27.4167},{-84.5,27.4167}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B600.p, pwLine1to11.n) annotation (Line(
      points={{-84,40},{-84,35.5833},{-84.5,35.5833}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B600.p, pwLine1to12.p) annotation (Line(
      points={{-84,40},{-84,52.4167},{-83.5,52.4167}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1to13.n, B700.p) annotation (Line(
      points={{-85.5,80},{-80,80}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1to13.p, B800.p) annotation (Line(
      points={{-92.5,80},{-100,80}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B400.p, pwLine1to3.p) annotation (Line(
      points={{0,0},{5.5,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1to3.n, B900.p) annotation (Line(
      points={{12.5,0},{20,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B1000.p, pwLine1to9.p) annotation (Line(
      points={{80,0},{85.5,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1to9.n, B1100.p) annotation (Line(
      points={{92.5,0},{100,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B1100.p, pwLine1to10.p) annotation (Line(
      points={{100,0},{105.5,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1to10.n, B1200.p) annotation (Line(
      points={{112.5,0},{120,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1to15.n, B1000.p) annotation (Line(
      points={{-43.5,80},{76,80},{76,0},{80,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1to15.p, B700.p) annotation (Line(
      points={{-50.5,80},{-80,80}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1to6.n, B1300.p) annotation (Line(
      points={{34.5,0},{40,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B1300.p, pwLine1to7.p) annotation (Line(
      points={{40,0},{45.5,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B1400.p, pwLine1to8.p) annotation (Line(
      points={{60,0},{65.5,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1to8.n, B1000.p) annotation (Line(
      points={{72.5,0},{80,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1to7.n, B1400.p) annotation (Line(
      points={{52.5,0},{60,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwFault.p, pwLine1to9.p)
    annotation (Line(points={{84,-19.3333},{84,0},{85.5,0}}, color={0,0,255}));
  connect(pwLine1to5.n, B1000.p) annotation (Line(points={{52.5,20},{76,20},{76,
          0},{80,0}}, color={0,0,255}));
  connect(pwLine1to6.p, B900.p)
    annotation (Line(points={{27.5,0},{23.75,0},{20,0}}, color={0,0,255}));
  connect(pwLine1to5.p, B900.p) annotation (Line(points={{45.5,20},{24,20},{24,
          0},{20,0}}, color={0,0,255}));
  connect(pwLine1to12.n, B700.p) annotation (Line(points={{-83.5,60.5833},{-83.5,
          80},{-80,80}}, color={0,0,255}));
  connect(pwLine1to2.n, B400.p)
    annotation (Line(points={{-47.5,0},{-47.5,0},{0,0}}, color={0,0,255}));
  connect(pwLine1to1.n, B200.p) annotation (Line(points={{-84,-34.5},{-84,-37.25},
          {-84,-40}}, color={0,0,255}));
  connect(order2.p, B100.p) annotation (Line(points={{-84.0496,-69},{-84.0496,-64.5},
          {-84,-64.5},{-84,-60}}, color={0,0,255}));
  connect(order2.pm0, order2.pm) annotation (Line(points={{-73,-88},{-70,-88},{
          -70,-92},{-78,-92},{-78,-90},{-79,-90}}, color={0,0,127}));
  connect(order2.vf0, order2.vf) annotation (Line(points={{-95,-88},{-96,-88},{
          -96,-92},{-89,-92},{-89,-90}}, color={0,0,127}));
  connect(pwLine1to14.n, B500.p) annotation (Line(points={{-53.5,8.99998},{-84,
          8.99998},{-84,20}}, color={0,0,255}));
  connect(pwLine1to14.p, B400.p) annotation (Line(points={{-46.5,8.99998},{-4,
          8.99998},{-4,0},{0,0}}, color={0,0,255}));
  connect(pwLine1to2.p, B300.p)
    annotation (Line(points={{-54.5,0},{-84,0},{-84,-20}}, color={0,0,255}));
  connect(B1200.p, order3_2.p)
    annotation (Line(points={{120,0},{131,0},{131,0.04964}}, color={0,0,255}));
  connect(order3_2.pm0, order3_2.pm) annotation (Line(points={{150,-11},{150,-14},
          {156,-14},{156,-5},{152,-5}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-180,-120},{180,
            120}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-180,-120},{
            180,120}})),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p></p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>Tin Rabuzin, May 2016</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Yuwa Chompoobutrgool, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end BaseNetwork;
