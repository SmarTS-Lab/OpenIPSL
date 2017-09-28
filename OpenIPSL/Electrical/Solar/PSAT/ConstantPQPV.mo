within OpenIPSL.Electrical.Solar.PSAT;
model ConstantPQPV
  model PQ1 "Constant PQ Generator, Solar Photo-Voltaic Generator"
    OpenIPSL.Interfaces.PwPin p annotation (Placement(
        visible=true,
        transformation(
          origin={55.0,22.7992},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0),
        iconTransformation(
          origin={-110.0,0.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    parameter Real S_b=100 "System base power (MVA)"
      annotation (Dialog(group="Power flow data"));
    parameter Real Sn=10 "Nominal power (MVA)";
    parameter Real V_0=1.00018548610126 "Voltage magnitude (pu)"
      annotation (Dialog(group="Power flow data"));
    parameter Real angle_0=-0.0000253046024029618 "Voltage angle (deg)"
      annotation (Dialog(group="Power flow data"));
    parameter Real P_0=0.4 "Active power (pu)"
      annotation (Dialog(group="Power flow data"));
    parameter Real Q_0=0.3 "Reactive power (pu)"
      annotation (Dialog(group="Power flow data"));
    parameter Real Td=15 "d-axis inverter time constant (s)";
    parameter Real Tq=15 "q-axis inverter time constant (s)";
  protected
    parameter Real CoB=Sn/S_b;
    parameter Real Pref=P_0*CoB "Initialitation";
    parameter Real Qref=Q_0*CoB "Initialitation";
    parameter Real vd0=-V_0*sin(angle_0) "Initialitation";
    parameter Real vq0=V_0*cos(angle_0) "Initialitation";
    parameter Real idref=(vq0*Qref + Pref*vd0)/(vq0^2 + vd0^2) "Initialitation";
    parameter Real iqref=((-vd0*Qref) + Pref*vq0)/(vq0^2 + vd0^2)
      "Initialitation";
  public
    Real v "Bus voltage magnitude (pu)";
    Real anglev "Bus voltage angle (deg)";
    Real id(start=idref) "d-axis current (pu)";
    Real iq(start=iqref) "q-axis current (pu)";
    Real vd(start=vd0) "d-axis voltage (pu)";
    Real vq(start=vq0) "q-axis voltage (pu)";
    Real P(start=Pref) "Active power (pu)";
    Real Q(start=Qref) "Reactive power (pu)";
    Real idref1(start=idref) "d-axis current setpoint";
    Real iqref1(start=iqref) "q-axis current setpoint";
  equation
    P = vd*id + vq*iq;
    Q = vq*id - vd*iq;
    idref1 = (vq*Qref + Pref*vd)/(vq^2 + vd^2);
    iqref1 = ((-vd*Qref) + Pref*vq)/(vq^2 + vd^2);
    der(id) = (idref1 - id)/Td;
    der(iq) = (iqref1 - iq)/Tq;
    v = sqrt(p.vr^2 + p.vi^2);
    anglev = atan2(p.vi, p.vr);
    p.ir = -iq
      "change of sign due to the fact than in modelica when entering is + and in this case is going out";
    p.ii = id
      "change of sign due to the fact than in modelica when entering is + and in this case is going out";
    p.vr = vq;
    p.vi = -vd;
    annotation (
      Icon(coordinateSystem(
          extent={{-100.0,-100.0},{100.0,100.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={10,10}), graphics={Rectangle(
              visible=true,
              fillColor={255,255,255},
              extent={{-100.0,-100.0},{100.0,100.0}}),Text(
              visible=true,
              origin={0.0,15.3102},
              fillPattern=FillPattern.Solid,
              extent={{-31.415,-20.0667},{31.415,20.0667}},
              textString="%name",
              fontName="Arial")}),
      Diagram(coordinateSystem(
          extent={{-148.5,-105.0},{148.5,105.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={5,5})),
      Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>Constant PQ Generator, Solar Photo-Voltaic Generator, PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>September 2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
  end PQ1;

  model PV1 "Constant PV Generator, Solar Photo-Voltaic Generator"
    OpenIPSL.Interfaces.PwPin p annotation (Placement(
        visible=true,
        transformation(
          origin={55.0,22.7992},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0),
        iconTransformation(
          origin={-110.0,0.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    parameter Real S_b=100 "System base power (MVA)"
      annotation (Dialog(group="Power flow data"));
    parameter Real Sn=10 "Nominal power (MVA)";
    parameter Real V_0=1.00018548610126 "Voltage magnitude (pu)"
      annotation (Dialog(group="Power flow data"));
    parameter Real angle_0=-0.0000253046024029618 "Voltage angle (deg)"
      annotation (Dialog(group="Power flow data"));
    parameter Real P_0=0.4 "Active power (pu)"
      annotation (Dialog(group="Power flow data"));
    parameter Real Q_0=0.3 "Reactive power (pu)"
      annotation (Dialog(group="Power flow data"));
    parameter Real vref=1.0002 "Voltage reference (pu)";
    parameter Real Td=0.15 "d-axis inverter time constant (s)";
    parameter Real Tq=0.15 "q-axis inverter time constant (s)";
    parameter Real Ki=50.9005 "Integral gain of the voltage controller";
    parameter Real Kp=0.0868 "Proportional gain of the voltage controller";
  protected
    parameter Real CoB=Sn/S_b;
    parameter Real Pref=P_0*CoB;
    parameter Real vd0=-V_0*sin(angle_0) "Initialitation";
    parameter Real vq0=V_0*cos(angle_0) "Initialitation";
    parameter Real idref=(vq0*Q_0*CoB + Pref*vd0)/(vq0^2 + vd0^2)
      "Initialitation";
    parameter Real iqref=((-vd0*Q_0*CoB) + Pref*vq0)/(vq0^2 + vd0^2)
      "Initialitation";
    Real x(start=Q_0*CoB);
    Real Qref(start=Q_0*CoB);
  public
    Real v "Bus voltage magnitude (pu)";
    Real anglev "Bus voltage angle (deg.)";
    Real idref1(start=idref) "d-axis current setpoint";
    Real iqref1(start=iqref) "q-axis current setpoint";
    Real id(start=idref) "d-axis current (pu)";
    Real iq(start=iqref) "q-axis current (pu)";
    Real vd(start=vd0) "d-axis voltage (pu)";
    Real vq(start=vq0) "q-axs voltage (pu)";
    Real P(start=Pref) "Active power (pu)";
    Real Q(start=Q_0*CoB) "Reactive power (pu)";
  equation
    der(x) = Ki*(vref - v);
    Qref = x + Kp*(vref - v);
    P = vd*id + vq*iq;
    Q = vq*id - vd*iq;
    idref1 = (vq*Qref + Pref*vd)/(vq^2 + vd^2);
    iqref1 = ((-vd*Qref) + Pref*vq)/(vq^2 + vd^2);
    der(id) = (idref1 - id)/Td;
    der(iq) = (iqref1 - iq)/Tq;
    v = sqrt(p.vr^2 + p.vi^2);
    anglev = atan2(p.vi, p.vr);
    p.ir = -iq
      "change of sign due to the fact than in modelica when entering is + and in this case is going out";
    p.ii = id
      "change of sign due to the fact than in modelica when entering is + and in this case is going out";
    p.vr = vq;
    p.vi = -vd;
    annotation (
      Icon(coordinateSystem(
          extent={{-100.0,-100.0},{100.0,100.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={10,10}), graphics={Rectangle(
              visible=true,
              fillColor={255,255,255},
              extent={{-100.0,-100.0},{100.0,100.0}}),Text(
              visible=true,
              origin={0.0,15.3102},
              fillPattern=FillPattern.Solid,
              extent={{-31.415,-20.0667},{31.415,20.0667}},
              textString="%name",
              fontName="Arial")}),
      Diagram(coordinateSystem(
          extent={{-148.5,-105.0},{148.5,105.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={5,5})),
      Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>Constant PV Generator, Solar Photo-Voltaic Generator, PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>September 2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
  end PV1;
  annotation (Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={5,5})), Documentation);
end ConstantPQPV;
