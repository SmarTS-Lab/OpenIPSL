within OpenIPSL.Electrical.Solar.KTH.PFblocks;
model Staticgenerator
  parameter Types.ActivePower Pnen=500000 "rated power";
  parameter Types.PerUnit v0=1 "Node voltage" annotation (Dialog(group="Power flow data"));
  parameter Types.Angle anglev0=1 "Node angle" annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit p0=1 "Initial active power" annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit q0=1 "Initial reactive power" annotation (Dialog(group="Power flow data"));
  parameter Types.Time Td=0.00015 "d-axis inverter time constant";
  parameter Types.Time Tq=0.00015 "q-axis inverter time constant";
  Modelica.Blocks.Interfaces.RealInput id_ref annotation (Placement(
      transformation(
        origin={-175.0,55.0},
        extent={{-20.0,-20.0},{20.0,20.0}}),
      iconTransformation(
        origin={-120.0,70.0},
        extent={{-20.0,-20.0},{20.0,20.0}})));
  Modelica.Blocks.Interfaces.RealInput iq_ref annotation (Placement(
      transformation(
        origin={-181.6246,25.0},
        extent={{-20.0,-20.0},{20.0,20.0}}),
      iconTransformation(
        origin={-120.0,20.0},
        extent={{-20.0,-20.0},{20.0,20.0}})));
  OpenIPSL.Interfaces.PwPin p(vr(start=v0*cos(anglev0)), vi(start=v0*sin(
          anglev0))) annotation (Placement(
      transformation(
        origin={147.2097,10.0},
        extent={{-10.0,-10.0},{10.0,10.0}}),
      iconTransformation(
        origin={110.0,0.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Types.Angle anglev;
  Types.PerUnit id;
  Types.PerUnit iq;
  Types.PerUnit Q;
  Modelica.Blocks.Interfaces.RealOutput P(start=p0) annotation (Placement(
      transformation(
        origin={165.1089,-78.9737},
        extent={{-10.0,-10.0},{10.0,10.0}}),
      iconTransformation(
        origin={110.0,-75.213},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Interfaces.RealOutput v(start=v0) annotation (Placement(
      transformation(
        origin={165.1089,-78.9737},
        extent={{-10.0,-10.0},{10.0,10.0}}),
      iconTransformation(
        origin={110.0,70.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
initial equation
  der(iq) = 0;
  der(id) = 0;
equation
  -P = p.vr*p.ir + p.vi*p.ii;
  -Q = p.vi*p.ir - p.vr*p.ii;
  v = sqrt(p.vr^2 + p.vi^2);
  anglev = atan2(p.vi, p.vr);
  der(id) = (id_ref - id)/Td;
  der(iq) = (iq_ref - iq)/Tq;
  p.ir = -(id*cos(anglev) - iq*sin(anglev))*Pnen;
  p.ii = -(id*sin(anglev) + iq*cos(anglev))*Pnen;
  annotation (
    Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        grid={10,10}), graphics={Text(
          origin={-77.7013,70.0105},
          fillPattern=FillPattern.Solid,
          extent={{-12.2987,-8.1753},{12.2987,8.1753}},
          textString="idref",
          fontName="Arial"),Text(
          origin={-77.7013,21.8247},
          fillPattern=FillPattern.Solid,
          extent={{-12.2987,-8.1753},{12.2987,8.1753}},
          textString="iqref",
          fontName="Arial"),Text(
          origin={74.8853,-74.849},
          fillPattern=FillPattern.Solid,
          extent={{-12.2987,-8.1753},{12.2987,8.1753}},
          textString="P,pu",
          fontName="Arial"),Text(
          origin={16.0747,3.9219},
          fillPattern=FillPattern.Solid,
          extent={{-66.0747,-43.9219},{66.0747,43.9219}},
          textString="StaticGen",
          fontName="Arial"),Rectangle(
          fillColor={255,255,255},
          extent={{-100.0,-100.0},{100.0,100.0}}),Text(
          origin={73.4293,69.8619},
          fillPattern=FillPattern.Solid,
          extent={{-19.0262,-13.6751},{19.0262,13.6751}},
          textString="Vac,pu",
          fontName="Arial")}),
    Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        grid={5,5})),
    Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Last update</p></td>
<td>2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end Staticgenerator;
