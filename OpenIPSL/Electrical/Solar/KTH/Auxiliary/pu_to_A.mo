within OpenIPSL.Electrical.Solar.KTH.Auxiliary;
model pu_to_A
  Modelica.Blocks.Interfaces.RealOutput y0 annotation (Placement(
      visible=true,
      transformation(
        origin={160.0,0.0},
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
  parameter Real Pnen;
  parameter Real UdcN;
equation
  y0 = yi*UdcN*1000;
  annotation (
    Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={10,10}), graphics={Text(
          visible=true,
          origin={1.9581,1.6889},
          fillPattern=FillPattern.Solid,
          extent={{-31.9581,-31.6889},{31.9581,31.6889}},
          textString="A_to_pu",
          fontName="Arial"),Rectangle(
          visible=true,
          fillColor={255,255,255},
          extent={{-100.0,-100.0},{100.0,100.0}})}),
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
end pu_to_A;
