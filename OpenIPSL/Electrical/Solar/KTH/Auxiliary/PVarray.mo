within OpenIPSL.Electrical.Solar.KTH.Auxiliary;
model PVarray
  Modelica.Blocks.Interfaces.RealInput V1(start=Vmp) "Voltage" annotation (
      Placement(
      visible=true,
      transformation(
        origin={-168.2602,-0.0},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0),
      iconTransformation(
        origin={-120.0,70.0},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0)));
  parameter Real Vt=(2*Vmp - Vocref)*(Iscref - Imp)/(Imp + (Iscref - Imp)*log((
      Iscref - Imp)/Iscref));
  parameter Real Rs=(Vt*log((Iscref - Imp)/Iscref) + Vocref - Vmp)/Imp;
  Modelica.Blocks.Interfaces.RealInput E(start=Estc) "Irradiance" annotation (
      Placement(
      visible=true,
      transformation(
        origin={-170.0,80.0},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0),
      iconTransformation(
        origin={-120.0,0.0},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput T(start=Tstc) "Temperature" annotation (
      Placement(
      visible=true,
      transformation(
        origin={-168.0185,40.0},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0),
      iconTransformation(
        origin={-120.0,-70.0},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0)));
  parameter Real Imp=1;
  parameter Real Vmp=1;
  parameter Real Iscref=1
    "Module short-circuit current reference at reference temp and irradiance";
  parameter Real Vocref=1
    "Module open-circuit voltage reference at reference temp and irradiance";
  parameter Real Kv=1 "temperature correction factor for the voltage";
  parameter Real Ki=1 "temperature correction factor for the current";
  parameter Real Tstc=1 "Temperature at the standard test conditions";
  parameter Real Estc=1 "Irradiance at the standard test conditions";
  Real Voct;
  Real Voc;
  Real Isct;
  Real Isc;
  Real I0 "diode dark current";
  Real Iph;
  Real Id;
  Modelica.Blocks.Interfaces.RealOutput I(start=Imp) annotation (Placement(
      visible=true,
      transformation(
        origin={160.0,60.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0),
      iconTransformation(
        origin={110.0,40.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput V(start=Vmp) annotation (Placement(
      visible=true,
      transformation(
        origin={160.0,21.9548},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0),
      iconTransformation(
        origin={110.0,-34.2738},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
equation
  Voct = Vocref + Kv*(T - Tstc);
  Voc = Voct*log(E)/log(Estc);
  Isct = Iscref*(1 + Ki/100*(T - Tstc));
  Isc = Isct*E/Estc;
  I0 = Isct/exp(Voct/Vt);
  Iph = Isc;
  Id = I0*exp((V + I*Rs)/Vt);
  I = Iph - Id;
  V = V1;
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
          origin={40.0,0.0},
          fillPattern=FillPattern.Solid,
          extent={{-45.9305,-23.3368},{45.9305,23.3368}},
          textString="%name",
          fontName="Arial"),Text(
          visible=true,
          origin={-46.5008,63.2046},
          fillPattern=FillPattern.Solid,
          extent={{-51.9003,-55.1779},{51.9003,55.1779}},
          textString="Vdc(ex=35)",
          fontName="Arial"),Text(
          visible=true,
          origin={-80.0,0.0},
          fillPattern=FillPattern.Solid,
          extent={{-12.8628,-13.6751},{12.8628,13.6751}},
          textString="E",
          fontName="Arial"),Text(
          visible=true,
          origin={-80.0,-70.0},
          fillPattern=FillPattern.Solid,
          extent={{-12.8628,-13.6751},{12.8628,13.6751}},
          textString="T",
          fontName="Arial"),Text(
          visible=true,
          origin={70.7131,40.0},
          fillPattern=FillPattern.Solid,
          extent={{-20.7131,-17.8652},{20.7131,17.8652}},
          textString="Ipv(4.58)",
          fontName="Arial"),Text(
          visible=true,
          origin={70.0,-37.1013},
          fillPattern=FillPattern.Solid,
          extent={{-25.1013,-17.1013},{25.1013,17.1013}},
          textString="Vpv(35)",
          fontName="Arial")}),
    Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={5,5})),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>TBD</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>TBD</td>
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
end PVarray;
