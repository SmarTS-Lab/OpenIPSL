within OpenIPSL.Electrical.Controls.PSAT.TG;
model TGtypeII "TG Type II"
  Modelica.Blocks.Interfaces.RealInput pm0 "Initial mechanical power (pu)"
    annotation (Placement(
      visible=true,
      transformation(
        origin={5.0,75.0},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=-90),
      iconTransformation(
        origin={0.0,120.0},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=-90)));
  Modelica.Blocks.Interfaces.RealOutput pm "Mechanical power (pu)" annotation (
      Placement(
      visible=true,
      transformation(
        origin={127.8147,-10.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0),
      iconTransformation(
        origin={110.0,-0.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput W "Rotor speed (pu)" annotation (
      Placement(
      visible=true,
      transformation(
        origin={-86.6223,-82.7085},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=-270),
      iconTransformation(
        origin={-120.0,-0.0},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0)));
  Modelica.Blocks.Math.Add add1(k2=-1) annotation (Placement(visible=true,
        transformation(
        origin={-57.8833,-13.175},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Continuous.TransferFunction transferFunction1(a={Ts,1}, b={T3,
        1}) annotation (Placement(visible=true, transformation(
        origin={5.0,-13.2292},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  parameter Real wref=1 "Reference speed (pu)";
  parameter Real R=0.2 "Droop (pu)";
  parameter Real pmax0=1 "Maximum turbine output (pu)";
  parameter Real pmin0=0 "Minimum turbine output (pu)";
  parameter Real Ts=0.1 "Governor Time constant (s)";
  parameter Real T3=-0.1 "Transient gain time constant (s)";
  parameter Real S_b=100 "System base power (MVA)"
    annotation (Dialog(group="Power flow data"));
  parameter Real Sn=20 "Nominal power (MVA)";
  Modelica.Blocks.Math.Gain gain1(k=1/Ro) annotation (Placement(visible=true,
        transformation(
        origin={-26.9038,-12.7482},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Sources.Constant const(k=wref) annotation (Placement(visible=
          true, transformation(
        origin={-125.0,-6.9858},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Math.Add add2 annotation (Placement(visible=true,
        transformation(
        origin={50.0,-5.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=pmax, uMin=pmin) annotation (
      Placement(visible=true, transformation(
        origin={82.1897,-7.0368},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
protected
  parameter Real Ro=R*S_b/Sn;
  parameter Real pmax=pmax0*Sn/S_b;
  parameter Real pmin=pmin0*Sn/S_b;
equation
  connect(limiter1.y, pm) annotation (Line(
      visible=true,
      origin={112.546,-8.5184},
      points={{-19.3563,1.4816},{2.0437,1.4816},{2.0437,-1.4816},{15.2687,-1.4816}},

      color={0,0,127}));

  connect(pm0, add2.u1) annotation (Line(
      visible=true,
      origin={16.0,25.6667},
      points={{-11.0,49.3333},{-11.0,-24.6667},{22.0,-24.6667}},
      color={0,0,127}));
  connect(add1.u2, W) annotation (Line(
      visible=true,
      origin={-81.0427,-40.3528},
      points={{11.1594,21.1778},{-5.5797,21.1778},{-5.5796,-42.3557}},
      color={0,0,127}));
  connect(add2.y, limiter1.u) annotation (Line(
      visible=true,
      origin={66.3923,-6.0184},
      points={{-5.3923,1.0184},{0.7974,1.0184},{0.7974,-1.0184},{3.7974,-1.0184}},

      color={0,0,127}));

  connect(transferFunction1.y, add2.u2) annotation (Line(
      visible=true,
      origin={31.0,-12.1146},
      points={{-15.0,-1.1146},{4.0,-1.1146},{4.0,1.1146},{7.0,1.1146}},
      color={0,0,127}));
  connect(const.y, add1.u1) annotation (Line(
      visible=true,
      origin={-82.4125,-7.0804},
      points={{-31.5875,0.0946},{9.5292,0.0946},{9.5292,-0.0946},{12.5292,-0.0946}},

      color={0,0,127}));

  connect(gain1.y, transferFunction1.u) annotation (Line(
      visible=true,
      origin={-10.726,-12.9887},
      points={{-5.1778,0.2405},{0.726,0.2405},{0.726,-0.2405},{3.726,-0.2405}},

      color={0,0,127}));

  connect(add1.y, gain1.u) annotation (Line(
      visible=true,
      origin={-42.3987,-12.9616},
      points={{-4.4846,-0.2134},{0.4949,-0.2134},{0.4949,0.2134},{3.4949,0.2134}},

      color={0,0,127}));

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
          origin={0.0,2.0143},
          fillPattern=FillPattern.Solid,
          extent={{-35.7561,-17.9857},{35.7561,17.9857}},
          textString="TGtype2",
          fontName="Arial"),Text(
          visible=true,
          origin={0.0,84.3902},
          fillPattern=FillPattern.Solid,
          extent={{-21.9862,-7.9881},{21.9862,7.9881}},
          textString="pm0",
          fontName="Arial"),Text(
          visible=true,
          origin={-80.0,-2.4321},
          fillPattern=FillPattern.Solid,
          extent={{-11.4068,-12.4321},{11.4068,12.4321}},
          textString="W",
          fontName="Arial"),Text(
          visible=true,
          origin={80.0,1.5812},
          fillPattern=FillPattern.Solid,
          extent={{-16.0104,-8.4188},{16.0104,8.4188}},
          textString="pm",
          fontName="Arial")}),
    Diagram(coordinateSystem(
        extent={{-148.5,-105},{148.5,105}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={5,5})),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>TG Type II, PSAT Manual 2.1.8</p></td>
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
end TGtypeII;
