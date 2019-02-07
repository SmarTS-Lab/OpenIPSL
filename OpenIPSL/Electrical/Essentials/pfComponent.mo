within OpenIPSL.Electrical.Essentials;
partial model pfComponent
  "Partial model containing all the parameters for entering power flow data"
  outer OpenIPSL.Electrical.SystemBase SysData
    "Must add this line in all models";
  parameter SI.Voltage V_b(displayUnit="kV")=400e3 "Base voltage of the bus"
    annotation (Dialog(group="Power flow data"));
  parameter Modelica.SIunits.PerUnit V_0=1 "Voltage magnitude (pu)"
    annotation (Dialog(group="Power flow data"));
  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg angle_0=0
    "Voltage angle" annotation (Dialog(group="Power flow data"));
  parameter SI.ActivePower P_0(displayUnit="MW")=1000000 "Active power"
    annotation (Dialog(group="Power flow data"));
  parameter SI.ReactivePower Q_0(displayUnit="Mvar")=0 "Reactive power"
    annotation (Dialog(group="Power flow data"));
  parameter SI.ApparentPower S_b(displayUnit="MVA")=SysData.S_b
    "System base power"
    annotation (Dialog(group="Power flow data", enable=false));
  parameter Modelica.SIunits.Frequency fn=SysData.fn "System Frequeny"
    annotation (Dialog(group="Power flow data", enable=false));
  annotation (Documentation);
end pfComponent;
