within OpenIPSL.Electrical.Loads.PSSE.BaseClasses;
partial model baseLoad
  import Modelica.Constants.pi;
  import Modelica.ComplexMath.j;
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  parameter Complex S_p=P_0 + j*Q_0
    "Consumption of original constant power load (MVA)";
  parameter Complex S_i=0 + j*0
    "Consumption of original constant current load (MVA)";
  parameter Complex S_y=0 + j*0
    "Consumption of original constant shunt admittance load (MVA)";
  parameter Complex a=1 + j*0
    "Load transfer fraction for constant current load";
  parameter Complex b=0 + j*1
    "Load transfer fraction for constant shunt admittance load";
  parameter Real PQBRAK=0.7 "Constant power characteristic threshold";
  parameter Integer characteristic=1 annotation (choices(choice=1, choice=2));
  OpenIPSL.Interfaces.PwPin p(
    vr(start=vr0),
    vi(start=vi0),
    ir(start=ir0),
    ii(start=ii0))
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));
  Modelica.SIunits.Angle angle(start=anglev_rad) "Bus voltage angle";
  Real v(start=V_0) "Bus voltage magnitude (pu)";
  Real P "Active power consumption (pu)";
  Real Q "Reactive power consumption (pu)";
protected
  parameter Modelica.SIunits.Angle anglev_rad=angle_0*pi/180;
  parameter Real p0=(S_i.re*V_0 + S_y.re*V_0^2 + S_p.re)/S_b "pu";
  parameter Real q0=(S_i.im*V_0 + S_y.im*V_0^2 + S_p.im)/S_b "pu";
  parameter Real vr0=V_0*cos(anglev_rad) "Initialitation";
  parameter Real vi0=V_0*sin(anglev_rad) "Initialitation";
  parameter Real ir0=(p0*vr0 + q0*vi0)/(vr0^2 + vi0^2) "Initialitation";
  parameter Real ii0=(p0*vi0 - q0*vr0)/(vr0^2 + vi0^2) "Initialitation";
  parameter Complex S_P=Complex((1 - a.re - b.re)*S_p.re, (1 - a.im - b.im)*S_p.im)
      /S_b "pu";
  parameter Complex S_I=(S_i + Complex(a.re*S_p.re/V_0, a.im*S_p.im/V_0))/S_b
    "pu";
  parameter Complex S_Y=(S_y + Complex(b.re*S_p.re/V_0^2, b.im*S_p.im/V_0^2))/
      S_b "pu";
  //Constant current load vary function when voltage is below 0.5
  parameter Real a2=1.502;
  parameter Real b2=1.769;
  //Constant Power load vary function when voltage is below 0.5
  parameter Real a0=0.4881;
  parameter Real a1=-0.4999;
  parameter Real b1=0.1389;
  parameter Real wp=3.964;
protected
  Real kP(start=1);
  Real kI(start=1);
equation
  P = p.vr*p.ir + p.vi*p.ii;
  Q = (-p.vr*p.ii) + p.vi*p.ir;
  angle = atan2(p.vi, p.vr);
  v = sqrt(p.vr^2 + p.vi^2);
  //Voltage dependancy characteristic
  if characteristic == 1 then
    if v < PQBRAK/2 and v > 0 then
      kP = 2*(v/PQBRAK)^2;
      kI = 1;
    elseif v > PQBRAK/2 and v < PQBRAK then
      kP = 1 - 2*((v - PQBRAK)/PQBRAK)^2;
      kI = 1;
    else
      kP = 1;
      kI = 1;
    end if;
  else
    if v < PQBRAK then
      kP = a0 + a1*cos(v*wp) + b1*sin(v*wp);
    else
      kP = 1;
    end if;
    if v < 0.5 then
      kI = a2*b2*v^(b2 - 1)*exp(-a2*v^b2);
    else
      kI = 1;
    end if;
  end if;
  annotation (Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        initialScale=0.1), graphics={Line(points={{-100,100},{100,100},{0,-100},
          {-100,100}}, color={28,108,200}),Text(
          extent={{-60,80},{60,40}},
          lineColor={28,108,200},
          textString="%P_0+j%Q_0"),Text(
          extent={{-150,-110},{150,-150}},
          lineColor={0,0,255},
          textString="%name")}), Documentation);
end baseLoad;
