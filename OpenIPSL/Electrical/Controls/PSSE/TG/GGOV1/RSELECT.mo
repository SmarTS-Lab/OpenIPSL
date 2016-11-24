within OpenIPSL.Electrical.Controls.PSSE.TG.GGOV1;
block RSELECT "Output the minimum and the maximum element of the input vector"
  // extends Modelica.Blocks.Icons.Block;
  parameter Real Rselect;
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(extent={{100,-12},{120,8}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealInput Pelect annotation (Placement(transformation(extent={{-140,36},{-100,76}}), iconTransformation(extent={{-140,36},{-100,76}})));
  Modelica.Blocks.Interfaces.RealInput ValveStroke
    annotation (Placement(transformation(extent={{4,-80},{44,-40}}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={8,-120})));
  Modelica.Blocks.Interfaces.RealInput GovernorOutput
    annotation (Placement(transformation(extent={{6,-136},{46,-96}}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={84,-120})));
equation
  y = if Rselect == 1 then Pelect elseif Rselect == (-1) then ValveStroke elseif Rselect == (-2) then GovernorOutput else 0;
  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        initialScale=0.1), graphics={Text(
          extent={{-51,31},{51,-31}},
          lineColor={0,0,255},
          textString="Rselect
 1 -  electrical power
-1 - valve stroke
-2 - governor output
 0 - isochronous",
          horizontalAlignment=TextAlignment.Left,
          origin={-11,-1},
          rotation=270),Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255})}),
    Documentation(info="<html>
<p>
Determines the minimum and maximum element of the input vector and
provide both values as output.
</p>
</html>", revisions="<html>
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
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255})}));
end RSELECT;

