within OpenIPSL.Examples.Machines.PSSE.Plant;
model SMIB_GENSALPlant "SMIB system with one load and GENSAL model"
  extends OpenIPSL.Examples.SMIBpartial;
PlantGENSAL powerPlant annotation(
    Placement(visible = true, transformation(origin = {-82, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(powerPlant.pwPin, GEN1.p) annotation(
    Line(points = {{-70, 0}, {-40, 0}, {-40, 0}, {-40, 0}}, color = {0, 0, 255}));
  annotation(
    Documentation,
    experiment(StopTime = 10));
end SMIB_GENSALPlant;
