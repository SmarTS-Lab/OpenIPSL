within OpenIPSL.Electrical.Banks;
model PwShuntR "Shunt inductor"
  OpenIPSL.Interfaces.PwPin p
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));
  constant Real pi=Modelica.Constants.pi;
  parameter Real Qnom=75
    "Reactive power produced by the shunt inductor under 1 p.u voltage, -Mvar";
  parameter Real Vbase=138 "Base volatage of the bus, kV";
  parameter Real fn=50 "Frequency rating, Hz";
  Real Zbase;
  Real L "Inductance in p.u";
  Real v;
  Real anglev;
  Real i;
  Real anglei;
equation
  v = sqrt(p.vr^2 + p.vi^2);
  anglev = atan2(p.vi, p.vr);
  i = sqrt(p.ir^2 + p.ii^2);
  anglei = atan2(p.ii, p.ir);
  Zbase = Vbase^2/(-Qnom);
  L = Vbase^2/(2*pi*fn*(-Qnom)*Zbase) "S=U*I";
  anglei = anglev - pi/2;
  i = v/(2*pi*fn*L) "I=U/Z";
  annotation (Icon(coordinateSystem(extent={{-100,-100},{100,100}},
          initialScale=0.1), graphics={Rectangle(extent={{-100,100},{100,-100}},
          lineColor={0,0,255}),Line(
          points={{-15.5,-9},{-15.5,-1},{-11.5,7},{-3.5,11},{6.5,9},{12.5,1},{
            12.5,-9}},
          color={0,0,255},
          smooth=Smooth.Bezier,
          origin={-9,59.5},
          rotation=90),Line(
          points={{-15.5,-9},{-15.5,-1},{-11.5,7},{-3.5,11},{6.5,9},{12.5,1},{
            12.5,-9}},
          color={0,0,255},
          smooth=Smooth.Bezier,
          origin={-9,31.5},
          rotation=90),Line(
          points={{-15.5,-9},{-15.5,-1},{-11.5,7},{-3.5,11},{6.5,9},{12.5,1},{
            12.5,-9}},
          color={0,0,255},
          smooth=Smooth.Bezier,
          origin={-9,3.5},
          rotation=90),Line(
          points={{-15.5,-9},{-15.5,-1},{-11.5,7},{-3.5,11},{6.5,9},{12.5,1},{
            12.5,-9}},
          color={0,0,255},
          smooth=Smooth.Bezier,
          origin={-9,-24.5},
          rotation=90),Line(
          points={{-60,-60},{60,-60}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-68,-80},{-48,-60}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-50,-80},{-30,-60}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-30,-80},{-10,-60}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-10,-80},{10,-60}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{12,-80},{32,-60}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{30,-80},{50,-60}},
          color={0,0,255},
          smooth=Smooth.None),Line(points={{0,72},{0,100}}, color={0,0,255}),
          Line(points={{0,-60},{0,-40}}, color={0,0,255}),Text(
          extent={{-100,-100},{100,-140}},
          lineColor={0,0,255},
          textString="%name")}), Documentation);
end PwShuntR;
