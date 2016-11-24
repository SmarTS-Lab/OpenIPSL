within OpenIPSL.Electrical.Banks;


model CSVGN1 "STATC SHUNT COMPENSATOR MODEL"
  constant Real pi=Modelica.Constants.pi;
  parameter Real K;
  parameter Real T1;
  parameter Real T2;
  parameter Real T3;
  parameter Real T4;
  parameter Real T5;
  parameter Real RMIN=0 "Reactor minmum MVAr ouput";
  parameter Real VMAX;
  parameter Real VMIN;
  parameter Real CBASE=100 "Capacitor MVAr output";
  parameter Real MBASE=100 "MVAr range of SVC";
  parameter Real SBASE=100;
  parameter Real ra=0 "amature resistance";
  parameter Real x1d=1 "d-axis transient reactance, p.u., should be set to 9999";
  parameter Real v0 "init. voltage at terminal bus";
  parameter Real anglev0 "init voltage angle in degree";
  parameter Real Vc0 "init. voltage at controlled bus";
  parameter Real Psh "Active power MW";
  parameter Real Qsh "Reactive power Mvar";
  Real v(start=v0) "Bus voltage magnitude";
  Real anglev(start=anglev_rad) " Bus voltage angle";
  //Real pe "electric power";
  Real P;
  Real Q;
  Real vd(start=vd0) "voltage direct axis";
  Real vq(start=vq0) "voltage quadrature axis";
  Real id(start=id0) "current direct axis";
  Real iq(start=iq0) "current quadrature axis";
  Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(extent={{36,8},{44,16}})));
  Modelica.Blocks.Math.Add add(k2=-1) annotation (Placement(transformation(extent={{62,10},{72,20}})));
  Modelica.Blocks.Interfaces.RealOutput Y(start=Y0) annotation (Placement(transformation(extent={{86,6},{104,24}}), iconTransformation(extent={{86,6},{104,24}})));
  Modelica.Blocks.Interfaces.RealInput V
    annotation (Placement(transformation(extent={{-118,-18},{-92,8}}), iconTransformation(
        extent={{-13,-13},{13,13}},
        rotation=180,
        origin={39,29})));
  Modelica.Blocks.Math.Add add1(k1=-1) annotation (Placement(transformation(extent={{-76,-8},{-62,6}})));
  Modelica.Blocks.Sources.Constant const(k=MBASE/SBASE) annotation (Placement(transformation(extent={{6,54},{16,64}})));
  Modelica.Blocks.Sources.Constant const1(k=CBASE/SBASE) annotation (Placement(transformation(extent={{34,54},{44,64}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLagLim ImSimpleLagnonwinduplimit(
    outMin=VMIN,
    outMax=VMAX,
    T=T3,
    K=K,
    y_start=k30) annotation (Placement(transformation(extent={{-42,-12},{-22,8}})));
  Modelica.Blocks.Sources.Constant const2(k=Vref) annotation (Placement(transformation(extent={{-112,14},{-98,28}})));
  Modelica.Blocks.Nonlinear.Limiter imLimited(uMin=0, uMax=1) annotation (Placement(transformation(extent={{-2,-12},{18,8}})));
  OpenIPSL.Connectors.PwPin p(
    vr(start=vr0),
    vi(start=vi0),
    ir(start=ir0),
    ii(start=ii0)) annotation (Placement(transformation(extent={{108,6},{128,26}}), iconTransformation(extent={{-10,42},{10,62}})));
protected
  parameter Real p0=Psh/SBASE "Active power p.u. on system base";
  parameter Real q0=Qsh/SBASE "Reactive power p.u. on system base";
  parameter Real anglev_rad=anglev0*pi/180;
  parameter Real Y0=q0/(v0*v0) "Capacitor output";
  parameter Real vr0=v0*cos(anglev_rad) "Initialitation";
  parameter Real vi0=v0*sin(anglev_rad) "Initialitation";
  parameter Real ir0=(p0*vr0 + q0*vi0)/(vr0^2 + vi0^2) "Initialitation";
  parameter Real ii0=(p0*vi0 - q0*vr0)/(vr0^2 + vi0^2) "Initialitation";
  parameter Real delta0=atan2(vi0 + ra*ii0 + x1d*ir0, vr0 + ra*ir0 - x1d*ii0) "Initialitation";
  parameter Real vd0=vr0*cos(pi/2 - delta0) - vi0*sin(pi/2 - delta0) "Initialitation";
  parameter Real vq0=vr0*sin(pi/2 - delta0) + vi0*cos(pi/2 - delta0) "Initialitation";
  parameter Real id0=ir0*cos(pi/2 - delta0) - ii0*sin(pi/2 - delta0) "Initialitation";
  parameter Real iq0=ir0*sin(pi/2 - delta0) + ii0*cos(pi/2 - delta0) "Initialitation";
  parameter Real k50(fixed=false);
  parameter Real k30(fixed=false);
  parameter Real k0(fixed=false);
  parameter Real Vref(fixed=false);
initial equation
  k50 = (CBASE/SBASE - Y0)/(MBASE/SBASE);
  k30 = k50;
  k0 = k30/K;
  Vref = V - k0;
equation
  v = sqrt(p.vr^2 + p.vi^2);
  anglev = atan2(p.vi, p.vr);
  [p.ir; p.ii] = -[sin(delta0), cos(delta0); -cos(delta0), sin(delta0)]*[id; iq];
  [p.vr; p.vi] = [sin(delta0), cos(delta0); -cos(delta0), sin(delta0)]*[vd; vq];
  vq = id/Y;
  vd = -iq/Y;
  -P = p.vr*p.ir + p.vi*p.ii;
  -Q = p.vi*p.ir - p.vr*p.ii;
  connect(const1.y, add.u1) annotation (Line(
      points={{44.5,59},{61,59},{61,18}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add.y, Y) annotation (Line(
      points={{72.5,15},{95,15}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(product1.y, add.u2) annotation (Line(
      points={{44.4,12},{61,12}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(V, add1.u2) annotation (Line(
      points={{-105,-5},{-93.5,-5},{-93.5,-5.2},{-77.4,-5.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const2.y, add1.u1) annotation (Line(
      points={{-97.3,21},{-82,21},{-82,3.2},{-77.4,3.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, product1.u1) annotation (Line(
      points={{16.5,59},{24,59},{24,14.4},{35.2,14.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add1.y, ImSimpleLagnonwinduplimit.u) annotation (Line(points={{-61.3,-1},{-52.65,-1},{-52.65,-2},{-44,-2}}, color={0,0,127}));
  connect(ImSimpleLagnonwinduplimit.y, imLimited.u) annotation (Line(points={{-21,-2},{-4,-2},{-4,-2}}, color={0,0,127}));
  connect(imLimited.y, product1.u2) annotation (Line(points={{19,-2},{24,-2},{24,9.6},{35.2,9.6}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Text(
          extent={{-144,92},{-108,84}},
          lineColor={0,0,255},
          textString="Simplified one")}),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-60,42},{52,-68}}, lineColor={0,0,255}),Text(
          extent={{-46,20},{40,-26}},
          lineColor={0,0,255},
          textString="CSVGN1")}),
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
end CSVGN1;
