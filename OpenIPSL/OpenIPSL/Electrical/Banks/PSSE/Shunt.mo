within OpenIPSL.Electrical.Banks.PSSE;
model Shunt
  parameter SI.PerUnit G "(pu) on system base";
  parameter SI.PerUnit B "(pu) on system base";
  Complex I;
  Complex V;
  SI.PerUnit v;
  Complex S;
  OpenIPSL.Interfaces.PwPin p
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));
equation
  v = sqrt(p.vr^2 + p.vi^2);
  I = Complex(p.ir, p.ii);
  V = Complex(p.vr, p.vi);
  I = Complex(G, B)*V;
  S = Complex(p.vr, p.vi)*Complex(p.ir, -p.ii);
  annotation (Documentation(info="<html>
Shunt model from Nordic44 system developed by Giuseppe.
</html>"),
Icon(graphics={Rectangle(extent={{-100,
          100},{100,-100}}, lineColor={0,0,255}),Text(
          extent={{-60,60},{60,-80}},
          lineColor={0,0,255},
          textStyle={TextStyle.Bold},
          textString="Y")}));
end Shunt;
