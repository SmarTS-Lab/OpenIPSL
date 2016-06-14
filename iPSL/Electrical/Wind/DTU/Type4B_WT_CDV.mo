within iPSL.Electrical.Wind.DTU;
model Type4B_WT_CDV "IEC Type 4B Full-Scale Wind Turbine Model. Developed by DTU"
  parameter Real w_init=1 "Initial steady state generator speed";
  parameter Real T_Ufilt=0.01 "Voltage measurement filter time constant";
  parameter Real dPmax=99 "Wind turbine maximum power ramp rate";
  parameter Real Tpord=0.01 "Time constant in power order lag";
  parameter Real Tpaero=0.01 "Time constant in aerodynamic power response";
  parameter Real Tpfilt=0.01 "Power measurement filter time constant";
  parameter Real MwttPF=1 "Power factor control mode";
  parameter Real MwttU=0 "Voltage control mode";
  parameter Real MwttOL=0 "Open loop mode";
  parameter Real Uref0=1 "User defined voltage reference";
  parameter Real Tangent_phi=0 "Calculated from power factor setpoint";
  parameter Real Qmax=0.33 "Maximum reactive power";
  parameter Real Qmin=-0.33 "Minimum reactive power";
  parameter Real Tufilt=0.01 "Voltage measurement filter time constant";
  parameter Real Uqdip=0.8 "Voltage threshold value for LVRT detection";
  parameter Real Tpost=1 "Length of time period where post fault reactive power is injected";
  parameter Real Udb1=0.1 "Voltage dead band lower limit";
  parameter Real Udb2=0.1 "Voltage dead band upper limit";
  parameter Real Kqv=4 "Voltage scaling factor for LVRT current";
  parameter Real iqh1=1 "Maximum reactive current injection during dip";
  parameter Real iqmin=-1.1 "Minimum reactive current injection";
  parameter Real iqmax=1.1 "Maximum reactive current injection";
  parameter Real iq_post=-0.2 "Post fault reactive current injection";
  parameter Real Umax=1.05 "Maximum voltage in voltage PI controller integral term";
  parameter Real Umin=0 "Minimum voltage in voltage PI controller integral term";
  parameter Real KiQ=0.1 "Reactive power PI controller integration gain";
  parameter Real KpQ=1 "Reactive power PI controller proportional gain";
  parameter Real Tqord=0.01 "Time constant in reactive power order lag";
  parameter Real KiU=0.1 "Voltage PI controller integration gain";
  parameter Real KpU=1 "Voltage PI controller proportional gain";
  parameter Real Tiq=0.01 "Time constant in reactive current lag";
  parameter Real Hgen=0.7275 "Inertia Constant of Generator";
  parameter Real Hwtr=4.225 "Inertia Constant of Wind Turbine Rotor";
  parameter Real k_sh=140 "Drive Train Stiffness";
  parameter Real c_sh=0.8 "Drive Train Damping";
  parameter Real T_init=0.9 "Initial Steady State Shaft Torque";
  parameter Real i_maxdip=1.1 "Maximum current during voltage dip at the wind turbine terminals";
  parameter Real i_max=1.23 "Maximum continuous current at the wind turbine terminals";
  parameter Real M_Qpri=1 "Prioritisation of q control during LVRT (0: active power priority - 1: reactive power priority)";
  parameter Real Tg=0.005 "Current generation time constant";
  parameter Real diPmax=99 "Maximum active current ramp rate ";
  parameter Real diQmin=-99 "Minimum reactive current ramp rate";
  parameter Real diQmax=99 "Maximum reactive current ramp rate";
  parameter Real Rdroop=0 "Resistive component of voltage drop impedance";
  parameter Real Xdroop=0 "Inductive component of voltage drop impedance";
  parameter Real ini_iPref(fixed=false);
  parameter Real ini_iQref(fixed=false);
  iPSL.Electrical.Wind.DTU.CurrentLimiter CurrentLimitationModel(
    i_maxdip=i_maxdip,
    i_max=i_max,
    M_Qpri=M_Qpri,
    T_Ufilt=T_Ufilt) annotation (Placement(transformation(extent={{-8,36},{62,84}})));
  iPSL.Electrical.Sensors.PwPowerMeas pwPowerMeas annotation (Placement(transformation(extent={{100,-4},{120,16}})));
  iPSL.Electrical.Wind.DTU.DriveTrain driveTrain(
    Hgen=Hgen,
    Hwtr=Hwtr,
    k_sh=k_sh,
    c_sh=c_sh,
    w_init=w_init,
    T_init=T_init) annotation (Placement(transformation(extent={{-14,-86},{40,-44}})));
  iPSL.Electrical.Wind.DTU.GenSet_Type4 genSet_Type4_2(
    Tg=Tg,
    diPmax=diPmax,
    diQmin=diQmin,
    diQmax=diQmax,
    ini_iPref=ini_iPref,
    ini_iQref=ini_iQref) annotation (Placement(transformation(extent={{12,-10},{64,26}})));
  iPSL.Electrical.Wind.DTU.QControl_Type4B qControl_Type4B1(
    Tpfilt=Tpfilt,
    MwttPF=MwttPF,
    MwttU=MwttU,
    MwttOL=MwttOL,
    Uref0=Uref0,
    Tangent_phi=Tangent_phi,
    Qmax=Qmax,
    Qmin=Qmin,
    Tufilt=Tufilt,
    Uqdip=Uqdip,
    Tpost=Tpost,
    Udb1=Udb1,
    Udb2=Udb1,
    Kqv=Kqv,
    iqh1=iqh1,
    iqmin=iqmin,
    iqmax=iqmax,
    iq_post=iq_post,
    Umax=Umax,
    Umin=Umin,
    KiQ=KiQ,
    KpQ=KpQ,
    Tqord=Tqord,
    KiU=KiU,
    KpU=KpU,
    Tiq=Tiq,
    Xdroop=Xdroop,
    Rdroop=Rdroop) annotation (Placement(transformation(extent={{-86,-54},{10,-8}})));
  Modelica.Blocks.Interfaces.RealInput Uref annotation (Placement(transformation(extent={{-150,34},{-140,46}})));
  Modelica.Blocks.Interfaces.RealInput Qref annotation (Placement(transformation(extent={{-150,-6},{-140,6}})));
  Modelica.Blocks.Interfaces.RealInput Pref annotation (Placement(transformation(extent={{-150,-46},{-140,-34}})));
  iPSL.Connectors.PwPin WTG_terminal annotation (Placement(transformation(extent={{140,-5},{150,5}})));
  iPSL.Electrical.Sensors.PwVoltage pwVoltage annotation (Placement(transformation(extent={{86,-70},{66,-50}})));
  iPSL.Electrical.Wind.DTU.PControl_Type4B_CDV pControl_Type4B_CDV(
    w_init=w_init,
    T_Ufilt=T_Ufilt,
    dPmax=dPmax,
    Tpord=Tpord,
    Tpaero=Tpaero) annotation (Placement(transformation(extent={{-98,-4},{-6,54}})));
  iPSL.Electrical.Machines.DTU.PwdqCurrentSource pwdqCurrentSource annotation (Placement(transformation(extent={{58,-6},{92,24}})));
  iPSL.Electrical.Controls.DTU.pwPLL pwPLL annotation (Placement(transformation(extent={{82,-30},{62,-10}})));
