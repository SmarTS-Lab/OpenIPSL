within iPSL.Examples.DevelopmentExamples.Electrical.Controls.PSSE.ES;


model ESAC2A "SMIB model example of GENROU with Excitation System ESAC2A"
  iPSL.Electrical.Machines.PSSE.GENROU.GENROU generator(
    Xppd=0.2,
    Xppq=0.2,
    Xpp=0.2,
    Xl=0.12,
    V_0=1,
    P_0=100*0.399999529123306,
    angle_0=4.04626655578613,
    Q_0=100*0.0541657134890556,
    M_b=100,
    Tpd0=5,
    Tppd0=0.50000E-01,
    Tppq0=0.1,
    H=4.0000,
    D=0,
    Xd=1.41,
    Xq=1.3500,
    Xpd=0.3,
    S10=0.1,
    S12=0.5,
    Xpq=0.6,
    Tpq0=0.7) annotation (Placement(transformation(extent={{-78,-2},{-50,28}})));
  iPSL.Electrical.Branches.PwLine pwLine(
    R=0.001,
    X=0.2,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-40,2},{-20,22}})));
  iPSL.Electrical.Branches.PwLine pwLine1(
    R=0.001,
    X=0.2,
    G=0,
    B=0) annotation (Placement(transformation(extent={{2,8},{22,28}})));
  iPSL.Electrical.Branches.PwLine2Openings pwLine3(
    t2=100,
    t1=10.15 - 0.005,
    R=0.0005,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-6,-6},{14,14}})));
  iPSL.Electrical.Branches.PwLine2Openings pwLine4(
    t2=100,
    t1=10.15 - 0.005,
    R=0.0005,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{20,-6},{40,14}})));
  iPSL.Electrical.Machines.PSSE.GENCLS.GENCLS gENCLS(
    X_d=0.2,
    P_0=10.01716,
    Q_0=8.006525,
    H=0,
    D=0,
    M_b=100,
    V_0=1,
    angle_0=0) annotation (Placement(transformation(extent={{84,-6},{62,16}})));
  iPSL.Electrical.Loads.PSSE.Load_variation constantLoad(
    angle_0=-0.57627,
    S_p(re=0.5, im=0.1),
    S_i(im=0, re=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    PQBRAK=0.7,
    V_0=0.991992,
    d_P=5*0.01,
    d_t=0.1,
    t1=2 - 0.005) annotation (Placement(transformation(extent={{-6,-16},{-26,6}})));
  iPSL.Electrical.Events.PwFault pwFault(
    R=0,
    X=-2e-9,
    t1=10 - 0.005,
    t2=10.15 - 0.005) annotation (Placement(transformation(extent={{34,-16},{48,-2}})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=180,
        origin={-12,-18})));
  Modelica.Blocks.Sources.Constant const2(k=0) annotation (Placement(transformation(extent={{-110,166},{-94,182}})));
  Modelica.Blocks.Sources.Constant const4(k=1000) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={-11,-33})));
  Modelica.Blocks.Sources.Constant const5(k=-1000) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={-11,-49})));
  iPSL.Electrical.Controls.PSSE.ES.ESAC2A.ESAC2A eSAC2A annotation (Placement(transformation(extent={{-44,-58},{-114,-12}})));
equation
  connect(generator.p, pwLine.p) annotation (Line(
      points={{-48.6,13},{-50.6,13},{-50.6,12},{-37,12}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine.n, pwLine1.p) annotation (Line(
      points={{-23,12},{-16.5,12},{-16.5,18},{5,18}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1.n, gENCLS.p) annotation (Line(
      points={{19,18},{52,18},{52,4.8346},{59.8,4.8346}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.p, pwLine.n) annotation (Line(
      points={{-3,4},{-17.5,4},{-17.5,12},{-23,12}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.n, pwLine4.p) annotation (Line(
      points={{11,4},{23,4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine4.n, gENCLS.p) annotation (Line(
      points={{37,4},{52,4},{52,4.8346},{59.8,4.8346}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(constantLoad.p, pwLine3.p) annotation (Line(
      points={{-16,7.1},{-16,-5.5},{-3,-5.5},{-3,4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwFault.p, pwLine4.p) annotation (Line(
      points={{32.8333,-9},{23,-9},{23,4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(eSAC2A.EFD0, generator.EFD0) annotation (Line(
      points={{-41.025,-48.0333},{-30,-48.0333},{-30,2.5},{-48.88,2.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, eSAC2A.VOTHSG) annotation (Line(
      points={{-16.4,-18},{-33.25,-18},{-33.25,-14.6067},{-41.375,-14.6067}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(generator.XADIFD, eSAC2A.XADIFD) annotation (Line(
      points={{-48.88,-0.5},{-26,-0.5},{-26,-27.4867},{-41.025,-27.4867}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(eSAC2A.VOEL, const4.y) annotation (Line(
      points={{-41.375,-33.9267},{-28.6875,-33.9267},{-28.6875,-33},{-16.5,-33}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const5.y, eSAC2A.VUEL) annotation (Line(
      points={{-16.5,-49},{-24,-49},{-24,-40.3667},{-41.375,-40.3667}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(generator.PELEC, eSAC2A.ECOMP) annotation (Line(
      points={{-48.88,5.5},{-34,5.5},{-34,-21.0467},{-41.375,-21.0467}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(generator.PMECH0, generator.PMECH) annotation (Line(
      points={{-48.88,8.5},{-44,8.5},{-44,32},{-80,32},{-80,20.5},{-77.72,20.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(eSAC2A.EFD, generator.EFD) annotation (Line(points={{-115.75,-35.3067},{-120,-35.3067},{-120,5.5},{-77.72,5.5}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,100}})), Documentation(info="<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
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
end ESAC2A;
