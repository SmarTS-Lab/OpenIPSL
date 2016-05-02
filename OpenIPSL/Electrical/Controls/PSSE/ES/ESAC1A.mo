within OpenIPSL.Electrical.Controls.PSSE.ES;
model ESAC1A
  import OpenIPSL.NonElectrical.Functions.SE;
  Modelica.Blocks.Interfaces.RealInput XADIFD "Field current" annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=180,
        origin={219,-86}), iconTransformation(
        extent={{-5,-6},{5,6}},
        rotation=90,
        origin={-0.5,-54.9})));
  Modelica.Blocks.Interfaces.RealInput ECOMP
    "Input, generator terminal voltage"                                          annotation (Placement(transformation(extent={{-220,24},{-210,36}}), iconTransformation(extent={{-220,24},{-210,36}})));
  Modelica.Blocks.Interfaces.RealInput VOTHSG "Upss" annotation (Placement(transformation(extent={{-220,-36},{-210,-24}}), iconTransformation(extent={{-220,-36},{-210,-24}})));
  Modelica.Blocks.Interfaces.RealInput VOEL
    "value from the Over Excitation Limiter"                                         annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=270,
        origin={43,62}), iconTransformation(
        extent={{-5,-6},{5,6}},
        rotation=90,
        origin={-60.2,-54.9})));
  Modelica.Blocks.Interfaces.RealOutput EFD "Output,excitation voltage" annotation (Placement(transformation(extent={{240,-6},{250,6}}), iconTransformation(extent={{240,-6},{250,6}})));
  parameter Real T_R=0 "Voltage input time constant (s)";
  parameter Real T_B=0 "AVR lead-lag time constant (s)";
  parameter Real T_C=0 "AVR lead-lag time constant (s)";
  parameter Real K_A=400 "AVR gain";
  parameter Real T_A=0.02 "AVR time constant (s)";
  parameter Real V_AMAX=9 "Maximum AVR output (pu)";
  parameter Real V_AMIN=-5.43 "Minimum AVR output (pu)";
  parameter Real T_E=0.8 "Exciter time constant (s)";
  parameter Real K_F=0.03 "Rate feedback gain (pu)";
  parameter Real T_F=1 "Rate feedback time const (s)";
  parameter Real K_C=0.2 "Rectifier load factor (pu)";
  parameter Real K_D=0.48 "Exciter demagnetizing factor (pu)";
  parameter Real K_E=1 "Exciter field factor (pu)";
  parameter Real E_1=5.25 "Exciter satutartion point 1 (pu)";
  parameter Real E_2=7 "Exciter saturation point 2 (pu)";
  parameter Real S_EE_1=0.03 "Saturation at E1";
  parameter Real S_EE_2=0.1 "Saturation at E2";
  parameter Real V_RMAX "Maximum AVR output (pu)";
  parameter Real V_RMIN "Minimum AVR output (pu)";
  Modelica.Blocks.Interfaces.RealInput VUEL "Under Excitation Limiter output" annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=270,
        origin={17,62}), iconTransformation(
        extent={{-5,-6},{5,6}},
        rotation=90,
        origin={-120,-54.6})));
  NonElectrical.Logical.HV_GATE hV_GATE annotation (Placement(transformation(extent={{20,54},{40,34}})));
  NonElectrical.Logical.LV_GATE lV_GATE annotation (Placement(transformation(extent={{40,56},{60,36}})));
  NonElectrical.Continuous.LeadLag imLeadLag(
    K=1,
    T1=T_C,
    T2=T_B,
    y_start=VR0/K_A) annotation (Placement(transformation(extent={{-66,30},{-46,50}})));
  NonElectrical.Continuous.SimpleLag imSimpleLag(
    K=1,
    y_start=V0,
    T=T_R) annotation (Placement(transformation(extent={{-170,30},{-150,50}})));
  NonElectrical.Functions.ImSE imSE(
    SE1=S_EE_1,
    SE2=S_EE_2,
    E1=E_1,
    E2=E_2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={158,-16})));
  Modelica.Blocks.Math.Product product annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={130,-22})));
  Modelica.Blocks.Math.Gain gain(k=K_E) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={130,-52})));
  Modelica.Blocks.Math.Gain gain1(k=K_D) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={130,-86})));
  Modelica.Blocks.Math.Add3 add3_1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={54,-52})));
  Modelica.Blocks.Math.Gain gain2(k=K_C) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={198,-66})));
  Modelica.Blocks.Math.Division division annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={192,-34})));
  NonElectrical.Nonlinear.FEX fEX annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=90,
        origin={192,2})));
  Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={212,32})));
  Modelica.Blocks.Interfaces.RealInput EFD0 annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-14,-58}), iconTransformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={60,-54})));
  Modelica.Blocks.Sources.Constant const(k=VREF) annotation (Placement(transformation(extent={{-170,64},{-150,84}})));
  Modelica.Blocks.Math.Add3 add3_2(k2=-1) annotation (Placement(transformation(extent={{-136,30},{-116,50}})));
  Modelica.Blocks.Math.Add add(k2=-1) annotation (Placement(transformation(extent={{-98,30},{-78,50}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=V_RMAX, uMin=V_RMIN) annotation (Placement(transformation(extent={{72,36},{92,56}})));
  Modelica.Blocks.Math.Add add1(k2=-1) annotation (Placement(transformation(extent={{104,30},{124,50}})));
  Modelica.Blocks.Continuous.LimIntegrator limIntegrator(
    k=1/T_E,
    outMax=Modelica.Constants.inf,
    outMin=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=VE0) annotation (Placement(transformation(extent={{144,28},{164,48}})));
  NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=K_A,
    T=T_A,
    y_start=VR0,
    outMax=V_AMAX,
    outMin=V_AMIN) annotation (Placement(transformation(extent={{-20,30},{0,50}})));
  Modelica.Blocks.Continuous.Derivative derivative(
    k=K_F,
    T=T_F,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=0) annotation (Placement(transformation(extent={{0,-10},{-20,10}})));
protected
  parameter Real VREF(fixed=false) "Reference terminal voltage (pu)";
  parameter Real VR0(fixed=false);
  parameter Real Efd0(fixed=false);
  parameter Real Ifd0(fixed=false);
  parameter Real VE0(fixed=false);
  parameter Real VFE0(fixed=false);
  parameter Real V0(fixed=false) "Voltage magnitude (pu)";
initial equation
  V0 = ECOMP;
  Efd0 = EFD0;
  Ifd0 = XADIFD;
  // Finding initial value of excitation voltage, VE0, via going through conditions of FEX function
  if Ifd0 <= 0 then
    VE0 = Efd0;
  elseif K_C*Ifd0/(Efd0 + 0.577*K_C*Ifd0) <= 0.433 then
    VE0 = Efd0 + 0.577*K_C*Ifd0;
  elseif K_C*Ifd0/sqrt((Efd0^2 + (K_C*Ifd0)^2)/0.75) > 0.433 and K_C*Ifd0/sqrt((Efd0^2 + (K_C*Ifd0)^2)/0.75) < 0.75 then
    VE0 = sqrt((Efd0^2 + (K_C*Ifd0)^2)/0.75);
  else
    VE0 = (Efd0 + 1.732*K_C*Ifd0)/1.732;
  end if;
  // Case IN>0 not checked because it will be resolved in the next iteration
  VFE0 = VE0*(SE(
    VE0,
    S_EE_1,
    S_EE_2,
    E_1,
    E_2) + K_E) + Ifd0*K_D;
  VR0 = VFE0;
  VREF = VR0/K_A + V0 - VOTHSG;
equation
  connect(hV_GATE.p, lV_GATE.n1) annotation (Line(
      points={{38.75,44},{38.75,41}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VOEL, lV_GATE.n2) annotation (Line(
      points={{43,62},{43,56},{43,51},{38.75,51}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(product.u2, imSE.VE_OUT) annotation (Line(points={{142,-16},{147.4,-16},{147.4,-16}}, color={0,0,127}));
  connect(VUEL, hV_GATE.n2) annotation (Line(points={{17,62},{17,49},{18.75,49}}, color={0,0,127}));
  connect(add3_1.u2, gain.y) annotation (Line(points={{66,-52},{66,-52},{119,-52}}, color={0,0,127}));
  connect(product.y, add3_1.u3) annotation (Line(points={{119,-22},{72,-22},{72,-44},{66,-44}}, color={0,0,127}));
  connect(add3_1.u1, gain1.y) annotation (Line(points={{66,-60},{78,-60},{78,-86},{119,-86}}, color={0,0,127}));
  connect(XADIFD, gain1.u) annotation (Line(points={{219,-86},{172,-86},{142,-86}}, color={0,0,127}));
  connect(gain2.u, gain1.u) annotation (Line(points={{198,-78},{198,-86},{142,-86}}, color={0,0,127}));
  connect(product1.y, EFD) annotation (Line(points={{223,32},{223,0},{245,0}}, color={0,0,127}));
  connect(imSE.VE_IN, product1.u1) annotation (Line(points={{169,-16},{176,-16},{176,38},{200,38}}, color={0,0,127}));
  connect(gain.u, product1.u1) annotation (Line(points={{142,-52},{176,-52},{176,38},{200,38}}, color={0,0,127}));
  connect(product.u1, product1.u1) annotation (Line(points={{142,-28},{176,-28},{176,38},{200,38}}, color={0,0,127}));
  connect(gain2.y, division.u1) annotation (Line(points={{198,-55},{198,-50.5},{198,-46}}, color={0,0,127}));
  connect(division.u2, product1.u1) annotation (Line(points={{186,-46},{186,-52},{176,-52},{176,38},{200,38}}, color={0,0,127}));
  connect(ECOMP, imSimpleLag.u) annotation (Line(points={{-215,30},{-194,30},{-194,40},{-172,40}}, color={0,0,127}));
  connect(imSimpleLag.y, add3_2.u2) annotation (Line(points={{-149,40},{-138,40}}, color={0,0,127}));
  connect(const.y, add3_2.u1) annotation (Line(points={{-149,74},{-146,74},{-146,48},{-138,48}}, color={0,0,127}));
  connect(VOTHSG, add3_2.u3) annotation (Line(points={{-215,-30},{-146,-30},{-146,32},{-138,32}}, color={0,0,127}));
  connect(add3_2.y, add.u1) annotation (Line(points={{-115,40},{-110,40},{-110,46},{-100,46}}, color={0,0,127}));
  connect(add.y, imLeadLag.u) annotation (Line(points={{-77,40},{-72.5,40},{-68,40}}, color={0,0,127}));
  connect(lV_GATE.p, limiter1.u) annotation (Line(points={{58.75,46},{58.75,45.25},{70,45.25},{70,46}}, color={0,0,127}));
  connect(limiter1.y, add1.u1) annotation (Line(points={{93,46},{102,46}}, color={0,0,127}));
  connect(add3_1.y, add1.u2) annotation (Line(points={{43,-52},{30,-52},{30,0},{96,0},{96,34},{102,34}}, color={0,0,127}));
  connect(add1.y, limIntegrator.u) annotation (Line(points={{125,40},{134,40},{134,38},{142,38}}, color={0,0,127}));
  connect(limIntegrator.y, product1.u1) annotation (Line(points={{165,38},{200,38}}, color={0,0,127}));
  connect(imLeadLag.y, simpleLagLim.u) annotation (Line(points={{-45,40},{-22,40},{-22,40}}, color={0,0,127}));
  connect(simpleLagLim.y, hV_GATE.n1) annotation (Line(points={{1,40},{18,40},{18,39},{18.75,39}}, color={0,0,127}));
  connect(derivative.y, add.u2) annotation (Line(points={{-21,0},{-106,0},{-106,34},{-100,34}}, color={0,0,127}));
  connect(derivative.u, add1.u2) annotation (Line(points={{2,0},{96,0},{96,34},{102,34}}, color={0,0,127}));
  connect(division.y, fEX.u) annotation (Line(points={{192,-23},{192,-14.5},{192,-6}}, color={0,0,127}));
  connect(fEX.y, product1.u2) annotation (Line(points={{192,10.8},{192,26},{200,26}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-220,-60},{240,60}},
        grid={2,2}), graphics={Text(
          extent={{200,-20},{194,-18}},
          lineColor={255,0,0},
          textString="N"),Text(
          extent={{192,-14},{198,-20}},
          lineColor={255,0,0},
          textString="I")}),
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-220,-60},{240,60}},
        grid={2,2}), graphics={Rectangle(
          extent={{-220,60},{240,-60}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-26,-32},{26,-54}},
          lineColor={0,0,255},
          textString="XADIFD"),Text(
          extent={{-204,40},{-164,20}},
          lineColor={0,0,255},
          textString="ECOMP"),Text(
          extent={{-210,-24},{-158,-36}},
          lineColor={0,0,255},
          textString="VOTHSG"),Text(
          extent={{-76,-36},{-42,-50}},
          lineColor={0,0,255},
          textString="VOEL"),Text(
          extent={{208,8},{238,-8}},
          lineColor={0,0,255},
          textString="EFD"),Text(
          extent={{-54,32},{50,-30}},
          lineColor={0,0,255},
          textString="ESAC1A"),Text(
          extent={{-136,-36},{-103,-49}},
          lineColor={0,0,255},
          textString="VUEL"),Text(
          extent={{38,-36},{82,-50}},
          lineColor={0,0,255},
          textString="EFD0")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>ESAC1A, PSS/E Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>Major change - 2016-01-19</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Tin Rabuzin, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>", revisions="<html>
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
end ESAC1A;
