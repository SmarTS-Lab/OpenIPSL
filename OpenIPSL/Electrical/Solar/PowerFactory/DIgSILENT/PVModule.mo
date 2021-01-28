within OpenIPSL.Electrical.Solar.PowerFactory.DIgSILENT;

model PVModule "Model of a single PV module"
  parameter SI.Voltage U0_stc = 43.8 "Open-circuit voltage at Standard Test Conditions";
  parameter SI.Voltage Umpp_stc = 35 "MPP voltage at Standard Test Conditions";
  parameter SI.Current Impp_stc = 4.58 "MPP current at Standard Test Conditions";
  parameter SI.Current Isc_stc = 5 "Short-circuit current at Standard Test Conditions";
  parameter SI.LinearTemperatureCoefficient au = -0.0039 "Temperature correction factor (voltage)";
  parameter SI.LinearTemperatureCoefficient ai = 0.0004 "Temperature correction factor (current)";
  parameter Boolean use_input_E = false "If true irradiance is used as input";
  parameter Boolean use_input_theta = false "If true temperature is used as input";
  parameter SI.ActivePower P_init "Initial active power (needed only if input E is not used)";
  parameter SI.Irradiance E_STC = 1000;
  parameter SI.Temperature theta_STC = 298.15;
  Modelica.Blocks.Interfaces.RealInput U annotation(
    Placement(visible = true, transformation(origin = {-100, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput E if use_input_E annotation(
    Placement(visible = true, transformation(origin = {-100, 30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput theta if use_input_theta annotation(
    Placement(visible = true, transformation(origin = {-100, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput I annotation(
    Placement(visible = true, transformation(origin = {110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {106, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Umpp annotation(
    Placement(visible = true, transformation(origin = {110, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {106, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SI.Irradiance local_E;
  SI.Temperature local_theta;
  SI.Voltage U0 "Open-circuit voltage";
  SI.Current Isc "Short-circuit current";
  SI.Current Impp "MPP Current";
  SI.Power P "PV Module Power";
  Real tempCorrU "Voltage Correction Factor";
  Real tempCorrI "Current Correction Factor";
protected
  Real lnEquot "Logarithm of the irradiance ratio";
  Real c1 "Helper variable";
  Real c2 "Helper variable";
initial equation
if not use_input_E then
  P = P_init;
end if;
equation
// Defining irradiance and temperature in case no input is connected
  if use_input_E then
    local_E = E;
  else
    der(local_E) = 0;
  end if;
  if use_input_theta then
    local_theta = theta;
  else
    local_theta = theta_STC;
  end if;
// Temperature dependency
  tempCorrU = 1 + au * (SI.Conversions.to_degC(local_theta) - 25);
  tempCorrI = 1 + ai * (SI.Conversions.to_degC(local_theta) - 25);
// Open-circuit voltage
  lnEquot = if local_E > 1.0 then log(max(local_E, 1.0)) / log(E_STC) else 0;
// ln(E)/ln(1000W/m2), if E > 1W/m2
  U0 = U0_stc * lnEquot * tempCorrU;
// Open-circuit voltage dependent from E and theta, proportional to log(E)
// Short-circuit current
  Isc = if local_E > 1 then Isc_stc * local_E / E_STC * tempCorrI else 0;
//Current generation only if E>1 (limitation of model)
// Maximum Power Point
  Umpp = Umpp_stc * lnEquot * tempCorrU;
// MPP voltage dependent on E and theta
  Impp = if local_E > 1 then Impp_stc * local_E / E_STC * tempCorrI else 0;

// Helper Variables
  c1 = if U0 > 0 then Umpp - U0 else 1;
// Avoids division by 0 in equation for c2
  if U0 > 0 then
    if c1 < 0 then
      c2 = log(1 - Impp / Isc) / c1;
    else
      c2 = 0;
    end if;
  else
    c2 = 0;
  end if;
// Current output, Current generation only if E>1 (limitation of model)
  I = max(Isc * (1 - exp(c2 * (min(U0, U) - U0))), 0.0); // Blocking diode function included by max- and min-function
  P = Impp * Umpp;
  annotation(
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}})}),
 Documentation(info = "<html>
<p>
Model of a PV Module within a PV array.
</p>
</html>", revisions = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Model Name</p></td>
<td><p>PV Module</p></td>
</tr>
<tr>
<td><p>Reference</p></td>
<td><p>PowerFactory Implementation in Templates</p></td>
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
end PVModule;
