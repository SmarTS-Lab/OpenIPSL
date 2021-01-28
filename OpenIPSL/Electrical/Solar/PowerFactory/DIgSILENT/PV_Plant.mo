within OpenIPSL.Electrical.Solar.PowerFactory.DIgSILENT;

model PV_Plant "DIgSILENT model of a solar plant"
  extends OpenIPSL.Electrical.Essentials.pfComponent(
    final enabledisplayPF=false,
    final enablefn=true,
    final enableV_b=false,
    final enableangle_0=true,
    final enablev_0=true,
    final enableQ_0=true,
    final enableP_0=true,
    final enableS_b=true);
  parameter Types.ApparentPower M_b "PV plant base power"
    annotation (Dialog(group="Plant parameters"));
    
  parameter Integer n_series = 20 "Number of modules in series" annotation(
    Dialog(group = "PV Array Dimensions"));
  parameter Integer n_parallel = 140 "Number of modules in parallel" annotation(
    Dialog(group = "PV Array Dimensions"));
  parameter Types.Time Tr = 0.01 "Time constant of modules" annotation(
    Dialog(group = "Parameters of PV Modules"));
  parameter Types.Voltage U0_stc = 43.8 "Open-circuit voltage at Standard Test Conditions" annotation(
    Dialog(group = "Parameters of PV Modules"));
  parameter Types.Voltage Umpp_stc = 35 "MPP voltage at Standard Test Conditions" annotation(
    Dialog(group = "Parameters of PV Modules"));
  parameter Types.Current Impp_stc = 4.58 "MPP current at Standard Test Conditions" annotation(
    Dialog(group = "Parameters of PV Modules"));
  parameter Types.Current Isc_stc = 5 "Short-circuit current at Standard Test Conditions" annotation(
    Dialog(group = "Parameters of PV Modules"));
  parameter SI.LinearTemperatureCoefficient au = -0.0039 "Temperature correction factor (voltage)" annotation(
    Dialog(group = "Parameters of PV Modules"));
  parameter SI.LinearTemperatureCoefficient ai = 0.0004 "Temperature correction factor (current)" annotation(
    Dialog(group = "Parameters of PV Modules"));
  parameter SI.Capacitance C=1.5e-3 "Capacity of capacitor on DC busbar" annotation(
    Dialog(group = "DC busbar parameters"));
  parameter Real Kp = 0.005 "Gain, Active Power PI-Controller" annotation(
    Dialog(group = "Current Controller Parameters"));
  parameter Types.Time Tip = 0.03  "Integration Time Constant, Active Power PI-Ctrl." annotation(
    Dialog(group = "Current Controller Parameters")); 
  parameter Types.Time Trm = 0.001 "Measurement Delay"annotation(
    Dialog(group = "Current Controller Parameters"));
  parameter Types.Time Tmpp = 5 "Time Delay MPP-Tracking"annotation(
    Dialog(group = "Current Controller Parameters"));
  parameter Types.PerUnit  id_min = 0 "Min. Active Current Limit"annotation(
    Dialog(group = "Current Controller Parameters"));
  parameter Types.PerUnit  id_max = 1"Max. Active Current Limit"annotation(
    Dialog(group = "Current Controller Parameters"));
  parameter Types.Voltage U_min = 200 "Minimal allowed DC-voltage"annotation(
    Dialog(group = "Current Controller Parameters"));
  parameter Types.PerUnit iq_min  = -1 "Min. Reactive Current Limit"annotation(
    Dialog(group = "Current Controller Parameters"));
  parameter Types.PerUnit iq_max  = 1"Max. Reactive Current Limit"annotation(
    Dialog(group = "Current Controller Parameters"));
  parameter Real Deadband = 0.1 "Deadband for Dynamic AC Voltage Support"annotation(
    Dialog(group = "Current Controller Parameters"));
  parameter Real K_FRT = 2 "Gain for Dynamic AC Voltage Support"annotation(
    Dialog(group = "Current Controller Parameters"));  
  parameter Boolean i_EEG = false  "false = acc. TC2007; true = acc. SDLWindV"annotation(
    Dialog(group = "Current Controller Parameters"));
  parameter Types.PerUnit maxAbsCur = 1 "Max. allowed absolute current"annotation(
    Dialog(group = "Current Controller Parameters"));
  parameter Types.PerUnit maxIq = 1 "Max.abs reactive current in normal operation"annotation(
    Dialog(group = "Current Controller Parameters"));
  OpenIPSL.Interfaces.PwPin p annotation(
    Placement(visible = true, transformation(origin = {210, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Solar.PowerFactory.DIgSILENT.Controller controller(Deadband = Deadband, K_FRT = K_FRT, Kp = Kp, Tip = Tip, Tmpp = Tmpp, Tr = Trm, U_min = U_min, i_EEG = i_EEG,id0 = P_0 / M_b / v_0, id_max = id_max, id_min = id_min, iq0 = -Q_0 / M_b / v_0, iq_max = iq_max, iq_min = iq_min, maxAbsCur = maxAbsCur, maxIq = maxIq, uac0 = v_0)  annotation(
    Placement(visible = true, transformation(origin = {80, -2}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant not_implemented_FRT(k = 1)  annotation(
    Placement(visible = true, transformation(origin = {-10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Solar.PowerFactory.DIgSILENT.DCBusBar busbar(C = C)  annotation(
    Placement(visible = true, transformation(origin = {-30, 15}, extent = {{-30, -15}, {30, 15}}, rotation = 0)));
  OpenIPSL.Electrical.Solar.PowerFactory.General.ElmGenstat gen(M_b = M_b,angle_0 = angle_0, v_0 = v_0)  annotation(
    Placement(visible = true, transformation(origin = {160.25, -0.4}, extent = {{-19.75, -31.6}, {19.75, 31.6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain pu_to_W(k = S_b)  annotation(
    Placement(visible = true, transformation(origin = {150, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Solar.PowerFactory.DIgSILENT.PVArray pv_array(Impp_stc = Impp_stc, Isc_stc = Isc_stc,P_init = P_0, Tr = Tr, U0_stc = U0_stc, Umpp_stc = Umpp_stc, ai = ai, au = au, n_parallel = n_parallel, n_series = n_series, use_input_E = false, use_input_theta = false)  annotation(
    Placement(visible = true, transformation(origin = {-130, 10}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
equation
  connect(not_implemented_FRT.y, controller.pred) annotation(
    Line(points = {{1, -70}, {46.5, -70}, {46.5, -23}, {53, -23}}, color = {0, 0, 127}));
  connect(gen.p, p) annotation(
    Line(points = {{180, 0}, {210, 0}}, color = {0, 0, 255}));
  connect(gen.P, pu_to_W.u) annotation(
    Line(points = {{182, -8}, {190, -8}, {190, -50}, {162, -50}}, color = {0, 0, 127}));
  connect(busbar.I_pv, pv_array.Iarray) annotation(
    Line(points = {{-57, 22.5}, {-96, 22.5}, {-96, 26}}, color = {0, 0, 127}));
  connect(pu_to_W.y, busbar.P_conv) annotation(
    Line(points = {{140, -50}, {-80, -50}, {-80, 7}, {-57, 7}}, color = {0, 0, 127}));
  connect(controller.id_ref, gen.id_ref) annotation(
    Line(points = {{114, 14}, {120, 14}, {120, 20}, {144, 20}, {144, 20}}, color = {0, 0, 127}));
  connect(controller.iq_ref, gen.iq_ref) annotation(
    Line(points = {{114, -16}, {126, -16}, {126, 8}, {144, 8}, {144, 8}}, color = {0, 0, 127}));
  connect(pv_array.Vmpp_array, controller.vdcref) annotation(
    Line(points = {{-96, -4}, {40, -4}, {40, 6}, {54, 6}, {54, 8}}, color = {0, 0, 127}));
  connect(busbar.Udc, controller.vdcin) annotation(
    Line(points = {{2, 16}, {40, 16}, {40, 20}, {54, 20}, {54, 20}}, color = {0, 0, 127}));
  connect(gen.v, controller.uac) annotation(
    Line(points = {{182, 20}, {188, 20}, {188, 42}, {22, 42}, {22, -12}, {54, -12}, {54, -10}}, color = {0, 0, 127}));
  connect(pv_array.Uarray, busbar.Udc) annotation(
    Line(points = {{-156, 32}, {-180, 32}, {-180, 60}, {12, 60}, {12, 14}, {2, 14}, {2, 16}}, color = {0, 0, 127}));
protected
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Line(origin = {0, 60.3123}, points = {{-100, 39.6877}, {0, -40.3123}, {100, 39.6877}, {100, 39.6877}})}),
        Documentation(info = "<html>
<p>
A PV Plant implemented according to the DIgSILENT template in PowerFactory. 
</p>
<p>NOTE 1: The PLL Dynamics are missing along with the active power reduction models for FRT events.
</p>
<p>NOTE 2: Keep in mind that if external irradiance is connected it needs to be matched for the inital active power for steady-state initialization.
</p>
</html>", revisions = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Model Name</p></td>
<td><p>DIgSILENT PV System 3PH</p></td>
</tr>
<tr>
<td><p>Reference</p></td>
<td><p>PowerFactory Implementation in \DIgSILENT Library\Templates\Photovoltaic</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>January 2021</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Tin Rabuzin, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
<tr>
<td><p>Model Verification</p></td>
<td><p>This model has not been verified against PowerFactory.</p></td>
</tr>
<tr>
<td><p>Description</p></td>
<td><p></p></td>
</tr>
</table>
</html>"));
end PV_Plant;
