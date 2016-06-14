within OpenIPSL.Electrical.Wind.GE.Type_3.Electrical_Control;
model lim_exc_s1
  extends Modelica.Blocks.Interfaces.BlockIcon;
  parameter Real xiqmin=1;
  parameter Real xiqmax=1;
  parameter Real typpe=1;
  Modelica.Blocks.Interfaces.RealInput Efd "Input: Excitation voltage" annotation (Placement(
      transformation(
        extent={{-140.0,40.0},{-100.0,80.0}},
        rotation=0,
        origin={0.0,18.0}),
      visible=true,
      iconTransformation(
        origin={0.0,0.0},
        extent={{-140.0,40.0},{-100.0,80.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput Vt "Terminal Voltage" annotation (Placement(
      transformation(
        extent={{-140.0,-80.0},{-100.0,-40.0}},
        rotation=0,
        origin={0.0,-18.0}),
      visible=true,
      iconTransformation(
        origin={0.0,0.0},
        extent={{-140.0,-80.0},{-100.0,-40.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput y
    "Output: saturated excitation voltage"                                       annotation (Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealInput Vref "Reference Voltage " annotation (Placement(
      visible=true,
      transformation(
        origin={0.0,-58.0},
        extent={{-140.0,40.0},{-100.0,80.0}},
        rotation=0),
      iconTransformation(
        origin={0.0,-58.0717},
        extent={{-140.0,40.0},{-100.0,80.0}},
        rotation=0)));
equation
  if typpe == 1 then
    if Efd >= Vt + xiqmax and Vref >= 0 or Efd <= Vt + xiqmin and Vref <= 0 then
      y = 0;
    else
      y = Vref;
    end if;
  elseif typpe == 2 then
    if Vref >= Vt + xiqmax then
      y = Vt + xiqmax;
    elseif Vref <= Vt + xiqmin then
      y = Vt + xiqmin;
    else
      y = Vref;
    end if;
  else
    y = 0;
  end if;
  annotation (
    Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={10,10}), graphics={Text(
          visible=true,
          origin={-1.349,1.6286},
          fillPattern=FillPattern.Solid,
          extent={{-55.1519,-28.3714},{55.1519,28.3714}},
          textString="lim_exc_s1",
          fontName="Arial")}),
    Documentation(info="<html>
<p>
Block has two continuous Real input vectors u1 and u2 and one
continuous Real output vector y.
All vectors have the same number of elements.
</p>
</html>", revisions="<html>
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
</html>"),
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics));
end lim_exc_s1;
