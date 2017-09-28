within OpenIPSL.Electrical.FACTS.PSAT;
model TCSCReactance
  OpenIPSL.Interfaces.PwPin p
    annotation (Placement(transformation(extent={{-119,-8},{-99,12}})));
  OpenIPSL.Interfaces.PwPin n
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  constant Real pi=Modelica.Constants.pi;
  parameter Real Sb=100 "System base power (MVA)"
    annotation (Dialog(group="Power flow data"));
  parameter Real Vbus=400000 "Bus nominal voltage (V)"
    annotation (Dialog(group="Power flow data"));
  parameter Real Sn=100 "Power rating (MVA)"
    annotation (Dialog(group="Power flow data"));
  parameter Real Vn=400000 "Voltage rating (V)"
    annotation (Dialog(group="Power flow data"));
  parameter Real f=50 "Frequency rating (Hz)"
    annotation (Dialog(group="Power flow data"));
  parameter Real x_TCSCO=0.01 "Value of the state varialbe x1"
    annotation (Dialog(group="Power flow data"));
  parameter Real x20=0.01 "Value of the state varible x2"
    annotation (Dialog(group="Power flow data"));
  parameter Real pref=0.080101913348342 "Reference power (pu)"
    annotation (Dialog(group="Power flow data"));
  parameter Real Cp=0.10 "Percentage of series compensation (%)";
  parameter Real Tr=0.5 "Regulator time constant (s)";
  parameter Real xTCSCmax=0.05 "Maximum reactance (pu)";
  parameter Real xTCSCmin=-0.05 "Minimum reactance (pu)";
  parameter Real Kp=5 "Proportional gain of PI controller (p.u./p.u.)";
  parameter Real Ki=1 "Integral gain of PI controller (p.u./p.u.)";
  parameter Real Vs_POD=0 "Power oscillation damper signal";
  parameter Real x_L=0.1 "Reactance (inductive) (pu)";
  parameter Real Kr=10 "Gain of the stabilizing signal (p.u./p.u.)";
  parameter Real G=0 "Shunt half conductance (pu)";
  parameter Real B=0 "Shunt half susceptance (pu)";
  parameter Real rL=0.01 "Line resistance (pu)";
  Real vk "Bus voltage of bus k (pu)";
  Real vm "Bus voltage of bus m (pu)";
  Real pkm "Active power flow from bus k to m (pu)";
  Real b "TCSC series susceptance (pu)";
  Real x_TCSC "TCSC series reactance (pu)";
protected
  Real x2;
  Real x0;
protected
  parameter Real Vb2new=Vbus*Vbus;
  parameter Real Vb2old=Vn*Vn;
  parameter Real R=rL*(Vb2old*Sb)/(Vb2new*Sn);
  parameter Real X=x_L*(Vb2old*Sb)/(Vb2new*Sn);
  parameter Real xTCSC_max=xTCSCmax*(Vb2old*Sb)/(Vb2new*Sn);
  parameter Real xTCSC_min=xTCSCmin*(Vb2old*Sb)/(Vb2new*Sn);
  parameter Real y=1/X;
initial equation
  x_TCSC = x_TCSCO;
  x2 = x20;
equation
  vk = sqrt(p.vr^2 + p.vi^2);
  vm = sqrt(n.vr^2 + n.vi^2);
  if x_TCSC > xTCSC_max and der(x_TCSC) > 0 and der(x2) > 0 then
    der(x_TCSC) = 0;
    der(x2) = -Ki*(pkm - pref);
    b = -xTCSC_max/X/(X*(1 - xTCSC_max/X));
  elseif x_TCSC < xTCSC_min and der(x_TCSC) < 0 and der(x2) < 0 then
    der(x_TCSC) = 0;
    der(x2) = -Ki*(pkm - pref);
    b = -xTCSC_min/X/(X*(1 - xTCSC_min/X));
  else
    der(x_TCSC) = (Kr*Vs_POD - Kp*(pkm - pref) + x2 - x_TCSC)/Tr;
    der(x2) = -Ki*(pkm - pref);
    b = -x_TCSC/X/(X*(1 - x_TCSC/X));
  end if;
  pkm = p.vr*p.ir + p.vi*p.ii;
  x0 = -(Kp*(pkm - pref) - x2);
  n.ii - B*n.vr - G*n.vi = (y - b)*(p.vr - n.vr);
  n.ir - G*n.vr + B*n.vi = (y - b)*(n.vi - p.vi);
  p.ii - B*p.vr - G*p.vi = (y - b)*(n.vr - p.vr);
  p.ir - G*p.vr + B*p.vi = (y - b)*(p.vi - n.vi);
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(
          extent={{-60,38},{60,-40}},
          lineColor={0,0,255},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid),Line(
          points={{-60,0},{-100,0},{-100,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{100,0},{60,0},{60,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-58,-60},{-42,-60},{40,58},{60,58},{60,58}},
          smooth=Smooth.None,
          color={255,0,0},
          thickness=0.5),Text(
          extent={{-24,62},{20,52}},
          lineColor={0,0,255},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          textString="%TCSC_XC%")}),
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
end TCSCReactance;
