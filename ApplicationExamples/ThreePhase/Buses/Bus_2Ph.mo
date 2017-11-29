within ThreePhase.Buses;
model Bus_2Ph
  import Modelica.Constants.pi;
  OpenIPSL.Interfaces.PwPin p1(vr(start=V_1*cos(angle_1*Modelica.Constants.pi/
          180)), vi(start=V_1*sin(angle_1*Modelica.Constants.pi/180)))
    annotation (Placement(transformation(extent={{-10,35},{10,55}})));
  OpenIPSL.Interfaces.PwPin p2(vr(start=V_2*cos(angle_2*Modelica.Constants.pi/
          180)), vi(start=V_2*sin(angle_2*Modelica.Constants.pi/180)))
    annotation (Placement(transformation(extent={{-10,-55},{10,-35}})));

  parameter Real V_1=1 "Voltage magnitude for phase 1 (pu)"
    annotation (Dialog(group="Power flow data"));
  parameter Real V_2=1 "Voltage magnitude for phase 2 (pu)"
    annotation (Dialog(group="Power flow data"));
  parameter Real angle_1=0 "Voltage angle for phase 1 (deg)"
    annotation (Dialog(group="Power flow data"));
  parameter Real angle_2=-120 "Voltage angle for phase 2 (deg)"
    annotation (Dialog(group="Power flow data"));
  Real V1(start=V_1) "Bus voltage magnitude for phase 1 (pu)";
  Modelica.SIunits.Conversions.NonSIunits.Angle_deg angle1(start=angle_1)
    "Bus voltage angle for phase 1 (deg)";
  Real V2(start=V_2) "Bus voltage magnitude for phase 2 (pu)";
  Modelica.SIunits.Conversions.NonSIunits.Angle_deg angle2(start=angle_2)
    "Bus voltage angle for phase 2 (deg)";


protected
  Real[1, 4] Vin=[p1.vr, p1.vi, p2.vr, p2.vi];

equation
  V1 = sqrt(Vin[1, 1]^2 + Vin[1, 2]^2);
  angle1 = atan2(Vin[1, 2], Vin[1, 1])*180/Modelica.Constants.pi;
  V2 = sqrt(Vin[1, 3]^2 + Vin[1, 4]^2);
  angle2 = atan2(Vin[1, 4], Vin[1, 3])*180/Modelica.Constants.pi;
  p1.ir = 0;
  p1.ii = 0;
  p2.ir = 0;
  p2.ii = 0;


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
end Bus_2Ph;
