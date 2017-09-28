within OpenIPSL.Electrical.Wind.PSAT.PSAT_Type_3;
model PitchControl
  Modelica.Blocks.Interfaces.RealInput omega_m "Real voltage" annotation (
      Placement(
      transformation(
        extent={{-102.0,54.0},{-62.0,94.0}},
        origin={-43.0,-74.0},
        rotation=0),
      visible=true,
      iconTransformation(
        origin={2.0,-74.0},
        extent={{-102.0,54.0},{-62.0,94.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput theta_p(start=theta_p0)
    "saturated theta_p" annotation (Placement(
      transformation(
        extent={{102.0,54.0},{62.0,94.0}},
        origin={46.3073,-74.0},
        rotation=0),
      visible=true,
      iconTransformation(
        origin={-2.0,-74.0},
        extent={{102.0,54.0},{62.0,94.0}},
        rotation=0)));
  parameter Real Kp=10 "Pitch control gain (pu)";
  parameter Real Tp=3 "Pitch control time constant (s)";
  parameter Real theta_p0=0;
  parameter Real theta_p_min;
  parameter Real theta_p_max;
  Real theta_pI "internal non-saturated theta_p";
  Real phi;
initial equation
  (Kp*phi - theta_pI)/Tp = 0;
equation
  theta_p = min(max(theta_pI, theta_p_min), theta_p_max);
  phi = ceil(0.5*floor(1000*(omega_m - 1)*2))/1000;
  der(theta_pI) = (Kp*phi - theta_p)/Tp;
  when theta_pI > theta_p_max and der(theta_pI) < 0 then
    reinit(theta_pI, theta_p_max);
  elsewhen theta_pI < theta_p_min and der(theta_pI) > 0 then
    reinit(theta_pI, theta_p_min);
  end when;
  annotation (
    Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={10,10}), graphics={Rectangle(
          visible=true,
          fillColor={255,255,255},
          extent={{-100.0,-100.0},{100.0,100.0}}),Text(
          visible=true,
          origin={0.0,3.0984},
          fillPattern=FillPattern.Solid,
          extent={{-44.9792,-41.316},{44.9792,41.316}},
          textString="pitch",
          fontName="Arial")}),
    Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={5,5})),
    Documentation);
end PitchControl;
