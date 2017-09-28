within OpenIPSL.Electrical.Loads.PSAT;
model ExponentialRecovery "Exponential Recovery Load"
  extends BaseClasses.baseLoad;
  parameter Real Tp=1 "Active power time constant (s)";
  parameter Real Tq=1 "Reactive power time constant (s)";
  parameter Real alpha_s=2 "Static active power exponent";
  parameter Real alpha_t=1.5 "Dynamic active power exponent";
  parameter Real beta_s=2 "Static reactive power exponent";
  parameter Real beta_t=1.5 "Dynamic reactive power exponent";
  Real ps "Static real power absorption (pu)";
  Real pt "Transient real power absorption (pu)";
  Real qs "Static imaginary power absorption (pu)";
  Real qt "Transient imaginary power absorption (pu)";
protected
  Real xp(start=0);
  Real xq(start=0);
equation
  der(xp) = (-xp/Tp) + ps - pt;
  P = xp/Tp + pt;
  ps = P_0/S_b*(V/V_0)^alpha_s;
  pt = P_0/S_b*(V/V_0)^alpha_t;
  der(xq) = (-xq/Tq) + qs - qt;
  Q = xq/Tq + qt;
  qs = Q_0/S_b*(V/V_0)^beta_s;
  qt = Q_0/S_b*(V/V_0)^beta_t;
  annotation (
    Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={10,10})),
    Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={5,5}), graphics={Rectangle(
          visible=true,
          origin={10.0,-2.5},
          lineColor={0,0,128},
          fillColor={255,255,255},
          extent={{-90.0,-82.5},{90.0,82.5}})}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>Exponential Recovery Load, PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>September 2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end ExponentialRecovery;
