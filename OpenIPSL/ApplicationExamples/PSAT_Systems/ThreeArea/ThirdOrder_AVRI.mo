within PSAT_Systems.ThreeArea;
model ThirdOrder_AVRI "ABC system with 3rd-order machines and AVR Type I"
  extends PSAT_Systems.ThreeArea.BaseClasses.BaseOrder3;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeI Exc1(
    Te=0.01,
    v0=1.05,
    K0=25,
    vrmax=5,
    vrmin=-5,
    T1=10,
    T2=6.67,
    Tr=0.001)
    annotation (Placement(transformation(extent={{-152,80},{-142,90}})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeI Exc2(
    Te=0.01,
    v0=1.05,
    K0=25,
    vrmax=5,
    vrmin=-5,
    T1=10,
    T2=6.67,
    Tr=0.001) annotation (Placement(transformation(extent={{168,0},{158,10}})));
equation
  connect(Exc2.vf, order3_2.vf)
    annotation (Line(points={{157,5},{157,5},{154,5}}, color={0,0,127}));
  connect(Exc2.v, order3_2.v) annotation (Line(points={{169,2},{172,2},{172,14},
          {128,14},{128,3},{131,3}}, color={0,0,127}));
  connect(Exc1.vf, order3_1.vf)
    annotation (Line(points={{-141,85},{-141,85},{-132,85}}, color={0,0,127}));
  connect(Exc1.v, order3_1.v) annotation (Line(points={{-153,82},{-164,82},{-164,
          96},{-106,96},{-106,83},{-109,83}}, color={0,0,127}));
  connect(Exc1.vf0, order3_1.vf0) annotation (Line(points={{-147,79},{-147,64},
          {-170,64},{-170,98},{-128,98},{-128,91}}, color={0,0,127}));
  connect(Exc1.vref0, Exc1.vref) annotation (Line(points={{-147,91},{-147,94},{
          -156,94},{-156,88},{-153,88}}, color={0,0,127}));
  connect(Exc2.vf0, order3_2.vf0) annotation (Line(points={{163,-1},{162,-1},{
          162,-10},{178,-10},{178,26},{170,26},{150,26},{150,11}}, color={0,0,
          127}));
  connect(Exc2.vref0, Exc2.vref) annotation (Line(points={{163,11},{163,18},{
          174,18},{174,12},{174,6},{174,8},{169,8}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-180,-120},{180,120}},
          preserveAspectRatio=false)),
    Icon(coordinateSystem(extent={{-180,-120},{180,120}})),
    experiment(
      StopTime=20,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Rkfix2"),
    __Dymola_experimentSetupOutput,
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p></p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>Tin Rabuzin, May 2016</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Yuwa Chompoobutrgool, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end ThirdOrder_AVRI;
