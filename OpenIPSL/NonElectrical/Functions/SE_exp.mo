within OpenIPSL.NonElectrical.Functions;
function SE_exp "Exponential Saturation Function (PTI PSS/E) "
  extends Modelica.Icons.Function;
  input Real u "Unsaturated Input";
  input Real S_EE_1 "Saturation factor at point E_1";
  input Real S_EE_2 "Saturation factor at point E_2";
  input Real E_1 "First saturation point";
  input Real E_2 "Second saturation point";
  output Real sys "Saturated Output";
protected
  parameter Real X=log(S_EE_2/S_EE_1)/log(E_2);
algorithm
  sys := S_EE_1*u^X;
  annotation (Documentation);
end SE_exp;
