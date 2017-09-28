within OpenIPSL.Electrical.Solar.KTH.Auxiliary;
model Capacitor
  Modelica.Blocks.Interfaces.RealOutput y0 annotation (Placement(
      visible=true,
      transformation(
        origin={155.0,-0.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0),
      iconTransformation(
        origin={110.0,0.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput yi annotation (Placement(
      visible=true,
      transformation(
        origin={-155.0,0.0},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0),
      iconTransformation(
        origin={-120.0,-0.0},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0)));
  Real x(start=Udc0/(1000*UdcN));
  parameter Real C;
  parameter Real Udc0;
  parameter Real UdcN;
equation
  y0 = x;
  der(x) = yi/C;
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
          origin={0.0,2.2296},
          fillPattern=FillPattern.Solid,
          extent={{-23.283,-44.4441},{23.283,44.4441}},
          textString="Capacitor",
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
end Capacitor;
