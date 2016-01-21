within iPSL.Electrical.Machines.PSAT.BaseClasses;


partial model baseMachine
  extends iPSL.Electrical.Essentials.pfComponent;
  import Modelica.Constants.pi;
  import Modelica.Blocks.Interfaces.*;
  parameter Real Sn "Power rating (MVA)" annotation (Dialog(group="Machine parameters"));
  parameter Real Vn "Voltage rating (kV)" annotation (Dialog(group="Machine parameters"));
  parameter Real ra "Armature resistance (pu)" annotation (Dialog(group="Machine parameters"));
  parameter Real xd1 "d-axis transient reactance (pu)" annotation (Dialog(group="Machine parameters"));
  parameter Real M "Machanical starting time (2H), kWs/kVA" annotation (Dialog(group="Machine parameters"));
  parameter Real D "Damping coefficient" annotation (Dialog(group="Machine parameters"));
  //Initialization
  //Initialization of currents and voltages
  iPSL.Connectors.PwPin p(
    vr(start=vr0),
    vi(start=vi0),
    ir(start=ir0),
    ii(start=ii0)) annotation (Placement(
      visible=true,
      transformation(
        origin={2.2777,10.4683},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0),
      iconTransformation(
        origin={110,0.4964},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  RealOutput delta "Rotor angle (deg)" annotation (Placement(
      visible=true,
      transformation(
        origin={161.0916,-52.0898},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0),
      iconTransformation(
        origin={110,60},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  RealOutput w(start=1) "Rotor speed (pu)" annotation (Placement(
      visible=true,
      transformation(
        origin={160.1093,-96.8871},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0),
      iconTransformation(
        origin={110,90},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  RealOutput v(start=V_0) "Generator terminal voltage (pu)" annotation (Placement(
      visible=true,
      transformation(
        origin={146.6,6.3277},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0),
      iconTransformation(
        origin={110,30},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  RealOutput P "Active power (pu)" annotation (Placement(
      visible=true,
      transformation(
        origin={135.6,56.3277},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0),
      iconTransformation(
        origin={110,-30.1615},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  RealOutput Q "Reactive power (pu)" annotation (Placement(
      visible=true,
      transformation(
        origin={135.6,36.3277},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0),
      iconTransformation(
        origin={110,-60},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  RealInput vf "Field voltage (pu)" annotation (Placement(
      visible=true,
      transformation(
        origin={-159.127,67.3695},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0),
      iconTransformation(
        origin={-100,50},
        extent={{-10,-9.99999},{9.99996,9.99998}},
        rotation=0)));
  RealOutput vf0 "Initial field voltage (pu)" annotation (Placement(
      visible=true,
      transformation(
        origin={159.127,97.5816},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0),
      iconTransformation(
        origin={-80,110},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=90)));
  RealOutput pm0 "Initial mechanical power (pu)" annotation (Placement(
      visible=true,
      transformation(
        origin={160.6004,66.3277},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0),
      iconTransformation(
        origin={-80,-110},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  RealInput pm "Mechanical power (pu)" annotation (Placement(
      visible=true,
      transformation(
        origin={-164.0384,-42.7137},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0),
      iconTransformation(
        origin={-100,-50},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Real anglev(start=angle_0) " Bus voltage angle";
  Real vd "d-axis voltage (pu)";
  Real vq "q-axis voltage (pu)";
  Real id "d-axis currrent (pu)";
  Real iq "q-axis current (pu)";
protected
  parameter Real vr0=V_0*cos(angle_0) "Initialitation";
  parameter Real vi0=V_0*sin(angle_0) "Initialitation";
  parameter Real ir0=(P_0*vr0 + Q_0*vi0)/(vr0^2 + vi0^2) "Initialitation";
  parameter Real ii0=(P_0*vi0 - Q_0*vr0)/(vr0^2 + vi0^2) "Initialitation";
  //Change of base constants
  parameter Real CoB=S_b*Vn/(Sn*V_b);
  parameter Real CoB2=S_b/Sn;
  parameter Real m=M/CoB2 "Machanical starting time (2H), kWs/kVA";
  parameter Real d=D/CoB2 "Damping coefficient";
  parameter Real Ra=ra*CoB "armature resistance, p.u.";
  parameter Real x1d=xd1*CoB "d-axis transient reactance, p.u.";
  parameter Real w_b=2*pi*fn "Base frequency in rad/s";
protected
  Real pe;
initial equation
  w = 1;
equation
  v = sqrt(p.vr^2 + p.vi^2);
  anglev = atan2(p.vi, p.vr);
  der(delta) = w_b*(w - 1);
  der(w) = (pm - pe - d*(w - 1))/m;
  [p.ir; p.ii] = -[sin(delta), cos(delta); -cos(delta), sin(delta)]*[id; iq];
  [p.vr; p.vi] = [sin(delta), cos(delta); -cos(delta), sin(delta)]*[vd; vq];
  // -P = p.vr * p.ir + p.vi * p.ii;
  // -Q = p.vi * p.ir - p.vr * p.ii;
  P = vd*id + vq*iq;
  Q = vq*id - vd*iq;
  pe = (vq + Ra*iq)*iq + (vd + Ra*id)*id;
  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={
        Text(
          origin={-81,50.5},
          fillPattern=FillPattern.Solid,
          extent={{-10,-10.5},{10,10.5}},
          fontName="Arial",
          textString="vf",
          lineColor={28,108,200}),
        Text(
          origin={-77.3761,-48},
          fillPattern=FillPattern.Solid,
          extent={{-9.6086,-11.4189},{9.6086,11.4189}},
          fontName="Arial",
          textString="pm",
          lineColor={28,108,200}),
        Text(
          origin={-80,90},
          fillPattern=FillPattern.Solid,
          extent={{-10,-10},{10,10}},
          fontName="Arial",
          textString="vf0",
          lineColor={28,108,200}),
        Text(
          origin={-80.6294,-89.5811},
          fillPattern=FillPattern.Solid,
          extent={{-15.3706,-13.4189},{15.3706,13.4189}},
          fontName="Arial",
          textString="pm0",
          lineColor={28,108,200}),
        Text(
          origin={80.5,60.6367},
          fillPattern=FillPattern.Solid,
          extent={{-23.5,-8.6367},{23.5,8.6367}},
          fontName="Arial",
          lineColor={28,108,200},
          textString="delta"),
        Text(
          origin={90,90.5},
          fillPattern=FillPattern.Solid,
          extent={{-10,-10.5},{10,10.5}},
          textString="w",
          fontName="Arial",
          lineColor={28,108,200}),
        Text(
          origin={90,30},
          fillPattern=FillPattern.Solid,
          extent={{-10,-10},{10,10}},
          textString="v",
          fontName="Arial",
          lineColor={28,108,200}),
        Rectangle(
          fillColor={255,255,255},
          extent={{-100,-100},{100,100}},
          lineColor={28,108,200}),
        Ellipse(extent={{-40,40},{40,-40}}, lineColor={28,108,200}),
        Line(
          points={{-20,0},{-9,15},{9,-15},{20,0}},
          color={28,108,200},
          smooth=Smooth.Bezier),
        Text(
          origin={4,-58.0978},
          fillPattern=FillPattern.Solid,
          extent={{-57.2101,-15.0},{57.2101,15.0}},
          textString="%name",
          fontName="Arial",
          lineColor={28,108,200}),
        Text(
          origin={90,-31},
          fillPattern=FillPattern.Solid,
          extent={{-10,-10},{10,10}},
          fontName="Arial",
          lineColor={28,108,200},
          textString="P"),
        Text(
          origin={90,-60},
          fillPattern=FillPattern.Solid,
          extent={{-10,-10},{10,10}},
          fontName="Arial",
          lineColor={28,108,200},
          textString="Q")}),
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={1,1})),
    Documentation(info="<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
end baseMachine;
