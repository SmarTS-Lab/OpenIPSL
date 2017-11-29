within OpenIPSL.Electrical.Wind.PSAT.PSAT_Type_3;
model PSAT_WT "Wind Turbine Doubly Fed Induction Generator"
  import Modelica.Constants.pi;
  ElecDynBlk elecDyn(
    Sbase=S_b,
    Vbus0=V_0,
    angle0=angle_0,
    Pc=P_0,
    Qc=Q_0,
    omega_m0=omega_m0,
    Pnom=Pnom,
    Vbase=V_b,
    freq=fn,
    Rs=Rs,
    Xs=Xs,
    Rr=Rr,
    Xr=Xr,
    Xm=Xm,
    Hm=Hm,
    x1=x1,
    x2=x2,
    i2Hm=i2Hm,
    wbase=wbase,
    k=k,
    poles=poles,
    ids0=ids0,
    iqs0=iqs0,
    idr0=idr0,
    iqr0=iqr0,
    vds0=vds0,
    vqs0=vqs0,
    vdr0=vdr0,
    vqr0=vqr0,
    Kv=Kv,
    Te=Te,
    idr_max=idr_max,
    idr_min=idr_min,
    iqr_max=iqr_max,
    iqr_min=iqr_min) annotation (Placement(visible=true, transformation(
        origin={-46.9875,-45.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  ElecBlk elecCircuit(
    Sbase=S_b,
    Vbus0=V_0,
    angle0=angle_0,
    Pc=P_0,
    Qc=Q_0,
    omega_m0=omega_m0,
    Pnom=Pnom,
    Vbase=V_b,
    freq=fn,
    Rs=Rs,
    Xs=Xs,
    Rr=Rr,
    Xr=Xr,
    Xm=Xm,
    Hm=Hm,
    x1=x1,
    i2Hm=i2Hm,
    wbase=wbase,
    k=k,
    poles=poles,
    ids0=ids0,
    iqs0=iqs0,
    idr0=idr0,
    iqr0=iqr0,
    vds0=vds0,
    vqs0=vqs0,
    vdr0=vdr0,
    vqr0=vqr0) annotation (Placement(visible=true, transformation(
        origin={43.0125,-50.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  WindBlk windBlk1(
    vw_base=vw_base,
    rho=rho,
    Sbase=S_b,
    ngb=ngb,
    poles=poles,
    freq=fn,
    wbase=wbase,
    l=l) annotation (Placement(visible=true, transformation(
        origin={15.4451,-15.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  MechaBlk mechaBlk1(
    Sbase=S_b,
    Pnom=Pnom,
    Hm=Hm,
    Pc=P_0) annotation (Placement(visible=true, transformation(
        origin={70.3869,-20.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  PitchControl pitchControl1(
    Kp=Kp,
    Tp=Tp,
    theta_p0=theta_p0,
    theta_p_max=theta_max,
    theta_p_min=theta_min) annotation (Placement(visible=true, transformation(
        origin={-46.9875,-15.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput Wind_Speed annotation (Placement(
      visible=true,
      transformation(
        origin={-111.9875,-2.3928},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0),
      iconTransformation(
        origin={0.0,77.9903},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=-90)));
  OpenIPSL.Interfaces.PwPin pin annotation (Placement(
      visible=true,
      transformation(
        origin={-101.9875,-70.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0),
      iconTransformation(
        origin={-110.0,0.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  parameter Real V_0=1 "Voltage magnitude (pu)"
    annotation (Dialog(group="Power flow data"));
  parameter Real angle_0=-0.00243 "Voltage angle (deg.)"
    annotation (Dialog(group="Power flow data"));
  parameter Real P_0=0.0160000000000082 "Active power (pu)"
    annotation (Dialog(group="Power flow data"));
  parameter Real Q_0=0.030527374471207 "Reactive power (pu)"
    annotation (Dialog(group="Power flow data"));
  parameter Real S_b=100 "System base power(MVA)"
    annotation (Dialog(group="Power flow data"));
  parameter Real V_b=400 "Voltage rating kV"
    annotation (Dialog(group="Power flow data"));
  parameter Real Pnom=10 "Nominal Power (MVA)";
  parameter Real fn=50 "Frequency rating (Hz)";
  parameter Real rho=1.225 "Air Density (kg/m^3)";
  parameter Real vw_base=15 "Nominal wind speed (m/s)";
  parameter Real Rs_machine=0.01 "Stator Resistance (pu)";
  parameter Real Xs_machine=0.1 "Stator Reactance (pu)";
  parameter Real Rr_machine=0.01 "Rotor Resitance (pu)";
  parameter Real Xr_machine=0.08 "Rotor Reactance (pu)";
  parameter Real Xm_machine=3 "Magnetisation reactance (pu)";
  parameter Real Hm_machine=3 "Inertia (pu)";
  parameter Real Kp=10 "Pitch control gain (pu)";
  parameter Real Tp=3 "Pitch control time constant (s)";
  parameter Real Kv=10 "Voltage control gain (kV)";
  parameter Real Te=0.01 "Power Control time constant (s)";
  parameter Real l=75 "Blade length (m)";
  parameter Real poles=2 "Number of poles-pair";
  parameter Real nblades=3 "Number of blades";
  parameter Real ngb=0.01123596 "Gear box ratio";
  Real Vbus=elecCircuit.Vbus "Bus voltage magnitude (pu)";
  Real Anglebus=elecCircuit.Anglebus "Bus voltage angle (deg)";
  Real P=elecCircuit.p "Active power (pu)";
  Real Q=elecCircuit.q "Reactive power (pu)";
protected
  parameter Real Rs=Rs_machine*S_b/Pnom "stator Resistance (pu)";
  parameter Real Xs=Xs_machine*S_b/Pnom "stator Reactance (pu)";
  parameter Real Rr=Rr_machine*S_b/Pnom "Rotor Resitance (pu)";
  parameter Real Xr=Xr_machine*S_b/Pnom "rotor Reactance (pu)";
  parameter Real Xm=Xm_machine*S_b/Pnom "magnetisation reactance (pu)";
  parameter Real Hm=Hm_machine*Pnom/S_b "inertia (pu)";
  parameter Real Pmax_machine=1 "Pmax (pu)";
  parameter Real Pmin_machine=0 "Pmin (pu)";
  parameter Real Qmax_machine=0.7 "Qmax (pu)";
  parameter Real Qmin_machine=-0.7 "Qmin (pu)";
  parameter Real Pmax=Pmax_machine*Pnom/S_b "Pmax (pu)";
  parameter Real Pmin=Pmin_machine*Pnom/S_b "Pmin (pu)";
  parameter Real Qmax=Qmax_machine*Pnom/S_b "Qmax (pu)";
  parameter Real Qmin=Qmin_machine*Pnom/S_b "Qmin (pu)";
  parameter Real x1=Xs + Xm;
  parameter Real x2=Xr + Xm;
  parameter Real iqr_max=-x1*Pmin/Xm;
  parameter Real iqr_min=-Pmax*x1/Xm;
  parameter Real idr_min=(-Qmax*x1/Xm) - x1/Xm^2;
  parameter Real idr_max=(-Qmin*x1/Xm) - x1/Xm^2;
  parameter Real theta_max=45;
  parameter Real theta_min=0;
  parameter Real omega_m0=min(max(0.5*P_0*S_b/Pnom + 0.5, 0.5), 1);
  parameter Real i2Hm=1/(2*Hm);
  parameter Real wbase=2*Modelica.Constants.pi*fn/poles;
  parameter Real k=x1*Pnom/V_0/Xm/S_b "gain for iqr_off computation";
  parameter Real theta_p0=0;
  parameter Real ids0=((-vds0^2) + vds0*Xm*iqr0 - x1*Q_0)/(Rs*vds0 - x1*vqs0);
  parameter Real iqs0=((-vds0*vqs0) + vqs0*Xm*iqr0 - Rs*Q_0)/(Rs*vds0 - x1*vqs0);
  parameter Real idr0=-(vqs0 + Rs*iqs0 + x1*ids0)/Xm;
  parameter Real iqr0=-x1*Pnom*(2*omega_m0 - 1)/V_0/Xm/S_b/omega_m0;
  parameter Real vds0=-V_0*sin(angle_0);
  parameter Real vqs0=V_0*cos(angle_0);
  parameter Real vdr0=(-Rr*idr0) + (1 - omega_m0)*(x2*iqr0 + Xm*iqs0);
  parameter Real vqr0=(-Rr*iqr0) - (1 - omega_m0)*(x2*idr0 + Xm*ids0);
equation
  connect(pin, elecCircuit.pin) annotation (Line(
      visible=true,
      origin={-5.4875,-55.7974},
      points={{-96.5,-14.2026},{48.5,-14.2026},{48.5,-5.2026}}));
  connect(mechaBlk1.omega_m, elecDyn.omega_m) annotation (Line(
      visible=true,
      origin={40.3844,-34.0062},
      points={{38.0025,14.0062},{42.6281,14.0062},{42.6281,0.9937},{44.6156,
          0.9937},{37.6281,0.9937},{-100.3844,0.9937},{-100.3844,-15.9937},{-95.3719,
          -15.9938}},
      color={0,0,127}));
  connect(elecDyn.Vbus, elecCircuit.Vbus) annotation (Line(
      visible=true,
      origin={-2.65,-55.6607},
      points={{-52.3375,15.6607},{-59.3375,15.6607},{-59.3375,-16.3215},{58.675,
          -16.3215},{58.675,0.6607},{53.6625,0.6607}},
      color={0,0,127}));
  connect(elecDyn.idr, elecCircuit.idr) annotation (Line(
      visible=true,
      origin={14.0062,-41.6194},
      points={{-52.9937,1.6194},{15.9938,1.6194},{15.9938,-1.61938},{21.0063,-1.61938}},

      color={0,0,127}));

  connect(elecDyn.iqr, elecCircuit.iqr) annotation (Line(
      visible=true,
      origin={-1.9875,-50.0},
      points={{-37.0,0.0},{37.0,0.0}},
      color={0,0,127}));
  connect(mechaBlk1.omega_m, elecCircuit.omega_m) annotation (Line(
      visible=true,
      origin={59.8363,-27.8632},
      points={{18.5506,7.8632},{23.1762,7.8632},{23.1762,-5.2097},{-66.8238,-5.2097},
          {-66.8238,-29.1368},{-24.8238,-29.1368}},
      color={0,0,127}));
  connect(mechaBlk1.Tel, elecCircuit.Tel) annotation (Line(
      visible=true,
      origin={56.3623,-35.0},
      points={{6.0246,10},{-0.3373,10},{-0.3373,-10},{-5.3498,-10}},
      color={0,0,127}));
  connect(pitchControl1.theta_p, windBlk1.theta_p) annotation (Line(
      visible=true,
      origin={-6.6693,-15.1284},
      points={{-32.3182,0.1284},{9.1019,0.1284},{9.1019,-0.12848},{14.1144,-0.12848}},

      color={0,0,127}));

  connect(windBlk1.Tm, mechaBlk1.Tm) annotation (Line(
      visible=true,
      origin={50.1452,-14.8679},
      points={{-26.7001,0.13217},{7.2292,0.13217},{7.2292,-0.1321},{12.2417,-0.1321}},

      color={0,0,127}));

  connect(mechaBlk1.omega_m, windBlk1.omega_m) annotation (Line(
      visible=true,
      origin={42.916,-25.0816},
      points={{35.4709,5.0816},{40.4834,5.0816},{40.4834,-7.9309},{-40.4834,-7.9309},
          {-40.4834,2.84934},{-35.4709,2.84934}},
      color={0,0,127}));
  connect(Wind_Speed, windBlk1.vw) annotation (Line(
      visible=true,
      origin={-24.9193,-5.1166},
      points={{-87.0682,2.7238},{27.3519,2.7238},{27.3519,-2.72393},{32.3644,-2.72393}},

      color={0,0,127}));

  connect(pitchControl1.omega_m, mechaBlk1.omega_m) annotation (Line(
      visible=true,
      origin={25.5125,-22.0292},
      points={{-80.5,7.0292},{-85.5125,7.0292},{-85.5125,-11.0437},{57.5,-11.0437},
          {57.5,2.0292},{52.8744,2.0292}},
      color={0,0,127}));
  annotation (
    Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={10,10}), graphics={Text(
          visible=true,
          fillPattern=FillPattern.Solid,
          extent={{-55.0,-28.0231},{55.0,28.0231}},
          textString="Dfig",
          fontName="Arial"),Ellipse(
          visible=true,
          fillColor={255,255,255},
          extent={{-100.0,-100.0},{100.0,100.0}})}),
    Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={5,5})),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>WT Doubly Fed Induction Generator, PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>July 2015</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Maxime Baudette, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end PSAT_WT;
