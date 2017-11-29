within KundurSMIB.Generation_Groups;
model Generator_AVR
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  OpenIPSL.Electrical.Machines.PSAT.Order6 machine(
    Vn=400,
    V_b=V_b,
    ra=0.003,
    xd=1.81,
    xq=1.76,
    x1d=0.3,
    x1q=0.65,
    x2d=0.23,
    x2q=0.25,
    T1d0=8,
    T1q0=1,
    T2d0=0.03,
    T2q0=0.07,
    M=7,
    D=0,
    P_0=P_0,
    Q_0=Q_0,
    V_0=V_0,
    angle_0=angle_0,
    Sn=2220,
    Taa=0) annotation (Placement(transformation(extent={{14,-30},{74,30}})));
  OpenIPSL.Interfaces.PwPin pwPin annotation (Placement(transformation(extent={
            {100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII avr(
    vfmax=7,
    vfmin=-6.40,
    K0=200,
    T2=1,
    T1=1,
    Te=0.0001,
    Tr=0.015) annotation (Placement(transformation(extent={{-52,-4},{-12,36}})));
  Modelica.Blocks.Sources.Constant pss_off(k=0)
    annotation (Placement(transformation(extent={{-92,-2},{-72,18}})));
equation
  connect(machine.pm0, machine.pm) annotation (Line(points={{20,-33},{20,-33},{
          20,-40},{0,-40},{0,-15},{8,-15}}, color={0,0,127}));
  connect(machine.p, pwPin)
    annotation (Line(points={{74,0},{78.5,0},{110,0}}, color={0,0,255}));
  connect(pss_off.y, avr.vs) annotation (Line(points={{-71,8},{-50.3333,8},{-50.3333,
          6}}, color={0,0,127}));
  connect(avr.vf, machine.vf) annotation (Line(points={{-10.3333,16},{2,16},{2,
          15},{8,15}}, color={0,0,127}));
  connect(machine.v, avr.v) annotation (Line(points={{77,9},{88,9},{88,52},{-50.3333,
          52},{-50.3333,26}}, color={0,0,127}));
  connect(machine.vf0, avr.vf0) annotation (Line(points={{20,33},{4,33},{4,44},
          {-30,44},{-30,34.3333},{-32,34.3333}},color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Ellipse(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Line(
          points={{-48,2},{-20,56},{2,4},{24,-28},{48,22}},
          color={0,0,0},
          smooth=Smooth.Bezier),Text(
          extent={{-52,-18},{56,-66}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="%name")}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
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
end Generator_AVR;
