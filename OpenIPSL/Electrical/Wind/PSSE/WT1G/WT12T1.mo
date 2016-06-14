within OpenIPSL.Electrical.Wind.PSSE.WT1G;
model WT12T1
  constant Real pi=Modelica.Constants.pi;
  parameter Real wbase=2*pi*50 "System base speed";
  parameter Real H "Total inertia constant sec";
  parameter Real DAMP "Machine damping factor pu P/pu speed";
  parameter Real Htfrac "Turbine inertia fraction (Hturb/H)";
  // To simulate one-mass mechanical system set Htfrac = 0.";
  // To simulate two-mass mechanical system set Htfrac as 0 < Htfrac < 1.";
  parameter Real Freq1 "First shaft torsional resonant frequency Hz";
  parameter Real Dshaft "Shaft damping factor (pu)";
  parameter Real k0(fixed=false) "Shaft twist angle, rad";
  parameter Real k10(fixed=false) "Turbine rotor speed deviation, pu";
  parameter Real k20(fixed=false) "Generator speed deviation, pu";
  parameter Real k30(fixed=false) "Generator rotor angle deviation, pu";
  parameter Real Ht=H*Htfrac;
  parameter Real Hg=H - Ht;
  parameter Real Kshaft(fixed=false);
  parameter Real Paero(fixed=false) "power on the rotor blade side, pu";
  parameter Real w0(fixed=false) "Initial rotor slip";
  parameter Real delta0(fixed=false) "Initial internal angle";
  Modelica.Blocks.Interfaces.RealOutput WTRBSP annotation (Placement(transformation(extent={{94,0},{114,20}}), iconTransformation(extent={{90,-64},{110,-44}})));
  Modelica.Blocks.Continuous.Integrator dwt(
    y_start=k10,
    k=1/(2*Ht),
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    "Turbine speed deviation, pu"                                                    annotation (Placement(transformation(extent={{0,14},{10,24}})));
  Modelica.Blocks.Math.Add Tmech1 annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-77,15})));
  Modelica.Blocks.Math.Add add3(k2=-1) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-11,19})));
  Modelica.Blocks.Interfaces.RealInput WAEROT "From WT12A" annotation (Placement(transformation(extent={{-106,60},{-92,74}})));
  Modelica.Blocks.Math.Gain D_shaft(k=Dshaft) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-36,-14})));
  Modelica.Blocks.Math.Add dwtg(k2=-1) annotation (Placement(transformation(
        extent={{-4,4},{4,-4}},
        rotation=180,
        origin={12,-14})));
  Modelica.Blocks.Math.Gain WBASE(k=wbase) annotation (Placement(transformation(extent={{26,14},{36,24}})));
  Modelica.Blocks.Math.Add add5(k2=-1) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={45,1})));
  Modelica.Blocks.Math.Gain WBASE1(k=wbase) annotation (Placement(transformation(extent={{24,-54},{34,-44}})));
  Modelica.Blocks.Interfaces.RealOutput SPEED annotation (Placement(transformation(extent={{94,-42},{114,-22}}), iconTransformation(extent={{90,-36},{110,-16}})));
  Modelica.Blocks.Continuous.Integrator dwg(
    k=1/(2*Hg),
    y_start=k20,
    initType=Modelica.Blocks.Types.Init.InitialOutput) annotation (Placement(transformation(extent={{-36,-54},{-26,-44}})));
  Modelica.Blocks.Math.Gain Damp(k=DAMP) annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=180,
        origin={-28,-34})));
  Modelica.Blocks.Math.Add3 add3_1(k1=-1, k3=-1) annotation (Placement(transformation(extent={{-54,-54},{-44,-44}})));
  Modelica.Blocks.Interfaces.RealInput Pelec annotation (Placement(transformation(
        extent={{-11,-11},{11,11}},
        rotation=90,
        origin={-67,-91}), iconTransformation(
        extent={{-13.5,-13.5},{13.5,13.5}},
        rotation=270,
        origin={-25.5,88.5})));
  Modelica.Blocks.Math.Add Tmech annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-77,-49})));
  Modelica.Blocks.Continuous.Integrator theta_tg(
    k=Kshaft,
    y_start=k0,
    initType=Modelica.Blocks.Types.Init.InitialOutput) annotation (Placement(transformation(extent={{56,-4},{66,6}})));
  Modelica.Blocks.Interfaces.RealOutput RotorAD "Rotor angle deviation" annotation (Placement(transformation(extent={{94,-80},{112,-62}}), iconTransformation(extent={{90,-88},{108,-70}})));
  Modelica.Blocks.Continuous.Integrator state4(k=1, y_start=k30) annotation (Placement(transformation(extent={{62,-76},{72,-66}})));
  Modelica.Blocks.Math.Add add2(k2=-1) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={33,-71})));
  Modelica.Blocks.Sources.Constant VAR1(k=w0) "Initial rotor slip" annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=180,
        origin={8,-74})));
  Modelica.Blocks.Math.Gain WBASE2(k=wbase) annotation (Placement(transformation(extent={{48,-76},{58,-66}})));
  Modelica.Blocks.Math.Division product2 annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={-64,-68})));
  Modelica.Blocks.Math.Add wg annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={-37,-79})));
  Modelica.Blocks.Sources.Constant const(k=1) "Initial rotor slip" annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=0,
        origin={-18,-86})));
initial equation
  k0 = 0;
  k10 = 0;
  k20 = 0;
  k30 = 0;
  Kshaft = 2*Ht*Hg*(2*pi*Freq1)^2/(H*w0);
  Paero = 0;
  w0 = k20;
  delta0 = 0;
