within OpenIPSL.Electrical.Loads.PSAT.BaseClasses;
partial model baseLoad
  import Modelica.Constants.pi;
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  parameter OpenIPSL.Types.ApparentPowerMega Sn=S_b "Power rating (MVA)";
  Modelica.SIunits.PerUnit V(start=V_0) "Voltage magnitude (pu)";
  Modelica.SIunits.Angle Angle_V(start=Modelica.SIunits.Conversions.from_deg(
        angle_0)) "voltage angle (rad)";
  Modelica.SIunits.PerUnit P(start=P_0/S_b) "Active power (pu)";
  Modelica.SIunits.PerUnit Q(start=Q_0/S_b) "Reactive power (pu)";
  Interfaces.PwPin p(vr(start=V_0*cos(angle_0rad)),vi(start=V_0*sin(angle_0rad)))
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));
protected
  parameter Modelica.SIunits.Angle angle_0rad=
      Modelica.SIunits.Conversions.from_deg(angle_0);
  parameter Real CoB=Sn/S_b "Change of base between Machine and System";
equation
  P = p.vr*p.ir + p.vi*p.ii;
  Q = p.vi*p.ir - p.vr*p.ii;
  V = sqrt(p.vr^2 + p.vi^2);
  Angle_V = atan2(p.vi, p.vr);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={Line(points={{-100,100},{100,100},{0,-100},{
          -100,100}}, color={28,108,200}),Text(
          extent={{-60,80},{60,40}},
          lineColor={28,108,200},
          textString="%P_0+j%Q_0"),Text(
          extent={{-150,-110},{150,-150}},
          lineColor={0,0,255},
          textString="%name")}), Documentation);
end baseLoad;
