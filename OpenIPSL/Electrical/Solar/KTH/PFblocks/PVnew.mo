within OpenIPSL.Electrical.Solar.KTH.PFblocks;
model PVnew
  OpenIPSL.Electrical.Solar.KTH.Auxiliary.PVarray PVarray1(
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
  Modelica.Blocks.Math.Gain gain1(k=1/nSerialModules) annotation (Placement(
        visible=true, transformation(
        origin={-70.0,60.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Math.Gain gain2(k=nParallelModules) annotation (Placement(
        visible=true, transformation(
        origin={68.072,10.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Math.Gain gain3(k=nSerialModules) annotation (Placement(
        visible=true, transformation(
        origin={70.0,-28.0297},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Math.Product product1 annotation (Placement(visible=true,
        transformation(
        origin={60.0,60.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  parameter Real nSerialModules=20;
  parameter Real nParallelModules=140;
  parameter Real Tdelay=0.05;
  parameter Real Imp=4.58 "Current at maximum power";
  parameter Real Vmp=35 "Voltage at maximum power";
  parameter Real Iscref=5
    "Module short-circuit current reference at reference temp and irradiance";
  parameter Real Vocref=43.8
    "Module open-circuit voltage reference at reference temp and irradiance";
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

  connect(gain3.y, Varray) annotation (Line(
      visible=true,
      origin={120.0322,-24.0148},
      points={{-39.0322,-4.0149},{8.6024,-4.0148},{8.6024,4.0148},{21.8275,
          4.0148}},
      color={0,0,127}));
  connect(product1.y, PowerArray) annotation (Line(
      visible=true,
      origin={115.264,-2.6636},
      points={{-44.264,62.6636},{-5.264,62.6636},{-5.264,-42.3364},{27.3959,-42.3364},
          {27.3959,-40.6544}},
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
  connect(PVarray1.V, gain3.u) annotation (Line(
      visible=true,
      origin={42.25,-13.2285},
      points={{-41.25,14.8011},{12.75,14.8011},{12.75,-14.8012},{15.75,-14.8012}},

      color={0,0,127}));

  connect(gain2.y, product1.u2) annotation (Line(
      visible=true,
      origin={63.536,33.8119},
      points={{15.536,-23.8119},{18.536,-23.8119},{18.536,3.6238},{-18.536,
          3.6238},{-18.536,20.1881},{-15.536,20.1881}},
      color={0,0,127}));
  connect(PVarray1.I, gain2.u) annotation (Line(
      visible=true,
      origin={40.804,9.5},
      points={{-39.804,-0.5},{12.268,-0.5},{12.268,0.5},{15.268,0.5}},
      color={0,0,127}));
  connect(gain1.y, PVarray1.V1) annotation (Line(
      visible=true,
      origin={-36.6,31.1287},
      points={{-22.4,28.8713},{-3.4,28.8713},{-3.4,-19.3069},{14.6,-19.3069},{
          14.6,-19.1287}},
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
          origin={0.8251,1.0405},
          fillPattern=FillPattern.Solid,
          extent={{-39.1749,-15.0129},{39.1749,15.0129}},
          textString="PVnew",
          fontName="Arial"),Text(
          visible=true,
          origin={-74.7566,70.0},
          fillPattern=FillPattern.Solid,
          extent={{-20.0,-13.9876},{20.0,13.9876}},
          textString="Vdc(700)",
          fontName="Arial"),Text(
          visible=true,
          origin={-75.6751,-0.0},
          fillPattern=FillPattern.Solid,
          extent={{-20.0,-13.9876},{20.0,13.9876}},
          textString="E(1000)",
          fontName="Arial"),Text(
          visible=true,
          origin={-74.8099,-67.7542},
          fillPattern=FillPattern.Solid,
          extent={{-20.0,-13.9876},{20.0,13.9876}},
          textString="Tref(25)",
          fontName="Arial"),Text(
          visible=true,
          origin={68.1573,71.699},
          fillPattern=FillPattern.Solid,
          extent={{-20.0,-13.9876},{20.0,13.9876}},
          textString="Varray",
          fontName="Arial"),Text(
          visible=true,
          origin={74.6709,-0.0},
          fillPattern=FillPattern.Solid,
          extent={{-20.0,-13.9876},{20.0,13.9876}},
          textString="Iarray",
          fontName="Arial"),Text(
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
</html>"));
end PVnew;
