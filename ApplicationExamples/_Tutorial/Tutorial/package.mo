package Tutorial
annotation (
  Icon(graphics={
      Rectangle(
        extent={{-80,100},{100,-80}},
        lineColor={0,0,0},
        fillColor={215,230,240},
        fillPattern=FillPattern.Solid),
      Rectangle(
        extent={{-100,80},{80,-100}},
        lineColor={0,0,0},
        fillColor={240,240,240},
        fillPattern=FillPattern.Solid),
      Polygon(
        points={{-48,50},{52,-10},{-48,-70},{-48,50}},
        lineColor={0,0,255},
        pattern=LinePattern.None,
        fillColor={95,95,95},
        fillPattern=FillPattern.Solid)}),
  Documentation,
  uses(Modelica(version="3.2.2"), OpenIPSL(version="1.5.0")));
end Tutorial;
