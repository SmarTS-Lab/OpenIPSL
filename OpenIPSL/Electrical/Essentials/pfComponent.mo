within OpenIPSL.Electrical.Essentials;
partial model pfComponent
  "Partial model containing all the parameters for entering power flow data"
  outer OpenIPSL.Electrical.SystemBase SysData
    "Must add this line in all models";
  parameter SI.ApparentPower S_b(displayUnit="MVA")=SysData.S_b
    "System base power"
    annotation (Dialog(group="Power flow data", enable=false));
  parameter SI.Frequency fn=SysData.fn
    "System frequency"
    annotation (Dialog(group="Power flow data", enable=false));
  parameter SI.Voltage V_b(displayUnit="kV")=400e3
    "Base voltage of the bus"
    annotation (Dialog(group="Power flow data"));
  parameter SI.ActivePower P_0(displayUnit="MW")=1e6
    "Initial active power"
    annotation (Dialog(group="Power flow data"));
  parameter SI.ReactivePower Q_0(displayUnit="Mvar")=0
    "Initial reactive power"
    annotation (Dialog(group="Power flow data"));
  parameter SI.PerUnit v_0=1
    "Initial voltage magnitude (pu)"
    annotation (Dialog(group="Power flow data"));
  parameter SI.Conversions.NonSIunits.Angle_deg angle_0=0
    "Initial voltage angle"
    annotation (Dialog(group="Power flow data"));
protected
  parameter SI.Angle angle_0rad = SI.Conversions.from_deg(angle_0) "Intial angle in rad";
end pfComponent;
