within OpenIPSL.Electrical.Controls.PSSE.TG.GGOV1;
model GGOV1 "GE General Governor/Turbine Mode"
  parameter Integer Rselect=1 "Feedback signal for
                    governor droop" annotation (Evaluate=true, choices(
      choice=1 "Electrical power",
      choice=0 "None (isochronous governor)",
      choice=-1 "Governor output (requested stroke)",
      choice=-2 "Fuel valve stroke (true stoke)"));
  parameter Integer Flag=1 "Switch for fuel source
                    characteristic" annotation (Evaluate=true, choices(choice=0
        "Fuel flow independent of speed", choice=1
        "Fuel flow proportional to speed"));
  parameter Real R "Permanent droop (pu)";
  parameter Real T_pelec "Electrical power transducer time constant (s)";
  parameter Real maxerr "Maximum value for speed error signal";
  parameter Real minerr "Minimum value for speed error signal";
  parameter Real Kpgov "Governor proportional gain";
  parameter Real Kigov "Governor integral gain";
  parameter Real Kdgov "Governor derivative gain";
  parameter Real Tdgov "Governor derivative controller time constant (s)";
  parameter Real Vmax "Maximum valve position limit";
  parameter Real Vmin "Minimum valve position limit";
  parameter Real Tact "Actuator time constant (s)";
  parameter Real Kturb "Turbine gain";
  parameter Real Wfnl "No load fuel flow (pu)";
  parameter Real Tb "Turbine lag time constant (s)";
  parameter Real Tc "Turbine lead time constant (s)";
  parameter Real Teng "Transport lag time constant for diesel engine (s)";
  parameter Real Tfload "Load Limiter time constant (s)";
  parameter Real Kpload "Load limiter proportional gain for PI controller";
  parameter Real Kiload "Load limiter integral gain for PI controller";
  parameter Real Ldref "Load limiter reference value (pu)";
  parameter Real Dm "Mechanical damping coefficient (pu)";
  parameter Real Ropen "Maximum valve opening rate (p.u./s)";
  parameter Real Rclose "Maximum valve closing rate (p.u./s)";
  parameter Real Kimw "Power controller (reset) gain";
  parameter Real Aset "Acceleration limiter setpoint (p.u./s)";
  parameter Real Ka "Acceleration limiter gain";
  parameter Real Ta "Acceleration limiter time constant (s)";
  parameter Real Trate "Turbine rating (MW)";
  parameter Real db "Speed governor deadband";
  parameter Real Tsa "Temperature detection lead time constant (s)";
  parameter Real Tsb "Temperature detection lag time constant (s)";
  parameter Real Rup "Maximum rate of load limit increase";
  parameter Real Rdown "Maximum rate of load limit decrease";
  parameter Real DELT "PSSE time step";
  Modelica.Blocks.Math.Gain KPLOAD(k=Kpload)
    annotation (Placement(transformation(extent={{-196,52},{-182,66}})));
  Modelica.Blocks.Math.Gain KPGOV(k=Kpgov)
    annotation (Placement(transformation(extent={{-92,-82},{-76,-66}})));
  Modelica.Blocks.Continuous.Integrator s6(
    k=1,
    y_start=s60,
    initType=Modelica.Blocks.Types.Init.InitialState) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-158,90})));
  Modelica.Blocks.Continuous.Integrator s2(
    k=1,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=s20) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=180,
        origin={-51,-117})));
  Modelica.Blocks.Continuous.Derivative s1(
    k=Kdgov,
    T=Tdgov,
    y_start=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
  Modelica.Blocks.Math.Add3 GovernorPID
    annotation (Placement(transformation(extent={{-60,-88},{-38,-66}})));
  Modelica.Blocks.Math.Add LoadlimiterPI
    annotation (Placement(transformation(extent={{-168,56},{-152,72}})));
  Modelica.Blocks.Nonlinear.DeadZone deadZone(uMax=db, deadZoneAtInit=false)
    annotation (Placement(transformation(extent={{-168,-84},{-148,-64}})));
  Modelica.Blocks.Nonlinear.Limiter limiterSerror(uMax=maxerr, uMin=minerr)
    annotation (Placement(transformation(extent={{-138,-84},{-118,-64}})));
  Modelica.Blocks.Math.Add3 add3_2(k1=-1, k3=-1)
    annotation (Placement(transformation(extent={{-198,-80},{-186,-68}})));
  Modelica.Blocks.Math.Gain Acceleration(k=Ka*DELT)
    annotation (Placement(transformation(extent={{-116,0},{-92,24}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-54,-2},{-36,16}})));
  Modelica.Blocks.Interfaces.RealInput SPEED
    "Machine speed deviation from nominal (pu)" annotation (Placement(
        transformation(extent={{-346,102},{-310,138}}), iconTransformation(
          extent={{-346,102},{-310,138}})));
  Modelica.Blocks.Interfaces.RealInput PELEC "Machine electrical power (pu)"
    annotation (Placement(transformation(extent={{-348,-118},{-310,-80}}),
        iconTransformation(extent={{-348,-118},{-310,-80}})));
  Modelica.Blocks.Continuous.Derivative s8(
    k=1,
    T=Ta,
    y_start=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{-196,-14},{-170,12}})));
  Modelica.Blocks.Math.Add add1(k2=-1)
    annotation (Placement(transformation(extent={{-146,2},{-126,22}})));
  Modelica.Blocks.Sources.Constant AccelerationSet(k=Aset)
    annotation (Placement(transformation(extent={{-180,22},{-164,38}})));
  Modelica.Blocks.Math.Gain r(k=R) "Permanent droop" annotation (Placement(
        transformation(
        extent={{-7,-7},{7,7}},
        rotation=90,
        origin={-207,-101})));
  Modelica.Blocks.Math.Add add2
    annotation (Placement(transformation(extent={{-238,-80},{-226,-68}})));
  Modelica.Blocks.Sources.Constant P_ref(k=Pref)
    annotation (Placement(transformation(extent={{-276,-78},{-260,-62}})));
  Modelica.Blocks.Continuous.LimIntegrator s7(
    k=Kimw,
    outMax=1.1*R,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=s70) "Power controller" annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=90,
        origin={-246,-98})));
  Modelica.Blocks.Sources.Constant Pmw_set(k=Pmwset)
    "Supervisory Load Controller Setpoint,"
    annotation (Placement(transformation(extent={{-276,-148},{-260,-132}})));
  Modelica.Blocks.Math.Add add3(k2=-1) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-246,-122})));
  NonElectrical.Continuous.SimpleLag s0(
    T=T_pelec,
    y_start=s00,
    K=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-270,-170})));
  Modelica.Blocks.Math.Add add6(k1=-1) annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=180,
        origin={-74,118})));
  NonElectrical.Continuous.SimpleLag s5(
    T=Tfload,
    y_start=s50,
    K=1) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-30,110})));
  Modelica.Blocks.Math.Gain gain(k=1/Kturb)
    annotation (Placement(transformation(extent={{-138,124},{-122,140}})));
  Modelica.Blocks.Sources.Constant set(k=Ldref) "load reference"
    annotation (Placement(transformation(extent={{-180,124},{-164,140}})));
  Modelica.Blocks.Nonlinear.Limiter maxLimiter(uMax=1, uMin=-Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{-126,56},{-110,72}})));
  NonElectrical.Continuous.LeadLag s9(
    T1=Tsa,
    T2=Tsb,
    y_start=s90,
    K=1) annotation (Placement(transformation(extent={{20,100},{0,120}})));
  Min_select min_select(nu=3, frs0=fsr0)
    annotation (Placement(transformation(extent={{-18,-28},{-2,-12}})));
  Modelica.Blocks.Math.Product product
    annotation (Placement(transformation(extent={{130,-66},{142,-54}})));
  OpenIPSL.NonElectrical.Continuous.LeadLag s4(
    K=1,
    T1=Tc,
    T2=Tb,
    y_start=s40) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={150,110})));
  Modelica.Blocks.Math.Gain gain1(k=Kturb) annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=90,
        origin={150,60})));
  Modelica.Blocks.Nonlinear.FixedDelay delay(delayTime=Teng)
    "Transport lag time" annotation (Placement(transformation(
        extent={{-14,-14},{14,14}},
        rotation=90,
        origin={150,20})));
  Modelica.Blocks.Math.Add add4(k2=-1) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={150,-24})));
  Modelica.Blocks.Math.Add add5(k1=-1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={176,158})));
  Modelica.Blocks.Sources.Constant set1(k=Wfnl) "full load flow" annotation (
      Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=180,
        origin={196,-38})));
  Modelica.Blocks.Math.Gain gain2(k=Dm) annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=0,
        origin={76,164})));
  flag flag10(flag=Flag) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={128,-152})));
  Dm_select dm_select(Dm=Dm)
    annotation (Placement(transformation(extent={{2,154},{22,174}})));
  Modelica.Blocks.Interfaces.RealOutput PMECH "Turbine mechanical power (pu)"
    annotation (Placement(transformation(extent={{260,-10},{280,10}}),
        iconTransformation(extent={{260,-10},{280,10}})));
  Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={50,110})));
  Modelica.Blocks.Nonlinear.Limiter V(uMax=Vmax, uMin=Vmin)
    annotation (Placement(transformation(extent={{10,-62},{24,-48}})));
  Modelica.Blocks.Math.Add add7 annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=0,
        origin={-85,137})));
  Modelica.Blocks.Sources.Constant set2(k=Wfnl) "full load flow" annotation (
      Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=270,
        origin={-116,182})));
  Modelica.Blocks.Math.Gain Gain(k=Kiload/Kpload) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-138,90})));
  Modelica.Blocks.Math.Add LoadlimiterPI1(k2=-1) annotation (Placement(
        transformation(
        extent={{-6,6},{6,-6}},
        rotation=180,
        origin={-114,90})));
  Modelica.Blocks.Math.Gain KPGOV1(k=Kigov/Kpgov) annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={-31,-117})));
  Modelica.Blocks.Math.Add LoadlimiterPI2(k1=-1) annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=180,
        origin={-11,-117})));
  Modelica.Blocks.Math.Gain Tactgain(k=1/Tact)
    annotation (Placement(transformation(extent={{60,-62},{70,-52}})));
  Modelica.Blocks.Nonlinear.Limiter V1(uMax=Ropen, uMin=Rclose)
    annotation (Placement(transformation(extent={{76,-64},{90,-50}})));
  Modelica.Blocks.Continuous.Integrator s3(
    k=1,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=s30) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=0,
        origin={107,-57})));
  Modelica.Blocks.Math.Add add8(k2=-1) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={48,-58})));
  RSELECT rSELECT(Rselect=Rselect) annotation (Placement(transformation(
        extent={{-15,-22},{15,22}},
        rotation=90,
        origin={-206,-131})));
