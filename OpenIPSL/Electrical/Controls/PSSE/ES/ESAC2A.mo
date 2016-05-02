within OpenIPSL.Electrical.Controls.PSSE.ES;
model ESAC2A "IEEE Type AC2A Excitation System"
  parameter Real T_R=0.1;
  parameter Real T_B=8;
  parameter Real T_C=19.99;
  parameter Real K_A=80;
  parameter Real T_A=0.01;
  parameter Real V_AMAX=8;
  parameter Real V_AMIN=-8;
  parameter Real K_B=25;
  parameter Real V_RMAX=15;
  parameter Real V_RMIN=-95;
  parameter Real T_E=0.2;
  parameter Real V_FEMAX=7;
  parameter Real K_H=1;
  parameter Real K_F=0.01;
  parameter Real T_F=1;
  parameter Real K_C=0.5;
  parameter Real K_D=0.35;
  parameter Real K_E=1;
  parameter Real E_1=4;
  parameter Real S_EE_1=0.4;
  parameter Real E_2=5;
  parameter Real S_EE_2=0.5;
  OpenIPSL.NonElectrical.Continuous.LeadLag imLeadLag(
    K=1,
    T1=T_C,
    T2=T_B,
    y_start=VA0/K_A) annotation (Placement(transformation(extent={{4,-10},{24,10}})));
  NonElectrical.Continuous.SimpleLag Vm(
    y_start=Vm0,
    K=1,
    T=T_R) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-74,4})));
  Modelica.Blocks.Math.Product VX annotation (Placement(transformation(
        extent={{-3,-3},{3,3}},
        rotation=180,
        origin={267,-51})));
  Modelica.Blocks.Interfaces.RealInput ECOMP annotation (Placement(transformation(extent={{-134,22},{-96,60}}), iconTransformation(extent={{-134,22},{-96,60}})));
  Modelica.Blocks.Interfaces.RealInput VOTHSG annotation (Placement(transformation(extent={{-134,64},{-96,102}}), iconTransformation(extent={{-134,64},{-96,102}})));
  Modelica.Blocks.Sources.Constant V_REF(k=VREF) annotation (Placement(transformation(extent={{-86,-40},{-66,-20}})));
  Modelica.Blocks.Math.Add imSum2_2(k1=-1, k2=1) annotation (Placement(transformation(
        extent={{-4,4},{4,-4}},
        rotation=0,
        origin={112,6})));
  Modelica.Blocks.Math.Gain K_b(k=K_B) annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=0,
        origin={128,6})));
  NonElectrical.Logical.HV_GATE hV_Gate annotation (Placement(transformation(extent={{144,-8},{168,26}})));
  NonElectrical.Logical.LV_GATE lV_Gate annotation (Placement(transformation(extent={{168,-14},{188,16}})));
  Modelica.Blocks.Math.Gain imGain3(k=K_H) annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=180,
        origin={128,-40})));
  Modelica.Blocks.Math.Gain imGain2(k=K_E) annotation (Placement(transformation(
        extent={{-3,-3},{3,3}},
        rotation=180,
        origin={269,-65})));
  Modelica.Blocks.Math.Gain imGain4(k=K_D) annotation (Placement(transformation(
        extent={{-3,-3},{3,3}},
        rotation=180,
        origin={269,-77})));
  Modelica.Blocks.Interfaces.RealInput XADIFD
    annotation (Placement(transformation(
        extent={{-19,-19},{19,19}},
        rotation=0,
        origin={-119,-93}), iconTransformation(extent={{-17,-17},{17,17}}, origin={-117,-1})));
  NonElectrical.Nonlinear.FEX fEX annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={338,-26})));
  Modelica.Blocks.Math.Product product annotation (Placement(transformation(extent={{344,-8},{356,4}})));
  Modelica.Blocks.Interfaces.RealOutput EFD annotation (Placement(transformation(extent={{382,-12},{402,8}}), iconTransformation(extent={{300,-62},{320,-42}})));
  Modelica.Blocks.Interfaces.RealInput EFD0
    annotation (Placement(transformation(
        extent={{-17,-17},{17,17}},
        rotation=90,
        origin={-61,-207}), iconTransformation(extent={{-17,-17},{17,17}}, origin={-117,-135})));
  Modelica.Blocks.Interfaces.RealInput VOEL
    annotation (Placement(transformation(
        extent={{-19,-19},{19,19}},
        rotation=0,
        origin={-117,-45}), iconTransformation(extent={{-17,-17},{17,17}}, origin={-115,-43})));
  Modelica.Blocks.Interfaces.RealInput VUEL
    annotation (Placement(transformation(
        extent={{-19,-19},{19,19}},
        rotation=0,
        origin={-117,-145}), iconTransformation(extent={{-17,-17},{17,17}}, origin={-115,-85})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=V_RMAX, uMin=V_RMIN) annotation (Placement(transformation(extent={{192,-10},{212,10}})));
  Modelica.Blocks.Math.Add add(k2=-1) annotation (Placement(transformation(extent={{222,-16},{242,4}})));
  Modelica.Blocks.Math.Add3 add3_1(k2=-1) annotation (Placement(transformation(extent={{-54,-6},{-34,14}})));
  Modelica.Blocks.Math.Add add1(k2=-1) annotation (Placement(transformation(extent={{-24,-10},{-4,10}})));
  Modelica.Blocks.Math.Add add2 annotation (Placement(transformation(extent={{258,-66},{250,-58}})));
  Modelica.Blocks.Math.Add add3 annotation (Placement(transformation(extent={{240,-68},{232,-60}})));
  NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=K_A,
    T=T_A,
    outMax=V_AMAX,
    outMin=V_AMIN,
    y_start=VA0) annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  NonElectrical.Functions.ImSE imSE(
    SE1=S_EE_1,
    SE2=S_EE_2,
    E1=E_1,
    E2=E_2) annotation (Placement(transformation(extent={{280,-56},{272,-50}})));
  Modelica.Blocks.Continuous.Derivative derivative(
    k=K_F,
    T=T_F,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=0) annotation (Placement(transformation(extent={{84,-74},{64,-54}})));
  Modelica.Blocks.Math.Division division annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=90,
        origin={338,-50})));
  Modelica.Blocks.Math.Gain gain2(k=K_C) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=90,
        origin={335,-73})));
  Modelica.Blocks.Math.Add add4 annotation (Placement(transformation(
        extent={{4,-4},{-4,4}},
        rotation=270,
        origin={262,-32})));
  Modelica.Blocks.Sources.Constant const(k=K_E) annotation (Placement(transformation(extent={{248,-46},{254,-40}})));
  Modelica.Blocks.Sources.Constant const1(k=V_FEMAX) annotation (Placement(transformation(extent={{220,-40},{226,-34}})));
  Modelica.Blocks.Math.Add add5(k1=-1, k2=+1) annotation (Placement(transformation(
        extent={{4,-4},{-4,4}},
        rotation=270,
        origin={236,-26})));
  Modelica.Blocks.Math.Division division1 annotation (Placement(transformation(
        extent={{-4,4},{4,-4}},
        rotation=90,
        origin={254,-16})));
  NonElectrical.Continuous.IntegratorLimVar integratorLimVar(K=1/T_E, y_start=VE_0) annotation (Placement(transformation(extent={{262,-12},{274,0}})));
  Modelica.Blocks.Sources.Constant const2(k=0) annotation (Placement(transformation(extent={{292,-22},{286,-16}})));
