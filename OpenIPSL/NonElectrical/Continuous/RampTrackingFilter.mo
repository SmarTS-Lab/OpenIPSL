within OpenIPSL.NonElectrical.Continuous;
model RampTrackingFilter "Ramp-tracking filter"
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Real T_1;
  parameter Real T_2;
  parameter Real M;
  parameter Real N;
  parameter Real startValue;
  LeadLag LL_1(
    K=1,
    T1=T_1,
    T2=T_2,
    y_start=startValue,
    x_start=startValue)
    annotation (Placement(transformation(extent={{-80,70},{-60,90}})));
  LeadLag LL_2(
    K=1,
    T1=T_1,
    T2=T_2,
    y_start=startValue,
    x_start=startValue)
    annotation (Placement(transformation(extent={{-40,70},{-20,90}})));
  LeadLag LL_3(
    K=1,
    T1=T_1,
    T2=T_2,
    y_start=startValue,
    x_start=startValue)
    annotation (Placement(transformation(extent={{-80,10},{-60,30}})));
  LeadLag LL_4(
    K=1,
    T1=T_1,
    T2=T_2,
    y_start=startValue,
    x_start=startValue)
    annotation (Placement(transformation(extent={{-40,10},{-20,30}})));
  LeadLag LL_5(
    K=1,
    T1=T_1,
    T2=T_2,
    y_start=startValue,
    x_start=startValue)
    annotation (Placement(transformation(extent={{20,70},{40,90}})));
  LeadLag LL_6(
    K=1,
    T1=T_1,
    T2=T_2,
    y_start=startValue,
    x_start=startValue)
    annotation (Placement(transformation(extent={{60,70},{80,90}})));
  LeadLag LL_7(
    K=1,
    T1=T_1,
    T2=T_2,
    y_start=startValue,
    x_start=startValue)
    annotation (Placement(transformation(extent={{20,10},{40,30}})));
  LeadLag LL_8(
    K=1,
    T1=T_1,
    T2=T_2,
    y_start=startValue,
    x_start=startValue)
    annotation (Placement(transformation(extent={{60,10},{80,30}})));
  SimpleLag SL_1(
    K=1,
    T=T_2,
    y_start=startValue)
    annotation (Placement(transformation(extent={{-80,-90},{-60,-70}})));
  SimpleLag SL_2(
    K=1,
    T=T_2,
    y_start=startValue)
    annotation (Placement(transformation(extent={{-40,-90},{-20,-70}})));
  SimpleLag SL_3(
    K=1,
    T=T_2,
    y_start=startValue)
    annotation (Placement(transformation(extent={{-80,-30},{-60,-10}})));
  SimpleLag SL_4(
    K=1,
    T=T_2,
    y_start=startValue)
    annotation (Placement(transformation(extent={{-40,-30},{-20,-10}})));
  SimpleLag SL_5(
    K=1,
    T=T_2,
    y_start=startValue)
    annotation (Placement(transformation(extent={{20,-90},{40,-70}})));
  SimpleLag SL_6(
    K=1,
    T=T_2,
    y_start=startValue)
    annotation (Placement(transformation(extent={{60,-90},{80,-70}})));
  SimpleLag SL_7(
    K=1,
    T=T_2,
    y_start=startValue)
    annotation (Placement(transformation(extent={{20,-30},{40,-10}})));
  SimpleLag SL_8(
    K=1,
    T=T_2,
    y_start=startValue)
    annotation (Placement(transformation(extent={{60,-30},{80,-10}})));
protected
  Modelica.Blocks.Interfaces.RealInput LL_out
    annotation (Placement(transformation(extent={{-126,-100},{-86,-60}})));
protected
  Modelica.Blocks.Interfaces.RealInput SL_out
    annotation (Placement(transformation(extent={{-22,-18},{10,14}})));
initial equation