equation
  connect(Tmech1.y, add3.u2) annotation (Line(
      points={{-71.5,15},{-22,15},{-22,16},{-17,16}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(WAEROT, add3.u1) annotation (Line(
      points={{-99,67},{-22,67},{-22,22},{-17,22}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(D_shaft.u, dwtg.y) annotation (Line(
      points={{-28.8,-14},{7.6,-14}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(WBASE.y, add5.u1) annotation (Line(
      points={{36.5,19},{38,19},{38,4},{39,4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(WBASE1.y, add5.u2) annotation (Line(
      points={{34.5,-49},{38,-49},{38,-2},{39,-2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(dwtg.u2, WBASE1.u) annotation (Line(
      points={{16.8,-16.4},{20,-16.4},{20,-49},{23,-49}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(SPEED, dwtg.u2) annotation (Line(
      points={{104,-32},{20,-32},{20,-16.4},{16.8,-16.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Damp.y, add3_1.u1) annotation (Line(
      points={{-32.4,-34},{-62,-34},{-62,-45},{-55,-45}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tmech.y, add3_1.u2) annotation (Line(
      points={{-71.5,-49},{-55,-49}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(D_shaft.y, Tmech1.u2) annotation (Line(
      points={{-42.6,-14},{-98,-14},{-98,12},{-83,12}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(D_shaft.y, Tmech.u1) annotation (Line(
      points={{-42.6,-14},{-98,-14},{-98,-46},{-83,-46}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VAR1.y, add2.u2) annotation (Line(
      points={{14.6,-74},{27,-74}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add2.u1, WBASE1.u) annotation (Line(
      points={{27,-68},{20,-68},{20,-49},{23,-49}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(product2.y, add3_1.u3) annotation (Line(
      points={{-64,-63.6},{-64,-53},{-55,-53}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(product2.u1, Pelec) annotation (Line(
      points={{-66.4,-72.8},{-66.4,-79.4},{-67,-79.4},{-67,-91}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, wg.u1) annotation (Line(
      points={{-24.6,-86},{-31,-86},{-31,-82}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(product2.u2, wg.y) annotation (Line(
      points={{-61.6,-72.8},{-61.6,-79},{-42.5,-79}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add2.y, WBASE2.u) annotation (Line(
      points={{38.5,-71},{42.25,-71},{42.25,-71},{47,-71}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(dwt.u, add3.y) annotation (Line(points={{-1,19},{-4,19},{-5.5,19}}, color={0,0,127}));
  connect(dwt.y, WBASE.u) annotation (Line(points={{10.5,19},{17.25,19},{25,19}}, color={0,0,127}));
  connect(dwtg.u1, WBASE.u) annotation (Line(points={{16.8,-11.6},{20,-11.6},{20,19},{25,19}}, color={0,0,127}));
  connect(WTRBSP, WBASE.u) annotation (Line(points={{104,10},{20,10},{20,19},{25,19}}, color={0,0,127}));
  connect(add3_1.y, dwg.u) annotation (Line(points={{-43.5,-49},{-37,-49}}, color={0,0,127}));
  connect(dwg.y, WBASE1.u) annotation (Line(points={{-25.5,-49},{20,-49},{23,-49}}, color={0,0,127}));
  connect(Damp.u, WBASE1.u) annotation (Line(points={{-23.2,-34},{-8,-34},{-8,-49},{20,-49},{23,-49}}, color={0,0,127}));
  connect(wg.u2, WBASE1.u) annotation (Line(points={{-31,-76},{-8,-76},{-8,-49},{20,-49},{23,-49}}, color={0,0,127}));
  connect(WBASE2.y, state4.u) annotation (Line(points={{58.5,-71},{59.25,-71},{59.25,-71},{61,-71}}, color={0,0,127}));
  connect(state4.y, RotorAD) annotation (Line(points={{72.5,-71},{84.25,-71},{84.25,-71},{103,-71}}, color={0,0,127}));
  connect(add5.y, theta_tg.u) annotation (Line(points={{50.5,1},{52.25,1},{55,1}}, color={0,0,127}));
  connect(theta_tg.y, Tmech1.u1) annotation (Line(points={{66.5,1},{76,1},{76,38},{-98,38},{-98,18},{-83,18}}, color={0,0,127}));
  connect(Tmech.u2, Tmech1.u1) annotation (Line(points={{-83,-52},{-98,-52},{-98,-96},{76,-96},{76,38},{-98,38},{-98,18},{-83,18}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Text(
          extent={{48,0},{72,-24}},
          lineColor={255,0,0},
          textString="K
Shaft twist angle, rad."),Text(
          extent={{-16,18},{8,-6}},
          lineColor={255,0,0},
          textString="K+1
Turbine rotor speed deviation, pu"),Text(
          extent={{-44,-48},{-20,-72}},
          lineColor={255,0,0},
          textString="K+2
Generator speed deviation, pu"),Text(
          extent={{52,-70},{76,-94}},
          lineColor={255,0,0},
          textString="K+3
Generator rotor angle deviation, pu"),Text(
          extent={{-2,-78},{18,-94}},
          lineColor={255,0,0},
          textString="VAR(L+1)
Initial Rotor Slip"),Text(
          extent={{0,32},{10,24}},
          lineColor={255,0,0},
          textString="dwt"),Text(
          extent={{-24,-38},{-14,-46}},
          lineColor={255,0,0},
          textString="dwg"),Text(
          extent={{-16,-4},{-2,-12}},
          lineColor={255,0,0},
          textString="dwtg"),Text(
          extent={{76,4},{92,-10}},
          lineColor={255,0,0},
          textString="theta_tg")}),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-104,92},{94,-92}}, lineColor={0,0,255}),Text(
          extent={{-84,68},{80,-60}},
          lineColor={0,0,255},
          textString="Wind Turbine
Model (WT3T1)")}),
    Documentation(revisions="<html>
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
end WT12T1;