initial equation
  ini_iPref = Pref/pwVoltage.v;
  ini_iQref = Qref/pwVoltage.v;
equation
  connect(pwPowerMeas.P, driveTrain.Pag) annotation (Line(
      points={{114.5,5},{122,5},{122,-88},{-4.55,-88},{-4.55,-73.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(genSet_Type4_2.iQcmd, CurrentLimitationModel.iQcmdlmt)
    annotation (Line(
      points={{16.2545,3.77391},{-14,3.77391},{-14,44.4706},{-2.75,44.4706}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(genSet_Type4_2.iQmax, CurrentLimitationModel.iQmax)
    annotation (Line(
      points={{16.2545,-3.73913},{2,-3.73913},{2,34},{70,34},{70,64.2353},{56.75,64.2353}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(genSet_Type4_2.iPcmd, CurrentLimitationModel.iPcmdlmt)
    annotation (Line(
      points={{16.2545,13.7913},{-20,13.7913},{-20,67.0588},{-2.75,67.0588}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pwPowerMeas.Q, qControl_Type4B1.Qwtt)
    annotation (Line(
      points={{114.5,2.6},{128,2.6},{128,-94},{-110,-94},{-110,-18.2222},{-81.7333,-18.2222}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(qControl_Type4B1.Pwtt, driveTrain.Pag) annotation (Line(
      points={{-81.7333,-33.5556},{-116,-33.5556},{-116,-88},{-4.55,-88},{-4.55,-73.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(qControl_Type4B1.F_LVRT, CurrentLimitationModel.F_LVRT)
    annotation (Line(
      points={{-26.2667,-23.3333},{-24,-23.3333},{-24,80},{27,80},{27,74.1176}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(qControl_Type4B1.Iqcmd, CurrentLimitationModel.iQcmdlmt)
    annotation (Line(
      points={{-26.2667,-33.5556},{-14,-33.5556},{-14,44.4706},{-2.75,44.4706}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Uref, qControl_Type4B1.Uref) annotation (Line(
      points={{-145,40},{-106,40},{-106,-23.3333},{-81.7333,-23.3333}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(qControl_Type4B1.Qref, Qref) annotation (Line(
      points={{-81.7333,-28.4444},{-145,-28.4444},{-145,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pwPowerMeas.n, WTG_terminal) annotation (Line(
      points={{114.6,8.6},{134.3,8.6},{134.3,0},{145,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pControl_Type4B_CDV.Uwtt, pwVoltage.v)
    annotation (Line(
      points={{-77.76,34.28},{-102,34.28},{-102,-82},{-98,-82},{-98,-84},{71.1,-84},{71.1,-63}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(qControl_Type4B1.Uwtt, pwVoltage.v)
    annotation (Line(
      points={{-81.7333,-38.6667},{-102,-38.6667},{-102,-82},{-98,-82},{-98,-84},{71.1,-84},{71.1,-63}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(CurrentLimitationModel.Uwtt, pwVoltage.v)
    annotation (Line(
      points={{-2.75,55.7647},{-102,55.7647},{-102,-82},{-98,-82},{-98,-84},{71.1,-84},{71.1,-63}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(CurrentLimitationModel.iPmax, genSet_Type4_2.iPmax)
    annotation (Line(
      points={{56.75,46.7294},{80,46.7294},{80,32},{6,32},{6,21.3043},{16.2545,21.3043}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pControl_Type4B_CDV.iPmax, genSet_Type4_2.iPmax)
    annotation (Line(
      points={{-77.76,27.9},{-90,27.9},{-90,92},{80,92},{80,32},{6,32},{6,21.3043},{16.2545,21.3043}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(driveTrain.w_gen, pControl_Type4B_CDV.w_gen) annotation (Line(
      points={{27.85,-73.4},{44,-73.4},{44,-6},{-90,-6},{-90,22.1},{-77.76,22.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Pref, pControl_Type4B_CDV.Pwtt_ref) annotation (Line(
      points={{-145,-40},{-126,-40},{-126,6},{-77.76,6},{-77.76,15.72}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pControl_Type4B_CDV.iPcmd, CurrentLimitationModel.iPcmdlmt) annotation (Line(
      points={{-31.76,25},{-20,25},{-20,67.0588},{-2.75,67.0588}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(driveTrain.Paero, pControl_Type4B_CDV.imPin) annotation (Line(
      points={{-4.55,-56.6},{-4.55,-14},{-52.46,-14},{-52.46,14.56}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pwdqCurrentSource.n, pwPowerMeas.p) annotation (Line(
      points={{86.22,9},{86.22,-4.5},{105.4,-4.5},{105.4,6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwVoltage.p, pwdqCurrentSource.n) annotation (Line(
      points={{81,-60},{81,-38},{86.22,-38},{86.22,9}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwdqCurrentSource.id_ref, genSet_Type4_2.iPref) annotation (Line(
      points={{63.61,15},{63.61,14.5},{52.1818,14.5},{52.1818,15.0435}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pwdqCurrentSource.iq_ref, genSet_Type4_2.iQref) annotation (Line(
      points={{63.61,3},{63.61,3.5},{52.1818,3.5},{52.1818,2.52174}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pwPLL.pwPin, pwdqCurrentSource.n) annotation (Line(
      points={{77.4,-20},{86.22,-20},{86.22,9}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwPLL.imPin, pwdqCurrentSource.phi_meas) annotation (Line(
      points={{66.8,-20},{62,-20},{62,-8},{75,-8},{75,-0.9}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(extent={{-180,-100},{160,100}}, preserveAspectRatio=false), graphics={Text(
          extent={{-2,-42},{36,-54}},
          lineColor={0,0,255},
          textString="Mechanical Model"),Text(
          extent={{32,84},{76,72}},
          lineColor={0,0,255},
          textString="Current Limitation Model"),Text(
          extent={{16,34},{60,20}},
          lineColor={0,0,255},
          textString="Generator System Model"),Text(
          extent={{60,26},{92,18}},
          lineColor={0,0,255},
          textString="Current Injector"),Text(
          extent={{88,-12},{120,-20}},
          lineColor={0,0,255},
          textString="Measurements"),Text(
          extent={{-176,36},{-108,-8}},
          lineColor={0,0,255},
          textString="Wind Turbine Reference Values"),Text(
          extent={{102,36},{156,2}},
          lineColor={0,0,255},
          textString="Wind Turbine Terminal")}),
    Icon(coordinateSystem(extent={{-180,-100},{160,100}}, preserveAspectRatio=false), graphics={Rectangle(
          extent={{-140,80},{140,-80}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Bitmap(
          extent={{-132,76},{130,-78}},
          imageSource=
            "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",
          fileName="modelica://ToAIA_FrDTU/../Library/Turbine.jpg"),Text(
          extent={{-126,50},{-92,26}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="Uref"),Text(
          extent={{-126,14},{-90,-12}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="Qref"),Text(
          extent={{-124,-27},{-90,-50}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="Pref"),Text(
          extent={{84,10},{132,-12}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="Iwt"),Text(
          extent={{14,-32},{88,-78}},
          lineColor={0,0,0},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="IEC Type 4B")}),
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
end Type4B_WT_CDV;
