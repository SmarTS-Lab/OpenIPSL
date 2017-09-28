within OpenIPSL.Electrical.Wind.GE.Type_3.Electrical_Control;
model lim_exc_s1
  extends Modelica.Blocks.Interfaces.BlockIcon;
  parameter Real xiqmin=1;
  parameter Real xiqmax=1;
  parameter Real typpe=1;
  Modelica.Blocks.Interfaces.RealInput Efd "Input: Excitation voltage"
    annotation (Placement(
      transformation(
        extent={{-140.0,40.0},{-100.0,80.0}},
        rotation=0,
        origin={0.0,18.0}),
      visible=true,
      iconTransformation(
        origin={0.0,0.0},
        extent={{-140.0,40.0},{-100.0,80.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput Vt "Terminal Voltage" annotation (
      Placement(
      transformation(
        extent={{-140.0,-80.0},{-100.0,-40.0}},
        rotation=0,
        origin={0.0,-18.0}),
      visible=true,
      iconTransformation(
        origin={0.0,0.0},
        extent={{-140.0,-80.0},{-100.0,-40.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput y
    "Output: saturated excitation voltage" annotation (Placement(transformation(
          extent={{100,-10},{120,10}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealInput Vref "Reference Voltage " annotation (
      Placement(
      visible=true,
      transformation(
        origin={0.0,-58.0},
        extent={{-140.0,40.0},{-100.0,80.0}},
        rotation=0),
      iconTransformation(
        origin={0.0,-58.0717},
        extent={{-140.0,40.0},{-100.0,80.0}},
        rotation=0)));
equation
  if typpe == 1 then
    if Efd >= Vt + xiqmax and Vref >= 0 or Efd <= Vt + xiqmin and Vref <= 0
         then
      y = 0;
    else
      y = Vref;
    end if;
  elseif typpe == 2 then
    if Vref >= Vt + xiqmax then
      y = Vt + xiqmax;
    elseif Vref <= Vt + xiqmin then
      y = Vt + xiqmin;
    else
      y = Vref;
    end if;
  else
    y = 0;
  end if;
  annotation (
    Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={10,10}), graphics={Text(
          visible=true,
          origin={-1.349,1.6286},
          fillPattern=FillPattern.Solid,
          extent={{-55.1519,-28.3714},{55.1519,28.3714}},
          textString="lim_exc_s1",
          fontName="Arial")}),
    Documentation(info="<html>
<p>
Block has two continuous Real input vectors u1 and u2 and one
continuous Real output vector y.
All vectors have the same number of elements.
</p>
</html>"),
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics));
end lim_exc_s1;
