within OpenIPSL.Electrical.Controls.PSSE.OEL;
model OEL
  Modelica.Blocks.Interfaces.RealInput IFD "Field current" annotation (
      Placement(transformation(extent={{-104,24},{-94,36}}), iconTransformation(
        extent={{5,-6},{-5,6}},
        rotation=180,
        origin={-105,0})));
  Modelica.Blocks.Sources.Constant IFDSetpoint(k=IFDdes)
    annotation (Placement(transformation(extent={{-92,62},{-76,78}})));
  Modelica.Blocks.Continuous.LimIntegrator imLimitedIntegrator(
    outMin=Vmin,
    outMax=Vmax,
    k=KMX,
    y_start=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{0,58},{16,74}})));
  Modelica.Blocks.Interfaces.RealOutput VOEL "OEL output" annotation (Placement(
        transformation(extent={{72,34},{82,46}}), iconTransformation(extent={{
            100,-6},{110,6}})));
  parameter Real IFD1=1.1 "Low OEL limit (pu)";
  parameter Real IFD2=1.2 "Medium OEL limit (pu)";
  parameter Real IFD3=1.5 "High OEL limit (pu)";
  parameter Real TIME1=60 "Timing for low OEL (s)";
  parameter Real TIME2=30 "Timimg for medium OEL (s)";
  parameter Real TIME3=15 "Timing for high OEL (s)";
  parameter Real IFDdes=1 "IFD setpoint (pu)";
  parameter Real Vmax=0 "Max. OEL output (pu)";
  parameter Real Vmin=-0.05 "Min. OEL output (pu)";
  parameter Real KMX=1 "Control constant";
  IF_comparisor compasitor(
    HighCurrentLimit=IFD3,
    MediumCurrentLimit=IFD2,
    LowCurrentLimit=IFD1)
    annotation (Placement(transformation(extent={{-46,16},{-14,46}})));
  Modelica.Blocks.Continuous.LimIntegrator imLimitedIntegrator1(
    outMin=Vmin,
    outMax=Vmax,
    k=KMX,
    y_start=6,
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{0,34},{16,50}})));
  Modelica.Blocks.Continuous.LimIntegrator imLimitedIntegrator2(
    outMin=Vmin,
    outMax=Vmax,
    k=KMX,
    y_start=6,
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{0,10},{16,26}})));
  Modelica.Blocks.Continuous.LimIntegrator imLimitedIntegrator3(
    outMin=Vmin,
    outMax=Vmax,
    k=KMX,
    y_start=7.5,
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{0,-14},{16,2}})));
  Modelica.Blocks.Math.Add add(k1=-1)
    annotation (Placement(transformation(extent={{-68,26},{-52,42}})));
  Modelica.Blocks.Math.MultiSum multiSum(nu=4)
    annotation (Placement(transformation(extent={{42,34},{54,46}})));
equation
  connect(compasitor.n1, imLimitedIntegrator.u) annotation (Line(points={{-20.72,
          39.1},{-14,39.1},{-14,66},{-1.6,66}}, color={0,0,127}));
  connect(compasitor.n2, imLimitedIntegrator1.u) annotation (Line(points={{-20.72,
          34},{-10,34},{-10,42},{-1.6,42}}, color={0,0,127}));
  connect(compasitor.n3, imLimitedIntegrator2.u) annotation (Line(points={{-20.72,
          28.3},{-10,28.3},{-10,18},{-1.6,18}}, color={0,0,127}));
  connect(compasitor.n4, imLimitedIntegrator3.u) annotation (Line(points={{-20.72,
          23.5},{-14,23.5},{-14,-6},{-1.6,-6}}, color={0,0,127}));
  connect(add.y, compasitor.p) annotation (Line(points={{-51.2,34},{-46,34},{-46,
          33.1},{-41.84,33.1}}, color={0,0,127}));
  connect(add.u2, IFD) annotation (Line(points={{-69.6,29.2},{-82.8,29.2},{-82.8,
          30},{-99,30}}, color={0,0,127}));
  connect(IFDSetpoint.y, add.u1) annotation (Line(points={{-75.2,70},{-74,70},{
          -74,38.8},{-69.6,38.8}}, color={0,0,127}));
  connect(multiSum.y, VOEL)
    annotation (Line(points={{55.02,40},{66,40},{77,40}}, color={0,0,127}));
  connect(imLimitedIntegrator.y, multiSum.u[1]) annotation (Line(points={{16.8,
          66},{38,66},{38,43.15},{42,43.15}}, color={0,0,127}));
  connect(imLimitedIntegrator1.y, multiSum.u[2]) annotation (Line(points={{16.8,
          42},{30,42},{30,41.05},{42,41.05}}, color={0,0,127}));
  connect(imLimitedIntegrator2.y, multiSum.u[3]) annotation (Line(points={{16.8,
          18},{34,18},{34,38.95},{42,38.95}}, color={0,0,127}));
  connect(imLimitedIntegrator3.y, multiSum.u[4]) annotation (Line(points={{16.8,
          -6},{38,-6},{38,36.85},{42,36.85}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-80},{100,
            80}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-80},{100,80}}),
        graphics={Rectangle(extent={{-100,80},{100,-80}}, lineColor={0,0,255}),
          Text(
          extent={{-36,12},{38,-16}},
          lineColor={0,0,255},
          textString="OEL"),Text(
          extent={{-96,4},{-72,-6}},
          lineColor={0,0,255},
          textString="IFD/EFD"),Text(
          extent={{82,4},{100,-4}},
          lineColor={0,0,255},
          textString="VOEL")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Over Excitation Limiter, PSSE manual</td>
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
end OEL;
