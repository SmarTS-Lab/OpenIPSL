within TwoAreas.Groups.PSSE;
package No_Controls
  model G1
    extends iPSL.Electrical.Essentials.pfComponent;

    iPSL.Connectors.PwPin pwPin annotation (Placement(transformation(extent={{60,-10},{80,10}}), iconTransformation(extent={{60,-10},{80,10}})));
    iPSL.Electrical.Machines.PSSE.GENSAL.GENSAL gENSAL(
      Tpd0=8,
      Tppd0=0.03,
      Tppq0=0.05,
      H=6.5,
      Xd=1.8,
      Xq=1.7,
      Xpd=0.3,
      Xppd=0.25,
      Xppq=0.25,
      Xl=0.2,
      R_a=0.0025,
      D=0.02,
      S12=0.802,
      S10=0.18600,
      M_b=900,
      V_b=V_b,
      V_0=V_0,
      angle_0=angle_0,
      P_0=P_0,
      Q_0=Q_0) annotation (Placement(transformation(extent={{-16,-14},{24,22}})));
  equation

    connect(gENSAL.EFD0, gENSAL.EFD) annotation (Line(points={{25.6,-8.6},{26,-8.6},{26,-20},{-18,-20},{-18,-5},{-15.6,-5}}, color={0,0,127}));
    connect(gENSAL.PMECH, gENSAL.PMECH0) annotation (Line(points={{-15.6,13},{-18,13},{-18,30},{24,30},{24,-1.4},{25.6,-1.4}}, color={0,0,127}));
    connect(gENSAL.p, pwPin) annotation (Line(points={{26,4},{42,4},{42,0},{70,0}}, color={0,0,255}));
    annotation (Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-60,-60},{60,60}},
          initialScale=0.1)), Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-60,-60},{60,60}},
          initialScale=0.1), graphics={
          Ellipse(extent={{-60,60},{60,-60}}, lineColor={28,108,200}),
          Line(points={{-40,0},{-20,20}}, color={28,108,200}),
          Line(points={{-20,20},{20,-20},{40,0}}, color={28,108,200}),
          Text(
            extent={{-20,-24},{16,-54}},
            lineColor={28,108,200},
            textString="%name")}));
  end G1;

  model G2
    extends iPSL.Electrical.Essentials.pfComponent;

    iPSL.Connectors.PwPin pwPin annotation (Placement(transformation(extent={{60,-10},{80,10}}), iconTransformation(extent={{60,-10},{80,10}})));
    iPSL.Electrical.Machines.PSSE.GENSAL.GENSAL gENSAL(
      Tpd0=8,
      Tppd0=0.03,
      Tppq0=0.05,
      H=6.5,
      Xd=1.8,
      Xq=1.7,
      Xpd=0.3,
      Xppd=0.25,
      Xppq=0.25,
      Xl=0.2,
      R_a=0.0025,
      D=0.02,
      S12=0.802,
      S10=0.18600,
      M_b=900,
      V_b=V_b,
      V_0=V_0,
      angle_0=angle_0,
      P_0=P_0,
      Q_0=Q_0) annotation (Placement(transformation(extent={{-16,-14},{24,22}})));
  equation

    connect(gENSAL.EFD, gENSAL.EFD0) annotation (Line(points={{-15.6,-5},{-26,-5},{-26,-30},{26,-30},{26,-8.6},{25.6,-8.6}}, color={0,0,127}));
    connect(gENSAL.PMECH, gENSAL.PMECH0) annotation (Line(points={{-15.6,13},{-26,13},{-26,34},{28,34},{28,-1.4},{25.6,-1.4}}, color={0,0,127}));
    connect(gENSAL.p, pwPin) annotation (Line(points={{26,4},{44,4},{44,0},{70,0}}, color={0,0,255}));
    annotation (Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-60,-60},{60,60}},
          initialScale=0.1)), Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-60,-60},{60,60}},
          initialScale=0.1), graphics={
          Ellipse(extent={{-60,60},{60,-60}}, lineColor={28,108,200}),
          Line(points={{-40,0},{-20,20}}, color={28,108,200}),
          Line(points={{-20,20},{20,-20},{40,0}}, color={28,108,200}),
          Text(
            extent={{-20,-22},{16,-52}},
            lineColor={28,108,200},
            textString="G2")}));
  end G2;

  model G3
    extends iPSL.Electrical.Essentials.pfComponent;

    iPSL.Electrical.Machines.PSSE.GENSAL.GENSAL gENSAL(
      Tpd0=8,
      Tppd0=0.03,
      Tppq0=0.05,
      D=0,
      Xd=1.8,
      Xq=1.7,
      Xpd=0.3,
      Xppd=0.25,
      Xppq=0.25,
      Xl=0.2,
      H=6.175,
      R_a=0.0025,
      S12=0.802,
      S10=0.18600,
      M_b=900,
      V_b=V_b,
      V_0=V_0,
      P_0=P_0,
      Q_0=Q_0,
      angle_0=angle_0) annotation (Placement(transformation(extent={{-30,-30},{30,36}})));

    iPSL.Connectors.PwPin pwPin annotation (Placement(transformation(extent={{60,-10},{80,10}}), iconTransformation(extent={{60,-10},{80,10}})));

  equation
    connect(gENSAL.PMECH, gENSAL.PMECH0) annotation (Line(points={{-29.4,19.5},{-40,19.5},{-40,44},{30,44},{30,-6.9},{32.4,-6.9}}, color={0,0,127}));
    connect(gENSAL.EFD0, gENSAL.EFD) annotation (Line(points={{32.4,-20.1},{38,-20.1},{38,-40},{-38,-40},{-38,0},{-38,-13.5},{-29.4,-13.5}}, color={0,0,127}));
    connect(gENSAL.p, pwPin) annotation (Line(points={{33,3},{46.5,3},{46.5,0},{70,0}}, color={0,0,255}));
    annotation (Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-60,-60},{60,60}},
          initialScale=0.1)), Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-60,-60},{60,60}},
          initialScale=0.1), graphics={
          Ellipse(extent={{-60,60},{60,-60}}, lineColor={28,108,200}),
          Line(points={{-40,0},{-20,20}}, color={28,108,200}),
          Line(points={{-20,20},{20,-20},{40,0}}, color={28,108,200}),
          Text(
            extent={{-22,-24},{18,-54}},
            lineColor={28,108,200},
            textString="G3")}));
  end G3;

  model G4
    extends iPSL.Electrical.Essentials.pfComponent;

    iPSL.Connectors.PwPin pwPin annotation (Placement(transformation(extent={{60,-10},{80,10}}), iconTransformation(extent={{60,-10},{80,10}})));
    iPSL.Electrical.Machines.PSSE.GENSAL.GENSAL gENSAL(
      Tpd0=8,
      Tppd0=0.03,
      Tppq0=0.05,
      H=6.175,
      Xd=1.8,
      Xq=1.7,
      Xpd=0.3,
      Xppd=0.25,
      Xppq=0.25,
      Xl=0.2,
      R_a=0.0025,
      D=0.02,
      S12=0.802,
      S10=0.18600,
      M_b=900,
      V_b=V_b,
      V_0=V_0,
      angle_0=angle_0,
      P_0=P_0,
      Q_0=Q_0) annotation (Placement(transformation(extent={{-16,-14},{24,22}})));
  equation

    connect(gENSAL.p, pwPin) annotation (Line(points={{26,4},{42,4},{42,0},{70,0}}, color={0,0,255}));
    connect(gENSAL.EFD0, gENSAL.EFD) annotation (Line(points={{25.6,-8.6},{34,-8.6},{34,-20},{-24,-20},{-24,-5},{-15.6,-5}}, color={0,0,127}));
    connect(gENSAL.PMECH, gENSAL.PMECH0) annotation (Line(points={{-15.6,13},{-14,13},{-14,12},{-24,12},{-24,30},{34,30},{34,-1.4},{25.6,-1.4}}, color={0,0,127}));
    annotation (Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-60,-60},{60,60}},
          initialScale=0.1)), Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-60,-60},{60,60}},
          initialScale=0.1), graphics={
          Ellipse(extent={{-60,60},{60,-60}}, lineColor={28,108,200}),
          Line(points={{-40,0},{-20,20}}, color={28,108,200}),
          Line(points={{-20,20},{20,-20},{40,0}}, color={28,108,200}),
          Text(
            extent={{-24,-22},{18,-52}},
            lineColor={28,108,200},
            textString="G4")}));
  end G4;
end No_Controls;
