within iPSL.Electrical.Controls.PSSE.ES.SCRX;
model SCRX "Bus Fed or Solid Fed Static Exciter"
  parameter Real V_c0 "Magnitude of the compensated generator terminal voltage" annotation (Dialog(group="Power flow data"));
  parameter Real V_0 "Magnitude of the generator terminal voltage" annotation (Dialog(group="Power flow data"));
  parameter Real T_AT_B;
  parameter Real T_B;
  parameter Real K;
  parameter Real T_E;
  parameter Real E_MIN;
  parameter Real E_MAX;
  parameter Boolean C_SWITCH;
  parameter Real r_cr_fd;
  Modelica.Blocks.Interfaces.RealInput ETERM "Ecomp output" annotation (Placement(transformation(extent={{-114,0},{-104,10}}), iconTransformation(extent={{-126,-72},{-116,-60}})));
  Modelica.Blocks.Interfaces.RealOutput EFD annotation (Placement(transformation(extent={{116,-26},{132,-12}}), iconTransformation(extent={{116,-26},{132,-12}})));
  Modelica.Blocks.Math.Add3 V_erro(
    k3=1,
    k1=1,
    k2=-1) annotation (Placement(transformation(extent={{-52,-8},{-36,8}})));
  Modelica.Blocks.Interfaces.RealInput VOTHSG(start=0) "PSS output Upss" annotation (Placement(transformation(extent={{-114,-14},{-104,-4}}), iconTransformation(extent={{-124,34},{-114,44}})));
  Modelica.Blocks.Interfaces.RealInput VOEL "OEL output" annotation (Placement(transformation(extent={{-114,-24},{-104,-14}}), iconTransformation(extent={{-124,10},{-114,20}})));
  Modelica.Blocks.Interfaces.RealInput VUEL "UEL output" annotation (Placement(transformation(extent={{-114,-34},{-104,-24}}), iconTransformation(extent={{-124,-16},{-114,-6}})));
  Modelica.Blocks.Interfaces.RealInput EFD0 annotation (Placement(transformation(extent={{-114,10},{-104,20}}), iconTransformation(extent={{-124,-108},{-114,-94}})));
  iPSL.NonElectrical.Continuous.LeadLag imLeadLag(
    K=1,
    y_start=VR0/K,
    T1=T_AT_B*T_B,
    T2=T_B) annotation (Placement(transformation(extent={{-28,-10},{-8,10}})));
  iPSL.NonElectrical.Logical.NegCurLogic negCurLogic(nstartvalue=efd0, RC_rfd=r_cr_fd) annotation (Placement(transformation(extent={{66,-22},{110,22}})));
  Modelica.Blocks.Interfaces.RealInput XADIFD annotation (Placement(transformation(extent={{-114,-48},{-104,-36}}), iconTransformation(extent={{-126,-38},{-116,-28}})));
  Modelica.Blocks.Interfaces.RealInput ECOMP "Ternimal voltage of generator bus" annotation (Placement(transformation(extent={{-114,22},{-104,32}}), iconTransformation(extent={{-124,62},{-114,72}})));
  Modelica.Blocks.Sources.Constant const(k=VREF) annotation (Placement(transformation(extent={{-100,40},{-80,60}})));
  Modelica.Blocks.Math.Add3 add3_1 annotation (Placement(transformation(extent={{-86,-30},{-66,-10}})));
  NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=K,
    T=T_E,
    y_start=VR0,
    outMax=E_MAX,
    outMin=E_MIN) annotation (Placement(transformation(extent={{10,-10},{30,10}})));
  Modelica.Blocks.Logical.Switch switch1 annotation (Placement(transformation(extent={{72,20},{84,32}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=C_SWITCH) annotation (Placement(transformation(extent={{40,46},{52,58}})));
  Modelica.Blocks.Math.Product product annotation (Placement(transformation(extent={{42,14},{54,26}})));
protected
  parameter Real efd0(fixed=false);
  parameter Real VR0(fixed=false);
  parameter Real VREF(fixed=false);
initial algorithm
  efd0 := EFD0;
  if not C_SWITCH then
    VR0 := efd0/V_0;
    VREF := VR0/K + V_c0 - add3_1.y;
  else
    VR0 := efd0;
    VREF := VR0/K + V_c0 - add3_1.y;
  end if;
equation
  connect(ETERM, V_erro.u2) annotation (Line(
      points={{-109,5},{-56,5},{-56,0},{-53.6,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(XADIFD, negCurLogic.XadIfd) annotation (Line(
      points={{-109,-42},{55,-42},{55,-11},{62.3333,-11}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(negCurLogic.Efd, EFD) annotation (Line(
      points={{113.667,0},{114.7,0},{114.7,-19},{124,-19}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, V_erro.u1) annotation (Line(points={{-79,50},{-58,50},{-58,6.4},{-53.6,6.4}}, color={0,0,127}));
  connect(VOTHSG, add3_1.u1) annotation (Line(points={{-109,-9},{-99.5,-9},{-99.5,-12},{-88,-12}}, color={0,0,127}));
  connect(add3_1.u2, VOEL) annotation (Line(points={{-88,-20},{-97,-20},{-97,-19},{-109,-19}}, color={0,0,127}));
  connect(add3_1.u3, VUEL) annotation (Line(points={{-88,-28},{-98,-28},{-98,-29},{-109,-29}}, color={0,0,127}));
  connect(V_erro.y, imLeadLag.u) annotation (Line(points={{-35.2,0},{-32.6,0},{-30,0}}, color={0,0,127}));
  connect(add3_1.y, V_erro.u3) annotation (Line(points={{-65,-20},{-60,-20},{-60,-6.4},{-53.6,-6.4}}, color={0,0,127}));
  connect(imLeadLag.y, simpleLagLim.u) annotation (Line(points={{-7,0},{8,0},{8,0}}, color={0,0,127}));
  connect(booleanConstant.y, switch1.u2) annotation (Line(points={{52.6,52},{66,52},{66,26},{70.8,26}}, color={255,0,255}));
  connect(product.u2, simpleLagLim.y) annotation (Line(points={{40.8,16.4},{36,16.4},{36,0},{31,0}}, color={0,0,127}));
  connect(ECOMP, product.u1) annotation (Line(points={{-109,27},{40.8,27},{40.8,23.6}}, color={0,0,127}));
  connect(product.y, switch1.u3) annotation (Line(points={{54.6,20},{70.8,20},{70.8,21.2}}, color={0,0,127}));
  connect(switch1.u1, simpleLagLim.y) annotation (Line(points={{70.8,30.8},{62,30.8},{62,0},{31,0}}, color={0,0,127}));
  connect(switch1.y, negCurLogic.Vd) annotation (Line(points={{84.6,26},{90,26},{90,12},{68,12},{68,11},{62.3333,11}}, color={0,0,127}));
  annotation (
    Placement(transformation(extent={{-114,44},{-102,58}}), iconTransformation(extent={{-100,-50},{-90,-40}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,-120},{120,80}}), graphics={Text(
          extent={{-110,38},{-92,26}},
          lineColor={0,0,255},
          textString="Ecomp
             "),Text(
          extent={{-104,14},{-92,6}},
          lineColor={0,0,255},
          textString="Et"),Text(
          extent={{-106,6},{-86,-16}},
          lineColor={0,0,255},
          textString="VOTHSG "),Text(
          extent={{-108,-12},{-82,-18}},
          lineColor={0,0,255},
          textString=" VOEL"),Text(
          extent={{-110,-22},{-80,-28}},
          lineColor={0,0,255},
          textString=" VUEL "),Text(
          extent={{-102,26},{-90,12}},
          lineColor={0,0,255},
          textString="Efd0"),Text(
          extent={{-102,-34},{-84,-42}},
          lineColor={0,0,255},
          textString="XadIfd"),Text(
          extent={{106,14},{122,6}},
          lineColor={0,0,255},
          textString="Efd")}),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-120,-120},{120,80}}), graphics={Rectangle(extent={{-120,80},{120,-120}}, lineColor={0,0,255}),Text(
          extent={{-114,-48},{-70,-66}},
          lineColor={0,0,255},
          textString="ETERM"),Text(
          extent={{-114,62},{-62,32}},
          lineColor={0,0,255},
          textString="VOTHSG "),Text(
          extent={{90,4},{122,-10}},
          lineColor={0,0,255},
          textString="EFD"),Text(
          extent={{-52,26},{60,-56}},
          lineColor={0,0,255},
          textString="SCRX"),Text(
          extent={{-114,-2},{-80,-16}},
          lineColor={0,0,255},
          textString=" VUEL "),Text(
          extent={{-118,26},{-74,12}},
          lineColor={0,0,255},
          textString=" VOEL"),Text(
          extent={{-112,-82},{-88,-106}},
          lineColor={0,0,255},
          textString="Efd0"),Text(
          extent={{-112,-24},{-72,-42}},
          lineColor={0,0,255},
          textString="XADIFD"),Text(
          extent={{-114,86},{-72,58}},
          lineColor={0,0,255},
          textString="ECOMP")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSS/E Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>Unknown</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Mengjia Zhang,SmarTS Lab, KTH Royal Institute of Technology</p></td>
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
end SCRX;
