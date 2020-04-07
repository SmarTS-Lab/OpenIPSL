within OpenCPSD5d3B.Breakers;
model Breaker
  import Modelica.ComplexMath.j;
  OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(extent={{-100,
            -10},{-80,10}}), iconTransformation(extent={{-100,-10},{-80,10}})));
  OpenIPSL.Interfaces.PwPin n annotation (Placement(transformation(extent={{80,
            -10},{100,10}}), iconTransformation(extent={{80,-10},{100,10}})));
  Complex vs(re=p.vr, im=p.vi);
  Complex vr(re=n.vr, im=n.vi);
  Complex is(re=p.ir, im=p.ii);
  Complex ir(re=n.ir, im=n.ii);
  Modelica.Blocks.Interfaces.BooleanInput TRIGGER annotation (Placement(
        transformation(extent={{-32,80},{-12,100}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,90})));
equation
  if not TRIGGER then
    is = 0 + j*0;
    ir = 0 + j*0;
  else
    ir = is;
    vs = vr;
  end if;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-80,-80},
            {80,80}}), graphics={Ellipse(
          extent={{-80,80},{80,-80}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-80,-80},{80,80}})));
end Breaker;
