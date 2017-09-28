within KundurSMIB;
model SMIB_AVR
  extends SMIB_Partial;
  import Modelica.Constants.pi;
  Generation_Groups.Generator_AVR G1(
    V_0=1,
    P_0=0.899999999997135*S_b,
    Q_0=0.436002238696658*S_b,
    angle_0=0.494677176989155*180/pi)
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
protected
  parameter Real S_b=SysData.S_b;
equation
  connect(G1.pwPin, B1.p)
    annotation (Line(points={{-99,0},{-90,0},{-80,0}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(extent={{-140,-100},{120,100}},
          preserveAspectRatio=false), graphics={Text(
          extent={{-110,70},{110,50}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Solid,
          fontSize=15,
          textStyle={TextStyle.Bold},
          textString="(AVR)")}),
    Icon(coordinateSystem(extent={{-140,-100},{120,100}})),
    experiment(
      StopTime=10,
      Interval=0.0001,
      Tolerance=1e-006,
      __Dymola_fixedstepsize=0.0001,
      __Dymola_Algorithm="Rkfix2"),
    __Dymola_experimentSetupOutput,
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>SMIB PSAT, d_kundur2.mdl, PSAT</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>February 2016</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Maxime Baudette, Ahsan Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end SMIB_AVR;
