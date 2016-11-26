within TriPhase;
model ThreePhaseBus

  OpenIPSL.Connectors.PwPin p1
    annotation (Placement(transformation(extent={{-10,80},{10,100}})));
  OpenIPSL.Connectors.PwPin p2
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  OpenIPSL.Connectors.PwPin p3
    annotation (Placement(transformation(extent={{-10,-100},{10,-80}})));
  Real Va(start=V_A) "Bus voltage magnitude for phase A (pu)";
  Real angle_a(start=angle_A) "Bus voltage angle for phase A (deg)";
  Real Vb(start=V_B) "Bus voltage magnitude for phase B (pu)";
  Real angle_b(start=angle_B) "Bus voltage angle for phase B (deg)";
  Real Vc(start=V_C) "Bus voltage magnitude for phase C (pu)";
  Real angle_c(start=angle_C) "Bus voltage angle for phase C (deg)";
  parameter Real V_A=1 "Voltage magnitude for phase A (pu)" annotation (Dialog(group="Power flow data"));
  parameter Real V_B=1 "Voltage magnitude for phase B (pu)" annotation (Dialog(group="Power flow data"));
  parameter Real V_C=1 "Voltage magnitude for phase C (pu)" annotation (Dialog(group="Power flow data"));
  parameter Real angle_A=0 "Voltage angle for phase A (deg)" annotation (Dialog(group="Power flow data"));
  parameter Real angle_B=-Modelica.Constants.Pi/3
    "Voltage angle for phase B (deg)"                                              annotation (Dialog(group="Power flow data"));
  parameter Real angle_C= Modelica.Constants.Pi/3
    "Voltage angle for phase C (deg)"                                              annotation (Dialog(group="Power flow data"));

equation
  Va = sqrt(p1.vr^2 + p1.vi^2);
  angle_a = atan2(p1.vi, p1.vr)*180/Modelica.Constants.pi;
  Vb = sqrt(p2.vr^2 + p2.vi^2);
  angle_b = atan2(p2.vi, p2.vr)*180/Modelica.Constants.pi;
  Vc = sqrt(p3.vr^2 + p3.vi^2);
  angle_c = atan2(p3.vi, p3.vr)*180/Modelica.Constants.pi;
  p1.ir = 0;
  p1.ii = 0;
  p2.ir = 0;
  p2.ii = 0;
  p3.ir = 0;
  p3.ii = 0;

  annotation (
   Icon(coordinateSystem(
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
          textString=DynamicSelect("0.0", String(v, significantDigits=3)),
          lineColor={238,46,47}),Text(
          origin={0.9738,-140.937},
          fillPattern=FillPattern.Solid,
          extent={{-39.0262,-16.7966},{39.0262,16.7966}},
          fontName="Arial",
          textString=DynamicSelect("0.0", String(anglevdeg, significantDigits=3)),
          lineColor={238,46,47})}));
end ThreePhaseBus;
