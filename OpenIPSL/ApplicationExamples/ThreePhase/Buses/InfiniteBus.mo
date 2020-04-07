within ThreePhase.Buses;
model InfiniteBus
  outer OpenIPSL.Electrical.SystemBase SysData
    "Must add this line in all models";
  parameter Real Vb=400 "Base voltage of the bus (kV)"
    annotation (Dialog(group="Power flow data"));
  parameter Real V_A=1 "Voltage magnitude (pu)"
    annotation (Dialog(group="Power flow data"));
  parameter Real angle_A=0 "Voltage angle for phase A (deg)"
    annotation (Dialog(group="Power flow data"));
  parameter Real V_B=1 "Voltage magnitude (pu)"
    annotation (Dialog(group="Power flow data"));
  parameter Real angle_B=-120 "Voltage angle for phase A (deg)"
    annotation (Dialog(group="Power flow data"));
  parameter Real V_C=1 "Voltage magnitude (pu)"
    annotation (Dialog(group="Power flow data"));
  parameter Real angle_C=120 "Voltage angle for phase A (deg)"
    annotation (Dialog(group="Power flow data"));
  parameter Real P_A=1 "Active Power for phase A (MW)"
    annotation (Dialog(group="Power flow data"));
  parameter Real Q_A=0 "Reactive Power for phase A (MVAr)"
    annotation (Dialog(group="Power flow data"));
  parameter Real P_B=1 "Active Power for phase B (MW)"
    annotation (Dialog(group="Power flow data"));
  parameter Real Q_B=0 "Reactive Power for phase B (MVAr)"
    annotation (Dialog(group="Power flow data"));
  parameter Real P_C=1 "Active Power for phase C (MW)"
    annotation (Dialog(group="Power flow data"));
  parameter Real Q_C=0 "Reactive Power for phase C (MVAr)"
    annotation (Dialog(group="Power flow data"));
  parameter Real S_b=SysData.S_b "System base power (MVA)"
    annotation (Dialog(group="Power flow data", enable=false));
  parameter Real fn=SysData.fn "System Frequency (Hz)"
    annotation (Dialog(group="Power flow data", enable=false));
  OpenIPSL.Interfaces.PwPin p1
    annotation (Placement(transformation(extent={{80,80},{100,100}})));
  OpenIPSL.Interfaces.PwPin p2
    annotation (Placement(transformation(extent={{80,-10},{100,10}})));
  OpenIPSL.Interfaces.PwPin p3
    annotation (Placement(transformation(extent={{80,-100},{100,-80}})));
  Real Pa "Active Power suplyed by the Infinite bus (phase a) (MW)";
  Real Qa "Reactive Power suplyed by the Infinite bus (phase a) (MVAr)";
  Real Pb "Active Power suplyed by the Infinite bus (phase b) (MW)";
  Real Qb "Reactive Power suplyed by the Infinite bus (phase b) (MVAr)";
  Real Pc "Active Power suplyed by the Infinite bus (phase c) (MW)";
  Real Qc "Reactive Power suplyed by the Infinite bus (phase c) (MVAr)";
equation
  // Equations for Phase A
  p1.vr = V_A*cos(angle_A*Modelica.Constants.pi/180);
  p1.vi = V_A*sin(angle_A*Modelica.Constants.pi/180);
  Pa = -(p1.vr*p1.ir + p1.vi*p1.ii)*S_b/3;
  Qa = -(p1.vr*p1.ii - p1.vi*p1.ir)*S_b/3;
  // Equations for Phase B
  p2.vr = V_B*cos(angle_B*Modelica.Constants.pi/180);
  p2.vi = V_B*sin(angle_B*Modelica.Constants.pi/180);
  Pb = -(p2.vr*p2.ir + p2.vi*p2.ii)*S_b/3;
  Qb = -(p2.vr*p2.ii - p2.vi*p2.ir)*S_b/3;
  // Equations for Phase C
  p3.vr = V_C*cos(angle_C*Modelica.Constants.pi/180);
  p3.vi = V_C*sin(angle_C*Modelica.Constants.pi/180);
  Pc = -(p3.vr*p3.ir + p3.vi*p3.ii)*S_b/3;
  Qc = -(p3.vr*p3.ii - p3.vi*p3.ir)*S_b/3;
  annotation (Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={10,10}), graphics={Rectangle(
          fillColor={255,255,255},
          extent={{-100,-100},{100,100}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid),Line(points={{34,86},{82,86},{74,92}},
          color={0,0,0}),Text(
          extent={{14,84},{102,38}},
          lineColor={238,46,47},
          textString=DynamicSelect("0.0", String(P, significantDigits=2))),Line(
          points={{32,-54},{80,-54},{72,-48}}, color={0,0,0}),Text(
          extent={{12,-54},{100,-100}},
          lineColor={0,255,0},
          textString=DynamicSelect("0.0", String(Q, significantDigits=2))),Line(
          points={{40,-48},{40,-60}}, color={0,0,0}),Line(points={{80,-54},{72,
          -60}}, color={0,0,0}),Line(points={{82,86},{74,80}}, color={0,0,0})}),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})));
end InfiniteBus;
