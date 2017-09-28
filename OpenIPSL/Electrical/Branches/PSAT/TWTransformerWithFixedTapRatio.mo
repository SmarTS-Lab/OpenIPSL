within OpenIPSL.Electrical.Branches.PSAT;
model TWTransformerWithFixedTapRatio
  "Modeled as series reactances without iron losses"
  outer OpenIPSL.Electrical.SystemBase SysData;
  OpenIPSL.Interfaces.PwPin p
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  OpenIPSL.Interfaces.PwPin n
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  parameter Real SystemBase=SysData.S_b;
  parameter Real Sn=100 "Power rating MVA";
  parameter Real Vbus=400000 "Sending end bus voltage";
  parameter Real Vn1=400000 "Voltage rating of primary winding KV";
  parameter Real fn=50 "Frequency rating Hz";
  parameter Real kT=1 "Nominal Tap ratio (V1/V2), kV/kV";
  parameter Real X=0.20 "Transformer reactance, p.u.";
  parameter Real R=0.01 "Transformer resistance, p.u.";
  parameter Real m=1.0 "Fixed Tap ratio";
protected
  parameter Real Vb2new=Vbus*Vbus;
  parameter Real Vb2old=Vn1*Vn1;
  parameter Real xT=X*(Vb2old*SystemBase)/(Vb2new*Sn)
    "Reactance(inductive),p.u";
  parameter Real rT=R*(Vb2old*SystemBase)/(Vb2new*Sn) "Resistance,p.u";
equation
  rT*p.ir - xT*p.ii = 1/m^2*p.vr - 1/m*n.vr;
  rT*p.ii + xT*p.ir = 1/m^2*p.vi - 1/m*n.vi;
  rT*n.ir - xT*n.ii = n.vr - 1/m*p.vr;
  xT*n.ir + rT*n.ii = n.vi - 1/m*p.vi;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    Icon(graphics={Ellipse(extent={{-46,30},{8,-30}}, lineColor={0,0,255}),
          Ellipse(extent={{-10,30},{44,-30}}, lineColor={0,0,255}),Line(
          points={{100,0},{44,0},{44,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-100,0},{-46,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(points={{-52,-28},{-24,20}}, color={28,108,
          200}),Line(points={{-34,12},{-24,20}}, color={28,108,200}),Line(
          points={{-26,8},{-24,20}}, color={28,108,200})}),
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
end TWTransformerWithFixedTapRatio;
