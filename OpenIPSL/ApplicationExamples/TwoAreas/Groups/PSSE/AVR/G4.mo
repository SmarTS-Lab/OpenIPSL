within TwoAreas.Groups.PSSE.AVR;
model G4
  extends TwoAreas.Support.Generator;
  OpenIPSL.Electrical.Machines.PSSE.GENROU gENSAL(
    Tpd0=8,
    Tppd0=0.03,
    Tppq0=0.05,
    H=6.175,
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
    V_b=V_b,
    V_0=V_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0,
    Xpq=0.55,
    Tpq0=0.4,
    M_b=350) annotation (Placement(transformation(extent={{4,-18},{44,18}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.ESDC1A eSDC1A(
    T_R=0.05,
    K_A=20,
    T_A=0.055,
    T_B=1,
    T_C=1,
    V_RMAX=4,
    V_RMIN=-4,
    K_E=-0.072,
    T_E=0.36,
    K_F=0.125,
    T_F1=1.8,
    E_1=1,
    E_2=2,
    S_EE_1=0.0164,
    S_EE_2=0.0481)
    annotation (Placement(transformation(extent={{-32,-16},{0,-2}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-62,2},{-54,10}})));
equation
  connect(gENSAL.p, pwPin)
    annotation (Line(points={{46,0},{42,0},{70,0}}, color={0,0,255}));
  connect(gENSAL.PMECH, gENSAL.PMECH0) annotation (Line(points={{4.4,9},{2,9},{
          2,14},{-8,14},{-8,32},{50,32},{50,-5.4},{45.6,-5.4}}, color={0,0,127}));
  connect(eSDC1A.EFD, gENSAL.EFD) annotation (Line(points={{0.888889,-9},{
          0.888889,-9},{2,-9},{4.4,-9}}, color={0,0,127}));
  connect(eSDC1A.EFD0, gENSAL.EFD0) annotation (Line(points={{-19.5556,-14.95},
          {-19.5556,-22},{50,-22},{50,-12.6},{45.6,-12.6}}, color={0,0,127}));
  connect(const.y, eSDC1A.VUEL) annotation (Line(points={{-53.6,6},{-44,6},{-44,
          -14.25},{-31.1111,-14.25}}, color={0,0,127}));
  connect(eSDC1A.VOEL, eSDC1A.VUEL) annotation (Line(points={{-31.1111,-10.75},
          {-44,-10.75},{-44,-14.25},{-31.1111,-14.25}}, color={0,0,127}));
  connect(eSDC1A.VOTHSG, eSDC1A.VUEL) annotation (Line(points={{-31.1111,-7.25},
          {-44,-7.25},{-44,-14.25},{-31.1111,-14.25}}, color={0,0,127}));
  connect(gENSAL.ETERM, eSDC1A.ECOMP) annotation (Line(points={{45.6,9},{52,9},
          {52,-24},{-38,-24},{-38,-3.925},{-31.1111,-3.925}}, color={0,0,127}));
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
end G4;
