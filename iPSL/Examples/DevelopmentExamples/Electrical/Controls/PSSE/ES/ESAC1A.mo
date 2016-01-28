within iPSL.Examples.DevelopmentExamples.Electrical.Controls.PSSE.ES;
model ESAC1A "SMIB system with one load and GENROE model"
  import iPSL;
  iPSL.Electrical.Branches.PwLine pwLine(
    R=0.001,
    X=0.2,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-26,0},{-6,20}})));
  iPSL.Electrical.Branches.PwLine pwLine1(
    R=0.001,
    X=0.2,
    G=0,
    B=0) annotation (Placement(transformation(extent={{26,14},{46,34}})));
  iPSL.Electrical.Branches.PwLine2Openings pwLine3(
    t2=100,
    R=0.0005,
    X=0.1,
    G=0,
    B=0,
    t1=100) annotation (Placement(transformation(extent={{16,-20},{36,0}})));
  iPSL.Electrical.Branches.PwLine2Openings pwLine4(
    t2=100,
    t1=100,
    R=0.0005,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{42,-20},{62,0}})));
  iPSL.Electrical.Machines.PSSE.GENCLS.GENCLS gENCLS(
    M_b=100,
    D=0,
    V_0=1,
    angle_0=0,
    X_d=0.2,
    P_0=10.01711,
    Q_0=8.006544,
    H=0) annotation (Placement(transformation(extent={{108,0},{86,22}})));
  iPSL.Electrical.Loads.PSSE.Load_variation constantLoad(
    S_p(re=0.5, im=0.1),
    S_i(im=0, re=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    PQBRAK=0.7,
    d_t=0,
    d_P=0,
    V_0=0.9919935,
    angle_0=-0.5762684,
    t1=0) annotation (Placement(transformation(extent={{12,-40},{28,-26}})));
  iPSL.Electrical.Events.PwFault pwFault(
    R=0,
    X=0,
    t1=2,
    t2=2.15) annotation (Placement(transformation(extent={{52,-34},{66,-20}})));
  iPSL.Electrical.Machines.PSSE.GENROE.GENROE gENROE(
    M_b=100,
    Tpd0=5,
    Tppd0=0.07,
    Tpq0=0.9,
    Tppq0=0.09,
    H=4.28,
    D=0,
    Xd=1.84,
    Xq=1.75,
    Xpd=0.41,
    Xpq=0.6,
    Xppd=0.2,
    Xl=0.12,
    S10=0.11,
    S12=0.39,
    V_0=1,
    P_0=40,
    angle_0=4.046276,
    Q_0=5.416582,
    Xppq=0.2) annotation (Placement(transformation(extent={{-82,-10},{-42,30}})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(extent={{-10,-48},{-20,-38}})));
  Modelica.Blocks.Sources.Constant const1(k=-Modelica.Constants.inf) annotation (Placement(transformation(extent={{-10,-70},{-20,-60}})));
  Modelica.Blocks.Sources.Constant const2(k=Modelica.Constants.inf) annotation (Placement(transformation(extent={{-10,-90},{-20,-80}})));
  iPSL.Electrical.Controls.PSSE.ES.ESAC1A.ESAC1A eSAC1A(
    T_R=0.04,
    T_B=2,
    T_C=10,
    K_A=400,
    T_A=0.02,
    V_AMAX=9,
    V_AMIN=-5.34,
    T_E=0.8,
    K_F=0.03,
    T_F=1,
    K_C=0.2,
    K_D=0.48,
    K_E=1,
    E_1=5.25,
    E_2=7,
    S_EE_1=0.03,
    S_EE_2=0.1,
    V_RMAX=3,
    V_RMIN=-3) annotation (Placement(transformation(extent={{-34,-48},{-88,-28}})));
equation
  connect(pwLine.n, pwLine1.p) annotation (Line(
      points={{-9,10},{3.5,10},{3.5,24},{29,24}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1.n, gENCLS.p) annotation (Line(
      points={{43,24},{74,24},{74,10.8346},{83.8,10.8346}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.p, pwLine.n) annotation (Line(
      points={{19,-10},{2.5,-10},{2.5,10},{-9,10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.n, pwLine4.p) annotation (Line(
      points={{33,-10},{45,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine4.n, gENCLS.p) annotation (Line(
      points={{59,-10},{74,-10},{74,10.8346},{83.8,10.8346}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(constantLoad.p, pwLine3.p) annotation (Line(
      points={{20,-25.3},{20,-18},{19,-18},{19,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwFault.p, pwLine4.p) annotation (Line(
      points={{50.8333,-27},{50.8333,-26},{40,-26},{40,-10},{45,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gENROE.p, pwLine.p) annotation (Line(points={{-40,10},{-23,10}}, color={0,0,255}));
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-81.6,20},{-92,20},{-92,36},{-30,36},{-30,4},{-40.4,4}}, color={0,0,127}));
  connect(eSAC1A.VOTHSG, const.y) annotation (Line(points={{-34.587,-43},{-34.587,-43},{-20.5,-43}}, color={0,0,127}));
  connect(gENROE.ETERM, eSAC1A.ECOMP) annotation (Line(points={{-40.4,20},{-32,20},{-32,-33},{-34.587,-33}}, color={0,0,127}));
  connect(eSAC1A.EFD0, gENROE.EFD0) annotation (Line(points={{-66.8696,-47},{-66.8696,-52},{-28,-52},{-28,-4},{-40.4,-4}}, color={0,0,127}));
  connect(gENROE.XADIFD, eSAC1A.XADIFD) annotation (Line(points={{-40.4,-8},{-26,-8},{-26,-54},{-59.7674,-54},{-59.7674,-47.15}}, color={0,0,127}));
  connect(eSAC1A.EFD, gENROE.EFD) annotation (Line(points={{-88.587,-38},{-92,-38},{-92,0},{-81.6,0}}, color={0,0,127}));
  connect(const1.y, eSAC1A.VUEL) annotation (Line(points={{-20.5,-65},{-45.7391,-65},{-45.7391,-47.1}}, color={0,0,127}));
  connect(const2.y, eSAC1A.VOEL) annotation (Line(points={{-20.5,-85},{-20.5,-85},{-52.7591,-85},{-52.7591,-47.15}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})), Documentation(info="<html>
<p><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
end ESAC1A;