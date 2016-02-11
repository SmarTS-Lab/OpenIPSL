within iPSL.Electrical.Solar.KTH;
model PFblocks
  model PVnew
    iPSL.Electrical.Solar.KTH.Auxiliary.PVarray PVarray1(
      Estc=Estc,
      Imp=Imp,
      Iscref=Iscref,
      Ki=Ki,
      Kv=Kv,
      Tstc=Tstc,
      Vmp=Vmp,
      Vocref=Vocref) annotation (Placement(visible=true, transformation(
          origin={-10.0,5.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealInput E annotation (Placement(
        visible=true,
        transformation(
          origin={-170.0,10.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0),
        iconTransformation(
          origin={-120.0,0.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput Iarray annotation (Placement(
        visible=true,
        transformation(
          origin={141.6223,2.7793},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0),
        iconTransformation(
          origin={110.0,0.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealInput T annotation (Placement(
        visible=true,
        transformation(
          origin={-170.0,-27.9545},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0),
        iconTransformation(
          origin={-120.0,-70.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput Varray annotation (Placement(
        visible=true,
        transformation(
          origin={141.8597,-20.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0),
        iconTransformation(
          origin={110.0,70.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealInput Udc annotation (Placement(
        visible=true,
        transformation(
          origin={-170.0,60.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0),
        iconTransformation(
          origin={-120.0,70.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput PowerArray annotation (Placement(
        visible=true,
        transformation(
          origin={142.6599,-43.318},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0),
        iconTransformation(
          origin={110.0,-63.8978},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Math.Gain gain1(k=1/nSerialModules) annotation (Placement(visible=true, transformation(
          origin={-70.0,60.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Math.Gain gain2(k=nParallelModules) annotation (Placement(visible=true, transformation(
          origin={68.072,10.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Math.Gain gain3(k=nSerialModules) annotation (Placement(visible=true, transformation(
          origin={70.0,-28.0297},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Math.Product product1 annotation (Placement(visible=true, transformation(
          origin={60.0,60.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    parameter Real nSerialModules=20;
    parameter Real nParallelModules=140;
    parameter Real Tdelay=0.05;
    parameter Real Imp=4.58 "Current at maximum power";
    parameter Real Vmp=35 "Voltage at maximum power";
    parameter Real Iscref=5 "Module short-circuit current reference at reference temp and irradiance";
    parameter Real Vocref=43.8 "Module open-circuit voltage reference at reference temp and irradiance";
    parameter Real Kv=-0.0039 "temperature correction factor for the voltage";
    parameter Real Ki=0.0004 "temperature correction factor for the current";
    parameter Real Tstc=25 "Temperature at the standard test conditions";
    parameter Real Estc=1000 "Irradiance at the standard test conditions";
  equation
    connect(Udc, gain1.u) annotation (Line(
        visible=true,
        origin={-126.0,60.0},
        points={{-44.0,0.0},{44.0,0.0}},
        color={0,0,127}));
    connect(gain2.y, Iarray) annotation (Line(
        visible=true,
        origin={119.3722,6.3896},
        points={{-40.3002,3.6104},{9.0251,3.6104},{9.0251,-3.6103},{22.2501,-3.6103}},
        color={0,0,127}));
    connect(gain3.y, Varray)
      annotation (Line(
        visible=true,
        origin={120.0322,-24.0148},
        points={{-39.0322,-4.0149},{8.6024,-4.0148},{8.6024,4.0148},{21.8275,4.0148}},
        color={0,0,127}));
    connect(product1.y, PowerArray)
      annotation (Line(
        visible=true,
        origin={115.264,-2.6636},
        points={{-44.264,62.6636},{-5.264,62.6636},{-5.264,-42.3364},{27.3959,-42.3364},{27.3959,-40.6544}},
        color={0,0,127}));
    connect(T, PVarray1.T) annotation (Line(
        visible=true,
        origin={-60.5,-14.9773},
        points={{-109.5,-12.9772},{35.5,-12.9773},{35.5,12.9773},{38.5,12.9773}},
        color={0,0,127}));
    connect(Udc, product1.u1) annotation (Line(
        visible=true,
        origin={-66.8,71.2},
        points={{-103.2,-11.2},{-63.2,-11.2},{-63.2,13.8},{114.8,13.8},{114.8,-5.2}},
        color={0,0,127}));
    connect(PVarray1.E, E) annotation (Line(
        visible=true,
        origin={-121.275,7.5},
        points={{99.275,-2.5},{-25.275,-2.5},{-25.275,2.5},{-48.725,2.5}},
        color={0,0,127}));
    connect(PVarray1.V, gain3.u)
      annotation (Line(
        visible=true,
        origin={42.25,-13.2285},
        points={{-41.25,14.8011},{12.75,14.8011},{12.75,-14.8012},{15.75,-14.8012}},
        color={0,0,127}));
    connect(gain2.y, product1.u2) annotation (Line(
        visible=true,
        origin={63.536,33.8119},
        points={{15.536,-23.8119},{18.536,-23.8119},{18.536,3.6238},{-18.536,3.6238},{-18.536,20.1881},{-15.536,20.1881}},
        color={0,0,127}));
    connect(PVarray1.I, gain2.u) annotation (Line(
        visible=true,
        origin={40.804,9.5},
        points={{-39.804,-0.5},{12.268,-0.5},{12.268,0.5},{15.268,0.5}},
        color={0,0,127}));
    connect(gain1.y, PVarray1.V1)
      annotation (Line(
        visible=true,
        origin={-36.6,31.1287},
        points={{-22.4,28.8713},{-3.4,28.8713},{-3.4,-19.3069},{14.6,-19.3069},{14.6,-19.1287}},
        color={0,0,127}));
    annotation (
      Icon(coordinateSystem(
          extent={{-100.0,-100.0},{100.0,100.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={10,10}), graphics={
          Rectangle(
            visible=true,
            fillColor={255,255,255},
            extent={{-100.0,-100.0},{100.0,100.0}}),
          Text(
            visible=true,
            origin={0.8251,1.0405},
            fillPattern=FillPattern.Solid,
            extent={{-39.1749,-15.0129},{39.1749,15.0129}},
            textString="PVnew",
            fontName="Arial"),
          Text(
            visible=true,
            origin={-74.7566,70.0},
            fillPattern=FillPattern.Solid,
            extent={{-20.0,-13.9876},{20.0,13.9876}},
            textString="Vdc(700)",
            fontName="Arial"),
          Text(
            visible=true,
            origin={-75.6751,-0.0},
            fillPattern=FillPattern.Solid,
            extent={{-20.0,-13.9876},{20.0,13.9876}},
            textString="E(1000)",
            fontName="Arial"),
          Text(
            visible=true,
            origin={-74.8099,-67.7542},
            fillPattern=FillPattern.Solid,
            extent={{-20.0,-13.9876},{20.0,13.9876}},
            textString="Tref(25)",
            fontName="Arial"),
          Text(
            visible=true,
            origin={68.1573,71.699},
            fillPattern=FillPattern.Solid,
            extent={{-20.0,-13.9876},{20.0,13.9876}},
            textString="Varray",
            fontName="Arial"),
          Text(
            visible=true,
            origin={74.6709,-0.0},
            fillPattern=FillPattern.Solid,
            extent={{-20.0,-13.9876},{20.0,13.9876}},
            textString="Iarray",
            fontName="Arial"),
          Text(
            visible=true,
            origin={74.3469,-62.1058},
            fillPattern=FillPattern.Solid,
            extent={{-20.0,-13.9876},{20.0,13.9876}},
            textString="Parray",
            fontName="Arial")}),
      Diagram(coordinateSystem(
          extent={{-148.5,-105.0},{148.5,105.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={5,5})),
      Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>TBD</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>TBD</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
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
  end PVnew;

  model MPPT
    Modelica.Blocks.Interfaces.RealOutput Vdref(start=700) annotation (Placement(
        visible=true,
        transformation(
          origin={187.3027,-0.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0),
        iconTransformation(
          origin={110.0,0.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealInput Varray(start=700) annotation (Placement(
        visible=true,
        transformation(
          origin={-168.4441,40.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0),
        iconTransformation(
          origin={-120.0,40.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealInput Iarray(start=641.2) annotation (Placement(
        visible=true,
        transformation(
          origin={-168.0142,-28.0297},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0),
        iconTransformation(
          origin={-120.0,-50.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0)));
    parameter Real Tdelay1=0.0045;
    parameter Real Tdelay=0.005;
    parameter Real Vbase=1;
    parameter Real Vmpp0_array=700;
    parameter Real Step=125;
    Modelica.Blocks.Math.Add add1(k2=-1) annotation (Placement(visible=true, transformation(
          origin={0.0,40.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Math.Add add2(k2=-1) annotation (Placement(visible=true, transformation(
          origin={-1.9703,-25.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Solar.KTH.Auxiliary.InputSelectorEpsilon inputSelectorEpsilon1
      annotation (Placement(visible=true, transformation(
          origin={65.0,5.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Math.Gain gain1(k=Vmpp0_array*Tdelay/Step)
      annotation (Placement(visible=true, transformation(
          origin={95.0,5.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Math.Add add3(k2=+1) annotation (Placement(visible=true, transformation(
          origin={123.0297,35.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Nonlinear.FixedDelay fixedDelay4(delayTime=Tdelay1)
      annotation (Placement(visible=true, transformation(
          origin={-45.0,-26.7774},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Nonlinear.FixedDelay fixedDelay3(delayTime=Tdelay1)
      annotation (Placement(visible=true, transformation(
          origin={-52.3186,40.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Nonlinear.FixedDelay fixedDelay2(delayTime=Tdelay)
      annotation (Placement(visible=true, transformation(
          origin={-106.6572,-25.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Nonlinear.FixedDelay fixedDelay1(delayTime=Tdelay)
      annotation (Placement(visible=true, transformation(
          origin={-106.6255,40.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
  equation
    connect(fixedDelay1.y, inputSelectorEpsilon1.vd) annotation (Line(
        visible=true,
        origin={-59.6663,23.3137},
        points={{-35.9592,16.6863},{-20.3337,16.6863},{-20.3337,-6.144},{-18.0199,-6.144},{-18.0199,-10.5423},{112.666,-10.5423}},
        color={0,0,127}));
    connect(fixedDelay2.y, inputSelectorEpsilon1.id) annotation (Line(
        visible=true,
        origin={-33.9199,-5.4748},
        points={{-61.7373,-19.5252},{-51.5513,-19.5252},{-51.5513,13.0745},{86.9199,13.0745},{86.9199,12.9015}},
        color={0,0,127}));
    connect(add1.y, inputSelectorEpsilon1.dv) annotation (Line(
        visible=true,
        origin={34.4337,17.6894},
        points={{-23.4337,22.3106},{-6.8495,22.3106},{-6.8495,-14.5932},{18.5663,-14.5932},{18.5663,-15.4347}},
        color={0,0,127}));
    connect(inputSelectorEpsilon1.di, add2.y)
      annotation (Line(
        visible=true,
        origin={21.5223,-14.2005},
        points={{31.4777,10.7996},{-9.4926,10.7996},{-9.4926,-10.7995},{-12.4926,-10.7995}},
        color={0,0,127}));
    connect(fixedDelay1.y, add3.u1)
      annotation (Line(
        visible=true,
        origin={-12.7429,50.2},
        points={{-82.8826,-10.2},{-73.2868,-10.2},{-73.2868,14.8},{123.773,14.8},{123.773,-9.2}},
        color={0,0,127}));
    connect(fixedDelay1.y, add1.u1)
      annotation (Line(
        visible=true,
        origin={-55.9251,49.2},
        points={{-39.7004,-9.2},{-24.0749,-9.2},{-24.0749,10.8},{43.9251,10.8},{43.9251,-3.2}},
        color={0,0,127}));
    connect(fixedDelay1.y, fixedDelay3.u) annotation (Line(
        visible=true,
        origin={-79.972,40.0},
        points={{-15.6535,0},{15.6534,0}},
        color={0,0,127}));
    connect(Varray, fixedDelay1.u) annotation (Line(
        visible=true,
        origin={-143.5348,40.0},
        points={{-24.9093,0},{24.9093,0}},
        color={0,0,127}));
    connect(fixedDelay2.y, add2.u1) annotation (Line(
        visible=true,
        origin={-57.5163,-14.6141},
        points={{-38.1409,-10.3859},{-24.4755,-10.3859},{-24.4755,12.5788},{43.546,12.5788},{43.546,-4.3859}},
        color={0,0,127}));
    connect(fixedDelay2.y, fixedDelay4.u)
      annotation (Line(
        visible=true,
        origin={-68.1643,-25.8887},
        points={{-27.4929,0.8887},{8.1643,0.8887},{8.1643,-0.8887},{11.1643,-0.8887}},
        color={0,0,127}));
    connect(Iarray, fixedDelay2.u)
      annotation (Line(
        visible=true,
        origin={-132.4965,-26.5148},
        points={{-35.5177,-1.5149},{10.8392,-1.5148},{10.8392,1.5148},{13.8393,1.5148}},
        color={0,0,127}));
    connect(fixedDelay3.y, add1.u2) annotation (Line(
        visible=true,
        origin={-20.8296,37.0},
        points={{-20.489,3.0},{5.8296,3.0},{5.8296,-3.0},{8.8296,-3.0}},
        color={0,0,127}));
    connect(fixedDelay4.y, add2.u2)
      annotation (Line(
        visible=true,
        origin={-20.4777,-28.8887},
        points={{-13.5223,2.1113},{3.5074,2.1113},{3.5074,-2.1113},{6.5074,-2.1113}},
        color={0,0,127}));
    connect(add3.y, Vdref) annotation (Line(
        visible=true,
        origin={162.8331,17.5},
        points={{-28.8034,17.5},{2.1669,17.5},{2.1669,-17.5},{24.4696,-17.5}},
        color={0,0,127}));
    connect(inputSelectorEpsilon1.k, gain1.u) annotation (Line(
        visible=true,
        origin={79.5,5.0},
        points={{-3.5,0.0},{3.5,0.0}},
        color={0,0,127}));
    connect(gain1.y, add3.u2) annotation (Line(
        visible=true,
        origin={108.5148,17.4083},
        points={{-2.5148,-12.4083},{0.4852,-12.4083},{0.4852,0.8167},{-0.4852,0.8167},{-0.4852,11.5917},{2.5149,11.5917}},
        color={0,0,127}));
    annotation (
      Icon(coordinateSystem(
          extent={{-100.0,-100.0},{100.0,100.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={10,10}), graphics={
          Rectangle(
            visible=true,
            fillColor={255,255,255},
            extent={{-100.0,-100.0},{100.0,100.0}}),
          Text(
            visible=true,
            origin={-2.5936,-0.1486},
            fillPattern=FillPattern.Solid,
            extent={{-42.5936,-24.8233},{42.5936,24.8233}},
            textString="%name",
            fontName="Arial"),
          Text(
            visible=true,
            origin={-76.6608,38.9853},
            fillPattern=FillPattern.Solid,
            extent={{-13.3392,-18.9853},{13.3392,18.9853}},
            textString="Varray",
            fontName="Arial"),
          Text(
            visible=true,
            origin={-73.5779,-52.1735},
            fillPattern=FillPattern.Solid,
            extent={{-18.8776,-14.7156},{18.8776,14.7156}},
            textString="Iarray",
            fontName="Arial"),
          Text(
            visible=true,
            origin={83.3883,-0.7022},
            fillPattern=FillPattern.Solid,
            extent={{-9.6618,-10.7022},{9.6618,10.7022}},
            textString="Vdref",
            fontName="Arial")}),
      Diagram(coordinateSystem(
          extent={{-148.5,-105.0},{148.5,105.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={5,5})),
      Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>TBD</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>TBD</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
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
  end MPPT;

  model DCBusBar
    parameter Real Pnen=0.5 "MW rated power";
    parameter Real UdcN=1 "kV Nominal DC voltage";
    parameter Real C=0.0172 "s of capacitor on DC busbar";
    parameter Real Udc0=700 "Intial dc voltage";
    Modelica.Blocks.Interfaces.RealInput Pac "voltage array" annotation (Placement(
        visible=true,
        transformation(
          origin={-168.2447,-30.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0),
        iconTransformation(
          origin={-120.0,60.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealInput Ipv "current array" annotation (Placement(
        visible=true,
        transformation(
          origin={-168.0962,67.0723},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0),
        iconTransformation(
          origin={-120.0,-30.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput Vdc(start=Udc0) annotation (Placement(
        visible=true,
        transformation(
          origin={160.0,-0.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0),
        iconTransformation(
          origin={110.0,0.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Math.Add add1(k2=-1) annotation (Placement(visible=true, transformation(
          origin={-50.0,0.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=876, uMin=0)
      annotation (Placement(visible=true, transformation(
          origin={100.0,0.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Solar.KTH.Auxiliary.Calcurrent calcurrent1(Udc0=Udc0)
      annotation (Placement(visible=true, transformation(
          origin={-108.3112,-33.4951},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Solar.KTH.Auxiliary.AtoPU atoPU1(Pnen=Pnen, UdcN=UdcN)
      annotation (Placement(visible=true, transformation(
          origin={-22.2363,0.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Solar.KTH.Auxiliary.Capacitor capacitor1(
      C=C,
      Udc0=Udc0,
      UdcN=UdcN) annotation (Placement(visible=true, transformation(
          origin={7.8812,0.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Solar.KTH.Auxiliary.pu_to_A pu_to_A1(Pnen=Pnen, UdcN=UdcN)
      annotation (Placement(visible=true, transformation(
          origin={40.0,0.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
  equation
    connect(limiter1.y, Vdc) annotation (Line(
        visible=true,
        origin={135.5,0.0},
        points={{-24.5,0.0},{24.5,0.0}},
        color={0,0,127}));
    connect(pu_to_A1.y0, limiter1.u) annotation (Line(
        visible=true,
        origin={69.5,0.0},
        points={{-18.5,0.0},{18.5,-0.0}},
        color={0,0,127}));
    connect(capacitor1.y0, pu_to_A1.yi) annotation (Line(
        visible=true,
        origin={23.4406,0.0},
        points={{-4.5594,0.0},{4.5594,-0.0}},
        color={0,0,127}));
    connect(capacitor1.yi, atoPU1.y0) annotation (Line(
        visible=true,
        origin={-7.6775,0.0},
        points={{3.5587,0},{-3.5588,0}},
        color={0,0,127}));
    connect(add1.y, atoPU1.yi) annotation (Line(
        visible=true,
        origin={-36.6181,0.0},
        points={{-2.3819,0},{2.3818,0}},
        color={0,0,127}));
    connect(add1.u2, calcurrent1.yo) annotation (Line(
        visible=true,
        origin={-77.3245,-22.3845},
        points={{15.3245,16.3845},{12.3245,16.3845},{12.3245,-10.8292},{-19.9867,-10.8292},{-19.9867,-11.1106}},
        color={0,0,127}));
    connect(Ipv, add1.u1)
      annotation (Line(
        visible=true,
        origin={-90.0241,36.5361},
        points={{-78.0721,30.5362},{25.0241,30.5362},{25.0241,-30.5361},{28.0241,-30.5361}},
        color={0,0,127}));
    connect(calcurrent1.udc, Vdc) annotation (Line(
        visible=true,
        origin={-30.4173,-44.0824},
        points={{-89.8939,5.5873},{-106.096,5.5873},{-106.096,-23.7522},{-104.583,-23.7522},{-104.583,-25.9176},{160.417,-25.9176},{160.417,44.0824},{190.417,44.0824}},
        color={0,0,127}));
    connect(Pac, calcurrent1.yi)
      annotation (Line(
        visible=true,
        origin={-133.7946,-29.7476},
        points={{-34.4501,-0.2524},{10.4834,-0.2524},{10.4834,0.2525},{13.4834,0.2525}},
        color={0,0,127}));
    annotation (
      Icon(coordinateSystem(
          extent={{-100.0,-100.0},{100.0,100.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={10,10}), graphics={
          Rectangle(
            visible=true,
            fillColor={255,255,255},
            extent={{-100.0,-100.0},{100.0,100.0}}),
          Text(
            visible=true,
            origin={-50.0,60.0},
            fillPattern=FillPattern.Solid,
            extent={{-47.2303,-30.0},{47.2303,30.0}},
            textString="Pac [MW]",
            fontName="Arial"),
          Text(
            visible=true,
            origin={-68.5241,-31.9581},
            fillPattern=FillPattern.Solid,
            extent={{-15.9047,-15.0129},{15.9047,15.0129}},
            textString="Ipv",
            fontName="Arial"),
          Text(
            visible=true,
            origin={70.0,0.0},
            fillPattern=FillPattern.Solid,
            extent={{-23.1601,-13.4726},{23.1601,13.4726}},
            textString="Vdc",
            fontName="Arial")}),
      Diagram(coordinateSystem(
          extent={{-148.5,-105.0},{148.5,105.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={5,5})),
      Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>TBD</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>TBD</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
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
  end DCBusBar;

  model Controller
    parameter Real v0=1;
    parameter Real ibase=1.02;
    parameter Real ibase_iq=1;
    parameter Real Kdc=-0.005 "DC voltage Controller Gain";
    parameter Real Tdc=0.0015 "DC controller time constant";
    parameter Real id_max=1;
    parameter Real id_min=0;
    parameter Real Kac=-2.346 "AC voltage Controller Gain";
    parameter Real Tac=-0.0002131 "AC controller time constant";
    parameter Real iq_max=3;
    parameter Real iq_min=-3;
    parameter Real xq=1 "Initialitation";
    parameter Real xd=1 "Initialitation";
    Modelica.Blocks.Interfaces.RealInput udc annotation (Placement(
        visible=true,
        transformation(
          origin={-168.0386,-48.3466},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0),
        iconTransformation(
          origin={-120.0,-30.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput id_ref annotation (Placement(
        visible=true,
        transformation(
          origin={160.0,45.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0),
        iconTransformation(
          origin={110.0,40.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealInput Vdcref annotation (Placement(
        visible=true,
        transformation(
          origin={-168.3642,-81.5161},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0),
        iconTransformation(
          origin={-120.0,-80.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0)));
    Modelica.Blocks.Math.Add add1(k1=-1) annotation (Placement(visible=true, transformation(
          origin={-85.0,-65.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=id_max, uMin=id_min)
      annotation (Placement(visible=true, transformation(
          origin={-11.5403,-65.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Math.Gain gain1(k=1/ibase) annotation (Placement(visible=true, transformation(
          origin={16.5869,-65.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealInput uac annotation (Placement(
        visible=true,
        transformation(
          origin={-168.3642,60.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0),
        iconTransformation(
          origin={-120.0,70.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealInput Vacref annotation (Placement(
        visible=true,
        transformation(
          origin={-168.1269,30.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0),
        iconTransformation(
          origin={-120.0,20.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0)));
    Modelica.Blocks.Math.Add add2(k1=-1) annotation (Placement(visible=true, transformation(
          origin={-95.0,48.1957},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Nonlinear.Limiter limiter2(uMax=iq_max, uMin=iq_min)
      annotation (Placement(visible=true, transformation(
          origin={-26.5403,47.3513},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Math.Gain gain2(k=1/ibase_iq) annotation (Placement(visible=true, transformation(
          origin={10.0,47.3513},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput iq_ref annotation (Placement(
        visible=true,
        transformation(
          origin={160.0,-60.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0),
        iconTransformation(
          origin={110.0,-48.2723},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Solar.KTH.Auxiliary.PI PI2(
      K=Kdc,
      T=Tdc,
      xo=xd,
      Ymax=id_max,
      Ymin=id_min) annotation (Placement(visible=true, transformation(
          origin={-50.0,-65.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Solar.KTH.Auxiliary.PI PI3(
      K=Kac,
      T=0.0005,
      Ymax=iq_max,
      Ymin=iq_min,
      xo=xq) annotation (Placement(visible=true, transformation(
          origin={-65.0,47.5332},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Solar.KTH.Auxiliary.SimpleLagg simpleLagg1(xo=v0)
      annotation (Placement(visible=true, transformation(
          origin={-132.2917,60.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
  equation
    connect(id_ref, gain1.y) annotation (Line(
        visible=true,
        origin={97.9312,-8.9184},
        points={{62.0688,53.9184},{27.0688,53.9184},{27.0688,2.1631},{-22.9312,2.1631},{-22.9312,-56.0816},{-70.3443,-56.0816}},
        color={0,0,127}));
    connect(PI2.yo, limiter1.u) annotation (Line(
        visible=true,
        origin={-31.2702,-65.0},
        points={{-7.7298,0},{7.7299,0}},
        color={0,0,127}));
    connect(add1.y, PI2.yi) annotation (Line(
        visible=true,
        origin={-68.0,-65.0},
        points={{-6.0,0.0},{6.0,0.0}},
        color={0,0,127}));
    connect(simpleLagg1.yo, add2.u1)
      annotation (Line(
        visible=true,
        origin={-117.0729,57.0978},
        points={{-4.2188,2.9022},{-2.9271,2.9022},{-2.9271,-2.9021},{10.0729,-2.9021}},
        color={0,0,127}));
    connect(uac, simpleLagg1.yi) annotation (Line(
        visible=true,
        origin={-156.3279,60.0},
        points={{-12.0363,0.0},{12.0362,0.0}},
        color={0,0,127}));
    connect(PI3.yo, limiter2.u)
      annotation (Line(
        visible=true,
        origin={-43.9052,47.4423},
        points={{-10.0948,0.0909},{2.3649,0.0909},{2.3649,-0.091},{5.3649,-0.091}},
        color={0,0,127}));
    connect(add2.y, PI3.yi) annotation (Line(
        visible=true,
        origin={-80.25,47.8645},
        points={{-3.75,0.3312},{0.25,0.3312},{0.25,-0.3313},{3.25,-0.3313}},
        color={0,0,127}));
    connect(udc, add1.u1)
      annotation (Line(
        visible=true,
        origin={-116.2596,-53.6733},
        points={{-51.779,5.3267},{16.2596,5.3267},{16.2596,-5.3267},{19.2596,-5.3267}},
        color={0,0,127}));
    connect(gain2.y, iq_ref) annotation (Line(
        visible=true,
        origin={97.75,-6.3243},
        points={{-76.75,53.6756},{7.25,53.6757},{7.25,-53.6757},{62.25,-53.6757}},
        color={0,0,127}));
    connect(Vdcref, add1.u2) annotation (Line(
        visible=true,
        origin={-116.341,-76.258},
        points={{-52.0232,-5.2581},{16.341,-5.258},{16.341,5.258},{19.341,5.258}},
        color={0,0,127}));
    connect(add2.u2, Vacref)
      annotation (Line(
        visible=true,
        origin={-141.1202,36.0979},
        points={{34.1202,6.0978},{-3.5567,6.0979},{-3.5567,-6.0979},{-27.0067,-6.0979}},
        color={0,0,127}));
    connect(limiter2.y, gain2.u) annotation (Line(
        visible=true,
        origin={-8.7701,47.3513},
        points={{-6.7702,0},{6.7701,0}},
        color={0,0,127}));
    connect(limiter1.y, gain1.u) annotation (Line(
        visible=true,
        origin={2.0233,-65.0},
        points={{-2.5636,0},{2.5636,0}},
        color={0,0,127}));
    annotation (
      Icon(coordinateSystem(
          extent={{-100.0,-100.0},{100.0,100.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={10,10}), graphics={
          Rectangle(
            visible=true,
            fillColor={255,255,255},
            extent={{-100.0,-100.0},{100.0,100.0}}),
          Text(
            visible=true,
            origin={2.9728,2.2168},
            fillPattern=FillPattern.Solid,
            extent={{-41.0253,-27.7832},{41.0253,27.7832}},
            textString="Controller",
            fontName="Arial"),
          Text(
            visible=true,
            origin={-70.0,72.8039},
            fillPattern=FillPattern.Solid,
            extent={{-25.3921,-17.1961},{25.3921,17.1961}},
            textString="vac",
            fontName="Arial"),
          Text(
            visible=true,
            origin={-71.5131,22.8039},
            fillPattern=FillPattern.Solid,
            extent={{-25.3921,-17.1961},{25.3921,17.1961}},
            textString="vacref",
            fontName="Arial"),
          Text(
            visible=true,
            origin={-70.0,-27.1961},
            fillPattern=FillPattern.Solid,
            extent={{-25.3921,-17.1961},{25.3921,17.1961}},
            textString="vdc",
            fontName="Arial"),
          Text(
            visible=true,
            origin={-71.8371,-80.0},
            fillPattern=FillPattern.Solid,
            extent={{-25.3921,-17.1961},{25.3921,17.1961}},
            textString="vdcref",
            fontName="Arial"),
          Text(
            visible=true,
            origin={67.86,42.8039},
            fillPattern=FillPattern.Solid,
            extent={{-25.3921,-17.1961},{25.3921,17.1961}},
            textString="id_ref",
            fontName="Arial"),
          Text(
            visible=true,
            origin={68.1306,-47.1961},
            fillPattern=FillPattern.Solid,
            extent={{-25.3921,-17.1961},{25.3921,17.1961}},
            textString="iq_ref",
            fontName="Arial")}),
      Diagram(coordinateSystem(
          extent={{-148.5,-105.0},{148.5,105.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={5,5})),
      Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>TBD</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>TBD</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
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
  end Controller;

  model Staticgenerator
    parameter Real Pnen=0.5 "MW rated power";
    parameter Real v0=1 "Power flow, node voltage";
    parameter Real anglev0=1 "Power flow, node angle";
    parameter Real p0=1 "Power flow, node active power";
    parameter Real q0=1 "Power flow, node reactive power";
    parameter Real Td=0.00015 "d-axis inverter time constant";
    parameter Real Tq=0.00015 "q-axis inverter time constant";
    Modelica.Blocks.Interfaces.RealInput id_ref annotation (Placement(
        visible=true,
        transformation(
          origin={-175.0,55.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0),
        iconTransformation(
          origin={-120.0,70.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealInput iq_ref annotation (Placement(
        visible=true,
        transformation(
          origin={-181.6246,25.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0),
        iconTransformation(
          origin={-120.0,20.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0)));
    iPSL.Connectors.PwPin p(vr(start=v0*cos(anglev0)), vi(start=v0*sin(anglev0))) annotation (Placement(
        visible=true,
        transformation(
          origin={147.2097,10.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0),
        iconTransformation(
          origin={110.0,0.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Real anglev;
    Real id;
    Real iq;
    Real Q;
    Modelica.Blocks.Interfaces.RealOutput P(start=p0) annotation (Placement(
        visible=true,
        transformation(
          origin={165.1089,-78.9737},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0),
        iconTransformation(
          origin={110.0,-75.213},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput v(start=v0) annotation (Placement(
        visible=true,
        transformation(
          origin={165.1089,-78.9737},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0),
        iconTransformation(
          origin={110.0,70.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
  initial equation
    der(iq) = 0;
    der(id) = 0;
  equation
    -P = p.vr*p.ir + p.vi*p.ii;
    -Q = p.vi*p.ir - p.vr*p.ii;
    v = sqrt(p.vr^2 + p.vi^2);
    anglev = atan2(p.vi, p.vr);
    der(id) = (id_ref - id)/Td;
    der(iq) = (iq_ref - iq)/Tq;
    p.ir = -(id*cos(anglev) - iq*sin(anglev))*Pnen;
    p.ii = -(id*sin(anglev) + iq*cos(anglev))*Pnen;
    annotation (
      Icon(coordinateSystem(
          extent={{-100.0,-100.0},{100.0,100.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={10,10}), graphics={
          Text(
            visible=true,
            origin={-77.7013,70.0105},
            fillPattern=FillPattern.Solid,
            extent={{-12.2987,-8.1753},{12.2987,8.1753}},
            textString="idref",
            fontName="Arial"),
          Text(
            visible=true,
            origin={-77.7013,21.8247},
            fillPattern=FillPattern.Solid,
            extent={{-12.2987,-8.1753},{12.2987,8.1753}},
            textString="iqref",
            fontName="Arial"),
          Text(
            visible=true,
            origin={74.8853,-74.849},
            fillPattern=FillPattern.Solid,
            extent={{-12.2987,-8.1753},{12.2987,8.1753}},
            textString="P,pu",
            fontName="Arial"),
          Text(
            visible=true,
            origin={16.0747,3.9219},
            fillPattern=FillPattern.Solid,
            extent={{-66.0747,-43.9219},{66.0747,43.9219}},
            textString="StaticGen",
            fontName="Arial"),
          Rectangle(
            visible=true,
            fillColor={255,255,255},
            extent={{-100.0,-100.0},{100.0,100.0}}),
          Text(
            visible=true,
            origin={73.4293,69.8619},
            fillPattern=FillPattern.Solid,
            extent={{-19.0262,-13.6751},{19.0262,13.6751}},
            textString="Vac,pu",
            fontName="Arial")}),
      Diagram(coordinateSystem(
          extent={{-148.5,-105.0},{148.5,105.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={5,5})),
      Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>TBD</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>TBD</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
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
  end Staticgenerator;
  annotation (Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={5,5})), Documentation(revisions="<html>
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
end PFblocks;
