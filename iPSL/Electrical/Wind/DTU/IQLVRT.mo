within iPSL.Electrical.Wind.DTU;
model IQLVRT "Selects the reactive current during fault and post fault. Developed by DTU"
  Modelica.Blocks.Interfaces.RealInput F_LVRT annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=-90,
        origin={-40,56})));
  Modelica.Blocks.Interfaces.RealInput Fpost annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=-90,
        origin={40,56})));
  Modelica.Blocks.Interfaces.RealInput iQstate annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=0,
        origin={-46,30})));
  Modelica.Blocks.Interfaces.RealInput iQpost annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=0,
        origin={-46,0})));
  Modelica.Blocks.Interfaces.RealInput iqv annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=0,
        origin={-46,-30})));
  Modelica.Blocks.Interfaces.RealOutput iQcmd annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=0,
        origin={44,0})));
equation
  iQcmd = if F_LVRT < 0.5 and Fpost < 0.5 then iQstate elseif F_LVRT < 0.5 and Fpost > 0.5 then iQpost + iQstate else iqv + iQstate;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Rectangle(
          extent={{-40,50},{40,-30}},
          lineColor={0,0,255},
          lineThickness=0.5),Text(
          extent={{-18,32},{20,0}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillPattern=FillPattern.Solid,
          textString="IQLVRT
Mode")}),
    Documentation(revisions="<html>
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
end IQLVRT;
