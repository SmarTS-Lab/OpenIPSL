within OpenIPSL.NonElectrical.Logical;
model NegCurLogic
  Modelica.Blocks.Interfaces.RealInput Vd(start=nstartvalue) annotation (
      Placement(transformation(extent={{-76,10},{-56,30}}), iconTransformation(
          extent={{-80,10},{-60,30}})));
  Modelica.Blocks.Interfaces.RealOutput Efd(start=nstartvalue) annotation (
      Placement(transformation(extent={{62,-24},{82,-4}}), iconTransformation(
          extent={{60,-10},{80,10}})));
  Modelica.Blocks.Interfaces.RealInput XadIfd(start=nstartvalue) annotation (
      Placement(transformation(extent={{-76,-46},{-56,-26}}),
        iconTransformation(extent={{-80,-30},{-60,-10}})));
  parameter Real RC_rfd;
  parameter Real nstartvalue;
  Real Crowbar_V;
equation
  Efd = if XadIfd < 0 then Crowbar_V else Vd;
  Crowbar_V = if RC_rfd == 0 then 0 else (-1)*RC_rfd*XadIfd;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-60,-40},{60,40}}),
        graphics),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-60,-40},{60,40}}),
        graphics={Rectangle(
          extent={{-60,40},{60,-40}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-52,46},{54,-42}},
          lineColor={0,0,255},
          textString="Negative Current Logic")}),
    Documentation);
end NegCurLogic;
