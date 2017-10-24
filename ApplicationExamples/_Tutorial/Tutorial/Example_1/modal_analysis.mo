within Tutorial.Example_1;
function modal_analysis
  import Modelica_LinearSystems2.StateSpace;
  import Modelica_LinearSystems2.TransferFunction;
  input String pathToPlantModel="Tutorial.Example_1.Example_1";
  output Modelica_LinearSystems2.StateSpace ss;
algorithm
  // LINEARIZE the model
  ss := Modelica_LinearSystems2.ModelAnalysis.Linearize(pathToPlantModel);
  //  Modelica.Utilities.Streams.print(String(ss));
  // Check eigenvalues of the open-loop
  Modelica.Math.Matrices.eigenValues(ss.A);
  annotation (Documentation);
end modal_analysis;
