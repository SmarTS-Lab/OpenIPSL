within iPSL.Electrical.Wind.PSSE.WT4G.Submodels;
model HVRCL
  //The 'High Voltage Reactive Current Management' block limits the reactive current injected into the network equations such that the terminal voltage of the machine never exceeds Volim of nominal, as long as the converter is within current limits."
  parameter Real VHVRCR "Threthod voltage for HVRCL";
  parameter Real CurHVRCR "Max. reactive current at VHVRCR";
  Modelica.Blocks.Interfaces.RealInput Vt annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=90,
        origin={15,-19}), iconTransformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={0,-35})));
  Modelica.Blocks.Interfaces.RealOutput Iq_HVRCL annotation (Placement(transformation(extent={{42,4},{60,22}}), iconTransformation(extent={{40,-10},{60,10}})));
  Modelica.Blocks.Interfaces.RealInput Iq annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=0,
        origin={-27,11}), iconTransformation(extent={{-40,-5},{-30,5}})));
equation
  if Vt > VHVRCR then
    Iq_HVRCL = CurHVRCR;
  else
    Iq_HVRCL = Iq;
  end if;
  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-40,-40},{40,40}},
        grid={1,1}), graphics),
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-40,-40},{40,40}},
        grid={1,1}), graphics={
        Rectangle(
          extent={{-40,40},{40,-40}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-20,40},{20,30}},
          lineColor={0,0,255},
          textString="HVRCL "),
        Line(
          points={{14,30},{-6,30},{-16,10},{-16,10}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),
        Text(
          extent={{-28,3},{-20,-3}},
          lineColor={0,0,255},
          textString="I_q"),
        Text(
          extent={{-5,-21},{5,-29}},
          lineColor={0,0,255},
          textString="V"),
        Text(
          extent={{19,4},{38,-4}},
          lineColor={0,0,255},
          textString="I_sorc")}),
    Documentation(info="<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
end HVRCL;
