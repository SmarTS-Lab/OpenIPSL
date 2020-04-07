within IEEE14.Components;
model GroupBus8
import PowerSystems = iPSL;
  PowerSystems.Electrical.Controls.PSAT.AVR.AVRTypeII aVR3TypeII2(Ta = 0.02, Tf = 1, Ke = 1, Tr = 0.001, Ka = 20, Kf = 0.001, Te = 0.7, v0 = 1.09, vrmin = 1.395, vrmax = 6.81,
    vf0=2.622215878949932,
    vref0=1.221943942023239)                                                                                                     annotation(Placement(transformation(extent={{-20,-21},
            {20,21}},                                                                                                    rotation=0,     origin={-12,11})));
  Modelica.Blocks.Sources.Constant const3(k=1.221943942023239)   annotation(Placement(transformation(extent = {{-9, -9}, {9, 9}}, rotation=0,     origin={-67,19})));
  iPSL.Electrical.Machines.PSAT.SixthOrder.Order6 Syn4(fn = 60, D = 2, Sn = 25, Vn = 18000, V_b = 18000,xd = 1.25, xq = 1.22, xd1 = 0.232,
  xq1 = 0.715, xd2 = 0.12, xq2 = 0.12, Td10 = 4.75, Tq10 = 1.5, Td20 = 0.06, Tq20 = 0.21, M = 2 * 5.06,
   V_0 = 1.09, angle_0=-0.339378947160109, P_0=-0.000000000000000, Q_0=0.334022011934611,ra=0.0041)                                                                                                     annotation(Placement(transformation(extent = {{-17, -17}, {17, 17}}, rotation=0,     origin={55,1})));
  PowerSystems.Connectors.PwPin pwPin
    annotation (Placement(transformation(extent={{102,-8},{122,12}}),
        iconTransformation(extent={{102,-8},{122,12}})));
equation
  connect(aVR3TypeII2.vf, Syn4.vf) annotation (Line(points={{5,16.46},{20.5,
          16.46},{20.5,9.5},{38,9.5}},                color={0,0,127}));
  connect(Syn4.v, aVR3TypeII2.v) annotation (Line(points={{73.7,6.1},{98,6.1},{98,
          -34},{-36,-34},{-36,8.9},{-28,8.9}},                  color={0,
          0,127}));
  connect(Syn4.pm0, Syn4.pm) annotation (Line(points={{41.4,-17.7},{88,-17.7},{88,
          -28},{-6,-28},{-6,-7.5},{38,-7.5}},                 color={0,0,
          127}));
  connect(Syn4.p, pwPin) annotation (Line(points={{73.7,1.08439},{103.85,
          1.08439},{103.85,2},{112,2}},  color={0,0,255}));
  connect(const3.y, aVR3TypeII2.vref) annotation (Line(points={{-57.1,19},
          {-45.55,19},{-45.55,22.34},{-28,22.34}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})), Icon(coordinateSystem(preserveAspectRatio=
           false, extent={{-100,-100},{100,100}}), graphics={
        Ellipse(extent={{-92,78},{100,-74}}, lineColor={28,108,200}),
        Line(points={{-20,26},{6,-6},{24,20}}, color={28,108,200}),
        Line(points={{-36,2},{-20,26}}, color={28,108,200}),
        Text(
          extent={{-26,-22},{12,-54}},
          lineColor={28,108,200},
          textString="Gen2 6")}));
end GroupBus8;
