within OpenIPSL.Electrical.Buses;
model InfiniteBus "PSAT Infinite Bus"
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  Real P "Active Power absorbed by the Infinite bus (MW)";
  Real Q "Reactive Power absorbed by the Infinite bus (MVAr)";
  Interfaces.PwPin p
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  parameter Boolean displayPF=false "Display power flow results:" annotation (
      Dialog(
      group="Visualisation",
      __Dymola_compact=true,
      __Dymola_descriptionLabel=true), choices(checkBox=true));
equation
  p.vr = V_0*cos(angle_0*Modelica.Constants.pi/180);
  p.vi = V_0*sin(angle_0*Modelica.Constants.pi/180);
  P = -(p.vr*p.ir + p.vi*p.ii)*S_b;
  Q = -(p.vr*p.ii - p.vi*p.ir)*S_b;
  annotation (
    Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={2,2}), graphics={Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={0,0,0},
          fillColor={241,241,241},
          fillPattern=FillPattern.Solid),Text(
          visible=displayPF,
          extent={{-80,100},{80,20}},
          lineColor={255,0,0},
          textString=DynamicSelect("0.0 MW",
            OpenIPSL.NonElectrical.Functions.displayPower(P, " MW"))),Polygon(
          visible=displayPF,
          points=DynamicSelect({{-20,30},{-20,10},{20,20},{-20,30}}, if P >= 0
             then {{-20,30},{-20,10},{20,20},{-20,30}} else {{20,30},{20,10},{-20,
            20},{20,30}}),
          lineColor={255,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),Text(
          visible=displayPF,
          extent={{-80,-20},{80,-100}},
          lineColor={0,255,0},
          textString=DynamicSelect("0.0 Mvar",
            OpenIPSL.NonElectrical.Functions.displayPower(Q, " Mvar"))),Polygon(
          visible=displayPF,
          points=DynamicSelect({{-20,-30},{-20,-10},{20,-20},{-20,-30}}, if Q
             >= 0 then {{-20,-30},{-20,-10},{20,-20},{-20,-30}} else {{20,-30},
            {20,-10},{-20,-20},{20,-30}}),
          lineColor={0,255,0},
          fillColor={0,255,0},
          fillPattern=FillPattern.Solid),Text(
          extent={{-100,160},{100,120}},
          lineColor={0,0,255},
          textString="%name")}),
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={2,2})),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>None</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2015-12-14</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Maxime Baudette, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end InfiniteBus;
