within OpenIPSL.Electrical.Banks;
model PwShuntB
  parameter Real B "(pu) on system base";
  Complex I;
  Complex V;
  Real v;
  Complex S;
  OpenIPSL.Interfaces.PwPin p
    annotation (Placement(transformation(extent={{-10,88},{10,108}})));
equation
  v = sqrt(p.vr^2 + p.vi^2);
  I = Complex(p.ir, p.ii);
  V = Complex(p.vr, p.vi);
  I = Complex(0, B)*V;
  S = Complex(p.vr, p.vi)*Complex(p.ir, -p.ii) annotation (Diagram(
        coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
        graphics), Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
            -100},{100,100}}), graphics={Rectangle(extent={{-100,100},{100,-100}},
          lineColor={0,0,255}),Text(
          extent={{-60,60},{60,-60}},
          lineColor={0,0,255},
          textStyle={TextStyle.Bold},
          textString="jB")}));
  annotation (Documentation);
end PwShuntB;
