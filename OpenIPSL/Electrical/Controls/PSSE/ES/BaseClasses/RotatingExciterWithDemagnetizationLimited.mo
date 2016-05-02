within OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses;
model RotatingExciterWithDemagnetizationLimited
  extends RotatingExciterWithDemagnetization(redeclare Modelica.Blocks.Continuous.LimIntegrator sISO(outMin=0, outMax=Modelica.Constants.inf));
  annotation (Icon(graphics={Text(
          extent={{-54,48},{52,36}},
          lineColor={255,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Limited")}));
end RotatingExciterWithDemagnetizationLimited;
