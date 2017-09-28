within OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses;
partial model BaseGovernor

  Modelica.Blocks.Interfaces.RealInput SPEED annotation (Placement(
        transformation(extent={{-260,-140},{-220,-100}}), iconTransformation(
          extent={{-240,80},{-200,120}})));
  Modelica.Blocks.Interfaces.RealInput PMECH0 annotation (Placement(
        transformation(extent={{-260,60},{-220,100}}), iconTransformation(
          extent={{-240,-140},{-200,-100}})));
  Modelica.Blocks.Interfaces.RealOutput PMECH annotation (Placement(
        transformation(extent={{240,-10},{260,10}}), iconTransformation(extent=
            {{240,-10},{260,10}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-240,
            -240},{240,200}}), graphics={
        Rectangle(
          extent={{-240,200},{240,-240}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-186,122},{-110,80}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="SPEED"),
        Text(
          extent={{-188,-102},{-92,-142}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="PMECH0"),
        Text(
          extent={{144,24},{224,-16}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="PMECH")}),                                 Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-240,-240},{240,
            200}})));
end BaseGovernor;
