within iPSL.Electrical.Branches.PSSE.Old_transformer.update;
model TransformerParameter "Basic Two Winding Transformer"
  constant Real pi=Modelica.Constants.pi;
  parameter Real R "Resistance p.u." annotation (Dialog(group=" The measured impedance across the windings"));
  parameter Real X "Reactance p.u." annotation (Dialog(group=" The measured impedance across the windings"));
  parameter Real G "Magnetizing impedance on From side p.u." annotation (Dialog(group=" The measured impedance across the windings"));
  parameter Real B "Magnetizing impedance on From side p.u." annotation (Dialog(group=" The measured impedance across the windings"));
  parameter Real ti "From side winding tap ratio" annotation (Dialog(group=" Norminal turns ratio"));
  parameter Real tj "To side winding tap ratio" annotation (Dialog(group=" Norminal turns ratio"));
  //parameter Real phase " From side and To side phase shift in degree";
  //protected
  // parameter Real A = (-phase * pi / 180) + 0.5 * pi;
  parameter Real Req=tj^2*R "Equivalent impedance is always transfered to the 'To' side circuit";
  parameter Real Xeq=tj^2*X "Equivalent impedance is always transfered to the 'To' side circuit";
  annotation (Documentation(revisions="<html>
<!--DISCLAIMER-->
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
</html>"));
end TransformerParameter;
