within OpenIPSL.Electrical.ThreePhase.Buses;
model MeasurementBus "Three-phase active and reactive power measurement bus"
  extends ThreePhaseComponent;
  OpenIPSL.Interfaces.PwPin p1 "Phase A output" annotation (Placement(transformation(extent={{80,80},{100,100}})));
  OpenIPSL.Interfaces.PwPin p2 "Phase B output" annotation (Placement(transformation(extent={{80,-10},{100,10}})));
  OpenIPSL.Interfaces.PwPin p3 "Phase C output" annotation (Placement(transformation(extent={{80,-100},{100,-80}})));
  OpenIPSL.Interfaces.PwPin p4 "Phase A input" annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  OpenIPSL.Interfaces.PwPin p5 "Phase B input" annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  OpenIPSL.Interfaces.PwPin p6 "Phase C input" annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
  Types.ActivePower Pa "Active power suplyed in phase a";
  Types.ReactivePower Qa "Reactive power suplyed in phase a";
  Types.ActivePower Pb "Active power suplyed in phase b";
  Types.ReactivePower Qb "Reactive power suplyed in phase b";
  Types.ActivePower Pc "Active power suplyed in phase c";
  Types.ReactivePower Qc "Reactive power suplyed in phase c";
  Modelica.Blocks.Interfaces.RealOutput pa(unit="1") = Pa/S_b "[pu, system base]" annotation (Placement(transformation(
        extent={{-24,-24},{24,24}},
        rotation=-90,
        origin={52,-124}), iconTransformation(
        extent={{-24,-24},{24,24}},
        rotation=-90,
        origin={52,-124})));
  Modelica.Blocks.Interfaces.RealOutput pb(unit="1") = Pb/S_b "[pu, system base]" annotation (Placement(transformation(
        extent={{-24,-24},{24,24}},
        rotation=-90,
        origin={2,-124}), iconTransformation(
        extent={{-24,-24},{24,24}},
        rotation=-90,
        origin={2,-124})));
  Modelica.Blocks.Interfaces.RealOutput pc(unit="1") = Pc/S_b "[pu, system base]" annotation (Placement(transformation(
        extent={{-24,-24},{24,24}},
        rotation=-90,
        origin={-50,-124}), iconTransformation(
        extent={{-24,-24},{24,24}},
        rotation=-90,
        origin={-50,-124})));

  Modelica.Blocks.Interfaces.RealOutput qa(unit="1") = Qa/S_b "[pu, system base]" annotation (Placement(transformation(
        extent={{24,-24},{-24,24}},
        rotation=-90,
        origin={50,124}),  iconTransformation(
        extent={{24,-24},{-24,24}},
        rotation=-90,
        origin={50,124})));
  Modelica.Blocks.Interfaces.RealOutput qb(unit="1") = Qb/S_b "[pu, system base]" annotation (Placement(transformation(
        extent={{24,-24},{-24,24}},
        rotation=-90,
        origin={0,124}),  iconTransformation(
        extent={{24,-24},{-24,24}},
        rotation=-90,
        origin={0,124})));
  Modelica.Blocks.Interfaces.RealOutput qc(unit="1") = Qc/S_b "[pu, system base]" annotation (Placement(transformation(
        extent={{24,-24},{-24,24}},
        rotation=-90,
        origin={-50,124}),  iconTransformation(
        extent={{24,-24},{-24,24}},
        rotation=-90,
        origin={-50,124})));
equation
  // Equations for Phase A
  Pa = -(p1.vr*p1.ir + p1.vi*p1.ii)*S_p;
  Qa = -(p1.vr*p1.ii - p1.vi*p1.ir)*S_p;
  // Equations for Phase B
  Pb = -(p2.vr*p2.ir + p2.vi*p2.ii)*S_p;
  Qb = -(p2.vr*p2.ii - p2.vi*p2.ir)*S_p;
  // Equations for Phase C
  Pc = -(p3.vr*p3.ir + p3.vi*p3.ii)*S_p;
  Qc = -(p3.vr*p3.ii - p3.vi*p3.ir)*S_p;
  connect(p4, p1) annotation (Line(points={{-90,90},{90,90}}, color={0,0,255}));
  connect(p5, p2) annotation (Line(points={{-90,0},{90,0}}, color={0,0,255}));
  connect(p6, p3) annotation (Line(points={{-90,-90},{90,-90}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false,
        grid={10,10}), graphics={Rectangle(
          fillColor={255,255,255},
          extent={{-100,-100},{100,100}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid)}),
    Documentation(info="<html>
<p>This three-phase measurement device should be connected in series, between two other devices. The main features of this device are listed below:</p>
<ul>
<li>Pins <i><b>p4</b></i>, <i><b>p5</b></i> and <i><b>p6</b></i> work as input pins for electrical quantities coming from phases A, B and C, respectively. </li>
<li>In an similar way, pins<i> <b>p1</b></i>, <i><b>p2</b></i> an <i><b>p3</b></i> work as output pins for electrical quantities coming from phases A, B and C, respectively. </li>
<li>Current flows from pin <i><b>p4</b></i> to pin <i><b>p1</b></i>, from pin <i><b>p5</b></i> to pin <i><b>p2</b></i> and from pin <i><b>p6</b></i> to pin <i><b>p3</b></i>. </li>
<li>There is no voltage drop between the pairs of pins responsible for each phase. </li>
</ul>
<p>The device returns, as real outputs, active and reactive powers coming from each of the three phases. All values are calculated in per unit, using the system&apos;s three-phase power base, S_b, provided in model SystemBase. The outputs are explained in the list below:</p>
<ul>
<li><i><b>pa</b></i> and <i><b>qa</b></i>returns the active and reactive power, respectively, in phase A. </li>
<li><i><b>pb</b></i> and <i><b>qb</b></i> returns the active and reactive power, respectively, in phase B. </li>
<li><i><b>pc</b></i> and <i><b>qc</b></i> returns the active and reactive power, respectively, in phase C. </li>
</ul>
</html>"));
end MeasurementBus;