protected
  parameter Real VREF(fixed=false);
  parameter Real Vm0(fixed=false);
  parameter Real VA0(fixed=false);
  parameter Real VFE0(fixed=false);
  parameter Real KCIFD0(fixed=false);
  parameter Real VE_0(fixed=false);

  function VE_ini
    input Real KCIFD0 "Psipp";
    input Real EFD0;
    output Real VE0;
  algorithm
    if KCIFD0 < 0 then
      VE0 := EFD0;
    elseif KCIFD0 >= 0 and KCIFD0 < 0.577*EFD0 then
      VE0 := EFD0 + 0.577*KCIFD0;
    elseif KCIFD0 >= 0.577*EFD0 and KCIFD0 < 1.732*EFD0 then
      VE0 := sqrt((EFD0^2 + KCIFD0^2)/0.75);
    else
      VE0 := EFD0/1.732 + KCIFD0;
    end if;
  end VE_ini;
initial equation
  Vm0 = ECOMP;
  VREF = VA0/K_A + ECOMP;
  KCIFD0 = K_C*XADIFD;
  VE_0 = VE_ini(KCIFD0, EFD0);
  VFE0 = VE_0*(OpenIPSL.NonElectrical.Functions.SE(
    VE_0,
    S_EE_1,
    S_EE_2,
    E_1,
    E_2) + K_E) + K_D*XADIFD;
  VA0 = VFE0*(1/K_B + K_H);
