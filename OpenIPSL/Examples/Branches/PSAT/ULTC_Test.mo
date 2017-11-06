within OpenIPSL.Examples.Branches.PSAT;
model ULTC_Test
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Branches.PwLine pwLine3(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={30,-10},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine4(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={30,10},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Sources.Sine sine1(amplitude=0.001, freqHz=0.2) annotation (
      Placement(visible=true, transformation(
        origin={-132.783,10.4652},
        extent={{-4.4802,-4.4802},{4.4802,4.4802}},
        rotation=0)));
  Modelica.Blocks.Math.Add add2(k2=-1) annotation (Placement(visible=true,
        transformation(
        origin={-109.106,-0.3379},
        extent={{-6.3229,-6.3229},{6.3229,6.3229}},
        rotation=0)));
  Modelica.Blocks.Sources.Sine sine2(
    amplitude=0.001,
    freqHz=0.2,
    startTime=5) annotation (Placement(visible=true, transformation(
        origin={-132.382,-10.5198},
        extent={{-4.4802,-4.4802},{4.4802,4.4802}},
        rotation=0)));
  OpenIPSL.Electrical.Machines.PSAT.Order2 order2_Inputs_Outputs(
    Sn=370,
    P_0=0.081032877181982,
    Q_0=0.058523044412627,
    D=5,
    V_b=400,
    V_0=1,
    angle_0=0,
    Vn=400,
    ra=0.001,
    x1d=0.302,
    M=10) annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-85,-10},{-65,10}})));
  OpenIPSL.Electrical.Loads.PSAT.LOADPQ_variation lOADPQ(
    P_0=0.08,
    Q_0=0.06,
    t_start_1=5,
    t_end_1=8,
    t_start_2=8,
    t_end_2=12,
    dP1=0,
    dP2=0,
    dQ1=-0.05,
    dQ2=0.05)
    annotation (Placement(transformation(extent={{115,-10},{135,10}})));
  OpenIPSL.Electrical.Branches.PSAT.ULTC_VoltageControl uLTC_VoltageControl
    annotation (Placement(transformation(extent={{70,-10},{90,10}})));
  OpenIPSL.Electrical.Buses.Bus B1
    annotation (Placement(transformation(extent={{-5,-10},{15,10}})));
  OpenIPSL.Electrical.Buses.Bus B2
    annotation (Placement(transformation(extent={{45,-10},{65,10}})));
  OpenIPSL.Electrical.Buses.Bus B3
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  inner OpenIPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{0,50},{45,70}})));
equation
  connect(add.y, order2_Inputs_Outputs.vf) annotation (Line(
      points={{-64,0},{-50,0},{-50,5},{-40,5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(order2_Inputs_Outputs.pm0, order2_Inputs_Outputs.pm) annotation (Line(
      points={{-38,-11},{-10,-11},{-10,-30},{-50,-30},{-50,-5},{-40,-5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pwLine4.n, pwLine3.n) annotation (Line(
      points={{41.6667,10},{45,10},{45,-10},{41.6667,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sine1.y, add2.u1) annotation (Line(
      points={{-127.855,10.4652},{-116.693,10.4652},{-116.693,3.45584}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sine2.y, add2.u2) annotation (Line(
      points={{-127.454,-10.5198},{-116.693,-10.5198},{-116.693,-4.13164}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pwLine4.p, pwLine3.p) annotation (Line(
      points={{18.3333,10},{15,10},{15,-10},{18.3333,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(order2_Inputs_Outputs.vf0, add.u2) annotation (Line(
      points={{-38,11},{0,11},{0,-35},{-100,-35},{-100,-6},{-87,-6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(order2_Inputs_Outputs.p, B1.p) annotation (Line(
      points={{-19,0.04964},{-7,0.04964},{-7,0},{5,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B1.p, pwLine3.p) annotation (Line(
      points={{5,0},{15,0},{15,-10},{18.3333,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B2.p, pwLine3.n) annotation (Line(
      points={{55,0},{45,0},{45,-10},{41.6667,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(uLTC_VoltageControl.n, B3.p) annotation (Line(
      points={{91,0},{100,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(lOADPQ.p, B3.p) annotation (Line(
      points={{125,11},{115,11},{115,0},{100,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B2.p, uLTC_VoltageControl.p) annotation (Line(
      points={{55,0},{69,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(add2.y, add.u1) annotation (Line(
      points={{-102.151,-0.3379},{-95,-0.3379},{-95,6},{-87,6}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(
        extent={{-148.5,-105},{148.5,105}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={5,5}), graphics), Documentation(info="<html>
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
end ULTC_Test;
