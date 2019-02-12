within OpenIPSL.Interfaces;
connector PwPin
  "Connector for electrical blocks treating voltage and current as complex variables"
  SI.PerUnit vr "Real part of the voltage";
  SI.PerUnit vi "Imaginary part of the voltage";
  flow SI.PerUnit ir "Real part of the current";
  flow SI.PerUnit ii "Imaginary part of the current";
  annotation (
    Icon(graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid)}),
    Diagram(graphics={Text(
          extent={{-100,160},{100,120}},
          lineColor={0,0,255},
          textString="%name"),Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid)}),
    Documentation);
end PwPin;
