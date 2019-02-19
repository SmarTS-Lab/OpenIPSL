within OpenIPSL.Examples.Branches.PSAT;
model PhaseShiftingTransformer_Test
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Loads.PSAT.LOADPQ lOADPQ_B3(P_0=30000, Q_0=1000) annotation (Placement(transformation(extent={{30,-50},{50,-30}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    R=0.01,
    X=0.1,
    G=0,
    B=0.001/2) annotation (Placement(transformation(extent={{0,0},{20,20}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine2(
    R=0.01,
    X=0.1,
    G=0,
    B=0.001) annotation (Placement(transformation(extent={{0,-20},{20,0}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine3(
    R=0.01,
    X=0.1,
    G=0,
    B=0.001/2) annotation (Placement(transformation(extent={{50,0},{70,20}})));
  OpenIPSL.Electrical.Branches.PSAT.PhaseShiftingTransformer.PSTransformer
    pSTransformer
    annotation (Placement(transformation(extent={{50,-20},{70,0}})));
  OpenIPSL.Electrical.Loads.PSAT.LOADPQ_variation lOADPQ_B4(
    t_start_1=5,
    t_end_1=7.99,
    t_start_2=8,
    t_end_2=12,
    dQ1=0.01,
    dQ2=-0.01,
    dP1=0.02,
    dP2=-0.02,
    P_0=20000,
    Q_0=10000) annotation (Placement(transformation(extent={{80,-50},{100,-30}})));
  Modelica.Blocks.Sources.Sine sine1(amplitude=0.001, freqHz=0.2) annotation (
      Placement(transformation(
        origin={-26,40},
        extent={{4.4802,-4.4802},{-4.4802,4.4802}})));
  Modelica.Blocks.Math.Add diff(k2=-1) annotation (Placement(transformation(
        origin={-47,31},
        extent={{4.99999,-4.99999},{-5,5}})));
  Modelica.Blocks.Sources.Sine sine2(
    amplitude=0.001,
    freqHz=0.2,
    startTime=5) annotation (Placement(transformation(
        origin={-26,22},
        extent={{4.4802,-4.4802},{-4.4802,4.4802}})));
  OpenIPSL.Electrical.Machines.PSAT.Order2 Gen1(
    D=5,
    angle_0=0,
    ra=0.001,
    x1d=0.302,
    M=10,
    P_0=50249.405357958,
    Q_0=10496.891745129,
    Sn=100000000,
    v_0=1,
    V_b=13800000,
    Vn=13800000) annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-64,24},{-78,38}})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer(
    Vn=13800,
    rT=0.01,
    xT=0.1,
    V_b=13800)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  OpenIPSL.Electrical.Buses.Bus B1
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  OpenIPSL.Electrical.Buses.Bus B2
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  OpenIPSL.Electrical.Buses.Bus B3
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  OpenIPSL.Electrical.Buses.Bus B4
    annotation (Placement(transformation(extent={{80,-10},{100,10}})));
  inner OpenIPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{-100,80},{-60,100}})));
equation
  connect(pSTransformer.pk, pSTransformer.u) annotation (Line(
      points={{71,-14},{74,-14},{74,-20},{44,-20},{44,-4.4},{48,-4.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sine1.y,diff. u1) annotation (Line(
      points={{-30.9282,40},{-36,40},{-36,34},{-41,34}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sine2.y,diff. u2) annotation (Line(
      points={{-30.9282,22},{-36,22},{-36,28},{-41,28}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen1.vf0, add.u2) annotation (Line(
      points={{-78,11},{-78,20},{-58,20},{-58,26.8},{-62.6,26.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen1.p, B1.p) annotation (Line(
      points={{-60,0},{-50,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B1.p, twoWindingTransformer.p) annotation (Line(
      points={{-50,0},{-41,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWindingTransformer.n, B2.p) annotation (Line(
      points={{-19,0},{-10,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B3.p, lOADPQ_B3.p) annotation (Line(
      points={{30,0},{40,0},{40,-30}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B4.p, lOADPQ_B4.p) annotation (Line(
      points={{90,0},{96,0},{96,-22},{90,-22},{90,-30}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.p, B3.p) annotation (Line(points={{51,10},{40,10},{40,0},{30,0}}, color={0,0,255}));
  connect(pSTransformer.p, B3.p) annotation (Line(points={{49,-10},{40,-10},{40,0},{30,0}}, color={0,0,255}));
  connect(pSTransformer.n, B4.p) annotation (Line(points={{71,-10},{76,-10},{76,0},{90,0}}, color={0,0,255}));
  connect(pwLine3.n, B4.p) annotation (Line(points={{69,10},{76,10},{76,0},{90,0}}, color={0,0,255}));
  connect(pwLine1.n, B3.p) annotation (Line(points={{19,10},{24,10},{24,0},{30,0}}, color={0,0,255}));
  connect(pwLine2.n, B3.p) annotation (Line(points={{19,-10},{24,-10},{24,0},{30,0}}, color={0,0,255}));
  connect(pwLine1.p, B2.p) annotation (Line(points={{1,10},{-4,10},{-4,0},{-10,0}}, color={0,0,255}));
  connect(pwLine2.p, B2.p) annotation (Line(points={{1,-10},{-4,-10},{-4,0},{-10,0}}, color={0,0,255}));
  connect(add.y, Gen1.vf) annotation (Line(points={{-78.7,31},{-92,31},{-92,5},{-82,5}}, color={0,0,127}));
  connect(Gen1.pm0, Gen1.pm) annotation (Line(points={{-78,-11},{-78,-14},{-86,-14},{-86,-5},{-82,-5}}, color={0,0,127}));
  connect(diff.y, add.u1) annotation (Line(points={{-52.5,31},{-58,31},{-58,35.2},{-62.6,35.2}}, color={0,0,127}));
  annotation (Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>KTH own Model, PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>29/09/2015</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end PhaseShiftingTransformer_Test;
