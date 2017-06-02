within OpenCPSD5d3B.NoiseInjections;
model WienerProcessInjection
  extends BaseClass;

initial equation
  P = 0;

equation
  der(P) = noise_gen.y;
  Q = 0;
end WienerProcessInjection;
