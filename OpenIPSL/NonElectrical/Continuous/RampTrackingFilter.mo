within OpenIPSL.NonElectrical.Continuous;
model RampTrackingFilter "Ramp-tracking filter"
  extends Modelica.Blocks.Interfaces.SISO;
  import Modelica.Blocks.Continuous;
  parameter Real T_1;
  parameter Real T_2;
  parameter Integer M;
  parameter Integer N;
  Continuous.TransferFunction TF1[M](b=fill({1},M), a=fill({T_2,1},M));
  Continuous.TransferFunction TF2[N](b=fill({T_1,1},N), a=fill({T_2,1},N));

equation
  if M == 0 or N == 0 then
    u = y;
  else
    connect(u, TF1[1].u);
    for i in 1:M-1 loop
      connect(TF1[i].y, TF1[i+1].u);
    end for;
    connect(TF1[M].y, TF2[1].u);
    for i in 1:N-1 loop
      connect(TF2[i].y, TF2[i+1].u);
    end for;
    connect(TF2[N].y, y);
  end if;
  annotation (
    Line(points={{30,0},{110,0}}, color={0,0,127}),
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        initialScale=0.05)),
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        initialScale=0.05), graphics={Rectangle(extent={{-100,100},{100,-100}},
          lineColor={0,0,0}),Text(
          extent={{-58,40},{40,-4}},
          lineColor={0,0,255},
          textString="1+sT"),Text(
          extent={{-64,20},{56,-58}},
          lineColor={0,0,255},
          textString="(1+sT )"),Text(
          extent={{22,28},{44,-4}},
          lineColor={0,0,255},
          textString="1"),Text(
          extent={{24,-10},{46,-42}},
          lineColor={0,0,255},
          textString="2"),Text(
          extent={{54,2},{66,-16}},
          lineColor={0,0,255},
          textString="M"),Line(
          points={{-60,40},{-74,40},{-74,-40},{-60,-40}},
          color={0,0,255},
          thickness=1),Line(
          points={{60,40},{76,40},{76,-40},{60,-40}},
          color={0,0,255},
          thickness=1),Text(
          extent={{76,48},{94,28}},
          lineColor={0,0,255},
          textString="N"),Line(
          points={{-68,0},{70,0}},
          color={0,0,255},
          thickness=1)}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>Ramp-tracking filter up to M*N &LT;=8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2015-08-03</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Tin Rabuzin, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end RampTrackingFilter;
