within OpenIPSL.Electrical.Loads.NoiseInjections;
model WhiteNoiseInjection
  extends BaseClass(noise_gen(startTime=0.1));

equation
  y = noise_gen.y;
end WhiteNoiseInjection;
