within IEEE14.Components;
model GroupBus2
import PowerSystems = iPSL;
  PowerSystems.Electrical.Controls.PSAT.AVR.AVRTypeII aVR1TypeII1(Ta = 0.02, Tf = 1, Ke = 1, Tr = 0.001, Ka = 20, Kf = 0.001, Te = 1.98, v0 = 1.045, vrmin = 0, vrmax = 4.38,
    vf0=2.718126892405428,
    vref0=1.181847826013889)                                                                                                     annotation(Placement(transformation(extent={{-52,0},
            {-2,38}})));
  Modelica.Blocks.Sources.Constant const1(k=1.181847826013889)   annotation(Placement(transformation(extent={{-94,24},
            {-68,50}})));
  iPSL.Electrical.Machines.PSAT.SixthOrder.Order6 Syn3(Sn = 60, Vn = 69000, V_b = 69000, fn = 60, ra = 0.0031, xq = 0.98, xd1 = 0.1850, xq1 = 0.36, xd2 = 0.13, xq2= 0.13, Td10 = 6.1, Tq10 = 0.3, Tq20 = 0.099, M = 2 * 6.54, D = 2,
   V_0 = 1.045, xd = 1.05,
    angle_0=-0.135677901384789,
    P_0=0.399999999999999,
    Q_0=0.948601533828266)                                                                                                     annotation(Placement(transformation(extent={{20,-36},
            {86,34}})));
  PowerSystems.Connectors.PwPin pwPin annotation (Placement(
        transformation(extent={{122,-10},{142,10}}), iconTransformation(
          extent={{122,-10},{142,10}})));
equation
  connect(aVR1TypeII1.vf, Syn3.vf) annotation (Line(points={{-5.75,23.94},{
          -2.65,23.94},{-2.65,16.5},{20,16.5}},          color={0,0,127}));
  connect(Syn3.v, aVR1TypeII1.v) annotation (Line(points={{89.3,9.5},{116,9.5},
          {116,-88},{-82,-88},{-82,-84},{-82,14},{-82,17.1},{-47,17.1}},
                       color={0,0,127}));
  connect(const1.y, aVR1TypeII1.vref) annotation (Line(points={{-66.7,37},
          {-54,37},{-54,29.26},{-47,29.26}}, color={0,0,127}));
  connect(Syn3.p, pwPin) annotation (Line(points={{89.3,-0.82626},{110.65,
          -0.82626},{110.65,0},{132,0}}, color={0,0,255}));
  connect(Syn3.pm0, Syn3.pm) annotation (Line(points={{26.6,-39.5},{110,-39.5},
          {110,-60},{-32,-60},{-32,-18.5},{20,-18.5}},        color={0,0,
          127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent=
            {{-120,-100},{120,100}})), Icon(coordinateSystem(extent={{
            -120,-100},{120,100}}, preserveAspectRatio=false), graphics={
        Ellipse(extent={{-72,78},{120,-74}}, lineColor={28,108,200}),
        Line(points={{0,26},{26,-6},{44,20}}, color={28,108,200}),
        Line(points={{-16,2},{0,26}}, color={28,108,200}),
        Text(
          extent={{-6,-22},{32,-54}},
          lineColor={28,108,200},
          textString="Gen2 6")}));
end GroupBus2;
