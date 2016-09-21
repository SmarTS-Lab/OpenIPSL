within OpenIPSL.Examples.Controls;
package CGMES


  package TG
    model GovHydroIEEE0 "SMIB model example of GENROU with Excitation System ExcSEXS"
      extends OpenIPSL.Examples.SMIBpartial;
      Modelica.Blocks.Sources.Constant const2(k = 0) annotation(Placement(transformation(extent = {{-110, 166}, {-94, 182}})));
      OpenIPSL.Electrical.Machines.PSSE.GENROU gENROE(M_b = 100, Tpd0 = 5, Tppd0 = 0.07, Tpq0 = 0.9, Tppq0 = 0.09, D = 0, Xd = 1.84, Xq = 1.75, Xpd = 0.41, Xpq = 0.6, Xppd = 0.2, Xl = 0.12, S10 = 0.11, S12 = 0.39, V_0 = 1, P_0 = 40, angle_0 = 4.046276, Q_0 = 5.416582, Xppq = 0.2, R_a = 0, Xpp = 0.2, H = 4.28) annotation(Placement(transformation(extent = {{-110, -20}, {-70, 20}})));
  Electrical.Controls.CGMES.TG.GovHydroIEEE0 govHydroIEEE01 annotation(Placement(visible = true, transformation(origin = {-150, 10}, extent = {{-20, -20}, {20, 16}}, rotation = 0)));
    equation
      connect(gENROE.SPEED, govHydroIEEE01.SPEED) annotation(Line(points = {{-68, 18}, {-58, 18}, {-58, 36}, {-180, 36}, {-180, 10}, {-170, 10}}, color = {0, 0, 127}));
      connect(gENROE.PMECH0, govHydroIEEE01.PMECH0) annotation(Line(points = {{-68, -6}, {-62, -6}, {-62, 30}, {-176, 30}, {-176, 18}, {-170, 18}}, color = {0, 0, 127}));
      connect(govHydroIEEE01.PMECH, gENROE.PMECH) annotation(Line(points = {{-128, 10}, {-110, 10}, {-110, 10}, {-110, 10}}, color = {0, 0, 127}));
      connect(gENROE.EFD0, gENROE.EFD) annotation(Line(points = {{-68, -14}, {-60, -14}, {-60, -26}, {-118, -26}, {-118, -10}, {-110, -10}, {-110, -10}}, color = {0, 0, 127}));
      connect(gENROE.p, GEN1.p) annotation(Line(points = {{-68, 0}, {-40, 0}, {-40, 0}}, color = {0, 0, 255}));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-120, -100}, {120, 100}})), Documentation(revisions = "<html>
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
</html>"), Icon(coordinateSystem(extent = {{-120, -100}, {120, 100}})), uses(OpenIPSL(version = "0.8.1")));
    end GovHydroIEEE0;
    annotation(Icon(graphics = {Rectangle(lineColor = {200, 200, 200}, fillColor = {248, 248, 248}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, -100}, {100, 100}}, radius = 25.0), Polygon(origin = {18, 24}, lineColor = {78, 138, 73}, fillColor = {78, 138, 73}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-58.0, 46.0}, {42.0, -14.0}, {-58.0, -74.0}, {-58.0, 46.0}})}));
  end TG;

annotation (Icon(graphics={Rectangle(
        lineColor={200,200,200},
        fillColor={248,248,248},
        fillPattern=FillPattern.HorizontalCylinder,
        extent={{-100,-100},{100,100}},
        radius=25.0),Polygon(
        origin={18,24},
        lineColor={78,138,73},
        fillColor={78,138,73},
        pattern=LinePattern.None,
        fillPattern=FillPattern.Solid,
        points={{-58.0,46.0},{42.0,-14.0},{-58.0,-74.0},{-58.0,46.0}})}));
end CGMES;