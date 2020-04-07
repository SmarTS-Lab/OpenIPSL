within PSAT_Systems.Discretization.BaseClasses;
partial model BaseNetwork
  OpenIPSL.Electrical.Machines.PSAT.Order4 order4_Inputs_Outputs(
    V_b=20,
    Sn=370,
    Vn=20,
    V_0=1,
    angle_0=0,
    P_0=16.0352698692006,
    Q_0=11.859436505981,
    ra=0.001,
    M=10,
    D=0,
    x1d=0.302,
    xd=1.9,
    xq=1.7,
    x1q=0.5,
    T1d0=8,
    T1q0=0.8) annotation (Placement(transformation(extent={{-30,-12},{-8,11}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    X=0.1,
    R=0.01,
    G=0,
    B=0.0005) annotation (Placement(visible=true, transformation(
        origin={20,-10},
        extent={{-6,-4},{6,4}},
        rotation=0)));
  OpenIPSL.Electrical.Branches.PwLine pwLinewithOpening1(
    G=0,
    R=0.01,
    X=0.1,
    opening=1,
    B=0.0005,
    t1=2,
    t2=2.15) annotation (Placement(visible=true, transformation(
        origin={60,10},
        extent={{-6,-4},{6,4}},
        rotation=0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine2(
    G=0,
    R=0.01,
    X=0.1,
    B=0.0005) annotation (Placement(visible=true, transformation(
        origin={20,10},
        extent={{-6,-4},{6,4}},
        rotation=0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine3(
    G=0,
    R=0.01,
    X=0.1,
    B=0.0005) annotation (Placement(visible=true, transformation(
        origin={60,-10},
        extent={{-6,-4.00001},{6,4.00002}},
        rotation=0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine4(
    G=0,
    R=0.01,
    X=0.1,
    B=0.0005) annotation (Placement(visible=true, transformation(
        origin={60,32},
        extent={{-5.99999,-3.99998},{5.99999,4}},
        rotation=0)));
  OpenIPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ1(
    P_0=8,
    Q_0=6,
    V_0=1,
    angle_0=0) annotation (Placement(visible=true, transformation(
        origin={94,20},
        extent={{-6,-6},{6,6}},
        rotation=90)));
  OpenIPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ2(
    P_0=8,
    Q_0=6,
    V_0=1,
    angle_0=0) annotation (Placement(visible=true, transformation(
        origin={94.034,-10.2889},
        extent={{-6.2889,-6.0335},{6.2889,6.0335}},
        rotation=90)));
  OpenIPSL.Electrical.Buses.Bus bus
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  OpenIPSL.Electrical.Buses.Bus bus1
    annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  OpenIPSL.Electrical.Buses.Bus bus2
    annotation (Placement(transformation(extent={{70,10},{90,30}})));
  OpenIPSL.Electrical.Buses.Bus bus3
    annotation (Placement(transformation(extent={{70,-20},{90,0}})));
  inner OpenIPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{-140,80},{-80,100}})));
equation
  connect(order4_Inputs_Outputs.pm, order4_Inputs_Outputs.pm0) annotation (Line(
        points={{-30,-6.25},{-32,-6.25},{-32,-6},{-34,-6},{-34,-16},{-27.8,-16},
          {-27.8,-13.15}}, color={0,0,127}));
  connect(pwLine2.p, pwLine1.p) annotation (Line(points={{13,10},{8,10},{8,-10},
          {13,-10}}, color={0,0,255}));
  connect(pwLine2.n, pwLine1.n) annotation (Line(points={{27,10},{32,10},{32,-10},
          {27,-10}}, color={0,0,255}));
  connect(pwLine4.p, pwLinewithOpening1.p) annotation (Line(points={{53,32},{48,
          32},{48,10},{53,10}}, color={0,0,255}));
  connect(pwLine4.n, pwLinewithOpening1.n) annotation (Line(points={{67,32},{72,
          32},{72,10},{67,10}}, color={0,0,255}));
  connect(bus.p, pwLine1.p)
    annotation (Line(points={{0,0},{8,0},{8,-10},{13,-10}}, color={0,0,255}));
  connect(bus1.p, pwLine1.n) annotation (Line(points={{40,0},{32,0},{32,-10},{
          27,-10}}, color={0,0,255}));
  connect(bus1.p, pwLinewithOpening1.p) annotation (Line(points={{40,0},{44,0},
          {44,20},{48,20},{48,10},{53,10}}, color={0,0,255}));
  connect(pwLine3.p, pwLinewithOpening1.p) annotation (Line(points={{53,-10},{
          44,-10},{44,20},{48,20},{48,10},{53,10}}, color={0,0,255}));
  connect(bus2.p, pwLoadPQ1.p)
    annotation (Line(points={{80,20},{87.4,20}}, color={0,0,255}));
  connect(bus2.p, pwLinewithOpening1.n) annotation (Line(points={{80,20},{72,20},
          {72,10},{67,10}}, color={0,0,255}));
  connect(bus3.p, pwLoadPQ2.p) annotation (Line(points={{80,-10},{87.3972,-10},
          {87.3972,-10.2889}}, color={0,0,255}));
  connect(pwLine3.n, bus3.p)
    annotation (Line(points={{67,-10},{73.5,-10},{80,-10}}, color={0,0,255}));
  connect(order4_Inputs_Outputs.p, bus.p) annotation (Line(points={{-6.9,-0.442914},
          {-3.45,-0.442914},{-3.45,0},{0,0}}, color={0,0,255}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{140,
            100}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{
            140,100}})),
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
