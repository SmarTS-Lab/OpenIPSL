within OpenIPSL.Electrical.Controls.PSAT.TG;
model TGTypeI
  Modelica.Blocks.Interfaces.RealInput w "Rotor speed (pu)" annotation (
      Placement(transformation(extent={{-92,-10},{-72,10}}), iconTransformation(
          extent={{-94,-4},{-60,34}})));
  Modelica.Blocks.Interfaces.RealOutput pm "Mechanical power (pu)" annotation (
      Placement(transformation(extent={{70,2},{90,22}}), iconTransformation(
          extent={{78,-8},{116,34}})));
  parameter Real wref=1 "Speed reference (pu)";
  parameter Real pref "Active power reference (pu)";
  parameter Real R "Droop (pu)";
  parameter Real pmax "Maximum turbine output (pu)";
  parameter Real pmin "Minimum turbine output (pu)";
  parameter Real Ts "Governor time constant (s)";
  parameter Real Tc "Servo time constant (s)";
  parameter Real T3 "Transient gain time constant (s)";
  parameter Real T4 "Power fraction time constant (s)";
  parameter Real T5 "Reheat time constant (s)";
  Real pin "Turbine output (pu)";
protected
  parameter Real pin0=pref "Initialization";
  parameter Real xg10=pin0 "Initialization";
  parameter Real xg20=(1 - T3/Tc)*xg10 "Initialization";
  parameter Real xg30=(1 - T4/T5)*(xg20 + T3*xg10/Tc) "Initialization";
  Real pinstar;
  Real xg1(start=xg10, fixed=true);
  Real xg2(start=xg20, fixed=true);
  Real xg3(start=xg30, fixed=true);
equation
  pinstar = pref + (wref - w)/R;
  if pinstar >= pmin and pinstar <= pmax then
    pin = pinstar;
  elseif pinstar > pmax then
    pin = pmax;
  else
    pin = pmin;
  end if;
  der(xg1) = (pin - xg1)/Ts;
  der(xg2) = ((1 - T3/Tc)*xg1 - xg2)/Tc;
  der(xg3) = ((1 - T4/T5)*(xg2 + T3*xg1/Tc) - xg3)/T5;
  pm = xg3 + (xg2 + T3*xg1/Tc)*T4/T5;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            140,100}}), graphics),
    Icon(coordinateSystem(extent={{-100,-100},{140,100}}, preserveAspectRatio=
            false), graphics={Rectangle(extent={{-58,74},{80,-50}}, lineColor={
          0,0,255}),Text(
          extent={{-74,38},{-12,0}},
          lineColor={0,0,255},
          textString="w"),Text(
          extent={{34,22},{82,-14}},
          lineColor={0,0,255},
          textString="pm
    "),Text(
          extent={{-18,-4},{44,-44}},
          lineColor={0,0,255},
          textString="TG1")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Turbine and Governor - control scheme Type I</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-10-02</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Le Qi, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end TGTypeI;
