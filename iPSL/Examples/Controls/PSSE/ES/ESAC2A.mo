within iPSL.Examples.Controls.PSSE.ES;
model ESAC2A "SMIB model example of GENROU with Excitation System ESAC2A"
  extends iPSL.Examples.SMIBpartial;
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
    Tpq0=0.7) annotation (Placement(transformation(extent={{-108,-14},{-80,16}})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=180,
        origin={-42,-26})));
  Modelica.Blocks.Sources.Constant const2(k=0) annotation (Placement(transformation(extent={{-110,166},{-94,182}})));
  Modelica.Blocks.Sources.Constant const4(k=1000) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={-41,-45})));
  Modelica.Blocks.Sources.Constant const5(k=-1000) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={-41,-61})));
  iPSL.Electrical.Controls.PSSE.ES.ESAC2A.ESAC2A eSAC2A annotation (Placement(transformation(extent={{-74,-70},{-144,-24}})));
equation
  connect(eSAC2A.EFD0, generator.EFD0) annotation (Line(
      points={{-71.025,-60.0333},{-60,-60.0333},{-60,-9.5},{-78.88,-9.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, eSAC2A.VOTHSG) annotation (Line(
      points={{-46.4,-26},{-63.25,-26},{-63.25,-26.6067},{-71.375,-26.6067}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(generator.XADIFD, eSAC2A.XADIFD) annotation (Line(
      points={{-78.88,-12.5},{-56,-12.5},{-56,-39.4867},{-71.025,-39.4867}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(eSAC2A.VOEL, const4.y) annotation (Line(
      points={{-71.375,-45.9267},{-58.6875,-45.9267},{-58.6875,-45},{-46.5,-45}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const5.y, eSAC2A.VUEL) annotation (Line(
      points={{-46.5,-61},{-54,-61},{-54,-52.3667},{-71.375,-52.3667}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(generator.PELEC, eSAC2A.ECOMP) annotation (Line(
      points={{-78.88,-6.5},{-64,-6.5},{-64,-33.0467},{-71.375,-33.0467}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(generator.PMECH0, generator.PMECH) annotation (Line(
      points={{-78.88,-3.5},{-74,-3.5},{-74,20},{-110,20},{-110,8.5},{-107.72,8.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(eSAC2A.EFD, generator.EFD) annotation (Line(points={{-145.75,-47.3067},{-150,-47.3067},{-150,-6.5},{-107.72,-6.5}}, color={0,0,127}));
  connect(generator.p, GEN1.p) annotation (Line(points={{-78.6,1},{-58.3,1},{-58.3,0},{-40,0}}, color={0,0,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,100}})), Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>"));
end ESAC2A;
