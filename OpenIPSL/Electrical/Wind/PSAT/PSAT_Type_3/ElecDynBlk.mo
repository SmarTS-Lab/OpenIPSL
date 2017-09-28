within OpenIPSL.Electrical.Wind.PSAT.PSAT_Type_3;
model ElecDynBlk
  Modelica.Blocks.Interfaces.RealInput omega_m "Rotor Speed" annotation (
      Placement(
      transformation(
        extent={{-102.0,54.0},{-62.0,94.0}},
        origin={-45.2439,-151.0508},
        rotation=0),
      visible=true,
      iconTransformation(
        origin={2.0,-124.0},
        extent={{-102.0,54.0},{-62.0,94.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput Vbus "Vbus" annotation (Placement(
      transformation(
        extent={{-102.0,54.0},{-62.0,94.0}},
        origin={-45.2049,-85.6189},
        rotation=0),
      visible=true,
      iconTransformation(
        origin={2.0,-24.0},
        extent={{-102.0,54.0},{-62.0,94.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput idr(start=idr0, fixed=false)
    "saturated idr" annotation (Placement(
      transformation(
        extent={{102.0,54.0},{62.0,94.0}},
        origin={43.0,-29.0},
        rotation=0),
      visible=true,
      iconTransformation(
        origin={-2.0,-24.0},
        extent={{102.0,54.0},{62.0,94.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput iqr(start=iqr0, fixed=false)
    "saturated iqr" annotation (Placement(
      transformation(
        extent={{102.0,54.0},{62.0,94.0}},
        origin={43.0,-94.0},
        rotation=0),
      visible=true,
      iconTransformation(
        origin={-2.0,-124.0},
        extent={{102.0,54.0},{62.0,94.0}},
        rotation=0)));
  constant Real pi=3.14159265358979;
  parameter Real Sbase=100 "Power Rating [Normalization Factor] (MVA)";
  parameter Real Vbus0=1 "p.u. Input PowerFlow";
  parameter Real angle0=-0.00243 "Angle PowerFlow";
  parameter Real Pc=0.0160000000000082 "Active Power (pu), PowerFlow";
  parameter Real Qc=0.030527374471207 "Reactive Power(pu), Power Flow";
  parameter Real omega_m0=min(max(0.5*Pc*Sbase/Pnom + 0.5, 0.5), 1);
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
  parameter Real x2=Xm + Xr "rotor plus magnetisation impedances";
  parameter Real i2Hm=1.667 "inverse p.u.inertia";
  parameter Real wbase=2*pi*freq/poles "p.u. basis for angular speed";
  parameter Real iqr_max;
  parameter Real idr_max;
  parameter Real iqr_min;
  parameter Real idr_min;
  parameter Real poles=2 "Number of poles-pair";
  parameter Real Kv=10 "Voltage control gain (kV)";
  parameter Real Te=0.01 "Power Control time constant (s)";
  parameter Real k=x1*Pnom/Vbus0/Xm/Sbase "gain for iqr_off computation";
  parameter Real ids0=((-vds0^2) + vds0*Xm*iqr0 - x1*Qc)/(Rs*vds0 - x1*vqs0);
  parameter Real iqs0=((-vds0*vqs0) + vqs0*Xm*iqr0 - Rs*Qc)/(Rs*vds0 - x1*vqs0);
  parameter Real idr0=-(vqs0 + Rs*iqs0 + x1*ids0)/Xm;
  parameter Real iqr0=-x1*Pnom*(2*omega_m0 - 1)/Vbus0/Xm/Sbase/omega_m0;
  parameter Real vds0=-Vbus0*sin(angle0);
  parameter Real vqs0=Vbus0*cos(angle0);
  parameter Real vdr0=(-Rr*idr0) + (1 - omega_m0)*(x2*iqr0 + Xm*iqs0);
  parameter Real vqr0=(-Rr*iqr0) - (1 - omega_m0)*(x2*idr0 + Xm*ids0);
  Real idrI "internal, non saturated idr";
  Real iqrI "internal, non saturated iqr";
  Real Vref;
  Real iqr_off;
  Real pwa;
initial equation
  0 = ((-(Xs + Xm)*pwa/Vbus/Xm/omega_m) - iqr - iqr_off)/Te;
  Vref = Vbus0 - (idrI + Vbus0/Xm)/Kv;
  iqr_off = (-k*max(min(2*omega_m0 - 1, 1), 0)/omega_m0) - iqrI;
equation
  der(Vref) = 0;
  der(iqr_off) = 0;
  pwa = max(min(2*omega_m - 1, 1), 0)*Pnom/Sbase;
  der(iqrI) = ((-(Xs + Xm)*pwa/Vbus/Xm/omega_m) - iqr - iqr_off)/Te;
  der(idrI) = Kv*(Vbus - Vref) - Vbus/Xm - idr;
  iqr = min(max(iqrI, iqr_min), iqr_max);
  idr = min(max(idrI, idr_min), idr_max);
  when iqrI > iqr_max and der(iqrI) < 0 then
    reinit(iqrI, iqr_max);
  elsewhen iqrI < iqr_min and der(iqrI) > 0 then
    reinit(iqrI, iqr_min);
  end when;
  when idrI > idr_max and der(idrI) < 0 then
    reinit(idrI, idr_max);
  elsewhen idrI < idr_min and der(idrI) > 0 then
    reinit(idrI, idr_min);
  end when;
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
          origin={0.294,8.6655},
          fillPattern=FillPattern.Solid,
          extent={{-47.919,-38.6655},{47.919,38.6655}},
          textString="elecDyn",
          fontName="Arial")}),
    Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={5,5})),
    Documentation);
end ElecDynBlk;
