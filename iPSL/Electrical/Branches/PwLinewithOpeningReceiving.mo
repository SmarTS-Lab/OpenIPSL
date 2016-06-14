within iPSL.Electrical.Branches;
model PwLinewithOpeningReceiving "Transmission Line based on the pi-equivalent circuit
              with an opening event on the receiving node. Developed by AIA.
              2014/03/10"
  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-80,-10},{-60,10}}), iconTransformation(extent={{-80,-10},{-60,10}})));
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{60,-10},{80,10}}), iconTransformation(extent={{60,-10},{80,10}})));
  parameter Real R "Resistance p.u.";
  parameter Real X "Reactance p.u.";
  parameter Real G "Shunt half conductance p.u.";
  parameter Real B "Shunt half susceptance p.u.";
  parameter Real t1 "Start time of the opening";
  parameter Real t2 "End time of the opening";
  Real Zr;
  Real Zi;
equation
  Zr = R*G + X*B;
  Zi = R*B + X*G;
  if time > t1 then
    if time < t2 then
      p.vr*(2.0*G + G*Zr - B*Zi) - p.vi*(2.0*B + Zr*B + Zi*G) = p.ir*(1.0 + Zr) - p.ii*Zi;
      p.vr*(2.0*B + Zr*B + Zi*G) + p.vi*(2.0*G + G*Zr - B*Zi) = p.ir*Zi + p.ii*(1.0 + Zr);
      n.ii = 0.0;
      n.ir = 0.0;
    else
      R*(n.ir - G*n.vr + B*n.vi) - X*(n.ii - B*n.vr - G*n.vi) = n.vr - p.vr;
      R*(n.ii - B*n.vr - G*n.vi) + X*(n.ir - G*n.vr + B*n.vi) = n.vi - p.vi;
      R*(p.ir - G*p.vr + B*p.vi) - X*(p.ii - B*p.vr - G*p.vi) = p.vr - n.vr;
      R*(p.ii - B*p.vr - G*p.vi) + X*(p.ir - G*p.vr + B*p.vi) = p.vi - n.vi;
    end if;
  else
    R*(n.ir - G*n.vr + B*n.vi) - X*(n.ii - B*n.vr - G*n.vi) = n.vr - p.vr;
    R*(n.ii - B*n.vr - G*n.vi) + X*(n.ir - G*n.vr + B*n.vi) = n.vi - p.vi;
    R*(p.ir - G*p.vr + B*p.vi) - X*(p.ii - B*p.vr - G*p.vi) = p.vr - n.vr;
    R*(p.ii - B*p.vr - G*p.vi) + X*(p.ir - G*p.vr + B*p.vi) = p.vi - n.vi;
  end if;
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
end PwLinewithOpeningReceiving;
