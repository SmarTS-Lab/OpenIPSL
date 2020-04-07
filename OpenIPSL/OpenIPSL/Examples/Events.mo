within OpenIPSL.Examples;
package Events
  extends Modelica.Icons.ExamplesPackage;

  model TestBreaker "Example model to test the breaker model"
    extends Modelica.Icons.Example;

    inner Electrical.SystemBase SysData annotation (Placement(transformation(extent={{-100,80},{-76,100}})));
    Electrical.Buses.InfiniteBus infiniteBusExt(displayPF=true) annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
    Electrical.Loads.PSAT.LOADPQ lOADPQExt annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={50,30})));
    Electrical.Events.Breaker breakerExt(t_o=0.5, enableTrigger=true) annotation (Placement(transformation(extent={{-10,20},{10,40}})));
    Electrical.Buses.InfiniteBus infiniteBusPara(displayPF=true) annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
    Electrical.Loads.PSAT.LOADPQ lOADPQPara annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={50,-30})));
    Electrical.Events.Breaker breakerPara(
      t_o=0.5,
      rc_enabled=true,
      t_rc=0.7) annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
    Modelica.Blocks.Sources.BooleanPulse booleanPulse(period=0.1, startTime=0.1) annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
    Electrical.Branches.PwLine pwLineExt(
      R=1,
      X=1,
      G=1,
      B=1,
      displayPF=true)
           annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
    Electrical.Branches.PwLine pwLinePara(
      R=1,
      X=1,
      G=1,
      B=1,
      displayPF=true)
           annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
  equation
    connect(lOADPQExt.p, breakerExt.r) annotation (Line(points={{40,30},{10,30}}, color={0,0,255}));
    connect(lOADPQPara.p, breakerPara.r) annotation (Line(points={{40,-30},{10,-30}}, color={0,0,255}));
    connect(booleanPulse.y, breakerExt.Trigger) annotation (Line(points={{-19,70},{0,70},{0,42}}, color={255,0,255}));
    connect(breakerExt.s, pwLineExt.n) annotation (Line(points={{-10,30},{-21,30}}, color={0,0,255}));
    connect(pwLineExt.p, infiniteBusExt.p) annotation (Line(points={{-39,30},{-60,30}}, color={0,0,255}));
    connect(breakerPara.s, pwLinePara.n) annotation (Line(points={{-10,-30},{-21,-30}}, color={0,0,255}));
    connect(pwLinePara.p, infiniteBusPara.p) annotation (Line(points={{-39,-30},{-60,-30}}, color={0,0,255}));
    annotation (experiment(StopTime=1.0));
  end TestBreaker;
end Events;
