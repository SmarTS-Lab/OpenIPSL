within OpenIPSL.Examples.Controls.PSAT.AVR;
model AVRTypeI_Test
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Machines.PSAT.Order6 Syn1(
    Sn=991,
    V_0=1.05,
    angle_0=0.159255652433349,
    P_0=0.899999999999999,
    Q_0=-0.090933105025882,
    ra=0,
    xd=2,
    xd1=0.245,
    xq1=0.42,
    xd2=0.2,
    xq2=0.2,
    Td10=5,
    Tq10=0.66,
    Td20=0.031,
    Tq20=0.061,
    M=2.8756*2,
    Vn=20000,
    V_b=20000,
    xq=1.91,
    Taa=0.002,
    D=0) annotation (Placement(transformation(extent={{-116,-10},{-86,18}})));
  OpenIPSL.Electrical.Buses.Bus bus1
    annotation (Placement(transformation(extent={{-80,-12},{-56,12}})));
  OpenIPSL.Electrical.Buses.Bus bus2
    annotation (Placement(transformation(extent={{102,-12},{126,12}})));
  OpenIPSL.Electrical.Buses.Bus bus3
    annotation (Placement(transformation(extent={{20,20},{44,44}})));
  OpenIPSL.Electrical.Buses.Bus bus4
    annotation (Placement(transformation(extent={{-22,-12},{2,12}})));
  OpenIPSL.Electrical.Buses.Bus bus5
    annotation (Placement(transformation(extent={{60,20},{84,44}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1to4(
    R=0,
    X=0.05,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-48,-10},{-28,10}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    R=0,
    X=0.05,
    G=0,
    B=0) annotation (Placement(transformation(extent={{4,-10},{24,10}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine2(
    R=0,
    X=0.05,
    G=0,
    B=0) annotation (Placement(transformation(extent={{42,22},{62,42}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine3(
    R=0,
    X=0.05,
    G=0,
    B=0) annotation (Placement(transformation(extent={{88,-10},{108,10}})));
  OpenIPSL.Electrical.Machines.PSAT.Order2 Syn2(
    Sn=991,
    Vn=20000,
    V_b=20000,
    V_0=1.081,
    P_0=-0.900000000000001,
    Q_0=0.239371894974117,
    ra=0,
    xd1=0.01,
    M=6,
    D=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={140,0})));
  Modelica.Blocks.Sources.Constant vref2(k=1.198705028536746) annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-167,23})));
  OpenIPSL.Electrical.Events.PwFault pwFault(
    R=0.15,
    X=0,
    t1=2,
    t2=2.1) annotation (Placement(transformation(extent={{38,-8},{58,12}})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeI aVRI(vrmax=7.57)
    annotation (Placement(transformation(extent={{-148,8},{-128,28}})));
  inner OpenIPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{-80,60},{-38,80}})));
equation
  connect(Syn1.p, bus1.p) annotation (Line(
      points={{-84.5,4.0695},{-74.5,4.0695},{-74.5,0},{-68,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus1.p, pwLine1to4.p) annotation (Line(
      points={{-68,0},{-49.6667,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1to4.n, bus4.p) annotation (Line(
      points={{-26.3333,0},{-10,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus4.p, pwLine1.p) annotation (Line(
      points={{-10,0},{2.33333,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus3.p, pwLine1.n) annotation (Line(
      points={{32,32},{26,32},{26,0},{25.6667,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus3.p, pwLine2.p) annotation (Line(
      points={{32,32},{40.3333,32}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine2.n, bus5.p) annotation (Line(
      points={{63.6667,32},{72,32}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus5.p, pwLine3.p) annotation (Line(
      points={{72,32},{86.3333,32},{86.3333,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.n, bus2.p) annotation (Line(
      points={{109.667,0},{114,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus2.p, Syn2.p) annotation (Line(
      points={{114,0},{122,0},{122,-0.04964},{129,-0.04964}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Syn1.pm0, Syn1.pm) annotation (Line(points={{-113,-11.4},{-76,-11.4},
          {-76,-18},{-126,-18},{-126,-3},{-116,-3}}, color={0,0,127}));
  connect(bus3.p, pwFault.p) annotation (Line(points={{32,32},{36,32},{36,28},{
          36,2},{36,2},{36.3333,2}}, color={0,0,255}));
  connect(aVRI.vf, Syn1.vf) annotation (Line(points={{-127,18.2},{-116,18.2},{-116,
          11}}, color={0,0,127}));
  connect(vref2.y, aVRI.vref) annotation (Line(points={{-161.5,23},{-155.75,23},
          {-155.75,23.6},{-150.2,23.6}}, color={0,0,127}));
  connect(Syn1.v, aVRI.v) annotation (Line(points={{-84.5,8.2},{-74,8.2},{-74,-28},
          {-160,-28},{-160,14.4},{-150.4,14.4}}, color={0,0,127}));
  connect(Syn2.pm0, Syn2.pm) annotation (Line(points={{148,11},{148,20},{156,20},
          {156,5},{150,5}}, color={0,0,127}));
  connect(Syn2.vf, Syn2.vf0) annotation (Line(points={{150,-5},{154,-5},{154,-4},
          {156,-4},{156,-16},{148,-16},{148,-11}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-180,-100},{160,100}},
          preserveAspectRatio=false)),
    Icon(coordinateSystem(extent={{-180,-100},{160,100}})),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>15/07/2015</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad,SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end AVRTypeI_Test;
