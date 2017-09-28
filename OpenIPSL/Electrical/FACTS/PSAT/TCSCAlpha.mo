within OpenIPSL.Electrical.FACTS.PSAT;
model TCSCAlpha
  OpenIPSL.Interfaces.PwPin p
    annotation (Placement(transformation(extent={{-119,-10},{-99,10}})));
  OpenIPSL.Interfaces.PwPin n
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  constant Real pi=Modelica.Constants.pi;
  parameter Real SystemBase=100 "System base power (MVA)"
    annotation (Dialog(group="Power flow data"));
  parameter Real Vbus=400000 "Bus nominal voltage (V)"
    annotation (Dialog(group="Power flow data"));
  parameter Real Sn=100 "Power rating (MVA)"
    annotation (Dialog(group="Power flow data"));
  parameter Real Vn=400000 "Voltage rating (V)"
    annotation (Dialog(group="Power flow data"));
  parameter Real f=50 "Frequency rating (Hz)"
    annotation (Dialog(group="Power flow data"));
  parameter Real alpha_TCSCO=0.826168365308219 "Value of state variable x1"
    annotation (Dialog(group="Power flow data"));
  parameter Real x20=0.826168365308219 "Value of the state varible x2"
    annotation (Dialog(group="Power flow data"));
  parameter Real x0i=0.826168365308219 "Value of x0"
    annotation (Dialog(group="Power flow data"));
  parameter Real pref=0.080101913348342 "Reference power (pu)"
    annotation (Dialog(group="Power flow data"));
  parameter Real Cp=0.10 "Percentage of series compensation (%)";
  parameter Real Tr=0.5 "Regulator time constant (s)";
  parameter Real alpha_max=0.85 " Maximum firing angle (rad)";
  parameter Real alpha_min=0.72 "Minimum firing angle (rad)";
  parameter Real Kp=5 "Proportional gain of PI controller (p.u./p.u.)";
  parameter Real Ki=1 "Integral gain of PI controller (p.u./p.u.)";
  parameter Real Kr=10 "Gain of stabilizing signal (p.u./p.u.)";
  parameter Real Vs_POD=0 "Power oscillation damper signal";
  parameter Real x_L=0.2 "Reactance (inductive) (pu)";
  parameter Real x_C=0.1 "Reactance (capacitive) (pu)";
  parameter Real XL=0.1 "Line reactance (pu)";
  parameter Real G=0 "Shunt half conductance (pu)";
  parameter Real B=0 "Shunt half susceptance (pu)";
  parameter Real rL=0.01 "Line resistance, (pu)";
  Real vk "Bus voltage of bus k (pu)";
  Real vm "Bus voltage of bus m (pu)";
  Real pkm(start=pref) "Active power flow from bus k to m (pu)";
  Real b "TCSC series susceptance (pu)";
  Real alpha_TCSC "TCSC series reactance (pu)";
protected
  Real x0(start=x0i);
  Real x2(start=x20);
protected
  parameter Real Vb2new=Vbus*Vbus;
  parameter Real Vb2old=Vn*Vn;
  parameter Real xL=x_L*(Vb2old*SystemBase)/(Vb2new*Sn)
    "Reactance(inductive),p.u";
  parameter Real xC=x_C*(Vb2old*SystemBase)/(Vb2new*Sn)
    "Reactance(capacitive),p.u";
  parameter Real X=XL*(Vb2old*SystemBase)/(Vb2new*Sn) "Line Reactance,p.u";
  parameter Real kx=sqrt(xC/xL);
  parameter Real XL2=(1 - Cp)*XL;
  parameter Real y=1/X;
initial equation
  alpha_TCSC = alpha_TCSCO;
