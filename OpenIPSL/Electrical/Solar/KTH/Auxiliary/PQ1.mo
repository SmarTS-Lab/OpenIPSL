within OpenIPSL.Electrical.Solar.KTH.Auxiliary;
model PQ1
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
  parameter Real SystemBase=100;
  parameter Real Sn=10;
  parameter Real CoB=Sn/SystemBase;
  parameter Real v0=1.00018548610126 "voltage magnitude after power flow, pu";
  parameter Real anglev0=-0.0000253046024029618
    "voltage angle after power flow";
  parameter Real P0=0.4 "active power,pu";
  parameter Real Q0=0.3 "reactive power,pu";
  parameter Real Pref=P0*CoB;
  parameter Real Qref=Q0*CoB;
  parameter Real vd0=-v0*sin(anglev0) "Initialitation";
  parameter Real vq0=v0*cos(anglev0) "Initialitation";
  parameter Real Td=15 "d-axis inverter time constant";
  parameter Real Tq=15 "q-axis inverter time constant";
  parameter Real idref=(vq0*Qref + Pref*vd0)/(vq0^2 + vd0^2) "Initialitation";
  parameter Real iqref=((-vd0*Qref) + Pref*vq0)/(vq0^2 + vd0^2)
    "Initialitation";
  Real idref1(start=idref);
  Real iqref1(start=iqref);
  Real v;
  Real anglev;
  Real id(start=idref);
  Real iq(start=iqref);
  Real vd(start=vd0);
  Real vq(start=vq0);
  Real Pgen(start=Pref);
  Real Q(start=Qref);
  Modelica.Blocks.Interfaces.RealInput P(start=Pref) annotation (Placement(
      visible=true,
      transformation(
        origin={165.1089,40.5794},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0),
      iconTransformation(
        origin={120.0,60.0},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=-180)));
equation
  Pgen = vd*id + vq*iq;
  Q = vq*id - vd*iq;
  idref1 = (vq*Qref + P*vd)/(vq^2 + vd^2);
  iqref1 = ((-vd*Qref) + P*vq)/(vq^2 + vd^2);
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
<td><p>TBD</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>TBD</td>
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