protected
  parameter Real Pe0(fixed=false);
  parameter Real Pmech0(fixed=false);
  parameter Real Pref(fixed=false);
  parameter Real Pmwset(fixed=false);
  parameter Real s00(fixed=false);
  parameter Real s20(fixed=false);
  parameter Real s30(fixed=false);
  parameter Real s40(fixed=false);
  parameter Real s50(fixed=false);
  parameter Real s60(fixed=false);
  parameter Real s70(fixed=false);
  parameter Real s80(fixed=false);
  parameter Real s90(fixed=false);
  //parameter Real s10( fixed=false);
  parameter Real fsr0(fixed=false);
initial equation
  Pe0 = PELEC;
  Pmech0 = PELEC;
  Pref = R*Pe0;
  Pmwset = s00;
  s00 = Pe0;
  s20 = fsr0;
  s30 = fsr0;
  s40 = Pmech0;
  s50 = s90;
  s60 = fsr0;
  s70 = 0;
  //assume s70=0
  s80 = 0;
  s90 = fsr0;
  fsr0 = (Pmech0 + Dm)/Kturb + Wfnl;
equation
  connect(deadZone.y, limiterSerror.u) annotation (Line(
      points={{-147,-74},{-140,-74}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(KPGOV.u, limiterSerror.y) annotation (Line(
      points={{-93.6,-74},{-117,-74}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Acceleration.y, add.u1) annotation (Line(
      points={{-90.8,12},{-86,12},{-86,12.4},{-55.8,12.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(s8.y, add1.u2) annotation (Line(
      points={{-168.7,-1},{-160,-1},{-160,6},{-148,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(AccelerationSet.y, add1.u1) annotation (Line(
      points={{-163.2,30},{-150,30},{-150,18},{-148,18}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Acceleration.u, add1.y) annotation (Line(
      points={{-118.4,12},{-125,12}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(SPEED, s8.u) annotation (Line(
      points={{-328,120},{-262,120},{-262,-1},{-198.6,-1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add3_2.y, deadZone.u) annotation (Line(
      points={{-185.4,-74},{-170,-74}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add3_2.u1, s8.u) annotation (Line(
      points={{-199.2,-69.2},{-212,-69.2},{-212,-1},{-198.6,-1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(r.y, add3_2.u3) annotation (Line(
      points={{-207,-93.3},{-207,-78.8},{-199.2,-78.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add2.y, add3_2.u2) annotation (Line(
      points={{-225.4,-74},{-199.2,-74}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(P_ref.y, add2.u1) annotation (Line(
      points={{-259.2,-70},{-250,-70},{-250,-70.4},{-239.2,-70.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(s7.y, add2.u2) annotation (Line(
      points={{-246,-89.2},{-246,-77.6},{-239.2,-77.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Pmw_set.y, add3.u1) annotation (Line(
      points={{-259.2,-140},{-249.6,-140},{-249.6,-129.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add3.y, s7.u) annotation (Line(
      points={{-246,-115.4},{-246,-107.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(s0.y, add3.u2) annotation (Line(
      points={{-259,-170},{-242,-170},{-242,-129.2},{-242.4,-129.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(s0.u, PELEC) annotation (Line(
      points={{-282,-170},{-300,-170},{-300,-99},{-329,-99}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(set.y, gain.u) annotation (Line(
      points={{-163.2,132},{-139.6,132}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add6.u1, s5.y) annotation (Line(
      points={{-64.4,113.2},{-51.2,113.2},{-51.2,110},{-41,110}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(s5.u, s9.y) annotation (Line(
      points={{-18,110},{-1,110}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(maxLimiter.y, min_select.u[1]) annotation (Line(
      points={{-109.2,64},{-28,64},{-28,-16.2667},{-18,-16.2667}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add.y, min_select.u[2]) annotation (Line(
      points={{-35.1,7},{-26,7},{-26,-4},{-18,-4},{-18,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(s4.y, add5.u2) annotation (Line(
      points={{150,121},{150,152},{164,152}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(product.y, add4.u1) annotation (Line(
      points={{142.6,-60},{146,-60},{146,-31.2},{146.4,-31.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(set1.y, add4.u2) annotation (Line(
      points={{187.2,-38},{153.6,-38},{153.6,-31.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain2.y, add5.u1) annotation (Line(
      points={{84.8,164},{164,164}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(flag10.y, product.u2) annotation (Line(
      points={{128.2,-141},{128.2,-63.6},{128.8,-63.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(SPEED, flag10.speed) annotation (Line(
      points={{-328,120},{-258,120},{-258,-230},{128,-230},{128,-164},{128.2,-164}},

      color={0,0,127},
      smooth=Smooth.None));

  connect(SPEED, dm_select.speed) annotation (Line(
      points={{-328,120},{-328,163.8},{0,163.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(dm_select.y, gain2.u) annotation (Line(
      points={{23,163.8},{66.4,163.8},{66.4,164}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add5.y, PMECH) annotation (Line(
      points={{187,158},{198,158},{198,0},{270,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(product1.u2, gain2.u) annotation (Line(
      points={{62,116},{66.4,116},{66.4,164}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(product1.u1, add4.u1) annotation (Line(
      points={{62,104},{126,104},{126,-30},{134,-30},{134,-31.2},{146.4,-31.2}},

      color={0,0,127},
      smooth=Smooth.None));

  connect(add.u2, V.y) annotation (Line(
      points={{-55.8,1.6},{-76,1.6},{-76,78},{34,78},{34,-55},{24.7,-55}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(V.u, min_select.yMin) annotation (Line(
      points={{8.6,-55},{3.3,-55},{3.3,-26.72},{-1.2,-26.72}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain.y, add7.u2) annotation (Line(
      points={{-121.2,132},{-106,132},{-106,131.6},{-95.8,131.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add7.y, add6.u2) annotation (Line(
      points={{-75.1,137},{-48,137},{-48,122.8},{-64.4,122.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(set2.y, add7.u1) annotation (Line(
      points={{-116,173.2},{-116,142.4},{-95.8,142.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add6.y, KPLOAD.u) annotation (Line(
      points={{-82.8,118},{-204,118},{-204,59},{-197.4,59}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(LoadlimiterPI1.y, Gain.u) annotation (Line(
      points={{-120.6,90},{-130.8,90}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gain.y, s6.u) annotation (Line(
      points={{-144.6,90},{-150.8,90}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(KPLOAD.y, LoadlimiterPI.u2) annotation (Line(
      points={{-181.3,59},{-178,59},{-178,59.2},{-169.6,59.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(s6.y, LoadlimiterPI.u1) annotation (Line(
      points={{-164.6,90},{-184,90},{-184,68.8},{-169.6,68.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(LoadlimiterPI.y, maxLimiter.u) annotation (Line(
      points={{-151.2,64},{-127.6,64}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(LoadlimiterPI1.u2, LoadlimiterPI.u1) annotation (Line(
      points={{-106.8,86.4},{-94,86.4},{-94,78},{-184,78},{-184,68.8},{-169.6,
          68.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(LoadlimiterPI1.u1, V.y) annotation (Line(
      points={{-106.8,93.6},{34,93.6},{34,-56},{24.7,-55}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(s1.u, limiterSerror.y) annotation (Line(
      points={{-82,-30},{-108,-30},{-108,-74},{-117,-74}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(s1.y, GovernorPID.u1) annotation (Line(
      points={{-59,-30},{-34,-30},{-34,-68.2},{-62.2,-68.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(KPGOV.y, GovernorPID.u2) annotation (Line(
      points={{-75.2,-74},{-74,-74},{-74,-77},{-62.2,-77}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(s2.u, KPGOV1.y) annotation (Line(
      points={{-42.6,-117},{-36.5,-117}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(s2.y, GovernorPID.u3) annotation (Line(
      points={{-58.7,-117},{-98,-117},{-98,-85.8},{-62.2,-85.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(KPGOV1.u, LoadlimiterPI2.y) annotation (Line(
      points={{-25,-117},{-16.5,-117}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(LoadlimiterPI2.u1, GovernorPID.u3) annotation (Line(
      points={{-5,-114},{0,-114},{0,-104},{-98,-104},{-98,-85.8},{-62.2,-85.8}},

      color={0,0,127},
      smooth=Smooth.None));

  connect(LoadlimiterPI2.u2, V.y) annotation (Line(
      points={{-5,-120},{34,-120},{34,-55},{24.7,-55}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(GovernorPID.y, min_select.u[3]) annotation (Line(
      points={{-36.9,-77},{-36,-77},{-36,-23.7333},{-18,-23.7333}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(V1.y, s3.u) annotation (Line(
      points={{90.7,-57},{98.6,-57}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tactgain.y, V1.u) annotation (Line(
      points={{70.5,-57},{74.6,-57}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add8.y, Tactgain.u) annotation (Line(
      points={{54.6,-58},{54.6,-57},{59,-57}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(s3.y, product.u1) annotation (Line(
      points={{114.7,-57},{119.35,-57},{119.35,-56.4},{128.8,-56.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add8.u1, V.y) annotation (Line(
      points={{40.8,-54.4},{34,-54.4},{34,-55},{24.7,-55}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add8.u2, product.u1) annotation (Line(
      points={{40.8,-61.6},{40,-61.6},{40,-90},{120,-90},{120,-56.4},{128.8,-56.4}},

      color={0,0,127},
      smooth=Smooth.None));

  connect(s4.u, gain1.y) annotation (Line(
      points={{150,98},{150,68.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(s0.y, rSELECT.Pelect) annotation (Line(
      points={{-259,-170},{-218.32,-170},{-218.32,-149}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(rSELECT.y, r.u) annotation (Line(
      points={{-205.56,-114.5},{-205.72,-114.5},{-205.72,-109.4},{-207,-109.4}},

      color={0,0,127},
      smooth=Smooth.None));

  connect(rSELECT.GovernorOutput, V.u) annotation (Line(
      points={{-179.6,-118.4},{2,-118.4},{2,-55},{8.6,-55}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(rSELECT.ValveStroke, product.u1) annotation (Line(
      points={{-179.6,-129.8},{120,-129.8},{120,-56.4},{128.8,-56.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(s9.u, product1.y)
    annotation (Line(points={{22,110},{39,110},{39,110}}, color={0,0,127}));
  connect(delay.y, gain1.u) annotation (Line(points={{150,35.4},{150,50.4},{150,
          50.4}}, color={0,0,127}));
  connect(delay.u, add4.y) annotation (Line(points={{150,3.2},{150,-17.4},{150,
          -17.4}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-320,-240},{
            260,220}}), graphics={Text(
          extent={{-272,-98},{-260,-106}},
          lineColor={255,0,0},
          textString="s7"),Text(
          extent={{-188,-8},{-178,-16}},
          lineColor={255,0,0},
          textString="s8"),Text(
          extent={{-72,136},{-58,126}},
          lineColor={255,0,0},
          textString="tlim"),Text(
          extent={{-62,110},{-46,102}},
          lineColor={255,0,0},
          textString="texm"),Text(
          extent={{-162,108},{-152,100}},
          lineColor={255,0,0},
          textString="s6"),Text(
          extent={{-88,-36},{-78,-44}},
          lineColor={255,0,0},
          textString="s1"),Text(
          extent={{-68,-122},{-58,-130}},
          lineColor={255,0,0},
          textString="s2"),Text(
          extent={{16,132},{26,124}},
          lineColor={255,0,0},
          textString="s9"),Text(
          extent={{-28,132},{-18,124}},
          lineColor={255,0,0},
          textString="s5"),Text(
          extent={{100,-76},{110,-84}},
          lineColor={255,0,0},
          textString="s3"),Text(
          extent={{168,98},{178,90}},
          lineColor={255,0,0},
          textString="s4"),Text(
          extent={{-254,-182},{-242,-190}},
          lineColor={255,0,0},
          textString="s0"),Text(
          extent={{-306,232},{-158,190}},
          lineColor={0,0,255},
          textString="input should be speed")}),
    Icon(coordinateSystem(extent={{-320,-240},{260,220}}, preserveAspectRatio=
            false), graphics={Rectangle(extent={{-320,220},{260,-240}},
          lineColor={0,0,255}),Text(
          extent={{-306,146},{-216,92}},
          lineColor={0,0,255},
          textString="SPEED"),Text(
          extent={{-306,-74},{-222,-126}},
          lineColor={0,0,255},
          textString="PELEC"),Text(
          extent={{-114,64},{92,-64}},
          lineColor={0,0,255},
          textString="GGOV1"),Text(
          extent={{172,24},{256,-28}},
          lineColor={0,0,255},
          textString="PMECH")}),
    Documentation);
end GGOV1;
