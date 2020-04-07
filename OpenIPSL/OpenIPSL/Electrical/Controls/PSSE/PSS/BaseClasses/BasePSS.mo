within OpenIPSL.Electrical.Controls.PSSE.PSS.BaseClasses;
partial model BasePSS
  Modelica.Blocks.Interfaces.RealInput V_S2 "PSS input signal 2" annotation (Placement(transformation(extent={{-166,
            -46},{-154,-34}}),                                                                                                         iconTransformation(extent={{-160,
            -46},{-148,-34}})));
  Modelica.Blocks.Interfaces.RealInput V_S1 "PSS input signal 1" annotation (Placement(transformation(extent={{-166,34},
            {-154,46}}),                                                                                                             iconTransformation(extent={{-160,34},
            {-148,46}})));
  Modelica.Blocks.Interfaces.RealOutput VOTHSG "PSS output" annotation (Placement(transformation(extent={{220,-6},
            {232,6}}),                                                                                                       iconTransformation(extent={{220,-6},
            {232,6}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-160,
            -80},{220,80}}), graphics={Rectangle(
          extent={{-160,80},{220,-80}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}),
                              Diagram(coordinateSystem(preserveAspectRatio=
            false, extent={{-160,-80},{220,80}})));
end BasePSS;
