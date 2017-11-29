within OpenIPSL.Electrical.Loads.PSAT;
model LOADPQ_variation
  "Equations come from the mathematical separation in between reals and imaginary of S=P+jQ=UI*"
  extends BaseClasses.baseLoad;
  parameter Modelica.SIunits.Time t_start_1=1
    "Start time of first load variation (s)"
    annotation (Dialog(group="Variation 1"));
  parameter Modelica.SIunits.Time t_end_1=2
    "End time of first load variation (s)"
    annotation (Dialog(group="Variation 1"));
  parameter OpenIPSL.Types.ActivePowerMega dP1=0
    "First active load variation  (MW)" annotation (Dialog(group="Variation 1"));
  parameter OpenIPSL.Types.ReactivePowerMega dQ1=0
    "First reactive load variation (Mvar)"
    annotation (Dialog(group="Variation 1"));
  parameter Modelica.SIunits.Time t_start_2=2
    "Start time of second Load variation (s)"
    annotation (Dialog(group="Variation 2"));
  parameter Modelica.SIunits.Time t_end_2=3
    "End time of second load variation (s)"
    annotation (Dialog(group="Variation 2"));
  parameter OpenIPSL.Types.ActivePowerMega dP2=0
    "Second active load variation  (MW)"
    annotation (Dialog(group="Variation 2"));
  parameter OpenIPSL.Types.ReactivePowerMega dQ2=0
    "Second reactive load variation (Mvar)"
    annotation (Dialog(group="Variation 2"));
  parameter Modelica.SIunits.PerUnit Vmax=1.2 "maximum voltage (pu)"
    annotation (Evaluate=true, Dialog(tab="To Be Implemented"));
  parameter Modelica.SIunits.PerUnit Vmin=0.8 "minimum voltage (pu)"
    annotation (Evaluate=true, Dialog(tab="To Be Implemented"));
  parameter Boolean forcePQ=true
    "force ''constant'' PQ-load, false may cause simulation problems"
    annotation (
    Evaluate=true,
    choices(checkBox=true),
    Dialog(tab="To Be Implemented"));
protected
  Modelica.SIunits.PerUnit Pd(start=P_0/S_b) "active
  power demand";
  Modelica.SIunits.PerUnit Qd(start=Q_0/S_b) "reactive power demand";
equation
  // forcePQ=false needs better implementation
  if forcePQ or initial() then
    P = Pd;
    Q = Qd;
  elseif noEvent(V > Vmax) then
    P = Pd*V^2/(Vmax^2)/S_b;
    Q = Qd*V^2/(Vmax^2)/S_b;
  elseif noEvent(V < Vmin) then
    P = Pd*V^2/Vmin^2/S_b;
    Q = Qd*V^2/(Vmin^2)/S_b;
  else
    P = Pd;
    Q = Qd;
  end if;
  if time >= t_start_1 and time <= t_end_1 then
    Pd = (P_0 + dP1)/S_b;
    Qd = (Q_0 + dQ1)/S_b;
  elseif time >= t_start_2 and time <= t_end_2 then
    Pd = (P_0 + dP2)/S_b;
    Qd = (Q_0 + dQ2)/S_b;
  else
    Pd = P_0/S_b;
    Qd = Q_0/S_b;
  end if;
  annotation (
    Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={10,10})),
    Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={5,5})),
    Documentation);
end LOADPQ_variation;
