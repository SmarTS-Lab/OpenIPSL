within OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses;
model RotatingExciterWithDemagnetizationVarLim
  extends RotatingExciterBase(redeclare replaceable
      OpenIPSL.NonElectrical.Continuous.IntegratorLimVar sISO(K=1/T_E, y_start=
          Efd0), redeclare Modelica.Blocks.Math.Add3 Sum(k3=K_D));
  parameter Real K_D "Exciter demagnetizing factor (pu)";
  Modelica.Blocks.Interfaces.RealInput outMin annotation (Placement(
        transformation(extent={{-120,50},{-80,90}}), iconTransformation(extent=
            {{100,50},{80,70}})));
  Modelica.Blocks.Interfaces.RealInput outMax annotation (Placement(
        transformation(extent={{120,50},{80,90}}), iconTransformation(extent={{
            -100,50},{-80,70}})));
  Modelica.Blocks.Interfaces.RealInput XADIFD annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={20,-100}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-90})));
  Modelica.Blocks.Interfaces.RealOutput V_FE annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-82,-32}), iconTransformation(extent={{-80,-60},{-100,-40}})));
equation
  connect(outMax, sISO.outMax)
    annotation (Line(points={{100,70},{8,70},{8,34}}, color={0,0,127}));
  connect(outMin, sISO.outMin) annotation (Line(points={{-100,70},{-60,70},{-20,
          70},{-20,0},{-8,0},{-8,6}}, color={0,0,127}));
  connect(XADIFD, Sum.u3) annotation (Line(points={{20,-100},{8,-100},{8,-38},{
          -18,-38}}, color={0,0,127}));
  connect(V_FE, feedback.u2)
    annotation (Line(points={{-82,-32},{-50,-32},{-50,12}}, color={0,0,127}));
  annotation (Icon(graphics={Text(
          extent={{-54,48},{52,36}},
          lineColor={255,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Limited"),Text(
          extent={{-79,66},{-48,56}},
          lineColor={28,108,200},
          textString="outMax"),Text(
          extent={{47,66},{78,56}},
          lineColor={28,108,200},
          textString="outMin"),Text(
          extent={{-52,60},{56,44}},
          lineColor={255,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="with Demagnetization Effect")}), Documentation);
end RotatingExciterWithDemagnetizationVarLim;
