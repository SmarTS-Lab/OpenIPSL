within OpenIPSL.Electrical.Wind.PSAT.PSAT_Type_3;
model MechaBlk
  Modelica.Blocks.Interfaces.RealInput Tm "engine shaft torque" annotation (
      Placement(
      transformation(
        extent={{-102.0,54.0},{-62.0,94.0}},
        origin={-43.0,7.7602},
        rotation=0),
      visible=true,
      iconTransformation(
        origin={2.0,-24.0},
        extent={{-102.0,54.0},{-62.0,94.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput Tel "electromagnetical torque"
    annotation (Placement(
      transformation(
        extent={{-102.0,54.0},{-62.0,94.0}},
        origin={-43.0,-34.0},
        rotation=0),
      visible=true,
      iconTransformation(
        origin={2.0,-124.0},
        extent={{-102.0,54.0},{-62.0,94.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput omega_m "engine shaft angular velocity"
    annotation (Placement(
      transformation(
        extent={{102.0,54.0},{62.0,94.0}},
        origin={43.0,-74.0},
        rotation=0),
      visible=true,
      iconTransformation(
        origin={-2.0,-74.0},
        extent={{102.0,54.0},{62.0,94.0}},
        rotation=0)));
  parameter Real Sbase=100 "Power Rating [Normalization Factor] (MVA)";
  parameter Real Pnom=10 "Nominal Power (MVA)";
  parameter Real Hm=0.3 "inertia (pu)";
  parameter Real Pc=0.016 "p.u. Input, PowerFlow";
initial equation
  if Pc < Pnom/Sbase and Pc > 0 then
    omega_m = 0.5*Pc*Sbase/Pnom + 0.5;
  elseif Pc*Sbase >= Pnom then
    omega_m = 1;
  else
    omega_m = 0.5;
  end if;
  Tel = Tm;
equation
  der(omega_m) = (Tm - Tel)/(2*Hm);
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
          origin={-1.9109,6.1667},
          fillPattern=FillPattern.Solid,
          extent={{-49.8299,-36.1667},{49.8299,36.1667}},
          textString="meca",
          fontName="Arial")}),
    Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={5,5})),
    Documentation);
end MechaBlk;
