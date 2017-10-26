within OpenIPSL.Electrical.Branches.PSAT;
model TwoWindingTransformer "Modeled as series reactances without iron losses"
  outer OpenIPSL.Electrical.SystemBase SysData;
  OpenIPSL.Interfaces.PwPin p
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  OpenIPSL.Interfaces.PwPin n
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  parameter Real Sb=SysData.S_b "System base power (MVA)"
    annotation (Dialog(group="Power flow"));
  parameter Real Sn=100 "Power rating (MVA)"
    annotation (Dialog(group="Power flow"));
  parameter Real V_b=40 "Sending end bus voltage (kV)"
    annotation (Dialog(group="Power flow"));
  parameter Real Vn=40 "Voltage rating (kV)"
    annotation (Dialog(group="Power flow"));
  parameter Real fn=SysData.fn "Frequency rating (Hz)"
    annotation (Dialog(group="Power flow"));
  parameter Real kT=1 "Nominal tap ratio (kV1/kV2)"
    annotation (Dialog(group="Transformer parameters"));
  parameter Real x=0.001 "Reactance (pu machine base)"
    annotation (Dialog(group="Transformer parameters"));
  parameter Real r=0.1 "Resistance (pu machine base)"
    annotation (Dialog(group="Transformer parameters"));
protected
  parameter Real Vb2new=V_b^2;
  parameter Real Vb2old=Vn*Vn;
  parameter Real xT=x*(Vb2old*Sb)/(Vb2new*Sn) "Reactance, p.u system base";
  parameter Real rT=r*(Vb2old*Sb)/(Vb2new*Sn) "Resistance, p.u system base";
equation
  rT*p.ir - xT*p.ii = p.vr - n.vr;
  rT*p.ii + xT*p.ir = p.vi - n.vi;
  rT*n.ir - xT*n.ii = n.vr - p.vr;
  xT*n.ir + rT*n.ii = n.vi - p.vi;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics),
    Icon(graphics={Ellipse(extent={{-46,30},{8,-30}}, lineColor={0,0,255}),
          Ellipse(extent={{-10,30},{44,-30}}, lineColor={0,0,255}),Line(
          points={{100,0},{44,0},{44,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-100,0},{-46,0}},
          color={0,0,255},
          smooth=Smooth.None),Text(
          extent={{-38,20},{-4,-20}},
          lineColor={28,108,200},
          textString="1"),Text(
          extent={{4,18},{32,-16}},
          lineColor={28,108,200},
          textString="2")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>29/09/2015</p></td>
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
end TwoWindingTransformer;
