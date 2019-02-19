within OpenIPSL.Electrical.Banks.PSSE;
model CSVGN1 "STATC SHUNT COMPENSATOR MODEL"
  parameter Real K;
  parameter SI.Time T1;
  parameter SI.Time T2;
  parameter SI.Time T3;
  parameter SI.Time T4;
  parameter SI.Time T5;
  parameter SI.ReactivePower RMIN(displayUnit="Mvar")=0 "Reactor minmum var output";
  parameter SI.PerUnit VMAX;
  parameter SI.PerUnit VMIN;
  parameter SI.ReactivePower CBASE(displayUnit="Mvar")=100e6 "Capacitor output";
  parameter SI.ApparentPower MBASE(displayUnit="MVA")=100e6 "Power range of SVC";
  parameter SI.ApparentPower SBASE(displayUnit="MVA")=100e6;
  parameter SI.PerUnit ra=0 "amature resistance";
  parameter SI.PerUnit x1d=1
    "d-axis transient reactance, pu, should be set to 9999";
  parameter SI.PerUnit v0 "init. voltage at terminal bus";
  parameter SI.Conversions.NonSIunits.Angle_deg anglev0 "init voltage angle";
  parameter SI.PerUnit Vc0 "init. voltage at controlled bus";
  parameter SI.ActivePower Psh(displayUnit="MW") "Active power";
  parameter SI.ReactivePower Qsh(displayUnit="Mvar") "Reactive power";
  SI.PerUnit v(start=v0) "Bus voltage magnitude";
  Real anglev(start=anglev_rad) " Bus voltage angle";
  //Real pe "electric power";
  SI.PerUnit P;
  SI.PerUnit Q;
  SI.PerUnit vd(start=vd0) "voltage direct axis";
  SI.PerUnit vq(start=vq0) "voltage quadrature axis";
  SI.PerUnit id(start=id0) "current direct axis";
  SI.PerUnit iq(start=iq0) "current quadrature axis";
  Modelica.Blocks.Math.Product product1
    annotation (Placement(transformation(extent={{36,-10},{56,10}})));
  Modelica.Blocks.Math.Add add(k2=-1)
    annotation (Placement(transformation(extent={{70,-10},{90,10}})));
  Modelica.Blocks.Interfaces.RealOutput Y(start=Y0)
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput V
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Math.Add add1(k1=-1)
    annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  Modelica.Blocks.Sources.Constant const(k=MBASE/SBASE)
    annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
  Modelica.Blocks.Sources.Constant const1(k=CBASE/SBASE)
    annotation (Placement(transformation(extent={{30,30},{50,50}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLagLim ImSimpleLagnonwinduplimit(
    outMin=VMIN,
    outMax=VMAX,
    T=T3,
    K=K,
    y_start=k30)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Blocks.Sources.Constant const2(k=Vref)
    annotation (Placement(transformation(extent={{-100,10},{-80,30}})));
  Modelica.Blocks.Nonlinear.Limiter imLimited(uMin=0, uMax=1)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  OpenIPSL.Interfaces.PwPin p(
    vr(start=vr0),
    vi(start=vi0),
    ir(start=ir0),
    ii(start=ii0))
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));
protected
  parameter Real p0=Psh/SBASE "Active power pu on system base";
  parameter Real q0=Qsh/SBASE "Reactive power pu on system base";
  parameter Real anglev_rad=SI.Conversions.from_deg(anglev0);
  parameter Real Y0=q0/(v0*v0) "Capacitor output";
  parameter Real vr0=v0*cos(anglev_rad) "Initialitation";
  parameter Real vi0=v0*sin(anglev_rad) "Initialitation";
  parameter Real ir0=(p0*vr0 + q0*vi0)/(vr0^2 + vi0^2) "Initialitation";
  parameter Real ii0=(p0*vi0 - q0*vr0)/(vr0^2 + vi0^2) "Initialitation";
  parameter Real delta0=atan2(vi0 + ra*ii0 + x1d*ir0, vr0 + ra*ir0 - x1d*ii0)
    "Initialitation";
  parameter Real vd0=vr0*cos(C.pi/2 - delta0) - vi0*sin(C.pi/2 - delta0)
    "Initialitation";
  parameter Real vq0=vr0*sin(C.pi/2 - delta0) + vi0*cos(C.pi/2 - delta0)
    "Initialitation";
  parameter Real id0=ir0*cos(C.pi/2 - delta0) - ii0*sin(C.pi/2 - delta0)
    "Initialitation";
  parameter Real iq0=ir0*sin(C.pi/2 - delta0) + ii0*cos(C.pi/2 - delta0)
    "Initialitation";
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
      points={{51,40},{60,40},{60,6},{68,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add.y, Y) annotation (Line(
      points={{91,0},{110,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(product1.y, add.u2) annotation (Line(
      points={{57,0},{60,0},{60,-6},{68,-6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(V, add1.u2) annotation (Line(
      points={{-120,0},{-90,0},{-90,-6},{-72,-6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, product1.u1) annotation (Line(
      points={{-19,40},{0,40},{0,28},{20,28},{20,6},{34,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add1.y, ImSimpleLagnonwinduplimit.u)
    annotation (Line(points={{-49,0},{-49,0},{-42,0}}, color={0,0,127}));
  connect(ImSimpleLagnonwinduplimit.y, imLimited.u)
    annotation (Line(points={{-19,0},{-12,0}}, color={0,0,127}));
  connect(imLimited.y, product1.u2)
    annotation (Line(points={{11,0},{24,0},{24,-6},{34,-6}}, color={0,0,127}));
  connect(const2.y, add1.u1) annotation (Line(points={{-79,20},{-76,20},{-76,6},
          {-72,6}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(extent={{-100,100},{100,-100}},
          lineColor={0,0,255}),Text(
          extent={{-46,20},{40,-26}},
          lineColor={0,0,255},
          textString="CSVGN1"),Text(
          extent={{-100,-100},{100,-140}},
          lineColor={0,0,255},
          textString="%name")}),
    Documentation);
end CSVGN1;
