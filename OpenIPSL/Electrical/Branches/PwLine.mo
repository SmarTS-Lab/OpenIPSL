within OpenIPSL.Electrical.Branches;
model PwLine "Model for a transmission Line based on the pi-equivalent circuit"
  outer OpenIPSL.Electrical.SystemBase SysData;
  import Modelica.ComplexMath.conj;
  import Modelica.ComplexMath.real;
  import Modelica.ComplexMath.imag;
  import Modelica.ComplexMath.j;
  OpenIPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-80,-10},{-60,10}}), iconTransformation(extent={{-80,-10},{-60,10}})));
  OpenIPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{60,-10},{80,10}}), iconTransformation(extent={{60,-10},{80,10}})));
  parameter Real R "Resistance (pu)" annotation (Dialog(group="Line parameters"));
  parameter Real X "Reactance (pu)" annotation (Dialog(group="Line parameters"));
  parameter Real G "Shunt half conductance (pu)" annotation (Dialog(group="Line parameters"));
  parameter Real B "Shunt half susceptance (pu)" annotation (Dialog(group="Line parameters"));
  parameter Real S_b=SysData.S_b "System base power (MVA)" annotation (Dialog(group="Line parameters", enable=false));
  parameter Real t1=Modelica.Constants.inf annotation (Dialog(group="Perturbation parameters"));
  parameter Real t2=Modelica.Constants.inf annotation (Dialog(group="Perturbation parameters"));
  parameter Integer opening=1
    annotation (Dialog(group="Perturbation parameters"), choices(
      choice=1 "Line opening at both ends",
      choice=2 "Line opening at sending end",
      choice=3 "Line opening at receiving end"));
  parameter Boolean displayPF=false "Enable/Disable"
    annotation (Dialog(
      group="Display Power Flow Results",
      __Dymola_compact=true,
      __Dymola_descriptionLabel=true), choices(__Dymola_checkBox=true));
  Real P12;
  Real P21;
  Real Q12;
  Real Q21;
  Complex vs(re=p.vr, im=p.vi);
  Complex is(re=p.ir, im=p.ii);
  Complex vr(re=n.vr, im=n.vi);
  Complex ir(re=n.ir, im=n.ii);
protected
  parameter Complex Y(re=G, im=B);
  parameter Complex Z(re=R, im=X);
equation
  //Calculations for the power flow display
  P12 = real(vs*conj(is))*S_b;
  P21 = -real(vr*conj(ir))*S_b;
  Q12 = imag(vs*conj(is))*S_b;
  Q21 = -imag(vr*conj(ir))*S_b;
  //PI model with different line openings
  if time >= t1 and time < t2 then
    if opening == 1 then
      is = Complex(0);
      ir = Complex(0);
    elseif opening == 2 then
      is = Complex(0);
      ir = (vr - ir*Z)*Y;
    else
      ir = Complex(0);
      is = (vs - is*Z)*Y;
    end if;
  else
    vs - vr = Z*(is - vs*Y);
    vr - vs = Z*(ir - vr*Y);
  end if;
  annotation (
    Icon(coordinateSystem(
        extent={{-60,-40},{60,40}},
        preserveAspectRatio=true,
        initialScale=0.1), graphics={Rectangle(
          extent={{-60,40},{60,-40}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Rectangle(
          extent={{-40,10},{40,-10}},
          lineColor={0,0,255},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),Text(
          visible=displayPF,
          extent={{-106,82},{-18,36}},
          lineColor={238,46,47},
          textString=DynamicSelect("0.0", String(P12, significantDigits=2))),Text(
          visible=displayPF,
          extent={{24,82},{112,36}},
          lineColor={238,46,47},
          textString=DynamicSelect("0.0", String(P21, significantDigits=2))),Text(
          visible=displayPF,
          extent={{20,-54},{108,-100}},
          lineColor={0,255,0},
          textString=DynamicSelect("0.0", String(Q21, significantDigits=2))),Text(
          visible=displayPF,
          extent={{-108,-54},{-20,-100}},
          lineColor={0,255,0},
          textString=DynamicSelect("0.0", String(Q12, significantDigits=2))),Line(
          visible=displayPF,
          points={{-86,86},{-38,86},{-46,92}},
          color={0,0,0}),Line(
          visible=displayPF,
          points={{-38,86},{-46,80}},
          color={0,0,0}),Line(
          visible=displayPF,
          points={{42,86},{90,86},{82,92}},
          color={0,0,0}),Line(
          visible=displayPF,
          points={{90,86},{82,80}},
          color={0,0,0}),Line(
          visible=displayPF,
          points={{-88,-54},{-40,-54},{-48,-48}},
          color={0,0,0}),Line(
          visible=displayPF,
          points={{-80,-48},{-80,-60}},
          color={0,0,0}),Line(
          visible=displayPF,
          points={{-40,-54},{-48,-60}},
          color={0,0,0}),Line(
          visible=displayPF,
          points={{48,-48},{48,-60}},
          color={0,0,0}),Line(
          visible=displayPF,
          points={{40,-54},{88,-54},{80,-48}},
          color={0,0,0}),Line(
          visible=displayPF,
          points={{88,-54},{80,-60}},
          color={0,0,0})}),
    Diagram(coordinateSystem(
        extent={{-60,-40},{60,40}},
        preserveAspectRatio=true,
        initialScale=0.1)),
    uses(Modelica(version="3.2.1")),
    Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>OpenIPSL:</p>
<p>Copyright 2016 SmarTS Lab (Sweden)</p>
<ul>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>

<p></p>
<p>iPSL:</p>
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>
"));
end PwLine;

