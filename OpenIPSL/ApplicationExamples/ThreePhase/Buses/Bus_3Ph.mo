within ThreePhase.Buses;
model Bus_3Ph
  import Modelica.Constants.pi;
  OpenIPSL.Interfaces.PwPin p1(vr(start=V_A*cos(angle_A*Modelica.Constants.pi/
          180)), vi(start=V_A*sin(angle_A*Modelica.Constants.pi/180)))
    annotation (Placement(transformation(extent={{-10,80},{10,100}})));
  OpenIPSL.Interfaces.PwPin p2(vr(start=V_B*cos(angle_B*Modelica.Constants.pi/
          180)), vi(start=V_B*sin(angle_B*Modelica.Constants.pi/180)))
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  OpenIPSL.Interfaces.PwPin p3(vr(start=V_C*cos(angle_C*Modelica.Constants.pi/
          180)), vi(start=V_C*sin(angle_C*Modelica.Constants.pi/180)))
    annotation (Placement(transformation(extent={{-10,-100},{10,-80}})));

  parameter Real V_A=1 "Voltage magnitude for phase A (pu)"
    annotation (Dialog(group="Power flow data"));
  parameter Real V_B=1 "Voltage magnitude for phase B (pu)"
    annotation (Dialog(group="Power flow data"));
  parameter Real V_C=1 "Voltage magnitude for phase C (pu)"
    annotation (Dialog(group="Power flow data"));
  parameter Real angle_A=0 "Voltage angle for phase A (deg)"
    annotation (Dialog(group="Power flow data"));
  parameter Real angle_B=-120 "Voltage angle for phase B (deg)"
    annotation (Dialog(group="Power flow data"));
  parameter Real angle_C=120 "Voltage angle for phase C (deg)"
    annotation (Dialog(group="Power flow data"));
  Real Va(start=V_A) "Bus voltage magnitude for phase A (pu)";
  Modelica.SIunits.Conversions.NonSIunits.Angle_deg angle_a(start=angle_A)
    "Bus voltage angle for phase A (deg)";
  Real Vb(start=V_B) "Bus voltage magnitude for phase B (pu)";
  Modelica.SIunits.Conversions.NonSIunits.Angle_deg angle_b(start=angle_B)
    "Bus voltage angle for phase B (deg)";
  Real Vc(start=V_C) "Bus voltage magnitude for phase C (pu)";
  Modelica.SIunits.Conversions.NonSIunits.Angle_deg angle_c(start=angle_C)
    "Bus voltage angle for phase C (deg)";

protected
  Real[1, 6] Vin=[p1.vr, p1.vi, p2.vr, p2.vi, p3.vr, p3.vi];

equation
  Va = sqrt(Vin[1, 1]^2 + Vin[1, 2]^2);
  angle_a = atan2(Vin[1, 2], Vin[1, 1])*180/Modelica.Constants.pi;
  Vb = sqrt(Vin[1, 3]^2 + Vin[1, 4]^2);
  angle_b = atan2(Vin[1, 4], Vin[1, 3])*180/Modelica.Constants.pi;
  Vc = sqrt(Vin[1, 5]^2 + Vin[1, 6]^2);
  angle_c = atan2(Vin[1, 6], Vin[1, 5])*180/Modelica.Constants.pi;
  p1.ir = 0;
  p1.ii = 0;
  p2.ir = 0;
  p2.ii = 0;
  p3.ir = 0;
  p3.ii = 0;

  annotation (Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={2,2}), graphics={Rectangle(
          visible=true,
          fillPattern=FillPattern.Solid,
          extent={{-10.0,-100.0},{10.0,100.0}}),Text(
          visible=true,
          origin={0.9738,119.0625},
          fillPattern=FillPattern.Solid,
          extent={{-39.0262,-16.7966},{39.0262,16.7966}},
          textString="%name",
          fontName="Arial"),Text(
          origin={0.9738,-114.937},
          fillPattern=FillPattern.Solid,
          extent={{-39.0262,-16.7966},{39.0262,16.7966}},
          fontName="Arial",
          textString=DynamicSelect("0.0", "%Va"),
          lineColor={238,46,47}),Text(
          origin={0.9738,-140.937},
          fillPattern=FillPattern.Solid,
          extent={{-39.0262,-16.7966},{39.0262,16.7966}},
          fontName="Arial",
          textString=DynamicSelect("0.0", String(Vb, significantDigits=3)),
          lineColor={238,46,47})}));
end Bus_3Ph;
