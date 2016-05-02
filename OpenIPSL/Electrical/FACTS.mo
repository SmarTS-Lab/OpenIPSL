within OpenIPSL.Electrical;
package FACTS

  package PSAT

    model STATCOM "Static Synchronous Compensator model with equation"

      OpenIPSL.Connectors.PwPin p(vr(start=vr0), vi(start=vi0)) annotation (Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
      constant Real pi=Modelica.Constants.pi;
      parameter Real Sb=100 "System base power (MVA)" annotation (Dialog(group="Power flow data"));
      parameter Real Vbus=400000 "Bus nominal voltage (V)" annotation (Dialog(group="Power flow data"));
      parameter Real Sn=100 "Power rating (MVA)" annotation (Dialog(group="Power flow data"));
      parameter Real Vn=400000 "Voltage rating (V)" annotation (Dialog(group="Power flow data"));
      parameter Real fn=50 "Frequency rating (Hz)" annotation (Dialog(group="Power flow data"));
      parameter Real V_0=1 "Voltage magnitude (pu)" annotation (Dialog(group="Power flow data"));
      parameter Real angle_0=-0.000213067852480 "Voltage angle (deg.)" annotation (Dialog(group="Power flow data"));
      parameter Real Qg=0.139557595258338 "Reactive power injection(p.u.)" annotation (Dialog(group="Power flow data"));
      //parameter Real v_ref=1.002791151905167 "Reference voltage of the STATCOM regulator (pu)" annotation(Dialog(group="Power flow data"));
      parameter Real Kr=50 "Regulator gain (p.u./p.u.)";
      parameter Real Tr=0.01 "Regulator time constant (s)";
      parameter Real i_Max=0.7 "Maximum current (pu)";
      parameter Real i_Min=-0.1 "Minimum current (pu)";
      parameter Real v_POD=0 "Power oscillation damper signal";
      Real i_SH "STATCOM current (pu)";
      Real v(start=V_0) "Bus voltage magnitude (pu)";
      Real Q(start=Qg) "Injected reactive power (pu)";

    protected
      parameter Real Iold=Sn/Vn;
      parameter Real Inew=Sb/Vbus;
      parameter Real i_max=i_Max*Iold/Inew;
      parameter Real i_min=i_Min*Iold/Inew;
      parameter Real vr0=V_0*cos(angle_0/180*pi) "Initialitation";
      parameter Real vi0=V_0*sin(angle_0/180*pi) "Initialitation";
      parameter Real uo=v_ref + v_POD - V_0 "Initialization";
      parameter Real io=Qg/V_0 "Initialization";
      parameter Real v_ref=io/Kr + V_0 - v_POD "Initialization";
      //parameter Real vmin=v_ref + v_POD - i_max/Kr;
      //parameter Real vmax=v_ref + v_POD - i_min/Kr;
      //parameter Real umax=i_max/Kr;
      //parameter Real umin=i_min/Kr;
      Real u(start=uo);

      NonElectrical.Continuous.SimpleLagLim simpleLagLim(
        K=Kr,
        T=Tr,
        y_start=io,
        outMax=i_Max,
        outMin=i_Min) annotation (Placement(transformation(extent={{-10,-8},{10,12}})));
    equation
      v = sqrt(p.vr^2 + p.vi^2);
      0 = p.vr*p.ir + p.vi*p.ii;
      -Q = p.vi*p.ir - p.vr*p.ii;
      u = v_ref + v_POD - v;
      Q = i_SH*v;
      simpleLagLim.u = u;
      simpleLagLim.y = i_SH;

      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255}),Ellipse(
              extent={{-2,22},{48,-22}},
              lineColor={0,0,0},
              fillColor={215,215,215},
              fillPattern=FillPattern.Solid),Ellipse(
              extent={{34,24},{84,-20}},
              lineColor={0,0,0},
              fillPattern=FillPattern.Solid,
              fillColor={215,215,215}),Line(
              points={{-38,0},{-2,0},{-2,0}},
              color={0,0,255},
              smooth=Smooth.None),Line(
              points={{84,2},{100,2},{100,2}},
              color={0,0,255},
              smooth=Smooth.None),Line(
              points={{-90,6},{-82,6},{-76,6}},
              color={255,0,0},
              smooth=Smooth.None,
              thickness=0.5),Line(
              points={{-90,-6},{-82,-6},{-76,-6}},
              color={255,0,0},
              smooth=Smooth.None,
              thickness=0.5),Line(
              points={{-38,0},{-46,0},{-46,0}},
              color={0,0,255},
              smooth=Smooth.None),Line(
              points={{-84,6},{-84,26},{-46,26},{-46,-24},{-82,-24},{-84,-24},{-84,-6},{-84,-6}},
              color={255,0,0},
              thickness=0.5,
              smooth=Smooth.None),Text(
              extent={{-34,-38},{24,-68}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={255,0,0},
              fillPattern=FillPattern.Solid,
              textString="%Name")}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics),
        Documentation(info="<html>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>15/07/2015</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>",     revisions="<html>
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
    end STATCOM;

    model TCSCReactance
      OpenIPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-119,-8},{-99,12}})));
      OpenIPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{100,-10},{120,10}})));
      constant Real pi=Modelica.Constants.pi;
      parameter Real Sb=100 "System base power (MVA)" annotation (Dialog(group="Power flow data"));
      parameter Real Vbus=400000 "Bus nominal voltage (V)" annotation (Dialog(group="Power flow data"));
      parameter Real Sn=100 "Power rating (MVA)" annotation (Dialog(group="Power flow data"));
      parameter Real Vn=400000 "Voltage rating (V)" annotation (Dialog(group="Power flow data"));
      parameter Real f=50 "Frequency rating (Hz)" annotation (Dialog(group="Power flow data"));
      parameter Real x_TCSCO=0.01 "Value of the state varialbe x1" annotation (Dialog(group="Power flow data"));
      parameter Real x20=0.01 "Value of the state varible x2" annotation (Dialog(group="Power flow data"));
      parameter Real pref=0.080101913348342 "Reference power (pu)" annotation (Dialog(group="Power flow data"));
      parameter Real Cp=0.10 "Percentage of series compensation (%)";
      parameter Real Tr=0.5 "Regulator time constant (s)";
      parameter Real xTCSCmax=0.05 "Maximum reactance (pu)";
      parameter Real xTCSCmin=-0.05 "Minimum reactance (pu)";
      parameter Real Kp=5 "Proportional gain of PI controller (p.u./p.u.)";
      parameter Real Ki=1 "Integral gain of PI controller (p.u./p.u.)";
      parameter Real Vs_POD=0 "Power oscillation damper signal";
      parameter Real x_L=0.1 "Reactance (inductive) (pu)";
      parameter Real Kr=10 "Gain of the stabilizing signal (p.u./p.u.)";
      parameter Real G=0 "Shunt half conductance (pu)";
      parameter Real B=0 "Shunt half susceptance (pu)";
      parameter Real rL=0.01 "Line resistance (pu)";
      Real vk "Bus voltage of bus k (pu)";
      Real vm "Bus voltage of bus m (pu)";
      Real pkm "Active power flow from bus k to m (pu)";
      Real b "TCSC series susceptance (pu)";
      Real x_TCSC "TCSC series reactance (pu)";
    protected
      Real x2;
      Real x0;
    protected
      parameter Real Vb2new=Vbus*Vbus;
      parameter Real Vb2old=Vn*Vn;
      parameter Real R=rL*(Vb2old*Sb)/(Vb2new*Sn);
      parameter Real X=x_L*(Vb2old*Sb)/(Vb2new*Sn);
      parameter Real xTCSC_max=xTCSCmax*(Vb2old*Sb)/(Vb2new*Sn);
      parameter Real xTCSC_min=xTCSCmin*(Vb2old*Sb)/(Vb2new*Sn);
      parameter Real y=1/X;
    initial equation
      x_TCSC = x_TCSCO;
      x2 = x20;
    equation
      vk = sqrt(p.vr^2 + p.vi^2);
      vm = sqrt(n.vr^2 + n.vi^2);
      if x_TCSC > xTCSC_max and der(x_TCSC) > 0 and der(x2) > 0 then
        der(x_TCSC) = 0;
        der(x2) = -Ki*(pkm - pref);
        b = -xTCSC_max/X/(X*(1 - xTCSC_max/X));
      elseif x_TCSC < xTCSC_min and der(x_TCSC) < 0 and der(x2) < 0 then
        der(x_TCSC) = 0;
        der(x2) = -Ki*(pkm - pref);
        b = -xTCSC_min/X/(X*(1 - xTCSC_min/X));
      else
        der(x_TCSC) = (Kr*Vs_POD - Kp*(pkm - pref) + x2 - x_TCSC)/Tr;
        der(x2) = -Ki*(pkm - pref);
        b = -x_TCSC/X/(X*(1 - x_TCSC/X));
      end if;
      pkm = p.vr*p.ir + p.vi*p.ii;
      x0 = -(Kp*(pkm - pref) - x2);
      n.ii - B*n.vr - G*n.vi = (y - b)*(p.vr - n.vr);
      n.ir - G*n.vr + B*n.vi = (y - b)*(n.vi - p.vi);
      p.ii - B*p.vr - G*p.vi = (y - b)*(n.vr - p.vr);
      p.ir - G*p.vr + B*p.vi = (y - b)*(p.vi - n.vi);
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(
              extent={{-60,38},{60,-40}},
              lineColor={0,0,255},
              fillColor={175,175,175},
              fillPattern=FillPattern.Solid),Line(
              points={{-60,0},{-100,0},{-100,0}},
              color={0,0,255},
              smooth=Smooth.None),Line(
              points={{100,0},{60,0},{60,0}},
              color={0,0,255},
              smooth=Smooth.None),Line(
              points={{-58,-60},{-42,-60},{40,58},{60,58},{60,58}},
              smooth=Smooth.None,
              color={255,0,0},
              thickness=0.5),Text(
              extent={{-24,62},{20,52}},
              lineColor={0,0,255},
              fillColor={175,175,175},
              fillPattern=FillPattern.Solid,
              textString="%TCSC_XC%")}),
        Documentation(info="<html>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>15/07/2015</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>",     revisions="<html>
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
    end TCSCReactance;

    model TCSCAlpha
      OpenIPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-119,-10},{-99,10}})));
      OpenIPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{100,-10},{120,10}})));
      constant Real pi=Modelica.Constants.pi;
      parameter Real SystemBase=100 "System base power (MVA)" annotation (Dialog(group="Power flow data"));
      parameter Real Vbus=400000 "Bus nominal voltage (V)" annotation (Dialog(group="Power flow data"));
      parameter Real Sn=100 "Power rating (MVA)" annotation (Dialog(group="Power flow data"));
      parameter Real Vn=400000 "Voltage rating (V)" annotation (Dialog(group="Power flow data"));
      parameter Real f=50 "Frequency rating (Hz)" annotation (Dialog(group="Power flow data"));
      parameter Real alpha_TCSCO=0.826168365308219 "Value of state variable x1"
                                                                                annotation (Dialog(group="Power flow data"));
      parameter Real x20=0.826168365308219 "Value of the state varible x2" annotation (Dialog(group="Power flow data"));
      parameter Real x0i=0.826168365308219 "Value of x0" annotation (Dialog(group="Power flow data"));
      parameter Real pref=0.080101913348342 "Reference power (pu)" annotation (Dialog(group="Power flow data"));
      parameter Real Cp=0.10 "Percentage of series compensation (%)";
      parameter Real Tr=0.5 "Regulator time constant (s)";
      parameter Real alpha_max=0.85 " Maximum firing angle (rad)";
      parameter Real alpha_min=0.72 "Minimum firing angle (rad)";
      parameter Real Kp=5 "Proportional gain of PI controller (p.u./p.u.)";
      parameter Real Ki=1 "Integral gain of PI controller (p.u./p.u.)";
      parameter Real Kr=10 "Gain of stabilizing signal (p.u./p.u.)";
      parameter Real Vs_POD=0 "Power oscillation damper signal";
      parameter Real x_L=0.2 "Reactance (inductive) (pu)";
      parameter Real x_C=0.1 "Reactance (capacitive) (pu)";
      parameter Real XL=0.1 "Line reactance (pu)";
      parameter Real G=0 "Shunt half conductance (pu)";
      parameter Real B=0 "Shunt half susceptance (pu)";
      parameter Real rL=0.01 "Line resistance, (pu)";
      Real vk "Bus voltage of bus k (pu)";
      Real vm "Bus voltage of bus m (pu)";
      Real pkm(start=pref) "Active power flow from bus k to m (pu)";
      Real b "TCSC series susceptance (pu)";
      Real alpha_TCSC "TCSC series reactance (pu)";
    protected
      Real x0(start=x0i);
      Real x2(start=x20);
    protected
      parameter Real Vb2new=Vbus*Vbus;
      parameter Real Vb2old=Vn*Vn;
      parameter Real xL=x_L*(Vb2old*SystemBase)/(Vb2new*Sn)
        "Reactance(inductive),p.u";
      parameter Real xC=x_C*(Vb2old*SystemBase)/(Vb2new*Sn)
        "Reactance(capacitive),p.u";
      parameter Real X=XL*(Vb2old*SystemBase)/(Vb2new*Sn) "Line Reactance,p.u";
      parameter Real kx=sqrt(xC/xL);
      parameter Real XL2=(1 - Cp)*XL;
      parameter Real y=1/X;
    initial equation
      alpha_TCSC = alpha_TCSCO;
    equation
      vk = sqrt(p.vr^2 + p.vi^2);
      vm = sqrt(n.vr^2 + n.vi^2);
      pkm = p.vr*p.ir + p.vi*p.ii;
      x0 = -(Kp*(pkm - pref) - x2);
      if alpha_TCSC > alpha_max and der(alpha_TCSC) > 0 and der(x2) > 0 then
        der(alpha_TCSC) = 0;
        der(x2) = -Ki*(pkm - pref);
        b = pi*(kx^4 - 2*kx^2 + 1)*cos(kx*(pi - alpha_max))/(xC*(pi*kx^4*cos(kx*(pi - alpha_max))) - pi*cos(kx*(pi - alpha_max)) - 2*kx^4*alpha_max*cos(kx*(pi - alpha_max)) + 2*kx^2*alpha_max*cos(kx*(pi
           - alpha_max)) - kx^4*sin(2*alpha_max)*cos(kx*(pi - alpha_max)) + kx^2*sin(2*alpha_max)*cos(kx*(pi - alpha_max)) - 4*kx^3*cos(alpha_max)^2*sin(kx*(pi - alpha_max)) - 4*kx^2*cos(alpha_max)*sin(
          alpha_max)*cos(kx*(pi - alpha_max)));
      elseif alpha_TCSC < alpha_min and der(alpha_TCSC) < 0 and der(x2) < 0 then
        der(alpha_TCSC) = 0;
        der(x2) = -Ki*(pkm - pref);
        b = pi*(kx^4 - 2*kx^2 + 1)*cos(kx*(pi - alpha_min))/(xC*(pi*kx^4*cos(kx*(pi - alpha_min))) - pi*cos(kx*(pi - alpha_min)) - 2*kx^4*alpha_min*cos(kx*(pi - alpha_min)) + 2*kx^2*alpha_min*cos(kx*(pi
           - alpha_min)) - kx^4*sin(2*alpha_min)*cos(kx*(pi - alpha_min)) + kx^2*sin(2*alpha_min)*cos(kx*(pi - alpha_min)) - 4*kx^3*cos(alpha_min)^2*sin(kx*(pi - alpha_min)) - 4*kx^2*cos(alpha_min)*sin(
          alpha_min)*cos(kx*(pi - alpha_min)));
      else
        der(alpha_TCSC) = (Kr*Vs_POD - Kp*(pkm - pref) + x2 - alpha_TCSC)/Tr;
        der(x2) = -Ki*(pkm - pref);
        b = pi*(kx^4 - 2*kx^2 + 1)*cos(kx*(pi - alpha_TCSC))/(xC*(pi*kx^4*cos(kx*(pi - alpha_TCSC))) - pi*cos(kx*(pi - alpha_TCSC)) - 2*kx^4*alpha_TCSC*cos(kx*(pi - alpha_TCSC)) + 2*kx^2*alpha_TCSC*cos(
          kx*(pi - alpha_TCSC)) - kx^4*sin(2*alpha_TCSC)*cos(kx*(pi - alpha_TCSC)) + kx^2*sin(2*alpha_TCSC)*cos(kx*(pi - alpha_TCSC)) - 4*kx^3*cos(alpha_TCSC)^2*sin(kx*(pi - alpha_TCSC)) - 4*kx^2*cos(
          alpha_TCSC)*sin(alpha_TCSC)*cos(kx*(pi - alpha_TCSC)));
      end if;
      n.ii - B*n.vr - G*n.vi = (y + b)*(p.vr - n.vr);
      n.ir - G*n.vr + B*n.vi = (y + b)*(n.vi - p.vi);
      p.ii - B*p.vr - G*p.vi = (y + b)*(n.vr - p.vr);
      p.ir - G*p.vr + B*p.vi = (y + b)*(p.vi - n.vi);
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(
              extent={{-4,46},{-4,34}},
              lineColor={0,0,255},
              fillColor={175,175,175},
              fillPattern=FillPattern.Solid),Rectangle(
              extent={{6,46},{6,34}},
              lineColor={0,0,255},
              fillColor={175,175,175},
              fillPattern=FillPattern.Solid),Line(
              points={{-60,40},{-20,40},{-4,40}},
              color={0,0,255},
              smooth=Smooth.None),Line(
              points={{-60,40},{-60,-40},{-22,-40},{-22,-40}},
              color={0,0,255},
              smooth=Smooth.None),Polygon(
              points={{4,-16},{18,-20},{4,-24},{4,-24},{4,-16}},
              lineColor={0,0,255},
              smooth=Smooth.None,
              fillColor={175,175,175},
              fillPattern=FillPattern.Solid),Polygon(
              points={{-7,4},{7,0},{-7,-4},{-7,-4},{-7,4}},
              lineColor={0,0,255},
              smooth=Smooth.None,
              fillColor={175,175,175},
              fillPattern=FillPattern.Solid,
              origin={9,-58},
              rotation=180),Line(
              points={{18,-16},{18,-24}},
              color={0,0,255},
              smooth=Smooth.None),Line(
              points={{2,-54},{2,-62}},
              color={0,0,255},
              smooth=Smooth.None),Line(
              points={{-22,-20},{-22,-58},{-22,-56}},
              color={0,0,255},
              smooth=Smooth.None),Line(
              points={{-22,-58},{2,-58},{2,-58}},
              color={0,0,255},
              smooth=Smooth.None),Line(
              points={{-22,-20},{4,-20},{4,-20}},
              color={0,0,255},
              smooth=Smooth.None),Line(
              points={{18,-20},{40,-20},{40,-58},{16,-58},{16,-58}},
              color={0,0,255},
              smooth=Smooth.None),Line(
              points={{6,40},{60,40},{60,-40},{40,-40}},
              color={0,0,255},
              smooth=Smooth.None),Line(
              points={{-100,0},{-62,0},{-60,0},{-60,0}},
              color={0,0,255},
              smooth=Smooth.None),Line(
              points={{60,0},{100,0},{100,0}},
              color={0,0,255},
              smooth=Smooth.None),Text(
              extent={{-18,68},{16,60}},
              lineColor={0,0,255},
              fillColor={175,175,175},
              fillPattern=FillPattern.Solid,
              textString="%TCSC_Alpha%")}),
        Documentation(info="<html>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>15/07/2015</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>",     revisions="<html>
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
    end TCSCAlpha;
  end PSAT;
annotation (Documentation(revisions="<html>
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
end FACTS;
