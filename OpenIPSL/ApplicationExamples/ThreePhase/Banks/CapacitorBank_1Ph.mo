within ThreePhase.Banks;
model CapacitorBank_1Ph
  outer OpenIPSL.Electrical.SystemBase SysData;
  parameter Real Sn=SysData.S_b "Power rating (MVA)";
  OpenIPSL.Interfaces.PwPin A(vr(start=var0), vi(start=vai0)) annotation (
      Placement(
      transformation(
        extent={{-10.0,0.0},{10.0,20.0}},
        origin={0.0,0.0},
        rotation=0),
      iconTransformation(
        extent={{-80.0,0.0},{-60.0,20.0}},
        origin={70,100},
        rotation=0),
      visible=true));
  parameter Real VA=1 "Guess value for phase A magnitude (pu)"
    annotation (Dialog(group="Initialization"));
  parameter Real AngA=0 "Guess value for phase A angle (deg)"
    annotation (Dialog(group="Initialization"));

  parameter Real Q_a "Reactive power for phase A (MVAr)"
    annotation (Dialog(group="Power flow"));
protected
  Real Pa=0;
  Real Qa=Q_a/(Sn/3);

  // Initializing voltages for each pin
  parameter Real var0=VA*cos(AngA*Modelica.Constants.pi/180) "Initialitation";
  parameter Real vai0=VA*sin(AngA*Modelica.Constants.pi/180) "Initialitation";
equation
  Pa = (A.vr*A.ir + A.vi*A.ii);
  Qa = (-A.vi*A.ir + A.vr*A.ii)/((A.vr)^2 + (A.vi)^2);
  annotation (Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=true,
        initialScale=0.1), graphics={Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Line(
          points={{0,70},{0,54}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-40,42},{40,42}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-40,54},{40,54}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{0,42},{0,14}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-40,2},{40,2}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-40,14},{40,14}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{0,2},{0,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-38,-22},{38,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-28,-30},{-20,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-20,-30},{-12,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-12,-30},{-4,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-4,-30},{4,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{4,-30},{12,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{12,-30},{20,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{20,-30},{28,-22}},
          color={0,0,255},
          smooth=Smooth.None)}));
end CapacitorBank_1Ph;
