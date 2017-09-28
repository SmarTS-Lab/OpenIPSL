within OpenIPSL.Electrical.Branches.PSAT;
model TwoWindingTransformerFixedTapRatio
  "Modeled as series reactances without iron losses"
  OpenIPSL.Interfaces.PwPin p
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  OpenIPSL.Interfaces.PwPin n
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  parameter Real Sb=100 "System base power (MVA)"
    annotation (Dialog(group="Power flow data"));
  parameter Real Sn=100 "Power rating (MVA)"
    annotation (Dialog(group="Power flow data"));
  parameter Real Vbus=400000 "Sending end bus voltage"
    annotation (Dialog(group="Power flow data"));
  parameter Real Vn=400000 "Voltage rating (kV)"
    annotation (Dialog(group="Power flow data"));
  parameter Real fn=50 "Frequency rating (Hz)"
    annotation (Dialog(group="Power flow data"));
  parameter Real kT=1 "Nominal tap ratio (V1/V2)"
    annotation (Dialog(group="Transformer data"));
  parameter Real x=0.20 "Reactance (pu)"
    annotation (Dialog(group="Transformer data"));
  parameter Real r=0.01 "resistance (pu)"
    annotation (Dialog(group="Transformer data"));
  parameter Real m=1.0 "Fixed tap ratio"
    annotation (Dialog(group="Transformer data"));
protected
  parameter Real Vb2new=Vbus*Vbus;
  parameter Real Vb2old=Vn*Vn;
  parameter Real xT=x*(Vb2old*Sb)/(Vb2new*Sn) "Reactance(inductive),p.u";
  parameter Real rT=r*(Vb2old*Sb)/(Vb2new*Sn) "Reactance(capacitive),p.u";
equation
  rT*p.ir - xT*p.ii = 1/m^2*p.vr - 1/m*n.vr;
  rT*p.ii + xT*p.ir = 1/m^2*p.vi - 1/m*n.vi;
  rT*n.ir - xT*n.ii = n.vr - 1/m*p.vr;
  xT*n.ir + rT*n.ii = n.vi - 1/m*p.vi;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics),
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
</html>"),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Ellipse(extent={{-46,30},{8,-30}}, lineColor={0,0,
          255}),Ellipse(extent={{-10,30},{44,-30}}, lineColor={0,0,255}),Line(
          points={{100,0},{44,0},{44,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-100,0},{-46,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(points={{-64,-44},{-22,12}}, color={28,108,
          200}),Line(points={{-34,6},{-22,12}}, color={28,108,200}),Line(points
          ={{-24,0}}, color={28,108,200}),Line(points={{-26,0},{-22,12}}, color
          ={28,108,200})}));
end TwoWindingTransformerFixedTapRatio;
