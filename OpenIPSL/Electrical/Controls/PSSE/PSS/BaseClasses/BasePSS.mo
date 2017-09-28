within OpenIPSL.Electrical.Controls.PSSE.PSS.BaseClasses;
partial model BasePSS
  Modelica.Blocks.Interfaces.RealInput V_S2 "PSS input signal 2" annotation (Placement(transformation(extent={{-166,
            -46},{-154,-34}}),                                                                                                         iconTransformation(extent={{-186,-26},{-174,-14}})));
  Modelica.Blocks.Interfaces.RealInput V_S1 "PSS input signal 1" annotation (Placement(transformation(extent={{-166,34},
            {-154,46}}),                                                                                                             iconTransformation(extent={{-186,14},{-174,26}})));
  Modelica.Blocks.Interfaces.RealOutput VOTHSG "PSS output" annotation (Placement(transformation(extent={{220,-6},
            {232,6}}),                                                                                                       iconTransformation(extent={{200,-6},{212,6}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-160,
            -80},{220,80}})), Diagram(coordinateSystem(preserveAspectRatio=
            false, extent={{-160,-80},{220,80}})));
end BasePSS;
