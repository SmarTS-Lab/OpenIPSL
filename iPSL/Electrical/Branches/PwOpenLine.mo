within iPSL.Electrical.Branches;
model PwOpenLine "Transmission Line based on the pi-equivalent circuit
             open at the Receiving/Sending end. 2014/04/28"
  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-80,-10},{-60,10}}), iconTransformation(extent={{-80,-10},{-60,10}})));
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{60,-10},{80,10}}), iconTransformation(extent={{60,-10},{80,10}})));
  parameter Real R "Resistance p.u.";
  parameter Real X "Reactance p.u.";
  parameter Real G "Shunt half conductance p.u.";
  parameter Real B "Shunt half susceptance p.u.";
  parameter Boolean OpenR_end "Open at Receiving end (true), Open at Sending end (false)";
  Real Zr;
  Real Zi;
equation
  Zr = R*G - X*B;
  Zi = R*B + X*G;
  if OpenR_end == true then
    p.vr*(2.0*G + G*Zr - B*Zi) - p.vi*(2.0*B + Zr*B + Zi*G) = p.ir*(1.0 + Zr) - p.ii*Zi;
    p.vr*(2.0*B + Zr*B + Zi*G) + p.vi*(2.0*G + G*Zr - B*Zi) = p.ir*Zi + p.ii*(1.0 + Zr);
    n.vr - p.vr*(1.0 + Zr) + p.vi*Zi = (-p.ir*R) + p.ii*X;
    n.vi - p.vi*(1.0 + Zr) - p.vr*Zi = (-p.ir*X) - p.ii*R;
  else
    n.vr*(2.0*G + G*Zr - B*Zi) - n.vi*(2.0*B + Zr*B + Zi*G) = n.ir*(1.0 + Zr) - n.ii*Zi;
    n.vr*(2.0*B + Zr*B + Zi*G) + n.vi*(2.0*G + G*Zr - B*Zi) = n.ir*Zi + n.ii*(1.0 + Zr);
    p.vr - n.vr*(1.0 + Zr) + n.vi*Zi = (-n.ir*R) + n.ii*X;
    p.vi - n.vi*(1.0 + Zr) - n.vr*Zi = (-n.ir*X) - n.ii*R;
  end if;
  // Open at Receiving node
  // Open at Sending node
  annotation (
    Icon(graphics={Rectangle(extent={{-60,40},{60,-42}}, lineColor={0,0,255}),Rectangle(
          extent={{-40,10},{40,-10}},
          lineColor={0,0,255},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),Line(
          points={{-38,16},{4,16},{24,30}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{34,18},{40,18}},
          color={0,0,255},
          smooth=Smooth.None),Ellipse(extent={{28,22},{34,16}}, lineColor={0,0,255})}),
    Diagram(graphics),
    Documentation(revisions="<html>
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
end PwOpenLine;
