within OpenIPSL.Electrical.Solar.KTH.Auxiliary;
model InputSelectorEpsilon
  Modelica.Blocks.Interfaces.RealInput vd(start=700) annotation (Placement(
      visible=true,
      transformation(
        origin={-167.6662,80.0},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0),
      iconTransformation(
        origin={-120.0,77.7142},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput id(start=641.2) annotation (Placement(
      visible=true,
      transformation(
        origin={-168.2292,30.0},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0),
      iconTransformation(
        origin={-120.0,24.2671},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput dv(start=0) annotation (Placement(
      visible=true,
      transformation(
        origin={-167.9388,-21.6068},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0),
      iconTransformation(
        origin={-120.0,-27.4532},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput di(start=0) annotation (Placement(
      visible=true,
      transformation(
        origin={-170.0,-80.0},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0),
      iconTransformation(
        origin={-120.0,-84.009},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput k(start=0) annotation (Placement(
      visible=true,
      transformation(
        origin={160.0,0.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0),
      iconTransformation(
        origin={110.0,0.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));

  function Inputselectorfunction
    input Real vd;
    input Real id;
    input Real dv;
    input Real di;
    output Real k;
    parameter Real Epsilon=0.01;
  algorithm
    if dv == 0 then
      if di == 0 then
        k := 0;
      elseif di > 0 then
        k := 1;
      elseif di < 0 then
        k := -1;
      end if;
    else
      if abs(di/dv + id/vd) < Epsilon then
        k := 0;
      else
        if di/dv + id/vd > 0 then
          k := 1;
        else
          k := -1;
        end if;
      end if;
    end if;
    annotation (
      Diagram(coordinateSystem(
          extent={{-148.5,-105.0},{148.5,105.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={5,5})),
      Diagram(coordinateSystem(
          extent={{-148.5,-105.0},{148.5,105.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={5,5})),
      Documentation);
  end Inputselectorfunction;
algorithm
  k := Inputselectorfunction(
    vd,
    id,
    dv,
    di);
  annotation (
    Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={10,10}), graphics={Text(
          visible=true,
          origin={-85.4693,77.294},
          fillPattern=FillPattern.Solid,
          extent={{-8.7699,-10.7022},{8.7699,10.7022}},
          textString="0",
          fontName="Arial"),Text(
          visible=true,
          origin={-83.7123,27.3769},
          fillPattern=FillPattern.Solid,
          extent={{-8.7699,-10.7022},{8.7699,10.7022}},
          textString="1",
          fontName="Arial"),Text(
          visible=true,
          origin={-84.3336,-26.9995},
          fillPattern=FillPattern.Solid,
          extent={{-8.7699,-10.7022},{8.7699,10.7022}},
          textString="2",
          fontName="Arial"),Text(
          visible=true,
          origin={-83.4684,-82.2678},
          fillPattern=FillPattern.Solid,
          extent={{-8.7699,-10.7022},{8.7699,10.7022}},
          textString="3",
          fontName="Arial"),Text(
          visible=true,
          origin={75.8495,0.7022},
          fillPattern=FillPattern.Solid,
          extent={{-8.7699,-10.7022},{8.7699,10.7022}},
          textString="k",
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
end InputSelectorEpsilon;
