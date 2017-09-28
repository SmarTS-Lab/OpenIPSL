within OpenIPSL.Electrical.Branches.PSAT;
model ULTC_VoltageControl
  "Under Load Tap Changer, continuous model, secondary voltage control"
  OpenIPSL.Interfaces.PwPin p
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  OpenIPSL.Interfaces.PwPin n
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  parameter Real Sb=100 "System base power (MVA)"
    annotation (Dialog(group="Power flow data"));
  parameter Real Vbus1=400000 "Sending end Bus nominal voltage (V)"
    annotation (Dialog(group="Power flow data"));
  parameter Real Vbus2=100000 "Receiving end Bus nominal voltage (V)"
    annotation (Dialog(group="Power flow data"));
  parameter Real Sn=100 "Power rating (MVA)"
    annotation (Dialog(group="Power flow data"));
  parameter Real Vn=400000 "Voltage rating (V)"
    annotation (Dialog(group="Power flow data"));
  parameter Real fn=50 "Frequency rating (Hz)"
    annotation (Dialog(group="Power flow data"));
  parameter Real V_0=1.008959700699460
    "Voltage magnitude of the controlled bus (pu)"
    annotation (Dialog(group="Power flow data"));
  parameter Real m0=0.98 "Initial tap ratio"
    annotation (Dialog(group="Power flow data"));
  parameter Real kT=4 "Nominal tap ratio (V1/V2)"
    annotation (Dialog(group="ULTC data"));
  parameter Real H=0.001 "Integral deviation (pu)"
    annotation (Dialog(group="ULTC data"));
  parameter Real K=0.10 "Inverse time constant (1/s)"
    annotation (Dialog(group="ULTC data"));
  parameter Real m_max=0.98 "Maximum tap ratio (p.u./p.u.)"
    annotation (Dialog(group="ULTC data"));
  parameter Real m_min=0.9785 "Minimum tap ratio (p.u./p.u.)"
    annotation (Dialog(group="ULTC data"));
  parameter Real deltam=0 "Tap ratio step (p.u./p.u.)"
    annotation (Dialog(group="ULTC data"));
  parameter Real v_ref=1.0 "Reference voltage (power) (pu)"
    annotation (Dialog(group="ULTC data"));
  parameter Real xT=0.001 "Transformer reactance (pu)"
    annotation (Dialog(group="ULTC data"));
  parameter Real rT=0.1 "Transformer resistance (pu)"
    annotation (Dialog(group="ULTC data"));
  parameter Real d=0.05 "Dead zone percentage"
    annotation (Dialog(group="ULTC data"));
  Real m "Tap ratio";
  Real vk "Voltage at primary, p.u.";
  Real vm(start=V_0) "Voltage at secondary p.u.";
  Real anglevk "Angle at primary";
  Real anglevm "Angle at secondary ";
protected
  parameter Real V2=Vn/kT "Secondary voltage";
  parameter Real Vb2new=Vbus1*Vbus1;
  parameter Real Vb2old=Vn*Vn;
  parameter Real R=rT*(Vb2old*Sb)/(Vb2new*Sn) "Transformer Resistance, p.u.";
  parameter Real X=xT*(Vb2old*Sb)/(Vb2new*Sn) "Transformer Reactance, p.u.";
  parameter Real vref=v_ref*(V2/Vbus2);
initial equation
  m = m0;
equation
  vk = sqrt(p.vr^2 + p.vi^2);
  vm = sqrt(n.vr^2 + n.vi^2);
  anglevk = atan2(p.vi, p.vr);
  anglevm = atan2(n.vi, n.vr);
  if m > m_max and der(m) > 0 then
    R*p.ir - X*p.ii = 1/m_max^2*p.vr - 1/m_max*n.vr;
    R*p.ii + X*p.ir = 1/m_max^2*p.vi - 1/m_max*n.vi;
    R*n.ir - X*n.ii = n.vr - 1/m_max*p.vr;
    X*n.ir + R*n.ii = n.vi - 1/m_max*p.vi;
    der(m) = 0;
  elseif m < m_min and der(m) < 0 then
    R*p.ir - X*p.ii = 1/m_min^2*p.vr - 1/m_min*n.vr;
    R*p.ii + X*p.ir = 1/m_min^2*p.vi - 1/m_min*n.vi;
    R*n.ir - X*n.ii = n.vr - 1/m_min*p.vr;
    X*n.ir + R*n.ii = n.vi - 1/m_min*p.vi;
    der(m) = 0;
  else
    R*p.ir - X*p.ii = 1/m^2*p.vr - 1/m*n.vr;
    R*p.ii + X*p.ir = 1/m^2*p.vi - 1/m*n.vi;
    R*n.ir - X*n.ii = n.vr - 1/m*p.vr;
    X*n.ir + R*n.ii = n.vi - 1/m*p.vi;
    der(m) = (-H*m) + K*(vm - vref);
  end if;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={Ellipse(extent={{-46,30},{8,-30}}, lineColor={0,0,
          255}),Ellipse(extent={{-10,30},{44,-30}}, lineColor={0,0,255}),Line(
          points={{100,0},{44,0},{44,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-100,0},{-46,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{70,0},{70,-40},{-36,-40},{-20,18},{-20,18}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-30,6},{-20,18}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-20,2},{-20,16}},
          color={0,0,255},
          smooth=Smooth.None),Text(
          extent={{-32,66},{32,54}},
          lineColor={0,128,0},
          textString="%ULTC%")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
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
end ULTC_VoltageControl;