equation
  connect(product.y, EFD) annotation (Line(
      points={{356.6,-2},{392,-2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSum2_2.y, K_b.u) annotation (Line(
      points={{116.4,6},{123.2,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSum2_2.u1, imGain3.y) annotation (Line(
      points={{107.2,3.6},{104,3.6},{104,-40},{123.6,-40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imGain2.u, product.u1) annotation (Line(
      points={{272.6,-65},{282,-65},{282,2},{344,2},{344,1.6},{342.8,1.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(K_b.y, hV_Gate.n1) annotation (Line(
      points={{132.4,6},{140,6},{140,17.5},{142.5,17.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VUEL, hV_Gate.n2) annotation (Line(
      points={{-117,-145},{144.5,-145},{144.5,0.5},{142.5,0.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hV_Gate.p, lV_Gate.n1) annotation (Line(
      points={{166.5,9},{166.54,9},{166.54,8.5},{166.75,8.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(lV_Gate.n2, VOEL) annotation (Line(
      points={{166.75,-6.5},{166.5,-6.5},{166.5,-45},{-117,-45}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ECOMP, Vm.u) annotation (Line(points={{-115,41},{-90,41},{-90,4},{-86,4}}, color={0,0,127}));
  connect(lV_Gate.p, limiter1.u) annotation (Line(points={{186.75,1},{186,1},{186,0},{190,0}}, color={0,0,127}));
  connect(limiter1.y, add.u1) annotation (Line(points={{213,0},{216.5,0},{220,0}}, color={0,0,127}));
  connect(add.u2, imGain3.u) annotation (Line(points={{220,-12},{214,-12},{214,-40},{132.8,-40}}, color={0,0,127}));
  connect(Vm.y, add3_1.u2) annotation (Line(points={{-63,4},{-56,4}}, color={0,0,127}));
  connect(VOTHSG, add3_1.u1) annotation (Line(points={{-115,83},{-62,83},{-62,12},{-56,12}}, color={0,0,127}));
  connect(V_REF.y, add3_1.u3) annotation (Line(points={{-65,-30},{-60,-30},{-60,-4},{-56,-4}}, color={0,0,127}));
  connect(imLeadLag.u, add1.y) annotation (Line(points={{2,0},{-2,0},{-3,0}}, color={0,0,127}));
  connect(add3_1.y, add1.u1) annotation (Line(points={{-33,4},{-26,4},{-26,6}}, color={0,0,127}));
  connect(VX.y, add2.u1) annotation (Line(points={{263.7,-51},{262,-51},{262,-59.6},{258.8,-59.6}}, color={0,0,127}));
  connect(add2.u2, imGain2.y) annotation (Line(points={{258.8,-64.4},{262.4,-64.4},{262.4,-65},{265.7,-65}}, color={0,0,127}));
  connect(imGain4.y, add3.u2) annotation (Line(points={{265.7,-77},{244,-77},{244,-66.4},{240.8,-66.4}}, color={0,0,127}));
  connect(add3.u1, add2.y) annotation (Line(points={{240.8,-61.6},{245.4,-61.6},{245.4,-62},{249.6,-62}}, color={0,0,127}));
  connect(add3.y, imGain3.u) annotation (Line(points={{231.6,-64},{214,-64},{214,-40},{132.8,-40}}, color={0,0,127}));
  connect(imLeadLag.y, simpleLagLim.u) annotation (Line(points={{25,0},{48,0}}, color={0,0,127}));
  connect(simpleLagLim.y, imSum2_2.u2) annotation (Line(points={{71,0},{94,0},{94,8.4},{107.2,8.4}}, color={0,0,127}));
  connect(VX.u1, imSE.VE_OUT) annotation (Line(points={{270.6,-52.8},{271.2,-52.8},{271.2,-53},{271.76,-53}}, color={0,0,127}));
  connect(imSE.VE_IN, product.u1) annotation (Line(points={{280.4,-53},{282,-53},{282,2},{344,2},{344,1.6},{342.8,1.6}}, color={0,0,127}));
  connect(derivative.u, imGain3.u) annotation (Line(points={{86,-64},{214,-64},{214,-40},{132.8,-40}}, color={0,0,127}));
  connect(derivative.y, add1.u2) annotation (Line(points={{63,-64},{42,-64},{42,-66},{-32,-66},{-32,-6},{-26,-6}}, color={0,0,127}));
  connect(fEX.y, product.u2) annotation (Line(points={{338,-15},{336,-15},{336,-5.6},{342.8,-5.6}}, color={0,0,127}));
  connect(division.y, fEX.u) annotation (Line(points={{338,-43.4},{338,-39.7},{338,-36}}, color={0,0,127}));
  connect(gain2.y, division.u2) annotation (Line(points={{335,-65.3},{335,-57.2},{334.4,-57.2}}, color={0,0,127}));
  connect(XADIFD, gain2.u) annotation (Line(points={{-119,-93},{335,-93},{335,-81.4}}, color={0,0,127}));
  connect(division.u1, product.u1) annotation (Line(points={{341.6,-57.2},{341.6,-62},{312,-62},{312,2},{342.8,2},{342.8,1.6}}, color={0,0,127}));
  connect(imGain4.u, gain2.u) annotation (Line(points={{272.6,-77},{280,-77},{280,-94},{335,-93},{335,-81.4}}, color={0,0,127}));
  connect(add4.u1, imSE.VE_OUT) annotation (Line(points={{264.4,-36.8},{264.4,-42},{271.76,-42},{271.76,-53}}, color={0,0,127}));
  connect(const.y, add4.u2) annotation (Line(points={{254.3,-43},{259.6,-43},{259.6,-36.8}}, color={0,0,127}));
  connect(const1.y, add5.u2) annotation (Line(points={{226.3,-37},{233.6,-37},{233.6,-30.8}}, color={0,0,127}));
  connect(add5.u1, add3.u2) annotation (Line(points={{238.4,-30.8},{238.4,-52},{244,-52},{244,-66.4},{240.8,-66.4}}, color={0,0,127}));
  connect(add5.y, division1.u2) annotation (Line(points={{236,-21.6},{236,-20.8},{251.6,-20.8}}, color={0,0,127}));
  connect(add4.y, division1.u1) annotation (Line(points={{262,-27.6},{262,-24},{256.4,-24},{256.4,-20.8}}, color={0,0,127}));
  connect(add.y, integratorLimVar.u) annotation (Line(points={{243,-6},{260.8,-6}}, color={0,0,127}));
  connect(const2.y, integratorLimVar.outMin) annotation (Line(points={{285.7,-19},{263.2,-19},{263.2,-14.4}}, color={0,0,127}));
  connect(division1.y, integratorLimVar.outMax) annotation (Line(points={{254,-11.6},{254,10},{272.8,10},{272.8,2.4}}, color={0,0,127}));
  connect(integratorLimVar.y, product.u1) annotation (Line(points={{274.6,-6},{282,-6},{282,2},{344,2},{344,1.6},{342.8,1.6}}, color={0,0,127}));
  connect(VX.u2, product.u1) annotation (Line(points={{270.6,-49.2},{282,-49.2},{282,2},{344,2},{344,1.6},{342.8,1.6}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-200},{300,100}}), graphics={Text(
          extent={{252,-44},{280,-48}},
          lineColor={0,0,255},
          textString="VX=SE*VE"),Text(
          extent={{210,18},{216,8}},
          lineColor={255,0,0},
          textString="VR"),Text(
          extent={{266,18},{272,8}},
          lineColor={255,0,0},
          textString="VE")}),
    Icon(coordinateSystem(extent={{-100,-200},{300,100}}, preserveAspectRatio=false), graphics={Text(
          extent={{32,-2},{240,-98}},
          lineColor={0,0,255},
          textString="ESAC2A"),Rectangle(extent={{-100,100},{300,-200}}, lineColor={0,0,255}),Text(
          extent={{-90,80},{-24,0}},
          lineColor={0,0,255},
          textString="ECOMP"),Text(
          extent={{-90,122},{-24,42}},
          lineColor={0,0,255},
          textString="VOTHSG"),Text(
          extent={{-88,32},{-28,-32}},
          lineColor={0,0,255},
          textString="XadIfd"),Text(
          extent={{-96,-120},{-32,-146}},
          lineColor={0,0,255},
          textString="EFD0"),Text(
          extent={{-86,-10},{-26,-74}},
          lineColor={0,0,255},
          textString="VOEL"),Text(
          extent={{-88,-52},{-28,-116}},
          lineColor={0,0,255},
          textString="VUEL")}),
    Documentation(info="<html>
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
end ESAC2A;
