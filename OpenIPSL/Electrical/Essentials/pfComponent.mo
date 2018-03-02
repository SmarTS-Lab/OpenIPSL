within OpenIPSL.Electrical.Essentials;
partial model pfComponent
  "Partial model containing all the Data for entering power flow data"
  outer OpenIPSL.Electrical.SystemBase SysData
    "Must add this line in all models";
  parameter OpenIPSL.Types.VoltageKilo V_b=400 "Base voltage of the bus"
    annotation (Dialog(group="Power flow data"));
  parameter Modelica.SIunits.PerUnit V_0=1 "Voltage magnitude (pu)"
    annotation (Dialog(group="Power flow data"));
  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg angle_0=0
    "Voltage angle" annotation (Dialog(group="Power flow data"));
  parameter OpenIPSL.Types.ActivePowerMega P_0=1 "Active power"
    annotation (Dialog(group="Power flow data"));
  parameter OpenIPSL.Types.ReactivePowerMega Q_0=0 "Reactive power"
    annotation (Dialog(group="Power flow data"));
  parameter OpenIPSL.Types.ApparentPowerMega S_b=SysData.S_b
    "System base power"
    annotation (Dialog(group="Power flow data", enable=false));
  parameter Modelica.SIunits.Frequency fn=SysData.fn "System Frequeny"
    annotation (Dialog(group="Power flow data", enable=false));
  annotation (Documentation);
end pfComponent;
