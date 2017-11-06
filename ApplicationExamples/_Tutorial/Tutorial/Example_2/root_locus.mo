within Tutorial.Example_2;
function root_locus
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
  // Carry out root locus
  Modelica_LinearSystems2.Utilities.Plot.rootLocusOfModel(pathToPlantModel, {
    Modelica_LinearSystems2.Records.ParameterVariation(
    Name="G1.avr.K0",
    grid=Modelica_LinearSystems2.Types.Grid.Equidistant,
    Value=200,
    Min=0,
    Max=200,
    nPoints=50)});
  annotation (Documentation);
end root_locus;
