within OpenIPSL;
model ModelValidation
  import Modelica.Utilities.Strings;
  parameter String refName "Name of the reference file";
  parameter String variableList[:, 2] "Test Array";
end ModelValidation;
