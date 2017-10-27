within OpenCPSD5d3B.NoiseInjections;
partial model BaseClass

  // Parameters to be used by the nois generators
  parameter Real active_mu=0 "Expectation value active power noise";
  parameter Real active_sigma=0.01 "Standard deviation active power noise";

  parameter Real samplePeriod=0.02 "Sample period";
  Real P, Q;

  OpenIPSL.Interfaces.PwPin pin annotation (Placement(
      visible=true,
      transformation(
        origin={-60,30},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={-110,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Noise.NormalNoise noise_gen(
    mu=active_mu,
    samplePeriod=samplePeriod,
    sigma=active_sigma) annotation (Placement(visible=true, transformation(
        origin={20,62},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation
  P = pin.vr*pin.ir - pin.vi*pin.ii;
  Q = pin.vi*pin.ir - pin.vr*pin.ii;
  annotation (Icon(graphics={Ellipse(
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          extent={{-100,100},{100,-100}},
          endAngle=360),Line(
          origin={30,0},
          points={{-100,0},{-80,0},{-70,40},{-60,-20},{-50,20},{-28,-40},{-10,
            40},{0,-20},{12,20},{20,0},{40,0},{40,0}},
          thickness=2)}));
end BaseClass;
