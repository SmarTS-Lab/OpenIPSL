within OpenIPSL.Electrical.Controls.PSSE.ES;
package BaseClasses

  model SelectLogic
    "Selection of voltage signal depending on the Excitation limiters"
    Modelica.Blocks.Interfaces.RealInput V1 annotation (Placement(transformation(extent={{-138,40},{-98,80}})));
    Modelica.Blocks.Interfaces.RealInput V2 annotation (Placement(transformation(extent={{-138,-20},{-98,20}})));
    Modelica.Blocks.Interfaces.RealInput V3 annotation (Placement(transformation(extent={{-138,-80},{-98,-40}})));
    Modelica.Blocks.Interfaces.RealInput VOEL annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={-60,96}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={-60,112})));
    Modelica.Blocks.Interfaces.RealInput VUEL annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={0,96}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={0,112})));
    Modelica.Blocks.Interfaces.RealInput VERR annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={60,96}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={60,112})));
    Modelica.Blocks.Interfaces.RealOutput Vout annotation (Placement(transformation(extent={{100,10},{120,30}})));
  equation
    Vout = if VOEL > 0 then V3 else if VUEL > 0 then V2 else V1;
    annotation (
      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics),
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Text(
            extent={{-42,54},{38,-48}},
            lineColor={0,0,255},
            textString="Select
Logic"),  Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255})}),
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
  end SelectLogic;

  model VE
    parameter Real KP=6.73;
    parameter Real KI=0.1;
    parameter Real XL=0;
    parameter Real THETAP=0;
    Modelica.Blocks.Interfaces.RealInput Vr annotation (Placement(transformation(extent={{-140,56},{-100,96}})));
    Modelica.Blocks.Interfaces.RealInput Vi annotation (Placement(transformation(extent={{-140,10},{-100,50}})));
    Modelica.Blocks.Interfaces.RealInput Ir annotation (Placement(transformation(extent={{-140,-36},{-100,4}})));
    Modelica.Blocks.Interfaces.RealInput Ii annotation (Placement(transformation(extent={{-140,-84},{-100,-44}})));
    Modelica.Blocks.Interfaces.RealOutput VE annotation (Placement(transformation(extent={{100,-18},{140,22}}), iconTransformation(extent={{100,-18},{140,22}})));
    Real Re;
    Real Im;
    Real VE2;
  protected
    parameter Real KPr=KP*cos(THETAP);
    parameter Real KPi=KP*sin(THETAP);
  equation
    Re = KPr*Vr - KPi*Vi - KI*Ii - XL*(KPr*Ii + KPi*Ir);
    Im = KPr*Vi + KPi*Vr + KI*Ir + XL*(KPr*Ir - KPi*Ii);
    VE2 = Re*Re + Im*Im;
    VE = sqrt(VE2);
    annotation (
      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics),
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Text(
            extent={{-88,86},{90,-68}},
            lineColor={0,0,255},
            textString="VE=| KP*VT+j(KI+KP*XL)*IT |"),Rectangle(extent={{-100,80},{100,-84}}, lineColor={0,0,255})}),
      Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSS/E Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>Unknown</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Mengjia Zhang,SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>",   revisions="<html>
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
  end VE;
end BaseClasses;
