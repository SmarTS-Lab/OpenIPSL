within OpenIPSL.Electrical.Solar.KTH.Auxiliary;
model Terminator
  Modelica.Blocks.Interfaces.RealInput V annotation (Placement(
      visible=true,
      transformation(
        origin={-155.0,1.9703},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0),
      iconTransformation(
        origin={-120.0,0.0},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0)));
  parameter Real T1=0.1;
  parameter Real T2=0.05;
  parameter Real Step=0.001;
  parameter Real Iniv123;
  parameter Real Inidv;
  Real[:] Value;
  Real v123(start=Iniv123);
  Real dv(start=Inidv);
  Integer i(start=1);
algorithm
  Value[i] := V;
  if time < T1 then
    v123 := Iniv123;
    dv := Inidv;
  else
    v123 := Value[i - 50];
    dv := Value[i - 100];
  end if;
  i := i + 1;
  annotation (
    Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={10,10}), graphics={Rectangle(
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
end Terminator;
