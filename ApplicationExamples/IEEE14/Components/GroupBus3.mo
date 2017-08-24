within IEEE14.Components;
model GroupBus3
import PowerSystems = iPSL;
  PowerSystems.Electrical.Controls.PSAT.AVR.AVRTypeII aVR2TypeII2(Ta = 0.02, Tf = 1, Ke = 1, Tr = 0.001, Ka = 20, Kf = 0.001, Te = 1.98, v0 = 1.01, vrmin = 0, vrmax = 4.38,
    vref0=1.112638137121514,
    vf0=2.045032675265062)                                                                                                     annotation(Placement(transformation(extent={{-30,-32},
            {30,32}},                                                                                                    rotation=0,     origin={-28,-2})));
  Modelica.Blocks.Sources.Constant const2(k=1.112638137121514)   annotation(Placement(transformation(extent={{-12,-12},
            {12,12}},                                                                                                    rotation=0,     origin={-78,18})));
  iPSL.Electrical.Machines.PSAT.SixthOrder.Order6 Syn2(Sn = 60, Vn = 69000, V_b = 69000, fn = 60, ra = 0.0031, xq = 0.98, xd1 = 0.1850, xq1 = 0.36, xd2 = 0.13, xq2 = 0.13, Td10 = 6.1, Tq10 = 0.3, Tq20 = 0.099, M = 2 * 6.54, D = 2,
    V_0 = 1.01, xd = 1.05,
    angle_0=-0.332124297307116,
    P_0=0.000000000000001,
    Q_0=0.597360399382518)                                                                                                     annotation(Placement(transformation(extent={{-28,-25},
            {28,25}},                                                                                                    rotation=0,     origin={66,1})));
  PowerSystems.Connectors.PwPin pwPin
    annotation (Placement(transformation(extent={{120,-12},{140,8}}),
        iconTransformation(extent={{120,-12},{140,8}})));
equation
  connect(aVR2TypeII2.vf, Syn2.vf) annotation (Line(points={{-2.5,6.32},{12,
          6.32},{12,13.5},{38,13.5}},          color={0,0,127}));
  connect(Syn2.v, aVR2TypeII2.v) annotation (Line(points={{96.8,8.5},{112,8.5},
          {112,-48},{-82,-48},{-82,-5.2},{-52,-5.2}},               color=
         {0,0,127}));
  connect(Syn2.pm0, Syn2.pm) annotation (Line(points={{43.6,-26.5},{122,-26.5},
          {122,-36},{16,-36},{16,-11.5},{38,-11.5}},      color={0,0,127}));
  connect(Syn2.p, pwPin) annotation (Line(points={{96.8,1.1241},{115.4,1.1241},
          {115.4,-2},{130,-2}},       color={0,0,255}));
  connect(const2.y, aVR2TypeII2.vref) annotation (Line(points={{-64.8,18},
          {-52,18},{-52,15.28}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{120,100}})),        Icon(coordinateSystem(extent={{-100,
            -100},{120,100}}, preserveAspectRatio=false), graphics={
        Ellipse(extent={{-80,78},{112,-74}}, lineColor={28,108,200}),
        Line(points={{-8,26},{18,-6},{36,20}}, color={28,108,200}),
        Line(points={{-24,2},{-8,26}}, color={28,108,200}),
        Text(
          extent={{-14,-24},{24,-56}},
          lineColor={28,108,200},
          textString="Gen3 6")}));
end GroupBus3;
