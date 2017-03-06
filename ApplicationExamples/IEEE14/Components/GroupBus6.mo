within IEEE14.Components;
model GroupBus6
import PowerSystems = iPSL;
  PowerSystems.Electrical.Controls.PSAT.AVR.AVRTypeII aVR4TypeII1(Ta = 0.02, Tf = 1, Ke = 1, Tr = 0.001, Ka = 20, Kf = 0.001, Te = 0.7, v0 = 1.07, vrmin = 1.395, vrmax = 6.81,
    vf0=3.146313160164691,
    vref0=1.228917822125829)                                                                                                     annotation(Placement(transformation(extent={{-23,-17},
            {23,17}},                                                                                                    rotation = 0, origin={7,27})));
  Modelica.Blocks.Sources.Constant const4(k=1.228917822125829)   annotation(Placement(transformation(extent={{-16,-16},
            {16,16}},                                                                                                    rotation = 0, origin={-60,40})));
  iPSL.Electrical.Machines.PSAT.SixthOrder.Order6 Syn5(fn = 60, D = 2, Sn = 25,xd = 1.25, xq = 1.22, xd1 = 0.232, xq1 = 0.715,
   xd2= 0.12, xq2 = 0.12, Td10 = 4.75, Tq10 = 1.5, Td20 = 0.06, Tq20 = 0.21, M = 2 * 5.06, Vn = 13800, V_b = 13800,
    V_0 = 1.07, angle_0=-0.369562610674901, P_0=-0.000000000000000,  Q_0=0.444329439389710, ra=0.0041)                                                                                                     annotation(Placement(transformation(extent={{-23,-20},
            {23,20}},                                                                                                    rotation = 0, origin={69,2})));
  PowerSystems.Connectors.PwPin pwPin
    annotation (Placement(transformation(extent={{100,-10},{120,10}}),
        iconTransformation(extent={{100,-10},{120,10}})));
equation
  connect(const4.y, aVR4TypeII1.vref) annotation (Line(points={{-42.4,40},
          {-26,40},{-26,36.18},{-11.4,36.18}}, color={0,0,127}));
  connect(aVR4TypeII1.vf, Syn5.vf) annotation (Line(points={{26.55,31.42},{32,
          31.42},{32,12},{46,12}},                 color={0,0,127}));
  connect(Syn5.v, aVR4TypeII1.v) annotation (Line(points={{94.3,8},{98,8},{98,-66},
          {-28,-66},{-28,25.3},{-11.4,25.3}},
        color={0,0,127}));
  connect(Syn5.pm0, Syn5.pm) annotation (Line(points={{50.6,-20},{122,-20},{122,
          -38},{20,-38},{20,-8},{46,-8}},                 color={0,0,127}));
  connect(Syn5.p, pwPin) annotation (Line(points={{94.3,2.09928},{113.15,2.09928},
          {113.15,0},{110,0}},          color={0,0,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent=
            {{-100,-100},{100,100}})), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics={
        Ellipse(extent={{-92,78},{100,-74}}, lineColor={28,108,200}),
        Line(points={{-20,26},{6,-6},{24,20}}, color={28,108,200}),
        Line(points={{-36,2},{-20,26}}, color={28,108,200}),
        Text(
          extent={{-24,-22},{14,-54}},
          lineColor={28,108,200},
          textString="Gen4 6")}));
end GroupBus6;
