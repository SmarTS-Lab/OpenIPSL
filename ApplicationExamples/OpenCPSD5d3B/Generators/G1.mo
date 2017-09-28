within OpenCPSD5d3B.Generators;
model G1
  outer OpenIPSL.Electrical.SystemBase SysData;
  extends OpenIPSL.Electrical.Essentials.pfComponent;

  OpenIPSL.Interfaces.PwPin conn annotation (Placement(transformation(extent={{
            100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  OpenIPSL.Electrical.Machines.PSSE.GENSAL gENROE(
    M_b=100,
    Tpd0=5,
    Tppd0=0.07,
    Tppq0=0.09,
    H=4.28,
    D=0,
    Xd=1.84,
    Xq=1.75,
    Xpd=0.41,
    Xppd=0.2,
    Xl=0.12,
    S10=0.11,
    S12=0.39,
    Xppq=0.2,
    R_a=0,
    V_b=V_b,
    V_0=V_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0) annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.SEXS sEXS(
    T_AT_B=0.1,
    T_B=1,
    K=100,
    T_E=0.1,
    E_MIN=-10,
    E_MAX=10)
    annotation (Placement(transformation(extent={{-78,-10},{-38,26}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.HYGOV hYGOV
    annotation (Placement(transformation(extent={{-80,-64},{-40,-32}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-98,40},{-86,52}})));
equation
  connect(gENROE.p, conn)
    annotation (Line(points={{20,0},{110,0}}, color={0,0,255}));
  connect(sEXS.EFD0, gENROE.EFD0) annotation (Line(points={{-78,-3},{-80,-3},{-80,
          -8},{-80,-26},{26,-26},{26,-10},{22,-10}}, color={0,0,127}));
  connect(sEXS.ECOMP, gENROE.ETERM) annotation (Line(points={{-78,10},{-80,10},
          {-80,28},{26,28},{26,-6},{22,-6}}, color={0,0,127}));
  connect(hYGOV.SPEED, gENROE.SPEED) annotation (Line(points={{-79.5,-40},{-84,
          -40},{-84,32},{32,32},{32,14},{22,14}}, color={0,0,127}));
  connect(hYGOV.PMECH0, gENROE.PMECH0) annotation (Line(points={{-79.5,-56},{-84,
          -56},{-84,-68},{28,-68},{28,10},{22,10}}, color={0,0,127}));
  connect(const.y, sEXS.VOTHSG) annotation (Line(points={{-85.4,46},{-82,46},{-82,
          19},{-78,19}}, color={0,0,127}));
  connect(sEXS.VUEL, sEXS.VOTHSG) annotation (Line(points={{-71,-10},{-70,-10},
          {-70,-14},{-82,-14},{-82,19},{-78,19}}, color={0,0,127}));
  connect(sEXS.VOEL, sEXS.VOTHSG) annotation (Line(points={{-65,-10},{-66,-10},
          {-66,-14},{-82,-14},{-82,19},{-78,19}}, color={0,0,127}));
  connect(hYGOV.PMECH, gENROE.PMECH) annotation (Line(points={{-39,-48},{-30,-48},
          {-30,10},{-24,10}}, color={0,0,127}));
  connect(sEXS.EFD, gENROE.EFD) annotation (Line(points={{-37,10},{-34,10},{-34,
          -10},{-24,-10}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Ellipse(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Line(
          points={{-48,2},{-20,56},{2,4},{24,-28},{48,22}},
          color={0,0,0},
          smooth=Smooth.Bezier),Text(
          extent={{-52,-18},{56,-66}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="%name")}), Diagram(coordinateSystem(preserveAspectRatio=
            false, extent={{-100,-100},{100,100}})));
end G1;
