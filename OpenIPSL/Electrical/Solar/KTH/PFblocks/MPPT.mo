within OpenIPSL.Electrical.Solar.KTH.PFblocks;
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
  Modelica.Blocks.Interfaces.RealInput Iarray(start=641.2) annotation (
      Placement(
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
  Modelica.Blocks.Math.Add add1(k2=-1) annotation (Placement(visible=true,
        transformation(
        origin={0.0,40.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Math.Add add2(k2=-1) annotation (Placement(visible=true,
        transformation(
        origin={-1.9703,-25.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  OpenIPSL.Electrical.Solar.KTH.Auxiliary.InputSelectorEpsilon
    inputSelectorEpsilon1 annotation (Placement(visible=true, transformation(
        origin={65.0,5.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Math.Gain gain1(k=Vmpp0_array*Tdelay/Step) annotation (
      Placement(visible=true, transformation(
        origin={95.0,5.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Math.Add add3(k2=+1) annotation (Placement(visible=true,
        transformation(
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
      points={{-35.9592,16.6863},{-20.3337,16.6863},{-20.3337,-6.144},{-18.0199,
          -6.144},{-18.0199,-10.5423},{112.666,-10.5423}},
      color={0,0,127}));
  connect(fixedDelay2.y, inputSelectorEpsilon1.id) annotation (Line(
      visible=true,
      origin={-33.9199,-5.4748},
      points={{-61.7373,-19.5252},{-51.5513,-19.5252},{-51.5513,13.0745},{
          86.9199,13.0745},{86.9199,12.9015}},
      color={0,0,127}));
  connect(add1.y, inputSelectorEpsilon1.dv) annotation (Line(
      visible=true,
      origin={34.4337,17.6894},
      points={{-23.4337,22.3106},{-6.8495,22.3106},{-6.8495,-14.5932},{18.5663,
          -14.5932},{18.5663,-15.4347}},
      color={0,0,127}));
  connect(inputSelectorEpsilon1.di, add2.y) annotation (Line(
      visible=true,
      origin={21.5223,-14.2005},
      points={{31.4777,10.7996},{-9.4926,10.7996},{-9.4926,-10.7995},{-12.4926,
          -10.7995}},
      color={0,0,127}));
  connect(fixedDelay1.y, add3.u1) annotation (Line(
      visible=true,
      origin={-12.7429,50.2},
      points={{-82.8826,-10.2},{-73.2868,-10.2},{-73.2868,14.8},{123.773,14.8},
          {123.773,-9.2}},
      color={0,0,127}));
  connect(fixedDelay1.y, add1.u1) annotation (Line(
      visible=true,
      origin={-55.9251,49.2},
      points={{-39.7004,-9.2},{-24.0749,-9.2},{-24.0749,10.8},{43.9251,10.8},{
          43.9251,-3.2}},
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
      points={{-38.1409,-10.3859},{-24.4755,-10.3859},{-24.4755,12.5788},{
          43.546,12.5788},{43.546,-4.3859}},
      color={0,0,127}));
  connect(fixedDelay2.y, fixedDelay4.u) annotation (Line(
      visible=true,
      origin={-68.1643,-25.8887},
      points={{-27.4929,0.8887},{8.1643,0.8887},{8.1643,-0.8887},{11.1643,-0.8887}},

      color={0,0,127}));

  connect(Iarray, fixedDelay2.u) annotation (Line(
      visible=true,
      origin={-132.4965,-26.5148},
      points={{-35.5177,-1.5149},{10.8392,-1.5148},{10.8392,1.5148},{13.8393,
          1.5148}},
      color={0,0,127}));
  connect(fixedDelay3.y, add1.u2) annotation (Line(
      visible=true,
      origin={-20.8296,37.0},
      points={{-20.489,3.0},{5.8296,3.0},{5.8296,-3.0},{8.8296,-3.0}},
      color={0,0,127}));
  connect(fixedDelay4.y, add2.u2) annotation (Line(
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
      points={{-2.5148,-12.4083},{0.4852,-12.4083},{0.4852,0.8167},{-0.4852,
          0.8167},{-0.4852,11.5917},{2.5149,11.5917}},
      color={0,0,127}));
  annotation (
    Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={10,10}), graphics={Rectangle(
          visible=true,
          fillColor={255,255,255},
          extent={{-100.0,-100.0},{100.0,100.0}}),Text(
          visible=true,
          origin={-2.5936,-0.1486},
          fillPattern=FillPattern.Solid,
          extent={{-42.5936,-24.8233},{42.5936,24.8233}},
          textString="%name",
          fontName="Arial"),Text(
          visible=true,
          origin={-76.6608,38.9853},
          fillPattern=FillPattern.Solid,
          extent={{-13.3392,-18.9853},{13.3392,18.9853}},
          textString="Varray",
          fontName="Arial"),Text(
          visible=true,
          origin={-73.5779,-52.1735},
          fillPattern=FillPattern.Solid,
          extent={{-18.8776,-14.7156},{18.8776,14.7156}},
          textString="Iarray",
          fontName="Arial"),Text(
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
</html>"));
end MPPT;
