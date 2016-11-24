within OpenIPSL.Electrical.Wind.PSSE.Submodels;
model HVRCL
  //The 'High Voltage Reactive Current Management' block limits the reactive current injected into the network equations such that the terminal voltage of the machine never exceeds Volim of nominal, as long as the converter is within current limits."
  parameter Real VHVRCR "Threthod voltage for HVRCL";
  parameter Real CurHVRCR "Max. reactive current at VHVRCR";
  Modelica.Blocks.Interfaces.RealInput Vt annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=90,
        origin={15,-19}), iconTransformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={0,-35})));
  Modelica.Blocks.Interfaces.RealOutput Iq_HVRCL annotation (Placement(transformation(extent={{42,4},{60,22}}), iconTransformation(extent={{40,-10},{60,10}})));
  Modelica.Blocks.Interfaces.RealInput Iq annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=0,
        origin={-27,11}), iconTransformation(extent={{-40,-5},{-30,5}})));
equation
  if Vt > VHVRCR then
    Iq_HVRCL = CurHVRCR;
  else
    Iq_HVRCL = Iq;
  end if;
  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-40,-40},{40,40}},
        grid={1,1}), graphics),
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-40,-40},{40,40}},
        grid={1,1}), graphics={Rectangle(
          extent={{-40,40},{40,-40}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-20,40},{20,30}},
          lineColor={0,0,255},
          textString="HVRCL "),Line(
          points={{14,30},{-6,30},{-16,10},{-16,10}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),Text(
          extent={{-28,3},{-20,-3}},
          lineColor={0,0,255},
          textString="I_q"),Text(
          extent={{-5,-21},{5,-29}},
          lineColor={0,0,255},
          textString="V"),Text(
          extent={{19,4},{38,-4}},
          lineColor={0,0,255},
          textString="I_sorc")}),
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
"));
end HVRCL;

