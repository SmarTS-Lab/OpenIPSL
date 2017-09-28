within OpenIPSL.Electrical.Wind;
model WindGenerator
  import Modelica.Constants.pi;
  import Modelica.Constants.e;
  Modelica.Blocks.Interfaces.RealOutput Vw "Connector of Real output signal"
    annotation (Placement(
      transformation(
        extent={{100.0,-10.0},{120.0,10.0}},
        rotation=0,
        origin={0.0,0.0}),
      visible=true,
      iconTransformation(
        origin={0.0,0.0},
        extent={{100.0,-10.0},{120.0,10.0}},
        rotation=0)));
  parameter Real tstart=5 "Start time of the wind gust";
  parameter Real tstop=10 "Stop time of the wind gust";
  parameter Real v0=14 "steady state wind speed";
  parameter Real vmax=25 "peak wind speed for Mexican Hat";
  parameter Real wmag=-4 "magnitude of the gust of wind";
  parameter Real sigma=1 "Mexican hat wavelet shape factor";
  parameter Real typ=1 "1:constant 2:gust 3:mexican hat";
protected
  parameter Real wgwidth=tstop - tstart;
equation
  if typ == 1 then
    Vw = v0;
  elseif typ == 2 then
    if time > tstart and time < tstop then
      Vw = v0 + wmag*(1 - cos((time - tstart)*2*Modelica.Constants.pi/wgwidth))
        /2;
    else
      Vw = v0;
    end if;
  else
    Vw = v0 + (vmax - v0)*(1 - (time - (tstop + tstart)/2)^2/sigma^2)*Modelica.Constants.e
      ^(-(time - (tstop + tstart)/2)^2/(2*sigma^2))
      "2/(sqrt(3*sigma)*Modelica.Constants.pi^(1/4))*(1 - ((time - (tstop + tstart)/2)/sigma)^2)*Modelica.Constants.e^((-((time - (tstop + tstart)/2)/sigma)^2)/(2*sigma^2)) + v0";
  end if;
  annotation (
    Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={10,10}), graphics={Rectangle(
          visible=true,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineThickness=0.75,
          extent={{-100.0,-100.0},{100.0,100.0}}),Bitmap(
          visible=true,
          origin={-0.1255,0},
          extent={{-99.8745,-96.8769},{99.8745,96.877}},
          fileName="modelica://OpenIPSL/Resources/Images/WindGenerator.png")}),

    Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={5,5})),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>Mexican Hat, PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>July 2015</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Maxime Baudette, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end WindGenerator;
