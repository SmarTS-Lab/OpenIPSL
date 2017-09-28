within OpenIPSL.Electrical.Controls.PSSE.OEL;
model IF_comparisor
  Modelica.Blocks.Interfaces.RealInput p
    annotation (Placement(transformation(extent={{-84,4},{-64,24}})));
  Modelica.Blocks.Interfaces.RealOutput n1
    annotation (Placement(transformation(extent={{48,44},{68,64}})));
  Modelica.Blocks.Interfaces.RealOutput n2 annotation (Placement(transformation(
          extent={{48,10},{68,30}}), iconTransformation(extent={{48,10},{68,30}})));
  parameter Real HighCurrentLimit=1.5;
  parameter Real MediumCurrentLimit=1.2;
  parameter Real LowCurrentLimit=1.1;
  parameter Real LL=1 - HighCurrentLimit;
  parameter Real ML=1 - MediumCurrentLimit;
  parameter Real HL=1 - LowCurrentLimit;
  Modelica.Blocks.Interfaces.RealOutput n3
    annotation (Placement(transformation(extent={{48,-28},{68,-8}})));
  Modelica.Blocks.Interfaces.RealOutput n4
    annotation (Placement(transformation(extent={{48,-60},{68,-40}})));
equation
  if p >= HL then
    n1 = 100;
    n2 = 0;
    n3 = 0;
    n4 = 0;
  elseif p >= ML and p < HL then
    n1 = 0;
    n2 = -0.1;
    n3 = 0;
    n4 = 0;
  elseif p >= LL and p < ML then
    n1 = 0;
    n2 = 0;
    n3 = -0.2;
    n4 = 0;
  else
    n1 = 0;
    n2 = 0;
    n3 = 0;
    n4 = -0.5;
  end if;
  connect(n1, n1) annotation (Line(
      points={{58,54},{58,54}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(extent={{-64,64},{48,-62}}, lineColor={
          0,0,255}),Text(
          extent={{12,-10},{56,-44}},
          lineColor={0,0,255},
          textString=">"),Text(
          extent={{10,52},{54,18}},
          lineColor={0,0,255},
          textString="<"),Line(
          points={{-60,14},{-34,14}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-14,38},{20,38}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-12,-20},{22,-20}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-34,14},{-18,-8}},
          color={0,0,255},
          smooth=Smooth.None),Ellipse(extent={{-18,-8},{-14,-12}}, lineColor={0,
          0,255}),Ellipse(extent={{-18,40},{-14,36}}, lineColor={0,0,255}),
          Ellipse(extent={{-16,-18},{-12,-22}}, lineColor={0,0,255}),Line(
          points={{-12,16},{22,16}},
          color={0,0,255},
          smooth=Smooth.None),Ellipse(extent={{-16,18},{-12,14}}, lineColor={0,
          0,255}),Line(
          points={{-12,-46},{22,-46}},
          color={0,0,255},
          smooth=Smooth.None),Ellipse(extent={{-16,-44},{-12,-48}}, lineColor={
          0,0,255})}),
    Documentation);
end IF_comparisor;
