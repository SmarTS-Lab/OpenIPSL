within OpenIPSL.Examples.Controls;
package CGMES 


package TG
  extends Modelica.Icons.ExamplesPackage;

  model GovHydroIEEE0 "SMIB model example of GENROU with Turbine Governor GovHydroIEEE0"
    extends OpenIPSL.Examples.SMIBpartial;
    Modelica.Blocks.Sources.Constant const2(k=0) annotation (Placement(transformation(extent={{-110,166},{-94,182}})));
    OpenIPSL.Electrical.Machines.PSSE.GENROU generator(
      M_b=100,
      Tpd0=5,
      Tppd0=0.07,
      Tpq0=0.9,
      Tppq0=0.09,
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
      Xppq=0.2,
      R_a=0,
      Xpp=0.2,
      H=4.28) annotation (Placement(transformation(extent={{-110,-20},{-70,20}})));
    Electrical.Controls.CGMES.TG.GovHydroIEEE0 govHydroIEEE0_1 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-90,44})));
    equation
    connect(generator.p, GEN1.p) annotation (Line(points={{-68,0},{-40,0},{-40,0}}, color={0,0,255}));
    connect(generator.EFD0, generator.EFD) annotation (Line(points={{-68.4,-14},{-60,-14},{-60,-30},{-116,-30},{-116,-10},{-109.6,-10}}, color={0,0,127}));
    connect(generator.SPEED, govHydroIEEE0_1.SPEED) annotation (Line(points={{-68.4,18},{-56,18},{-56,46},{-79.7,46}}, color={0,0,127}));
    connect(generator.PELEC, govHydroIEEE0_1.Pref) annotation (Line(points={{-68.4,-10},{-62,-10},{-62,40.5},{-79.7,40.5}}, color={0,0,127}));
    connect(govHydroIEEE0_1.PMECH, generator.PMECH) annotation (Line(points={{-100.8,45},{-116,45},{-116,10},{-109.6,10}}, color={0,0,127}));
    annotation (
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,-100},{120,100}})),
      Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>OpenIPSL:</p>
<p>Copyright 2016 SmarTS Lab (Sweden)</p>
<ul>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>

<p></p>
<p>iPSL:</p>
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
</html>
"),
      Icon(coordinateSystem(extent={{-120,-100},{120,100}})));
    end GovHydroIEEE0;
  annotation (Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>OpenIPSL:</p>
<p>Copyright 2016 SmarTS Lab (Sweden)</p>
<ul>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>

<p></p>
<p>iPSL:</p>
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
</html>
"));
  end TG;

annotation (Icon(graphics={Rectangle(
        lineColor={200,200,200},
        fillColor={248,248,248},
        fillPattern=FillPattern.HorizontalCylinder,
        extent={{-100,-100},{100,100}},
        radius=25.0), Polygon(
        origin={18,24},
        lineColor={78,138,73},
        fillColor={78,138,73},
        pattern=LinePattern.None,
        fillPattern=FillPattern.Solid,
        points={{-58.0,46.0},{42.0,-14.0},{-58.0,-74.0},{-58.0,46.0}})}), Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>OpenIPSL:</p>
<p>Copyright 2016 SmarTS Lab (Sweden)</p>
<ul>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>

<p></p>
<p>iPSL:</p>
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
</html>
"));
end CGMES;
