within OpenIPSL.Examples.FACTS;
model StatcomCode_Test
  import Modelica.Constants.pi;
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Branches.PwLine pwLine4(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={-13,13},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine2(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={-15,-17},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  OpenIPSL.Electrical.Machines.PSAT.Order2 Syn2(
    D=1,
    Sn=370,
    V_0=1.027606413803688,
    V_b=400,
    ra=0.001,
    x1d=0.302,
    M=10,
    angle_0=0.036282466109908*180/pi,
    P_0=0.800000000076548*SysData.S_b,
    Q_0=0.500000000133379*SysData.S_b,
    Vn=400) annotation (Placement(transformation(
        extent={{-15,-16},{15,16}},
        rotation=180,
        origin={123,0})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={53,17},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine3(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={55,-17},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  OpenIPSL.Electrical.Machines.PSAT.Order2 order2_Inputs_Outputs(
    Sn=370,
    D=5,
    V_b=400,
    V_0=1,
    angle_0=0,
    Vn=400,
    ra=0.001,
    x1d=0.302,
    M=10,
    P_0=0.004219210312137*SysData.S_b,
    Q_0=-0.001421467052118*SysData.S_b)
    annotation (Placement(transformation(extent={{-78,-8},{-58,12}})));
  Modelica.Blocks.Sources.Pulse pulse(
    period=10,
    startTime=4.2,
    amplitude=0.045,
    width=58,
    nperiod=-1,
    offset=0.999885177318814)
    annotation (Placement(transformation(extent={{-158,14},{-138,34}})));
  Modelica.Blocks.Sources.Pulse pulse1(
    period=10,
    amplitude=-0.045,
    width=42,
    startTime=0,
    nperiod=-1)
    annotation (Placement(transformation(extent={{-156,-22},{-136,-2}})));
  Modelica.Blocks.Math.Add3 add3_1(
    k3=0,
    k1=1,
    k2=1) annotation (Placement(transformation(extent={{-118,-10},{-98,10}})));
  OpenIPSL.Electrical.FACTS.PSAT.STATCOM sTATCOM3_1(V_0=1, angle_0=-0.000213067852480
        *180/pi)
    annotation (Placement(transformation(extent={{-14,-54},{6,-34}})));
  OpenIPSL.Electrical.Buses.Bus bus
    annotation (Placement(transformation(extent={{4,-8},{24,12}})));
  OpenIPSL.Electrical.Loads.PSAT.LOADPQ_variation lOADPQ(
    t_start_1=7,
    t_end_1=7.001,
    dP1=0,
    t_start_2=8,
    dP2=0,
    P_0=0.8*SysData.S_b,
    Q_0=0.6*SysData.S_b,
    t_end_2=50,
    angle_0=-0.000213067852480*180/pi,
    dQ1=0.1*SysData.S_b,
    dQ2=0.42*SysData.S_b)
    annotation (Placement(transformation(extent={{38,-52},{58,-32}})));
  inner OpenIPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{-116,60},{-76,80}})));
equation
  connect(pwLine1.n, pwLine3.n) annotation (Line(
      points={{62,17},{78,17},{78,-17},{64,-17}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus.p, lOADPQ.p) annotation (Line(
      points={{14,2},{24,2},{24,-32},{48,-32}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sTATCOM3_1.p, lOADPQ.p) annotation (Line(
      points={{7,-44},{20,-44},{20,2},{24,2},{24,-32},{48,-32}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.p, lOADPQ.p) annotation (Line(
      points={{46,-17},{38,-17},{38,2},{24,2},{24,-32},{48,-32}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1.p, lOADPQ.p) annotation (Line(
      points={{44,17},{38,17},{38,2},{24,2},{24,-32},{48,-32}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Syn2.p, pwLine3.n) annotation (Line(
      points={{108,1.83187e-015},{78,1.83187e-015},{78,-17},{64,-17}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine2.n, bus.p) annotation (Line(
      points={{-6,-17},{0,-17},{0,2},{14,2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine4.n, bus.p) annotation (Line(
      points={{-4,13},{0,13},{0,2},{14,2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine4.p, pwLine2.p) annotation (Line(
      points={{-22,13},{-28,13},{-28,-17},{-24,-17}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(order2_Inputs_Outputs.p, pwLine2.p) annotation (Line(
      points={{-58,2},{-28,2},{-28,-17},{-24,-17}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(add3_1.y, order2_Inputs_Outputs.vf) annotation (Line(
      points={{-97,0},{-92,0},{-92,7},{-80,7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(order2_Inputs_Outputs.vf0, add3_1.u3) annotation (Line(
      points={{-76,13},{-48,13},{-48,-22},{-120,-22},{-120,-8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pulse1.y, add3_1.u2) annotation (Line(
      points={{-135,-12},{-126,-12},{-126,0},{-120,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pulse.y, add3_1.u1) annotation (Line(
      points={{-137,24},{-130,24},{-130,8},{-120,8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(order2_Inputs_Outputs.pm0, order2_Inputs_Outputs.pm) annotation (Line(
      points={{-76,-9},{-54,-9},{-54,-16},{-90,-16},{-90,-3},{-80,-3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Syn2.pm, Syn2.pm0) annotation (Line(points={{141,8},{148,8},{148,26},
          {135,26},{135,17.6}}, color={0,0,127}));
  connect(Syn2.vf0, Syn2.vf) annotation (Line(points={{135,-17.6},{135,-26},{
          152,-26},{152,-8},{141,-8}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html>
<table cellspacing=\"2\" cellpadding=\"1\" border=\"1\"><tr>
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
end StatcomCode_Test;
