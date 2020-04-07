within AKD.Components;
model Gen_no_contr
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
    R_a=R_a) annotation (Placement(transformation(extent={{-29,-32},{35,32}})));
  OpenIPSL.Interfaces.PwPin pwPin annotation (Placement(transformation(extent={
            {80,-10},{100,10}}), iconTransformation(extent={{60,-10},{80,10}})));
equation
  connect(gENSAL.PMECH0, gENSAL.PMECH) annotation (Line(points={{37.56,-9.6},{
          56,-9.6},{56,42},{-38,42},{-38,16},{-28.36,16}}, color={0,0,127}));
  connect(gENSAL.EFD0, gENSAL.EFD) annotation (Line(points={{37.56,-22.4},{56,-22.4},
          {56,-44},{-38,-44},{-38,-16},{-28.36,-16}}, color={0,0,127}));
  connect(gENSAL.p, pwPin)
    annotation (Line(points={{38.2,0},{90,0}}, color={0,0,255}));
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
end Gen_no_contr;
