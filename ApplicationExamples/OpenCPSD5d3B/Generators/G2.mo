within OpenCPSD5d3B.Generators;
model G2
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
    Q_0=Q_0) annotation (Placement(transformation(extent={{20,-20},{60,20}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.SEXS sEXS(
    T_AT_B=0.2,
    K=50,
    E_MIN=0,
    E_MAX=5,
    T_E=0.01,
    T_B=10) annotation (Placement(transformation(extent={{-24,-22},{0,0}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{8,-36},{0,-28}})));
  Modelica.Blocks.Interfaces.RealInput V_IB annotation (Placement(
        transformation(extent={{-110,50},{-90,70}}), iconTransformation(extent=
            {{-108,40},{-88,60}})));
  Modelica.Blocks.Interfaces.RealInput V_DN annotation (Placement(
        transformation(extent={{-110,30},{-90,50}}), iconTransformation(extent=
            {{-108,-60},{-88,-40}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.IEESGO iEESGO(P_MAX=1.5, P_MIN=0)
    annotation (Placement(transformation(extent={{-24,2},{8,16}})));
  Modelica.Blocks.Interfaces.RealInput fi_IB annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-100,4}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-50,100})));
  Modelica.Blocks.Interfaces.RealInput fi_DN annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-100,20}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={50,100})));
  Controls.RESYNCH_UNIT central_Unit annotation (Placement(transformation(
          rotation=0, extent={{-62,18},{-42,38}})));
  Modelica.Blocks.Interfaces.BooleanOutput TRIGGER annotation (Placement(
        transformation(extent={{80,50},{100,70}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,-110})));
equation
  connect(gENROE.p, conn)
    annotation (Line(points={{60,0},{60,0},{110,0}}, color={0,0,255}));
  connect(sEXS.EFD, gENROE.EFD) annotation (Line(points={{0.6,-9.77778},{9.3,-9.77778},
          {9.3,-10},{16,-10}}, color={0,0,127}));
  connect(sEXS.ECOMP, gENROE.ETERM) annotation (Line(points={{-24,-9.77778},{-32,
          -9.77778},{-32,-14},{-32,-46},{76,-46},{76,-6},{62,-6}}, color={0,0,
          127}));
  connect(gENROE.EFD0, sEXS.EFD0) annotation (Line(points={{62,-10},{68,-10},{
          68,-40},{-28,-40},{-28,-17.7222},{-24,-17.7222}}, color={0,0,127}));
  connect(const.y, sEXS.VOEL) annotation (Line(points={{-0.4,-32},{-16.2,-32},{
          -16.2,-22}}, color={0,0,127}));
  connect(sEXS.VUEL, sEXS.VOEL) annotation (Line(points={{-19.8,-22},{-20,-22},
          {-20,-32},{-16.2,-32},{-16.2,-22}}, color={0,0,127}));
  connect(V_IB, central_Unit.V_IB) annotation (Line(points={{-100,60},{-80,60},
          {-80,35},{-61,35}}, color={0,0,127}));
  connect(iEESGO.PMECH, gENROE.PMECH)
    annotation (Line(points={{9,10},{16,10}}, color={0,0,127}));
  connect(iEESGO.SPEED, gENROE.SPEED) annotation (Line(points={{-23.2,13},{-28,
          13},{-28,32},{70,32},{70,14},{62,14}}, color={0,0,127}));
  connect(central_Unit.PMECH0, gENROE.PMECH0) annotation (Line(points={{-43,25},
          {74,25},{74,10},{62,10}}, color={0,0,127}));
  connect(V_DN, central_Unit.V_DN) annotation (Line(points={{-100,40},{-84,40},
          {-84,31},{-61,31}}, color={0,0,127}));
  connect(fi_DN, central_Unit.fi_DN) annotation (Line(points={{-100,20},{-80,20},
          {-80,25},{-61,25}}, color={0,0,127}));
  connect(fi_IB, central_Unit.fi_IB) annotation (Line(points={{-100,4},{-76,4},
          {-76,21},{-61,21}}, color={0,0,127}));
  connect(central_Unit.SPEED, gENROE.SPEED) annotation (Line(points={{-43,21},{
          -28,21},{-28,32},{70,32},{70,14},{62,14}}, color={0,0,127}));
  connect(TRIGGER, central_Unit.TRIGGER) annotation (Line(points={{90,60},{-30,
          60},{-30,28},{-41,28}}, color={255,0,255}));
  connect(central_Unit.P_CTRL, iEESGO.PMECH0) annotation (Line(points={{-41,31},
          {-32,31},{-32,6},{-23.2,6}}, color={0,0,127}));
  connect(central_Unit.V_CTRL, sEXS.VOTHSG) annotation (Line(points={{-41,35},{
          -36,35},{-36,-4.27778},{-24,-4.27778}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={Ellipse(
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
end G2;
