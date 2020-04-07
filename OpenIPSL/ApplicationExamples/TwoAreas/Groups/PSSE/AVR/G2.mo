within TwoAreas.Groups.PSSE.AVR;
model G2
  extends TwoAreas.Support.Generator;
  OpenIPSL.Electrical.Machines.PSSE.GENROU g2(
    Tpd0=8,
    Tppd0=0.03,
    Tppq0=0.05,
    H=6.5,
    Xd=1.8,
    Xq=1.7,
    Xpd=0.3,
    Xppd=0.25,
    Xppq=0.25,
    Xl=0.2,
    R_a=0.0025,
    D=0.02,
    S12=0.802,
    S10=0.18600,
    M_b=900,
    V_b=V_b,
    V_0=V_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0,
    Xpq=0.55,
    Tpq0=0.4) annotation (Placement(transformation(extent={{6,-18},{46,18}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.ESDC1A eSDC1A(
    T_R=0.5,
    K_A=20,
    T_A=0.055,
    T_B=1,
    T_C=1,
    V_RMAX=4,
    V_RMIN=-4,
    K_E=-0.052927,
    T_E=0.36,
    K_F=0.125,
    T_F1=1.8,
    E_1=1,
    E_2=2,
    S_EE_1=0.0164,
    S_EE_2=0.0481)
    annotation (Placement(transformation(extent={{-38,-18},{-4,0}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-56,4},{-48,12}})));
equation
  connect(g2.PMECH, g2.PMECH0) annotation (Line(points={{6.4,9},{-2,9},{-2,32},
          {52,32},{52,-5.4},{47.6,-5.4}}, color={0,0,127}));
  connect(g2.p, pwPin)
    annotation (Line(points={{48,0},{44,0},{70,0}}, color={0,0,255}));
  connect(g2.EFD, eSDC1A.EFD)
    annotation (Line(points={{6.4,-9},{-3.05556,-9}}, color={0,0,127}));
  connect(eSDC1A.EFD0, g2.EFD0) annotation (Line(points={{-24.7778,-16.65},{-24.7778,
          -24},{56,-24},{56,-12.6},{47.6,-12.6}}, color={0,0,127}));
  connect(const.y, eSDC1A.VUEL) annotation (Line(points={{-47.6,8},{-42,8},{-42,
          -15.75},{-37.0556,-15.75}}, color={0,0,127}));
  connect(eSDC1A.VOEL, eSDC1A.VUEL) annotation (Line(points={{-37.0556,-11.25},
          {-42,-11.25},{-42,-15.75},{-37.0556,-15.75}}, color={0,0,127}));
  connect(eSDC1A.VOTHSG, eSDC1A.VUEL) annotation (Line(points={{-37.0556,-6.75},
          {-42,-6.75},{-42,-15.75},{-37.0556,-15.75}}, color={0,0,127}));
  connect(g2.ETERM, eSDC1A.ECOMP) annotation (Line(points={{47.6,9},{58,9},{58,
          -26},{-40,-26},{-40,-2.475},{-37.0556,-2.475}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        initialScale=0.1)),
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        initialScale=0.1)),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Klein-Rogers-Kundur power network</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-12-01</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Maxime Baudette, Tin Rabuzin, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end G2;
