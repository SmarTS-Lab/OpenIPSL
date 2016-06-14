within OpenIPSL.Examples.FACTS;
model TCSC_Reactance_Test

  extends Modelica.Icons.Example;

  OpenIPSL.Electrical.Machines.PSAT.Order2 Gen1(
    Sn=370,
    P_0=0.080101913348342,
    Q_0=0.060948619430301,
    D=5,
    V_b=400,
    V_0=1,
    angle_0=0,
    Vn=400,
    ra=0.001,
    xd1=0.302,
    M=10) annotation (Placement(transformation(extent={{-22,-10},{-2,10}})));
  Modelica.Blocks.Sources.Pulse pulse(
    period=10,
    startTime=4.2,
    amplitude=0.045,
    width=58,
    offset=1.005017533847740,
    nperiod=2) annotation (Placement(transformation(extent={{-116,10},{-96,30}})));
  Modelica.Blocks.Sources.Pulse pulse1(
    period=10,
    amplitude=-0.045,
    width=42,
    startTime=0,
    nperiod=2) annotation (Placement(transformation(extent={{-118,-26},{-98,-6}})));
  Modelica.Blocks.Math.Add3 add3_1(
    k3=0,
    k1=1,
    k2=1) annotation (Placement(transformation(extent={{-58,-10},{-38,10}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    R=0.01,
    X=0.1,
    G=0,
    B=0.001/2) annotation (Placement(transformation(extent={{62,-10},{82,10}})));
  OpenIPSL.Electrical.Loads.PSAT.LOADPQ_variation lOADPQ(
    P_0=0.08,
    Q_0=0.06,
    t_start_1=2,
    t_end_1=10,
    t_start_2=12,
    t_end_2=20,
    dP1=0,
    dQ1=0.01,
    dP2=0,
    dQ2=-0.01) annotation (Placement(transformation(extent={{96,-10},{116,10}})));
  OpenIPSL.Electrical.FACTS.PSAT.TCSCReactance tCSCReactance annotation (Placement(transformation(extent={{26,-10},{46,10}})));
  inner OpenIPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{-100,60},{-76,80}})));
equation
  connect(pulse1.y, add3_1.u2) annotation (Line(
      points={{-97,-16},{-68,-16},{-68,0},{-60,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pulse.y, add3_1.u1) annotation (Line(
      points={{-95,20},{-70,20},{-70,8},{-60,8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pwLine1.n, lOADPQ.p) annotation (Line(
      points={{83.6667,0},{92,0},{92,11},{106,11}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(add3_1.y, Gen1.vf) annotation (Line(
      points={{-37,0},{-32,0},{-32,5},{-22,5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen1.pm0, Gen1.pm) annotation (Line(
      points={{-20,-11},{8,-11},{8,-20},{-32,-20},{-32,-5},{-22,-5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen1.vf0, add3_1.u3) annotation (Line(
      points={{-20,11},{4,11},{4,22},{-36,22},{-36,-20},{-60,-20},{-60,-8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(tCSCReactance.n, pwLine1.p) annotation (Line(
      points={{47,0},{60.3333,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Gen1.p, tCSCReactance.p) annotation (Line(
      points={{-1,0.04964},{11.5,0.04964},{11.5,0.2},{25.1,0.2}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-140,-100},{120,100}}), graphics),
    Icon(coordinateSystem(extent={{-140,-100},{120,100}})),
    Documentation(info="<html>
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
</html>", revisions="<html>
<!--DISCLAIMER-->
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>"));
end TCSC_Reactance_Test;
