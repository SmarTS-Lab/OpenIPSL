within OpenIPSL.Electrical.Wind.PSAT.PSAT_Type_3;
model ElecBlk
  import Modelica.Constants.pi;
  Modelica.Blocks.Interfaces.RealInput omega_m "Rotor Speed" annotation (
      Placement(
      transformation(
        extent={{-102.0,54.0},{-62.0,94.0}},
        origin={-46.1127,-159.0},
        rotation=0),
      visible=true,
      iconTransformation(
        origin={2.0,-144.0},
        extent={{-102.0,54.0},{-62.0,94.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput idr(start=idr0, fixed=false) "idr"
    annotation (Placement(
      transformation(
        extent={{-102.0,54.0},{-62.0,94.0}},
        origin={-45.2181,9.0065},
        rotation=0),
      visible=true,
      iconTransformation(
        origin={2.0,-6.3878},
        extent={{-102.0,54.0},{-62.0,94.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput iqr(start=iqr0, fixed=false) "iqr"
    annotation (Placement(
      transformation(
        extent={{-102.0,54.0},{-62.0,94.0}},
        origin={-44.5564,-24.0},
        rotation=0),
      visible=true,
      iconTransformation(
        origin={2.0,-74.0},
        extent={{-102.0,54.0},{-62.0,94.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput Tel "Electrical Torque" annotation (
      Placement(
      transformation(
        extent={{102.0,54.0},{62.0,94.0}},
        origin={44.9293,3.7214},
        rotation=0),
      visible=true,
      iconTransformation(
        origin={-2.0,-24.0},
        extent={{102.0,54.0},{62.0,94.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput Vbus "Bus Voltage Magnitude"
    annotation (Placement(
      transformation(
        extent={{102.0,54.0},{62.0,94.0}},
        origin={46.3073,-49.0},
        rotation=0),
      visible=true,
      iconTransformation(
        origin={-2.0,-124.0},
        extent={{102.0,54.0},{62.0,94.0}},
        rotation=0)));
  parameter Real Sbase=100 "Power Rating [Normalization Factor] (MVA)";
  parameter Real Vbus0=1 "p.u. Input PowerFlow";
  parameter Real angle0=-0.00243 "Angle PowerFlow";
  parameter Real Pc=0.0160000000000082 "Active Power (pu), PowerFlow";
  parameter Real Qc=0.030527374471207 "Reactive Power(pu), Power Flow";
  parameter Real omega_m0=0.58;
  parameter Real Pnom=10 "Nominal Power (MVA)";
  parameter Real Vbase=400 "Voltage rating kV";
  parameter Real freq=50 "frequency rating (Hz)";
  parameter Real Rs=0.1 "stator Resistance (pu)";
  parameter Real Xs=1 "stator Reactance (pu)";
  parameter Real Rr=0.1 "Rotor Resitance (pu)";
  parameter Real Xr=0.8 "rotor Reactance (pu)";
  parameter Real Xm=30 "magnetisation reactance (pu)";
  parameter Real Hm=0.3 "inertia (pu)";
  parameter Real x1=Xm + Xs "stator plus magnetisation impedances";
  parameter Real i2Hm=1.667 "inverse p.u.inertia";
  parameter Real wbase=2*pi*freq/poles "p.u. basis for angular speed";
  parameter Real k=x1*Pnom/Vbus0/Xm/Sbase "gain for iqr_off computation";
  parameter Real ids0=((-vds0^2) + vds0*Xm*iqr0 - x1*Qc)/(Rs*vds0 - x1*vqs0);
  parameter Real iqs0=((-vds0*vqs0) + vqs0*Xm*iqr0 - Rs*Qc)/(Rs*vds0 - x1*vqs0);
  parameter Real idr0=-(vqs0 + Rs*iqs0 + x1*ids0)/Xm;
  parameter Real iqr0=-x1*Pnom*(2*omega_m0 - 1)/Vbus0/Xm/Sbase/omega_m0;
  parameter Real vds0=-Vbus0*sin(angle0);
  parameter Real vqs0=Vbus0*cos(angle0);
  parameter Real vdr0=(-Rr*idr0) + (1 - omega_m0)*((Xm + Xr)*iqr0 + Xm*iqs0);
  parameter Real vqr0=(-Rr*iqr0) - (1 - omega_m0)*((Xm + Xr)*idr0 + Xm*ids0);
  parameter Real poles=2 "Number of poles-pair";
  Real vds(start=vds0, fixed=false) "stator tension, in dq";
  Real vqs(start=vqs0, fixed=false) "stator tension, in dq";
  Real p "Active power";
  Real q "Reactive Power";
  Real ids(start=ids0, fixed=false) "stator current, in dq";
  Real iqs(start=iqs0, fixed=false) "stator current, in dq";
  Real vdr(start=vdr0, fixed=false) "rotor voltage in dq";
  Real vqr(start=vqr0, fixed=false) "rotor voltage in dq";
  OpenIPSL.Interfaces.PwPin pin annotation (Placement(
      visible=true,
      transformation(
        origin={-158.3073,1.6927},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0),
      iconTransformation(
        origin={0.0,-110.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Real slip;
  Real Anglebus=atan(pin.vi/pin.vr);
equation
  Vbus = sqrt(vds^2 + vqs^2);
  vqs = pin.vr;
  vds = -pin.vi;
  -p = pin.vr*pin.ir + pin.vi*pin.ii;
  -q = pin.vi*pin.ir - pin.vr*pin.ii;
  p = vds*ids + vqs*iqs + vdr*idr + vqr*iqr;
  q = (-Xm*Vbus*idr/x1) - Vbus^2/Xm;
  vds = (-Rs*ids) + x1*iqs + Xm*iqr;
  vqs = (-Rs*iqs) - x1*ids - Xm*idr;
  slip = 1 - omega_m;
  vdr = (-Rr*idr) + slip*(x1*iqr + Xm*iqs);
  vqr = (-Rr*iqr) - slip*(x1*idr + Xm*ids);
  Tel = Xm*(iqr*ids - idr*iqs);
  annotation (
    Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={10,10}), graphics={Rectangle(
          visible=true,
          fillColor={255,255,255},
          extent={{-100.0,-100.0},{100.0,100.0}}),Text(
          visible=true,
          origin={1.7639,5.0},
          fillPattern=FillPattern.Solid,
          extent={{-44.3912,-45.0},{44.3912,45.0}},
          textString="elec",
          fontName="Arial")}),
    Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={5,5})),
    Documentation);
end ElecBlk;
