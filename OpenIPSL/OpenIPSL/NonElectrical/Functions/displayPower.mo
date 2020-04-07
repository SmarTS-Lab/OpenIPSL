within OpenIPSL.NonElectrical.Functions;
function displayPower
  "A function to generate a nice string of a power variable with unit attached."
  extends Modelica.Icons.Function;
  input Real pwrVar "Variable to be converted into a string";
  input String unitStr "Unit string to be appended";
  output String pwrDsp "Resultant display string";
algorithm
  pwrDsp := String(abs(pwrVar)/1e6, format=".1f") + unitStr;
end displayPower;
