within OpenIPSL.Electrical.Controls.PSSE.TG.GGOV1;
block Min_select
  "Output the minimum and the maximum element of the input vector"
  parameter Integer nu(min=0) = 0 "Number of input connections"
    annotation (Dialog(connectorSizing=true), HideResult=true);
  Modelica.Blocks.Interfaces.RealVectorInput u[nu]
    annotation (Placement(transformation(extent={{-120,70},{-80,-70}})));
  Modelica.Blocks.Interfaces.RealOutput yMin(start=frs0) annotation (Placement(
        transformation(extent={{100,-94},{120,-74}}, rotation=0)));
  parameter Real frs0;
equation
  yMin = min(u);
  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        initialScale=0.1), graphics={Text(
          extent={{-50,46},{76,-46}},
          lineColor={0,0,255},
          textString="Low value
select"),Rectangle(extent={{-100,98},{100,-98}}, lineColor={0,0,255})}),
    Documentation(info="<html>
<p>
Determines the minimum and maximum element of the input vector and
provide both values as output.
</p>
</html>"),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics));
end Min_select;
