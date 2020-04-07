within AKD.Components;
model Gen_gov_exc_stab
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  parameter Real M_b "Machine base power (MVA)"
    annotation (Dialog(group="Power flow data"));
  parameter Real Tpd0 "d-axis transient open-circuit time constant (s)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real Tppd0 "d-axis sub-transient open-circuit time constant (s)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real Tppq0 "q-axis transient open-circuit time constant (s)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real H "Inertia constant (s)"
    annotation (Dialog(group="Machine parameters"));
  parameter Real D "Speed damping"
    annotation (Dialog(group="Machine parameters"));
  parameter Real Xd "d-axis reactance"
    annotation (Dialog(group="Machine parameters"));
  parameter Real Xq "q-axis reactance"
    annotation (Dialog(group="Machine parameters"));
  parameter Real Xpd "d-axis transient reactance"
    annotation (Dialog(group="Machine parameters"));
  parameter Real Xppd "d-axis sub-transient reactance"
    annotation (Dialog(group="Machine parameters"));
  parameter Real Xl "leakage reactance"
    annotation (Dialog(group="Machine parameters"));
  parameter Real S10 "Saturation factor at 1.0 pu"
    annotation (Dialog(group="Machine parameters"));
  parameter Real S12 "Saturation factor at 1.2 pu"
    annotation (Dialog(group="Machine parameters"));
  parameter Real R_a=0 "amature resistance"
    annotation (Dialog(group="Machine parameters"));
  parameter Real R=0.05 "Permanent droop (pu)";
  parameter Real r=0.3 "Temporary droop (pu)";
  parameter Real T_r=5 "Governor time constant (s)";
  parameter Real T_f=0.05 "Filter time constant (s)";
  parameter Real T_g=0.5 "Servo time constant (s)";
  parameter Real VELM=0.2 "Gate open/close velocity limit";
  parameter Real G_MAX=0.9 "Maximum gate limit";
  parameter Real G_MIN=0 "Minimum gate limit";
  parameter Real T_w=1.25 "Water time constant (s)";
  parameter Real A_t=1.2 "Turbine gain";
  parameter Real D_turb=0.2 "Turbine damping";
  parameter Real q_NL=0.08 "Water flow at no load";
  parameter Real T_R=0.02 "Voltage input time constant (s)";
  parameter Real K_A=200.0 "AVR gain";
  parameter Real T_A=0.001 "AVR time constant (s)";
  parameter Real V_RMAX=6.08 "Maximum AVR output (pu)";
  parameter Real V_RMIN=-6.08 "Minimum AVR output (pu)";
  parameter Real K_E=1 "Exciter field gain";
  parameter Real T_E=0.55 "Exciter time constant s";
  parameter Real K_F=0.06 "Rate feedback gain (pu)";
  parameter Real T_F1=0.3 "Rate feedback time constant (s)";
  parameter Real T_F2=0.6 "Rate feedback time constant (s)";
  parameter Real E_1=2.85 "Exciter saturation point 1 (pu)";
  parameter Real S_EE_1=0.3 "Saturation at E_1";
  parameter Real E_2=3.8 "Exciter saturation point 2 (pu)";
  parameter Real S_EE_2=0.6 "Saturation at E_2";
  parameter Real A_1=3 "Filter Coefficient";
  parameter Real A_2=0 "Filter Coefficient";
  parameter Real A_3=0 "Filter Coefficient";
  parameter Real A_4=0 "Filter Coefficient";
  parameter Real A_5=0 "Filter Coefficient";
  parameter Real A_6=0 "Filter Coefficient";
  parameter Real T_1=0 "Lead Time Constant";
  parameter Real T_2=0 "Lag Time Constant";
  parameter Real T_3=0 "Lead Time Constant";
  parameter Real T_4=0 "Lag Time Constant";
  parameter Real T_5=1.65 "Washout Time Constant";
  parameter Real T_6=1.65 "Washout Time Constant";
  parameter Real K_S=6.2 "Stabilizer Gain";
  parameter Real L_SMAX=0.26 "Output Limits";
  parameter Real L_SMIN=-0.1 "Output Limits";
  parameter Real V_CU=999 "Output Limits";
  parameter Real V_CL=-999 "Output Limits";
  OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
    V_b=V_b,
    V_0=V_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0,
    M_b=M_b,
    Tpd0=Tpd0,
    Tppd0=Tppd0,
    Tppq0=Tppq0,
    H=H,
    D=D,
    Xd=Xd,
    Xq=Xq,
    Xpd=Xpd,
    Xppd=Xppd,
    Xppq=Xppd,
    Xl=Xl,
    S10=S10,
    S12=S12,
    R_a=R_a) annotation (Placement(transformation(extent={{-39,-6},{25,58}})));
  OpenIPSL.Interfaces.PwPin pwPin annotation (Placement(transformation(extent={
            {80,16},{100,36}}), iconTransformation(extent={{60,-10},{80,10}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
    R=R,
    r=r,
    T_r=T_r,
    T_f=T_f,
    T_g=T_g,
    VELM=VELM,
    G_MAX=G_MAX,
    G_MIN=G_MIN,
    T_w=T_w,
    A_t=A_t,
    D_turb=D_turb,
    q_NL=q_NL) annotation (Placement(transformation(extent={{26,72},{-30,94}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.IEEET2 iEEET2_1(
    T_R=T_R,
    K_A=K_A,
    T_A=T_A,
    V_RMAX=V_RMAX,
    V_RMIN=V_RMIN,
    K_E=K_E,
    T_E=T_E,
    K_F=K_F,
    T_F1=T_F1,
    T_F2=T_F2,
    E_1=E_1,
    S_EE_1=S_EE_1,
    E_2=E_2,
    S_EE_2=S_EE_2)
    annotation (Placement(transformation(extent={{-20,-74},{-88,-18}})));
  OpenIPSL.Electrical.Controls.PSSE.PSS.IEEEST iEEEST(
    A_1=A_1,
    A_2=A_2,
    A_3=A_3,
    A_4=A_4,
    A_5=A_5,
    A_6=A_6,
    T_1=T_1,
    T_2=T_2,
    T_3=T_3,
    T_4=T_4,
    T_5=T_5,
    T_6=T_6,
    K_S=K_S,
    L_SMAX=L_SMAX,
    L_SMIN=L_SMIN,
    V_CU=V_CU,
    V_CL=V_CL)
    annotation (Placement(transformation(extent={{90,-49},{18,-21}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{0,-58},{-12,-46}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{74,-14},{86,-2}})));
equation
  connect(gENSAL.p, pwPin)
    annotation (Line(points={{28.2,26},{64,26},{90,26}}, color={0,0,255}));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(points={{27.56,16.4},{
          40,16.4},{40,77.5},{25.3,77.5}}, color={0,0,127}));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{27.56,54.8},{50,
          54.8},{50,88.5},{25.3,88.5}}, color={0,0,127}));
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{-31.4,83},{-52,
          83},{-52,42},{-38.36,42}}, color={0,0,127}));
  connect(iEEET2_1.EFD, gENSAL.EFD) annotation (Line(points={{-90.55,-46},{-96,
          -46},{-96,10},{-38.36,10}}, color={0,0,127}));
  connect(iEEEST.VOTHSG, iEEET2_1.VOTHSG) annotation (Line(points={{15,-35},{-5.625,
          -35},{-5.625,-34.8},{-21.1333,-34.8}}, color={0,0,127}));
  connect(gENSAL.ETERM, iEEET2_1.ECOMP) annotation (Line(points={{27.56,42},{46,
          42},{46,-18},{-10,-18},{-10,-23.6},{-21.1333,-23.6}}, color={0,0,127}));
  connect(gENSAL.PELEC, iEEEST.V_S) annotation (Line(points={{27.56,10},{62,10},
          {98,10},{98,-42},{89.4,-42}}, color={0,0,127}));
  connect(const1.y, iEEEST.V_CT) annotation (Line(points={{86.6,-8},{94,-8},{94,
          -28},{89.4,-28}}, color={0,0,127}));
  connect(const.y, iEEET2_1.VOEL) annotation (Line(points={{-12.6,-52},{-16,-52},
          {-16,-46},{-21.1333,-46}}, color={0,0,127}));
  connect(iEEET2_1.VUEL, iEEET2_1.VOEL) annotation (Line(points={{-21.1333,-57.2},
          {-16,-57.2},{-16,-46},{-21.1333,-46}}, color={0,0,127}));
  connect(gENSAL.EFD0, iEEET2_1.EFD0) annotation (Line(points={{27.56,3.6},{38,
          3.6},{38,-14},{6,-14},{6,-68.4},{-21.1333,-68.4}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Ellipse(extent={{-60,60},{60,-60}}, lineColor={0,
          0,255}),Text(
          extent={{-34,24},{32,-28}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="GEN")}),
    Documentation);
end Gen_gov_exc_stab;
