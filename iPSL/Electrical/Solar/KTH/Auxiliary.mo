within iPSL.Electrical.Solar.KTH;
model Auxiliary
  model InputSelectorEpsilon
    Modelica.Blocks.Interfaces.RealInput vd(start=700) annotation (Placement(
        visible=true,
        transformation(
          origin={-167.6662,80.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0),
        iconTransformation(
          origin={-120.0,77.7142},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealInput id(start=641.2) annotation (Placement(
        visible=true,
        transformation(
          origin={-168.2292,30.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0),
        iconTransformation(
          origin={-120.0,24.2671},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealInput dv(start=0) annotation (Placement(
        visible=true,
        transformation(
          origin={-167.9388,-21.6068},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0),
        iconTransformation(
          origin={-120.0,-27.4532},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealInput di(start=0) annotation (Placement(
        visible=true,
        transformation(
          origin={-170.0,-80.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0),
        iconTransformation(
          origin={-120.0,-84.009},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput k(start=0) annotation (Placement(
        visible=true,
        transformation(
          origin={160.0,0.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0),
        iconTransformation(
          origin={110.0,0.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));

    function Inputselectorfunction
      input Real vd;
      input Real id;
      input Real dv;
      input Real di;
      output Real k;
      parameter Real Epsilon=0.01;
    algorithm
      if dv == 0 then
        if di == 0 then
          k := 0;
        elseif di > 0 then
          k := 1;
        elseif di < 0 then
          k := -1;
        end if;
      else
        if abs(di/dv + id/vd) < Epsilon then
          k := 0;
        else
          if di/dv + id/vd > 0 then
            k := 1;
          else
            k := -1;
          end if;
        end if;
      end if;
      annotation (
        Diagram(coordinateSystem(
            extent={{-148.5,-105.0},{148.5,105.0}},
            preserveAspectRatio=true,
            initialScale=0.1,
            grid={5,5})),
        Diagram(coordinateSystem(
            extent={{-148.5,-105.0},{148.5,105.0}},
            preserveAspectRatio=true,
            initialScale=0.1,
            grid={5,5})),
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
    end Inputselectorfunction;
  algorithm
    k := Inputselectorfunction(
        vd,
        id,
        dv,
        di);
    annotation (
      Icon(coordinateSystem(
          extent={{-100.0,-100.0},{100.0,100.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={10,10}), graphics={
          Text(
            visible=true,
            origin={-85.4693,77.294},
            fillPattern=FillPattern.Solid,
            extent={{-8.7699,-10.7022},{8.7699,10.7022}},
            textString="0",
            fontName="Arial"),
          Text(
            visible=true,
            origin={-83.7123,27.3769},
            fillPattern=FillPattern.Solid,
            extent={{-8.7699,-10.7022},{8.7699,10.7022}},
            textString="1",
            fontName="Arial"),
          Text(
            visible=true,
            origin={-84.3336,-26.9995},
            fillPattern=FillPattern.Solid,
            extent={{-8.7699,-10.7022},{8.7699,10.7022}},
            textString="2",
            fontName="Arial"),
          Text(
            visible=true,
            origin={-83.4684,-82.2678},
            fillPattern=FillPattern.Solid,
            extent={{-8.7699,-10.7022},{8.7699,10.7022}},
            textString="3",
            fontName="Arial"),
          Text(
            visible=true,
            origin={75.8495,0.7022},
            fillPattern=FillPattern.Solid,
            extent={{-8.7699,-10.7022},{8.7699,10.7022}},
            textString="k",
            fontName="Arial"),
          Rectangle(
            visible=true,
            fillColor={255,255,255},
            extent={{-100.0,-100.0},{100.0,100.0}})}),
      Diagram(coordinateSystem(
          extent={{-148.5,-105.0},{148.5,105.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={5,5})),
      Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>TBD</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>TBD</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
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
</html>"));
  end InputSelectorEpsilon;

  model PVarray
    Modelica.Blocks.Interfaces.RealInput V1(start=Vmp) "Voltage" annotation (Placement(
        visible=true,
        transformation(
          origin={-168.2602,-0.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0),
        iconTransformation(
          origin={-120.0,70.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0)));
    parameter Real Vt=(2*Vmp - Vocref)*(Iscref - Imp)/(Imp + (Iscref - Imp)*log((Iscref - Imp)/Iscref));
    parameter Real Rs=(Vt*log((Iscref - Imp)/Iscref) + Vocref - Vmp)/Imp;
    Modelica.Blocks.Interfaces.RealInput E(start=Estc) "Irradiance" annotation (Placement(
        visible=true,
        transformation(
          origin={-170.0,80.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0),
        iconTransformation(
          origin={-120.0,0.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealInput T(start=Tstc) "Temperature" annotation (Placement(
        visible=true,
        transformation(
          origin={-168.0185,40.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0),
        iconTransformation(
          origin={-120.0,-70.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0)));
    parameter Real Imp=1;
    parameter Real Vmp=1;
    parameter Real Iscref=1 "Module short-circuit current reference at reference temp and irradiance";
    parameter Real Vocref=1 "Module open-circuit voltage reference at reference temp and irradiance";
    parameter Real Kv=1 "temperature correction factor for the voltage";
    parameter Real Ki=1 "temperature correction factor for the current";
    parameter Real Tstc=1 "Temperature at the standard test conditions";
    parameter Real Estc=1 "Irradiance at the standard test conditions";
    Real Voct;
    Real Voc;
    Real Isct;
    Real Isc;
    Real I0 "diode dark current";
    Real Iph;
    Real Id;
    Modelica.Blocks.Interfaces.RealOutput I(start=Imp) annotation (Placement(
        visible=true,
        transformation(
          origin={160.0,60.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0),
        iconTransformation(
          origin={110.0,40.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput V(start=Vmp) annotation (Placement(
        visible=true,
        transformation(
          origin={160.0,21.9548},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0),
        iconTransformation(
          origin={110.0,-34.2738},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
  equation
    Voct = Vocref + Kv*(T - Tstc);
    Voc = Voct*log(E)/log(Estc);
    Isct = Iscref*(1 + Ki/100*(T - Tstc));
    Isc = Isct*E/Estc;
    I0 = Isct/exp(Voct/Vt);
    Iph = Isc;
    Id = I0*exp((V + I*Rs)/Vt);
    I = Iph - Id;
    V = V1;
    annotation (
      Icon(coordinateSystem(
          extent={{-100.0,-100.0},{100.0,100.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={10,10}), graphics={
          Rectangle(
            visible=true,
            fillColor={255,255,255},
            extent={{-100.0,-100.0},{100.0,100.0}}),
          Text(
            visible=true,
            origin={40.0,0.0},
            fillPattern=FillPattern.Solid,
            extent={{-45.9305,-23.3368},{45.9305,23.3368}},
            textString="%name",
            fontName="Arial"),
          Text(
            visible=true,
            origin={-46.5008,63.2046},
            fillPattern=FillPattern.Solid,
            extent={{-51.9003,-55.1779},{51.9003,55.1779}},
            textString="Vdc(ex=35)",
            fontName="Arial"),
          Text(
            visible=true,
            origin={-80.0,0.0},
            fillPattern=FillPattern.Solid,
            extent={{-12.8628,-13.6751},{12.8628,13.6751}},
            textString="E",
            fontName="Arial"),
          Text(
            visible=true,
            origin={-80.0,-70.0},
            fillPattern=FillPattern.Solid,
            extent={{-12.8628,-13.6751},{12.8628,13.6751}},
            textString="T",
            fontName="Arial"),
          Text(
            visible=true,
            origin={70.7131,40.0},
            fillPattern=FillPattern.Solid,
            extent={{-20.7131,-17.8652},{20.7131,17.8652}},
            textString="Ipv(4.58)",
            fontName="Arial"),
          Text(
            visible=true,
            origin={70.0,-37.1013},
            fillPattern=FillPattern.Solid,
            extent={{-25.1013,-17.1013},{25.1013,17.1013}},
            textString="Vpv(35)",
            fontName="Arial")}),
      Diagram(coordinateSystem(
          extent={{-148.5,-105.0},{148.5,105.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={5,5})),
      Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>TBD</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>TBD</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
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
</html>"));
  end PVarray;

  model AtoPU
    Modelica.Blocks.Interfaces.RealOutput y0 annotation (Placement(
        visible=true,
        transformation(
          origin={155.0,-0.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0),
        iconTransformation(
          origin={110.0,0.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealInput yi annotation (Placement(
        visible=true,
        transformation(
          origin={-155.0,0.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0),
        iconTransformation(
          origin={-120.0,-0.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0)));
    parameter Real Pnen;
    parameter Real UdcN;
  equation
    y0 = yi/Pnen*1000/UdcN;
    annotation (
      Icon(coordinateSystem(
          extent={{-100.0,-100.0},{100.0,100.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={10,10}), graphics={Text(
            visible=true,
            origin={1.9581,1.6889},
            fillPattern=FillPattern.Solid,
            extent={{-31.9581,-31.6889},{31.9581,31.6889}},
            textString="A_to_pu",
            fontName="Arial"), Rectangle(
            visible=true,
            fillColor={255,255,255},
            extent={{-100.0,-100.0},{100.0,100.0}})}),
      Diagram(coordinateSystem(
          extent={{-148.5,-105.0},{148.5,105.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={5,5})),
      Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>TBD</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>TBD</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
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
</html>"));
  end AtoPU;

  model Calcurrent
    parameter Real Udc0=700 "Intial dc voltage";
    Modelica.Blocks.Interfaces.RealInput yi annotation (Placement(
        visible=true,
        transformation(
          origin={-155.0,40.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0),
        iconTransformation(
          origin={-120.0,40.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealInput udc(start=Udc0) annotation (Placement(
        visible=true,
        transformation(
          origin={-150.0,-15.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0),
        iconTransformation(
          origin={-120.0,-50.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput yo annotation (Placement(
        visible=true,
        transformation(
          origin={157.5089,7.3692},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0),
        iconTransformation(
          origin={110.0,0.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
  equation
    yo = yi/udc*1000000;
    annotation (
      Icon(coordinateSystem(
          extent={{-100.0,-100.0},{100.0,100.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={10,10}), graphics={
          Text(
            visible=true,
            origin={-80.1182,38.5265},
            fillPattern=FillPattern.Solid,
            extent={{-13.2292,-11.4735},{13.2292,11.4735}},
            textString="0",
            fontName="Arial"),
          Text(
            visible=true,
            origin={-80.0,-51.4735},
            fillPattern=FillPattern.Solid,
            extent={{-13.2292,-11.4735},{13.2292,11.4735}},
            textString="1",
            fontName="Arial"),
          Text(
            visible=true,
            origin={76.7708,-0.0},
            fillPattern=FillPattern.Solid,
            extent={{-13.2292,-11.4735},{13.2292,11.4735}},
            textString="out",
            fontName="Arial"),
          Rectangle(
            visible=true,
            fillColor={255,255,255},
            extent={{-100.0,-100.0},{100.0,100.0}}),
          Text(
            visible=true,
            origin={-2.514,58.5651},
            fillPattern=FillPattern.Solid,
            extent={{-27.486,-14.5669},{27.486,14.5669}},
            textString="Calc_current",
            fontName="Arial")}),
      Diagram(coordinateSystem(
          extent={{-148.5,-105.0},{148.5,105.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={5,5})),
      Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>TBD</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>TBD</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
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
</html>"));
  end Calcurrent;

  model Capacitor
    Modelica.Blocks.Interfaces.RealOutput y0 annotation (Placement(
        visible=true,
        transformation(
          origin={155.0,-0.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0),
        iconTransformation(
          origin={110.0,0.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealInput yi annotation (Placement(
        visible=true,
        transformation(
          origin={-155.0,0.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0),
        iconTransformation(
          origin={-120.0,-0.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0)));
    Real x(start=Udc0/(1000*UdcN));
    parameter Real C;
    parameter Real Udc0;
    parameter Real UdcN;
  equation
    y0 = x;
    der(x) = yi/C;
    annotation (
      Icon(coordinateSystem(
          extent={{-100.0,-100.0},{100.0,100.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={10,10}), graphics={Rectangle(
            visible=true,
            fillColor={255,255,255},
            extent={{-100.0,-100.0},{100.0,100.0}}), Text(
            visible=true,
            origin={0.0,2.2296},
            fillPattern=FillPattern.Solid,
            extent={{-23.283,-44.4441},{23.283,44.4441}},
            textString="Capacitor",
            fontName="Arial")}),
      Diagram(coordinateSystem(
          extent={{-148.5,-105.0},{148.5,105.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={5,5})),
      Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>TBD</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>TBD</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
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
</html>"));
  end Capacitor;

  model pu_to_A
    Modelica.Blocks.Interfaces.RealOutput y0 annotation (Placement(
        visible=true,
        transformation(
          origin={160.0,0.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0),
        iconTransformation(
          origin={110.0,0.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealInput yi annotation (Placement(
        visible=true,
        transformation(
          origin={-155.0,0.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0),
        iconTransformation(
          origin={-120.0,-0.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0)));
    parameter Real Pnen;
    parameter Real UdcN;
  equation
    y0 = yi*UdcN*1000;
    annotation (
      Icon(coordinateSystem(
          extent={{-100.0,-100.0},{100.0,100.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={10,10}), graphics={Text(
            visible=true,
            origin={1.9581,1.6889},
            fillPattern=FillPattern.Solid,
            extent={{-31.9581,-31.6889},{31.9581,31.6889}},
            textString="A_to_pu",
            fontName="Arial"), Rectangle(
            visible=true,
            fillColor={255,255,255},
            extent={{-100.0,-100.0},{100.0,100.0}})}),
      Diagram(coordinateSystem(
          extent={{-148.5,-105.0},{148.5,105.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={5,5})),
      Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>TBD</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>TBD</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
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
</html>"));
  end pu_to_A;

  model CurrentLimitdeadband
    Modelica.Blocks.Interfaces.RealInput idin annotation (Placement(
        visible=true,
        transformation(
          origin={-168.0385,-35.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0),
        iconTransformation(
          origin={-103.1115,53.6136},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput id_ref annotation (Placement(
        visible=true,
        transformation(
          origin={160.0,30.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0),
        iconTransformation(
          origin={9.4772,39.6741},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealInput duac annotation (Placement(
        visible=true,
        transformation(
          origin={-168.0827,0.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0),
        iconTransformation(
          origin={-95.1115,45.6136},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealInput iqin annotation (Placement(
        visible=true,
        transformation(
          origin={-160.0,42.5},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0),
        iconTransformation(
          origin={-87.1115,37.6136},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput iq_ref annotation (Placement(
        visible=true,
        transformation(
          origin={158.267,-3.451},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0),
        iconTransformation(
          origin={17.4772,31.6741},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Math.Abs abs1 annotation (Placement(visible=true, transformation(
          origin={52.1853,70.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Nonlinear.Limiter limiter1(uMin=0, uMax=maxAbsCur*maxAbsCur)
      annotation (Placement(visible=true, transformation(
          origin={5.0,70.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Sources.Constant const(k=maxAbsCur) annotation (Placement(visible=true, transformation(
          origin={-140.0,95.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Math.Product product1 annotation (Placement(visible=true, transformation(
          origin={-75.0,83.3156},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Math.Product product2 annotation (Placement(visible=true, transformation(
          origin={-75.0,57.5},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Math.Add add1(k2=-1) annotation (Placement(visible=true, transformation(
          origin={-40.0,70.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Math.Sqrt sqrt1 annotation (Placement(visible=true, transformation(
          origin={82.1897,70.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
  equation
    connect(abs1.y, sqrt1.u) annotation (Line(
        visible=true,
        origin={66.6875,70.0},
        points={{-3.5022,0.0},{3.5022,0.0}},
        color={0,0,127}));
    connect(limiter1.y, abs1.u) annotation (Line(
        visible=true,
        origin={28.0926,70.0},
        points={{-12.0926,0},{12.0927,0}},
        color={0,0,127}));
    connect(add1.y, limiter1.u) annotation (Line(
        visible=true,
        origin={-18.0,70.0},
        points={{-11.0,0.0},{11.0,0.0}},
        color={0,0,127}));
    connect(product2.y, add1.u2) annotation (Line(
        visible=true,
        origin={-56.5,60.75},
        points={{-7.5,-3.25},{1.5,-3.25},{1.5,3.25},{4.5,3.25}},
        color={0,0,127}));
    connect(product1.y, add1.u1) annotation (Line(
        visible=true,
        origin={-56.5,79.6578},
        points={{-7.5,3.6578},{1.5,3.6578},{1.5,-3.6578},{4.5,-3.6578}},
        color={0,0,127}));
    connect(iqin, product2.u1)
      annotation (Line(
        visible=true,
        origin={-102.8,54.8073},
        points={{-57.2,-12.3073},{12.8,-12.3073},{12.8,7.9609},{15.8,7.9609},{15.8,8.6927}},
        color={0,0,127}));
    connect(iqin, product2.u2) annotation (Line(
        visible=true,
        origin={-106.75,47.0},
        points={{-53.25,-4.5},{16.75,-4.5},{16.75,4.5},{19.75,4.5}},
        color={0,0,127}));
    connect(const.y, product1.u2) annotation (Line(
        visible=true,
        origin={-101.5,86.1578},
        points={{-27.5,8.8422},{6.5,8.8422},{6.5,-8.8422},{14.5,-8.8422}},
        color={0,0,127}));
    connect(const.y, product1.u1) annotation (Line(
        visible=true,
        origin={-99.0,92.1578},
        points={{-30,2.8422},{9,2.8422},{9,-2.8422},{12,-2.8422}},
        color={0,0,127}));
    annotation (Diagram(coordinateSystem(
          extent={{-148.5,-105.0},{148.5,105.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={5,5})), Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>TBD</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>TBD</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
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
</html>"));
  end CurrentLimitdeadband;

  model PQ1
    iPSL.Connectors.PwPin p annotation (Placement(
        visible=true,
        transformation(
          origin={55.0,22.7992},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0),
        iconTransformation(
          origin={-110.0,0.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    parameter Real SystemBase=100;
    parameter Real Sn=10;
    parameter Real CoB=Sn/SystemBase;
    parameter Real v0=1.00018548610126 "voltage magnitude after power flow, pu";
    parameter Real anglev0=-0.0000253046024029618 "voltage angle after power flow";
    parameter Real P0=0.4 "active power,pu";
    parameter Real Q0=0.3 "reactive power,pu";
    parameter Real Pref=P0*CoB;
    parameter Real Qref=Q0*CoB;
    parameter Real vd0=-v0*sin(anglev0) "Initialitation";
    parameter Real vq0=v0*cos(anglev0) "Initialitation";
    parameter Real Td=15 "d-axis inverter time constant";
    parameter Real Tq=15 "q-axis inverter time constant";
    parameter Real idref=(vq0*Qref + Pref*vd0)/(vq0^2 + vd0^2) "Initialitation";
    parameter Real iqref=((-vd0*Qref) + Pref*vq0)/(vq0^2 + vd0^2) "Initialitation";
    Real idref1(start=idref);
    Real iqref1(start=iqref);
    Real v;
    Real anglev;
    Real id(start=idref);
    Real iq(start=iqref);
    Real vd(start=vd0);
    Real vq(start=vq0);
    Real Pgen(start=Pref);
    Real Q(start=Qref);
    Modelica.Blocks.Interfaces.RealInput P(start=Pref) annotation (Placement(
        visible=true,
        transformation(
          origin={165.1089,40.5794},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0),
        iconTransformation(
          origin={120.0,60.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=-180)));
  equation
    Pgen = vd*id + vq*iq;
    Q = vq*id - vd*iq;
    idref1 = (vq*Qref + P*vd)/(vq^2 + vd^2);
    iqref1 = ((-vd*Qref) + P*vq)/(vq^2 + vd^2);
    der(id) = (idref1 - id)/Td;
    der(iq) = (iqref1 - iq)/Tq;
    v = sqrt(p.vr^2 + p.vi^2);
    anglev = atan2(p.vi, p.vr);
    p.ir = -iq "change of sign due to the fact than in modelica when entering is + and in this case is going out";
    p.ii = id "change of sign due to the fact than in modelica when entering is + and in this case is going out";
    p.vr = vq;
    p.vi = -vd;
    annotation (
      Icon(coordinateSystem(
          extent={{-100.0,-100.0},{100.0,100.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={10,10}), graphics={Rectangle(
            visible=true,
            fillColor={255,255,255},
            extent={{-100.0,-100.0},{100.0,100.0}}), Text(
            visible=true,
            origin={0.0,15.3102},
            fillPattern=FillPattern.Solid,
            extent={{-31.415,-20.0667},{31.415,20.0667}},
            textString="%name",
            fontName="Arial")}),
      Diagram(coordinateSystem(
          extent={{-148.5,-105.0},{148.5,105.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={5,5})),
      Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>TBD</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>TBD</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
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
</html>"));
  end PQ1;

  model PI
    Modelica.Blocks.Interfaces.RealInput yi annotation (Placement(
        visible=true,
        transformation(
          origin={-137.6396,33.4951},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0),
        iconTransformation(
          origin={-120.0,0.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput yo annotation (Placement(
        visible=true,
        transformation(
          origin={105.0,35.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0),
        iconTransformation(
          origin={110.0,0.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    parameter Real K;
    parameter Real T;
    parameter Real xo;
    parameter Real Ymax;
    parameter Real Ymin;
    Real x(start=xo);
    Real x1(start=xo);
  equation
    if x > Ymax then
      x1 = Ymax;
    elseif x < Ymin then
      x1 = Ymin;
    else
      x1 = x;
    end if;
    der(x) = K*yi/T;
    yo = K*yi + x1;
    annotation (
      Icon(coordinateSystem(
          extent={{-100.0,-100.0},{100.0,100.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={10,10}), graphics={
          Text(
            visible=true,
            origin={-13.5393,7.4321},
            fillPattern=FillPattern.Solid,
            extent={{-43.5393,-25.2692},{43.5393,25.2692}},
            textString="PI",
            fontName="Arial"),
          Rectangle(
            visible=true,
            fillColor={255,255,255},
            extent={{-100.0,-100.0},{100.0,100.0}}),
          Rectangle(
            visible=true,
            origin={151.9125,3.2701},
            fillColor={255,255,255},
            extent={{-0.2973,-3.2701},{0.2973,3.2701}})}),
      Diagram(coordinateSystem(
          extent={{-148.5,-105.0},{148.5,105.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={5,5})),
      Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>TBD</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>TBD</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
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
</html>"));
  end PI;

  model SimpleLagg
    Modelica.Blocks.Interfaces.RealInput yi annotation (Placement(
        visible=true,
        transformation(
          origin={-137.6396,33.4951},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0),
        iconTransformation(
          origin={-120.0,0.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput yo annotation (Placement(
        visible=true,
        transformation(
          origin={105.0,35.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0),
        iconTransformation(
          origin={110.0,0.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    parameter Real T=0.002;
    parameter Real xo;
    Real x(start=xo);
  equation
    der(x) = (yi - x)/T;
    yo = x;
    annotation (
      Icon(coordinateSystem(
          extent={{-100.0,-100.0},{100.0,100.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={10,10}), graphics={
          Text(
            visible=true,
            origin={-13.5393,7.4321},
            fillPattern=FillPattern.Solid,
            extent={{-43.5393,-25.2692},{43.5393,25.2692}},
            textString="SimpleLagg",
            fontName="Arial"),
          Rectangle(
            visible=true,
            fillColor={255,255,255},
            extent={{-100.0,-100.0},{100.0,100.0}}),
          Rectangle(
            visible=true,
            origin={151.9125,3.2701},
            fillColor={255,255,255},
            extent={{-0.2973,-3.2701},{0.2973,3.2701}})}),
      Diagram(coordinateSystem(
          extent={{-148.5,-105.0},{148.5,105.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={5,5})),
      Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>TBD</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>TBD</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
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
</html>"));
  end SimpleLagg;

  model Terminator
    Modelica.Blocks.Interfaces.RealInput V annotation (Placement(
        visible=true,
        transformation(
          origin={-155.0,1.9703},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0),
        iconTransformation(
          origin={-120.0,0.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=0)));
    parameter Real T1=0.1;
    parameter Real T2=0.05;
    parameter Real Step=0.001;
    parameter Real Iniv123;
    parameter Real Inidv;
    Real[:] Value;
    Real v123(start=Iniv123);
    Real dv(start=Inidv);
    Integer i(start=1);
  algorithm
    Value[i] := V;
    if time < T1 then
      v123 := Iniv123;
      dv := Inidv;
    else
      v123 := Value[i - 50];
      dv := Value[i - 100];
    end if;
    i := i + 1;
    annotation (
      Icon(coordinateSystem(
          extent={{-100.0,-100.0},{100.0,100.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={10,10}), graphics={Rectangle(
            visible=true,
            fillColor={255,255,255},
            extent={{-100.0,-100.0},{100.0,100.0}})}),
      Diagram(coordinateSystem(
          extent={{-148.5,-105.0},{148.5,105.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={5,5})),
      Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>TBD</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>TBD</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
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
</html>"));
  end Terminator;
  annotation (Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={5,5})), Documentation(revisions="<html>
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
end Auxiliary;
