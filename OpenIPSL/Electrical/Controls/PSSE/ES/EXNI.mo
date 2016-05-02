within OpenIPSL.Electrical.Controls.PSSE.ES;
model EXNI "Bus or Solid Fed SCR Bridge Excitation System Model Type NI (NVE)"
  parameter Real T_R=0.60000E-01 "Voltage input time constant (s)";
  //0
  parameter Real K_A=150.00 "AVR gain";
  //400
  parameter Real T_A=0 "AVR time constant (s)";
  parameter Real V_RMAX=4 "Maximum AVR output (pu)";
  parameter Real V_RMIN=-4 "Minimum AVR output (pu)";
  parameter Real K_F=0.110000E-01 "Rate feedback gain (pu)";
  parameter Real T_F1=0.40000 "Rate feedback time constant (s)";
  parameter Real T_F2=0.70000 "Rate feedback time constant (s)";
  parameter Boolean SWITCH=false;
  parameter Real r_cr_fd=10;
  Modelica.Blocks.Interfaces.RealInput VOTHSG "PSS output Upss" annotation (Placement(transformation(extent={{-100,-10},{-94,-2}}), iconTransformation(extent={{-112,-22},{-102,-12}})));
  Modelica.Blocks.Interfaces.RealInput VOEL "OEL output" annotation (Placement(transformation(extent={{-100,-18},{-94,-10}}), iconTransformation(extent={{-112,-34},{-102,-24}})));
  Modelica.Blocks.Interfaces.RealInput VUEL annotation (Placement(transformation(extent={{-100,-26},{-94,-18}}), iconTransformation(extent={{-112,-46},{-102,-36}})));
  Modelica.Blocks.Interfaces.RealInput ECOMP(start=Ec0)
    "Input, generator terminal voltage"
    annotation (Placement(transformation(extent={{-100,6},{-92,14}}), iconTransformation(extent={{-112,8},{-102,18}})));
  Modelica.Blocks.Interfaces.RealInput EFD0 "Input, generator terminal voltage"
                                                                                annotation (Placement(transformation(extent={{-100,-36},{-94,-28}}), iconTransformation(extent={{-112,-8},{-102,2}})));
  Modelica.Blocks.Interfaces.RealInput ETERM(start=Et0)
    "Ternimal voltage of generator bus"
    annotation (Placement(transformation(extent={{-104,40},{-94,50}}), iconTransformation(extent={{-100,34},{-90,44}})));
  Modelica.Blocks.Interfaces.RealInput XADIFD annotation (Placement(transformation(extent={{-100,-56},{-90,-44}}), iconTransformation(extent={{-100,-72},{-90,-62}})));
  OpenIPSL.NonElectrical.Logical.NegCurLogic negCurLogic(RC_rfd=r_cr_fd, nstartvalue=Efd0) annotation (Placement(transformation(extent={{70,-18},{110,20}})));
  Modelica.Blocks.Interfaces.RealOutput EFD annotation (Placement(transformation(extent={{118,-8},{134,6}}), iconTransformation(extent={{98,-16},{114,-2}})));
  NonElectrical.Continuous.SimpleLag simpleLag(
    K=1,
    T=T_R,
    y_start=Ec0) annotation (Placement(transformation(extent={{-74,4},{-62,16}})));
  Modelica.Blocks.Math.Add3 add3_1 annotation (Placement(transformation(extent={{-72,-22},{-60,-10}})));
  Modelica.Blocks.Math.Add3 add3_2(k2=-1) annotation (Placement(transformation(extent={{-50,4},{-38,16}})));
  Modelica.Blocks.Continuous.Derivative derivativeLag(
    k=K_F,
    T=T_F1,
    y_start=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput) annotation (Placement(transformation(extent={{26,-26},{12,-12}})));
  NonElectrical.Continuous.SimpleLag simpleLag1(
    K=1,
    T=T_F2,
    y_start=0) annotation (Placement(transformation(extent={{-8,-26},{-22,-12}})));
  Modelica.Blocks.Math.Add add(k2=-1) annotation (Placement(transformation(extent={{-30,-2},{-16,12}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_RMAX, uMin=V_RMIN) annotation (Placement(transformation(extent={{20,-2},{34,12}})));
  Modelica.Blocks.Math.Product product annotation (Placement(transformation(extent={{28,34},{40,46}})));
  Modelica.Blocks.Logical.Switch switch1 annotation (Placement(transformation(extent={{60,34},{72,46}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=SWITCH) annotation (Placement(transformation(extent={{28,60},{40,72}})));
protected
  parameter Real Efd0(fixed=false);
  parameter Real VR0(fixed=false);
  parameter Real VREF(fixed=false);
  parameter Real Ec0(fixed=false);
  parameter Real Et0(fixed=false);
  Modelica.Blocks.Sources.Constant Vref(k=VREF) annotation (Placement(transformation(extent={{-86,24},{-74,36}})));
  NonElectrical.Continuous.SimpleLag VR(
    K=K_A,
    T=T_A,
    y_start=VR0) annotation (Placement(transformation(extent={{-8,-2},{6,12}})));
initial algorithm
  Ec0 := ECOMP;
  Ec0 := ECOMP;
  Efd0 := EFD0;
  if SWITCH then
    VR0 := Efd0;
    VREF := VR0/K_A + Ec0 - add3_1.y;
  else
    VR0 := Efd0/Et0;
    VREF := VR0/K_A + Ec0 - add3_1.y;
  end if;
equation
  connect(XADIFD, negCurLogic.XadIfd) annotation (Line(
      points={{-95,-50},{64,-50},{64,-8.5},{66.6667,-8.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(EFD, EFD) annotation (Line(
      points={{126,-1},{126,-1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ECOMP, simpleLag.u) annotation (Line(points={{-96,10},{-75.2,10}}, color={0,0,127}));
  connect(VOTHSG, add3_1.u1) annotation (Line(points={{-97,-6},{-76,-6},{-76,-11.2},{-73.2,-11.2}}, color={0,0,127}));
  connect(add3_1.u2, VOEL) annotation (Line(points={{-73.2,-16},{-84,-16},{-84,-14},{-97,-14}}, color={0,0,127}));
  connect(VUEL, add3_1.u3) annotation (Line(points={{-97,-22},{-88,-22},{-88,-24},{-73.2,-24},{-73.2,-20.8}}, color={0,0,127}));
  connect(simpleLag.y, add3_2.u2) annotation (Line(points={{-61.4,10},{-51.2,10}}, color={0,0,127}));
  connect(Vref.y, add3_2.u1) annotation (Line(points={{-73.4,30},{-58,30},{-58,14.8},{-51.2,14.8}}, color={0,0,127}));
  connect(add3_1.y, add3_2.u3) annotation (Line(points={{-59.4,-16},{-54,-16},{-54,5.2},{-51.2,5.2}}, color={0,0,127}));
  connect(simpleLag1.u, derivativeLag.y) annotation (Line(points={{-6.6,-19},{4,-19},{11.3,-19}}, color={0,0,127}));
  connect(add3_2.y, add.u1) annotation (Line(points={{-37.4,10},{-31.4,10},{-31.4,9.2}}, color={0,0,127}));
  connect(add.y, VR.u) annotation (Line(points={{-15.3,5},{-12.65,5},{-9.4,5}}, color={0,0,127}));
  connect(simpleLag1.y, add.u2) annotation (Line(points={{-22.7,-19},{-38,-19},{-38,0.8},{-31.4,0.8}}, color={0,0,127}));
  connect(VR.y, limiter.u) annotation (Line(points={{6.7,5},{12.35,5},{18.6,5}}, color={0,0,127}));
  connect(derivativeLag.u, limiter.y) annotation (Line(points={{27.4,-19},{40,-19},{40,5},{34.7,5}}, color={0,0,127}));
  connect(EFD, negCurLogic.Efd) annotation (Line(points={{126,-1},{115,-1},{115,1},{113.333,1}}, color={0,0,127}));
  connect(product.u1, ETERM) annotation (Line(points={{26.8,43.6},{-33.6,43.6},{-33.6,45},{-99,45}}, color={0,0,127}));
  connect(product.u2, limiter.y) annotation (Line(points={{26.8,36.4},{20,36.4},{20,20},{40,20},{40,5},{34.7,5}}, color={0,0,127}));
  connect(product.y, switch1.u3) annotation (Line(points={{40.6,40},{48,40},{48,35.2},{58.8,35.2}}, color={0,0,127}));
  connect(switch1.u1, limiter.y) annotation (Line(points={{58.8,44.8},{50,44.8},{50,5},{40,5},{34.7,5}}, color={0,0,127}));
  connect(switch1.y, negCurLogic.Vd) annotation (Line(points={{72.6,40},{80,40},{80,14},{64,14},{64,10.5},{66.6667,10.5}}, color={0,0,127}));
  connect(booleanConstant.y, switch1.u2) annotation (Line(points={{40.6,66},{54,66},{54,40},{58.8,40}}, color={255,0,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Text(
          extent={{-58,-8},{-52,-14}},
          lineColor={0,0,255},
          textString="Vs"),Text(
          extent={{-84,34},{-76,26}},
          lineColor={0,0,255},
          textString="Vref"),Text(
          extent={{-94,-30},{-78,-36}},
          lineColor={0,0,255},
          textString="Efd0"),Text(
          extent={{-102,16},{-74,10}},
          lineColor={0,0,255},
          textString="Ec"),Text(
          extent={{-94,2},{-76,-8}},
          lineColor={0,0,255},
          textString="VOTHSG"),Text(
          extent={{-96,-8},{-74,-14}},
          lineColor={0,0,255},
          textString="VOEL"),Text(
          extent={{-96,-16},{-74,-22}},
          lineColor={0,0,255},
          textString="VUEL"),Text(
          extent={{-92,54},{-80,46}},
          lineColor={0,0,255},
          textString="Et"),Text(
          extent={{-88,-42},{-70,-50}},
          lineColor={0,0,255},
          textString="XadIfd")}), Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>"));
end EXNI;