equation
  if N == 1 then
    LL_1.y = LL_out;
  elseif N == 2 then
    LL_2.y = LL_out;
  elseif N == 3 then
    LL_3.y = LL_out;
  elseif N == 4 then
    LL_4.y = LL_out;
  elseif N == 5 then
    LL_5.y = LL_out;
  elseif N == 6 then
    LL_6.y = LL_out;
  elseif N == 7 then
    LL_7.y = LL_out;
  else
    LL_8.y = LL_out;
  end if;
  if not M == 0 then
    SL_out = y;
  else
    u = y;
  end if;
  if M == 1 then
    SL_1.y = SL_out;
  elseif M == 2 then
    SL_2.y = SL_out;
  elseif M == 3 then
    SL_3.y = SL_out;
  elseif M == 4 then
    SL_4.y = SL_out;
  elseif M == 5 then
    SL_5.y = SL_out;
  elseif M == 6 then
    SL_6.y = SL_out;
  elseif M == 7 then
    SL_7.y = SL_out;
  else
    SL_8.y = SL_out;
  end if;
  connect(u, LL_1.u) annotation (Line(points={{-120,0},{-92,0},{-92,80},{-82,80}},
        color={0,0,127}));
  connect(LL_1.y, LL_2.u)
    annotation (Line(points={{-59,80},{-42,80}}, color={0,0,127}));
  connect(LL_2.y, LL_3.u) annotation (Line(points={{-19,80},{-14,80},{-14,60},{
          -88,60},{-88,20},{-82,20}}, color={0,0,127}));
  connect(LL_3.y, LL_4.u)
    annotation (Line(points={{-59,20},{-59,20},{-42,20}}, color={0,0,127}));
  connect(LL_4.y, LL_5.u) annotation (Line(points={{-19,20},{2,20},{2,80},{18,
          80}}, color={0,0,127}));
  connect(LL_5.y, LL_6.u)
    annotation (Line(points={{41,80},{58,80}}, color={0,0,127}));
  connect(LL_6.y, LL_7.u) annotation (Line(points={{81,80},{86,80},{86,58},{10,
          58},{10,20},{18,20}}, color={0,0,127}));
  connect(LL_7.y, LL_8.u)
    annotation (Line(points={{41,20},{41,20},{58,20}}, color={0,0,127}));
  connect(LL_out, SL_1.u)
    annotation (Line(points={{-106,-80},{-82,-80}}, color={0,0,127}));
  connect(SL_1.y, SL_2.u)
    annotation (Line(points={{-59,-80},{-59,-80},{-42,-80}}, color={0,0,127}));
  connect(SL_2.y, SL_3.u) annotation (Line(points={{-19,-80},{-10,-80},{-10,-60},
          {-88,-60},{-88,-20},{-82,-20}}, color={0,0,127}));
  connect(SL_3.y, SL_4.u)
    annotation (Line(points={{-59,-20},{-42,-20}}, color={0,0,127}));
  connect(SL_4.y, SL_5.u) annotation (Line(points={{-19,-20},{0,-20},{0,-80},{
          18,-80}}, color={0,0,127}));
  connect(SL_5.y, SL_6.u)
    annotation (Line(points={{41,-80},{56,-80},{58,-80}}, color={0,0,127}));
  connect(SL_6.y, SL_7.u) annotation (Line(points={{81,-80},{90,-80},{90,-60},{
          10,-60},{10,-20},{18,-20}}, color={0,0,127}));
  connect(SL_7.y, SL_8.u)
    annotation (Line(points={{41,-20},{41,-20},{58,-20}}, color={0,0,127}));
  annotation (
    Line(points={{30,0},{110,0}}, color={0,0,127}),
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        initialScale=0.05)),
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        initialScale=0.05), graphics={Rectangle(extent={{-100,100},{100,-100}},
          lineColor={0,0,0}),Text(
          extent={{-58,40},{40,-4}},
          lineColor={0,0,255},
          textString="1+sT"),Text(
          extent={{-64,20},{56,-58}},
          lineColor={0,0,255},
          textString="(1+sT )"),Text(
          extent={{22,28},{44,-4}},
          lineColor={0,0,255},
          textString="1"),Text(
          extent={{24,-10},{46,-42}},
          lineColor={0,0,255},
          textString="2"),Text(
          extent={{54,2},{66,-16}},
          lineColor={0,0,255},
          textString="M"),Line(
          points={{-60,40},{-74,40},{-74,-40},{-60,-40}},
          color={0,0,255},
          thickness=1),Line(
          points={{60,40},{76,40},{76,-40},{60,-40}},
          color={0,0,255},
          thickness=1),Text(
          extent={{76,48},{94,28}},
          lineColor={0,0,255},
          textString="N"),Line(
          points={{-68,0},{70,0}},
          color={0,0,255},
          thickness=1)}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>Ramp-tracking filter up to M*N &LT;=8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2015-08-03</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Tin Rabuzin, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end RampTrackingFilter;
