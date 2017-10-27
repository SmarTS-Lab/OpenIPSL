within OpenIPSL.Electrical.Solar.KTH;
model PFmodelmpptCorrected05MW
  parameter Real SystemBase=100 "MVa";
  parameter Real v0=0.99422 "Power flow, node voltage";
  parameter Real anglev0=0.00158 "Power flow, node angle";
  parameter Real p0=0.44884 "Power flow, node active power";
  parameter Real q0=0 "Power flow, node reactive power";
  OpenIPSL.Electrical.Solar.KTH.PFblocks.PVnew PVnew1 annotation (Placement(
        visible=true, transformation(
        origin={-95.0,-5.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  OpenIPSL.Electrical.Solar.KTH.PFblocks.DCBusBar DCBusBar1 annotation (
      Placement(visible=true, transformation(
        origin={-12.3692,15.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput E annotation (Placement(
      visible=true,
      transformation(
        origin={-170.0,-5.0},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0),
      iconTransformation(
        origin={-120.0,50.0},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput T annotation (Placement(
      visible=true,
      transformation(
        origin={-170.0,-41.9393},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0),
      iconTransformation(
        origin={-120.0,-50.0},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0)));
  Modelica.Blocks.Sources.Constant const3(k=v0) annotation (Placement(visible=
          true, transformation(
        origin={20.0,26.001},
        extent={{-3.999,-3.999},{3.999,3.999}},
        rotation=0)));
  OpenIPSL.Electrical.Solar.KTH.PFblocks.Controller controller1(
    xq=xq,
    xd=xd,
    v0=v0) annotation (Placement(visible=true, transformation(
        origin={67.0368,11.8218},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  OpenIPSL.Electrical.Solar.KTH.PFblocks.Staticgenerator staticgenerator1(
    v0=v0,
    anglev0=anglev0,
    p0=p0,
    q0=q0) annotation (Placement(visible=true, transformation(
        origin={110.0,5.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  OpenIPSL.Interfaces.PwPin pwPin1(vi(start=v0*sin(anglev0)), vr(start=v0*cos(
          anglev0))) annotation (Placement(
      visible=true,
      transformation(
        origin={145.0,3.4396},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0),
      iconTransformation(
        origin={110.0,0.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Sources.Constant const5(k=700) annotation (Placement(visible=
          true, transformation(
        origin={33.999,-5.0},
        extent={{-3.999,-3.999},{3.999,3.999}},
        rotation=0)));
  Modelica.Blocks.Math.Gain gain1(k=1) annotation (Placement(visible=true,
        transformation(
        origin={35.0,-28.2447},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=-180)));
protected
  parameter Real vr=v0*cos(anglev0);
  parameter Real vi=v0*sin(anglev0);
  parameter Real A=vi*cos(anglev0) - vr*sin(anglev0);
  parameter Real B=vr*cos(anglev0) + vi*sin(anglev0);
  parameter Real idref0=(p0*B + q0*A)/(A^2 + B^2);
  parameter Real iqref0=((-q0*B) + p0*A)/(A^2 + B^2) "
              
                                              parameter Real vd0=-v0*sin(anglev0) ;
                                              parameter Real vq0=v0*cos(anglev0) ;
                                              parameter Real iqref0=2*(vq0*q0 + p0*vd0)/(vq0^2 + vd0^2) ;
                                              parameter Real idref0=2*(-vd0*q0 + p0*vq0)/(vq0^2 + vd0^2) ";
  parameter Real xq=2*iqref0*1.02;
  parameter Real xd=2*idref0*1.02;
equation
  connect(gain1.y, DCBusBar1.Pac) annotation (Line(
      visible=true,
      origin={-25.8892,0.9021},
      points={{49.8892,-29.1468},{-26.4646,-29.1468},{-26.4646,19.0979},{1.52,
          19.0979},{1.52,20.0979}},
      color={0,0,127}));
  connect(DCBusBar1.Vdc, controller1.udc) annotation (Line(
      visible=true,
      origin={30.748,11.7644},
      points={{-32.1172,3.2356},{-8.2302,3.2356},{-8.2302,-1.7644},{24.2888,-1.7644},
          {24.2888,-2.9426}},
      color={0,0,127}));
  connect(staticgenerator1.iq_ref, controller1.iq_ref) annotation (Line(
      visible=true,
      origin={84.5276,6.9973},
      points={{13.4724,0.0027},{-3.4908,0.0027},{-3.4908,-0.00273},{-6.4908,-0.00273}},

      color={0,0,127}));

  connect(controller1.id_ref, staticgenerator1.id_ref) annotation (Line(
      visible=true,
      origin={91.5092,13.9109},
      points={{-13.4724,1.9109},{3.4908,1.9109},{3.4908,-1.9109},{6.4908,-1.9109}},

      color={0,0,127}));

  connect(staticgenerator1.v, controller1.uac) annotation (Line(
      visible=true,
      origin={96.2147,25.1802},
      points={{24.7853,-13.1802},{28.7853,-13.1802},{28.7853,16.3594},{-41.1779,
          16.3594},{-41.1779,-6.3584}},
      color={0,0,127}));
  connect(controller1.Vdcref, const5.y) annotation (Line(
      visible=true,
      origin={44.0576,-0.5891},
      points={{10.9792,4.4109},{-2.6597,4.4109},{-2.6597,-4.4109},{-5.6597,-4.4109}},

      color={0,0,127}));

  connect(const3.y, controller1.Vacref) annotation (Line(
      visible=true,
      origin={45.8773,19.9114},
      points={{-21.4784,6.0896},{6.1595,6.0896},{6.1595,-6.0896},{9.1595,-6.0896}},

      color={0,0,127}));

  connect(staticgenerator1.P, gain1.u) annotation (Line(
      visible=true,
      origin={93.0,-18.6575},
      points={{28,16.1362},{32,16.1362},{32,-11.3425},{-46,-11.3425},{-46,-9.5872}},

      color={0,0,127}));

  connect(PVnew1.Udc, DCBusBar1.Vdc) annotation (Line(
      visible=true,
      origin={-53.6023,19.0},
      points={{-53.3977,-17.0},{-56.3977,-17.0},{-56.3977,21.0},{56.98,21.0},{
          56.98,-4.0},{52.2331,-4.0}},
      color={0,0,127}));
  connect(staticgenerator1.p, pwPin1) annotation (Line(
      visible=true,
      origin={132.5,4.2198},
      points={{-11.5,0.7802},{-0.5,0.7802},{-0.5,-0.7802},{12.5,-0.7802}}));
  connect(T, PVnew1.T) annotation (Line(
      visible=true,
      origin={-124.25,-26.9696},
      points={{-45.75,-14.9697},{14.25,-14.9697},{14.25,14.9696},{17.25,14.9696}},

      color={0,0,127}));

  connect(E, PVnew1.E) annotation (Line(
      visible=true,
      origin={-138.5,-5.0},
      points={{-31.5,0.0},{31.5,0.0}},
      color={0,0,127}));
  connect(PVnew1.Iarray, DCBusBar1.Ipv) annotation (Line(
      visible=true,
      origin={-64.5923,3.5},
      points={{-19.4077,-8.5},{-10.4077,-8.5},{-10.4077,8.5},{40.2231,8.5}},
      color={0,0,127}));
  annotation (
    Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={10,10}), graphics={Text(
          visible=true,
          origin={-72.3502,50.0},
          fillPattern=FillPattern.Solid,
          extent={{-17.6498,-10.0},{17.6498,10.0}},
          textString="E",
          fontName="Arial"),Text(
          visible=true,
          origin={-72.3502,-50.0},
          fillPattern=FillPattern.Solid,
          extent={{-17.6498,-10.0},{17.6498,10.0}},
          textString="T",
          fontName="Arial"),Rectangle(
          visible=true,
          fillColor={255,255,255},
          extent={{-100.0,-100.0},{100.0,100.0}})}),
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
end PFmodelmpptCorrected05MW;
