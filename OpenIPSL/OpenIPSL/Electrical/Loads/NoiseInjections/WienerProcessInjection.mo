within OpenIPSL.Electrical.Loads.NoiseInjections;
model WienerProcessInjection
  extends BaseClass;

initial equation
  y = 0;

equation
  der(y) = noise_gen.y;
end WienerProcessInjection;