equation
  vk = sqrt(p.vr^2 + p.vi^2);
  vm = sqrt(n.vr^2 + n.vi^2);
  pkm = p.vr*p.ir + p.vi*p.ii;
  x0 = -(Kp*(pkm - pref) - x2);
  if alpha_TCSC > alpha_max and der(alpha_TCSC) > 0 and der(x2) > 0 then
    der(alpha_TCSC) = 0;
    der(x2) = -Ki*(pkm - pref);
    b = pi*(kx^4 - 2*kx^2 + 1)*cos(kx*(pi - alpha_max))/(xC*(pi*kx^4*cos(kx*(pi
       - alpha_max))) - pi*cos(kx*(pi - alpha_max)) - 2*kx^4*alpha_max*cos(kx*(
      pi - alpha_max)) + 2*kx^2*alpha_max*cos(kx*(pi - alpha_max)) - kx^4*sin(2
      *alpha_max)*cos(kx*(pi - alpha_max)) + kx^2*sin(2*alpha_max)*cos(kx*(pi
       - alpha_max)) - 4*kx^3*cos(alpha_max)^2*sin(kx*(pi - alpha_max)) - 4*kx^
      2*cos(alpha_max)*sin(alpha_max)*cos(kx*(pi - alpha_max)));
  elseif alpha_TCSC < alpha_min and der(alpha_TCSC) < 0 and der(x2) < 0 then
    der(alpha_TCSC) = 0;
    der(x2) = -Ki*(pkm - pref);
    b = pi*(kx^4 - 2*kx^2 + 1)*cos(kx*(pi - alpha_min))/(xC*(pi*kx^4*cos(kx*(pi
       - alpha_min))) - pi*cos(kx*(pi - alpha_min)) - 2*kx^4*alpha_min*cos(kx*(
      pi - alpha_min)) + 2*kx^2*alpha_min*cos(kx*(pi - alpha_min)) - kx^4*sin(2
      *alpha_min)*cos(kx*(pi - alpha_min)) + kx^2*sin(2*alpha_min)*cos(kx*(pi
       - alpha_min)) - 4*kx^3*cos(alpha_min)^2*sin(kx*(pi - alpha_min)) - 4*kx^
      2*cos(alpha_min)*sin(alpha_min)*cos(kx*(pi - alpha_min)));
  else
    der(alpha_TCSC) = (Kr*Vs_POD - Kp*(pkm - pref) + x2 - alpha_TCSC)/Tr;
    der(x2) = -Ki*(pkm - pref);
    b = pi*(kx^4 - 2*kx^2 + 1)*cos(kx*(pi - alpha_TCSC))/(xC*(pi*kx^4*cos(kx*(
      pi - alpha_TCSC))) - pi*cos(kx*(pi - alpha_TCSC)) - 2*kx^4*alpha_TCSC*cos(
      kx*(pi - alpha_TCSC)) + 2*kx^2*alpha_TCSC*cos(kx*(pi - alpha_TCSC)) - kx^
      4*sin(2*alpha_TCSC)*cos(kx*(pi - alpha_TCSC)) + kx^2*sin(2*alpha_TCSC)*
      cos(kx*(pi - alpha_TCSC)) - 4*kx^3*cos(alpha_TCSC)^2*sin(kx*(pi -
      alpha_TCSC)) - 4*kx^2*cos(alpha_TCSC)*sin(alpha_TCSC)*cos(kx*(pi -
      alpha_TCSC)));
  end if;
  n.ii - B*n.vr - G*n.vi = (y + b)*(p.vr - n.vr);
  n.ir - G*n.vr + B*n.vi = (y + b)*(n.vi - p.vi);
  p.ii - B*p.vr - G*p.vi = (y + b)*(n.vr - p.vr);
  p.ir - G*p.vr + B*p.vi = (y + b)*(p.vi - n.vi);
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(
          extent={{-4,46},{-4,34}},
          lineColor={0,0,255},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid),Rectangle(
          extent={{6,46},{6,34}},
          lineColor={0,0,255},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid),Line(
          points={{-60,40},{-20,40},{-4,40}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-60,40},{-60,-40},{-22,-40},{-22,-40}},
          color={0,0,255},
          smooth=Smooth.None),Polygon(
          points={{4,-16},{18,-20},{4,-24},{4,-24},{4,-16}},
          lineColor={0,0,255},
          smooth=Smooth.None,
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid),Polygon(
          points={{-7,4},{7,0},{-7,-4},{-7,-4},{-7,4}},
          lineColor={0,0,255},
          smooth=Smooth.None,
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          origin={9,-58},
          rotation=180),Line(
          points={{18,-16},{18,-24}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{2,-54},{2,-62}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-22,-20},{-22,-58},{-22,-56}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-22,-58},{2,-58},{2,-58}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-22,-20},{4,-20},{4,-20}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{18,-20},{40,-20},{40,-58},{16,-58},{16,-58}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{6,40},{60,40},{60,-40},{40,-40}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-100,0},{-62,0},{-60,0},{-60,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{60,0},{100,0},{100,0}},
          color={0,0,255},
          smooth=Smooth.None),Text(
          extent={{-18,68},{16,60}},
          lineColor={0,0,255},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          textString="%TCSC_Alpha%")}),
    Documentation(info="<html>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>15/07/2015</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end TCSCAlpha;
