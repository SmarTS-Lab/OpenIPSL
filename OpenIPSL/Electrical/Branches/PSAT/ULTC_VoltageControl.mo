within OpenIPSL.Electrical.Branches.PSAT;
model ULTC_VoltageControl
  "Under Load Tap Changer, continuous model, secondary voltage control"
  OpenIPSL.Interfaces.PwPin p
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  OpenIPSL.Interfaces.PwPin n
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  parameter SI.ApparentPower S_b(displayUnit="MVA")=100e6 "System base power"
    annotation (Dialog(group="Power flow data"));
  parameter SI.Voltage Vbus1(displayUnit="kV")=400e3 "Sending end Bus nominal voltage"
    annotation (Dialog(group="Power flow data"));
  parameter SI.Voltage Vbus2(displayUnit="kV")=100e3 "Receiving end Bus nominal voltage"
    annotation (Dialog(group="Power flow data"));
  parameter SI.ApparentPower Sn(displayUnit="MVA")=100e6 "Power rating (MVA)"
    annotation (Dialog(group="Transformer data"));
  parameter SI.Voltage Vn(displayUnit="kV")=400e3 "Voltage rating"
    annotation (Dialog(group="Transformer data"));
  parameter SI.PerUnit rT=0.01 "Transformer resistance (pu, transformer base)"
    annotation (Dialog(group="Transformer data"));
  parameter SI.PerUnit xT=0.2 "Transformer reactance (pu, transformer base)"
    annotation (Dialog(group="Transformer data"));
  parameter SI.PerUnit v_ref=1.0 "Reference voltage (pu)"
    annotation (Dialog(group="Voltage control"));
  parameter SI.PerUnit v_0=1.008959700699460
    "Initial voltage magnitude of the controlled bus (pu)"
    annotation (Dialog(group="Voltage control"));
  parameter Real kT=4 "Nominal tap ratio (V1/V2)"
    annotation (Dialog(group="Voltage control"));
  parameter SI.PerUnit m0=0.98 "Initial tap ratio (pu/pu)"
    annotation (Dialog(group="Voltage control"));
  parameter SI.PerUnit m_max=0.98 "Maximum tap ratio (pu/pu)"
    annotation (Dialog(group="Voltage control"));
  parameter SI.PerUnit m_min=0.9785 "Minimum tap ratio (pu/pu)"
    annotation (Dialog(group="Voltage control"));
  parameter SI.PerUnit H=0.001 "Integral deviation (pu)"
    annotation (Dialog(group="Voltage control"));
  parameter SI.TimeAging K=0.10 "Inverse time constant"
    annotation (Dialog(group="Voltage control"));
//  parameter Real deltam=0 "Tap ratio step (p.u./p.u.)"
//    annotation (Dialog(group="Voltage control"));
//  parameter Real d=0.05 "Dead zone percentage"
//    annotation (Dialog(group="Voltage control"));
  SI.PerUnit m "Tap ratio";
  SI.PerUnit vk "Voltage at primary (pu)";
  SI.PerUnit vm(start=v_0) "Voltage at secondary (pu)";
  SI.Angle anglevk "Angle at primary";
  SI.Angle anglevm "Angle at secondary ";
protected
  parameter SI.Voltage V2=Vn/kT "Secondary voltage";
  parameter SI.Impedance Zn = Vn^2/Sn "Transformer base impedance";
  parameter SI.Impedance Zb = Vbus1^2/S_b "System base impedance";
  parameter SI.PerUnit r = rT * Zn/Zb "Resistance (pu, system base)";
  parameter SI.PerUnit x = xT * Zn/Zb "Reactance (pu, system base)";
  parameter SI.PerUnit vref=v_ref*(V2/Vbus2);
initial equation
  m = m0;
equation
  vk = sqrt(p.vr^2 + p.vi^2);
  vm = sqrt(n.vr^2 + n.vi^2);
  anglevk = atan2(p.vi, p.vr);
  anglevm = atan2(n.vi, n.vr);
  if m > m_max and der(m) > 0 then
    r*p.ir - x*p.ii = 1/m_max^2*p.vr - 1/m_max*n.vr;
    r*p.ii + x*p.ir = 1/m_max^2*p.vi - 1/m_max*n.vi;
    r*n.ir - x*n.ii = n.vr - 1/m_max*p.vr;
    x*n.ir + r*n.ii = n.vi - 1/m_max*p.vi;
    der(m) = 0;
  elseif m < m_min and der(m) < 0 then
    r*p.ir - x*p.ii = 1/m_min^2*p.vr - 1/m_min*n.vr;
    r*p.ii + x*p.ir = 1/m_min^2*p.vi - 1/m_min*n.vi;
    r*n.ir - x*n.ii = n.vr - 1/m_min*p.vr;
    x*n.ir + r*n.ii = n.vi - 1/m_min*p.vi;
    der(m) = 0;
  else
    r*p.ir - x*p.ii = 1/m^2*p.vr - 1/m*n.vr;
    r*p.ii + x*p.ir = 1/m^2*p.vi - 1/m*n.vi;
    r*n.ir - x*n.ii = n.vr - 1/m*p.vr;
    x*n.ir + r*n.ii = n.vi - 1/m*p.vi;
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
          extent={{-100,-40},{100,-100}},
          lineColor={0,128,0},
          textString="ULTC"),
        Text(
          extent={{-100,100},{100,40}},
          lineColor={0,0,255},
          textString="%name")}),
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
