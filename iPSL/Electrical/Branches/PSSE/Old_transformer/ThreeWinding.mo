within iPSL.Electrical.Branches.PSSE.Old_transformer;
model ThreeWinding
  parameter Real C1[1, 6]=[1.1, 0.9, 1.1, 0.9, 33, 0] "Primary winding: Vmax Vmin Rmax Rmin Ntap angle  ";
  parameter Real D1[1, 3]=[17, 5, 0] "Delay TD TC TSD";
  parameter Real C2[1, 6]=[1.1, 0.9, 1.1, 0.9, 33, 0] "Secondary winding: Vmax Vmin Rmax Rmin Ntap angle  ";
  parameter Real D2[1, 3]=[17, 5, 0] "Delay TD TC TSD";
  parameter Real C3[1, 6]=[1.1, 0.9, 1.1, 0.9, 33, 0] "Tertiary winding: Vmax Vmin Rmax Rmin Ntap angle  ";
  parameter Real D3[1, 3]=[17, 5, 0] "Delay TD TC TSD";
  // parameter Complex Z12"short circuit test impedance";
  // parameter Complex Z23 "short circuit test impedance";
  // parameter Complex Z31 "short circuit test impedance";
  parameter Real COD1=1 "enable control for winding 1 primary side voltage";
  parameter Real COD2=0 "enable control for winding 2 primary side voltage";
  parameter Real COD3=0 "enable control for winding 3 primary side voltage";
  // parameter Complex Z1 = 0.5 * (Z12 + Z31 - Z23)
  //  "equivalent impedance of winding 1";
  //  parameter Complex Z2 = 0.5 * (Z12 + Z23 - Z31)
  //    "equivalent impedance of winding 2";
  // parameter Complex Z3 = 0.5 * (Z31 + Z23 - Z12)
  //  "equivalent impedance of winding 3";
  iPSL.Connectors.PwPin P1 annotation (Placement(transformation(extent={{-100,-2},{-80,18}}), iconTransformation(extent={{-100,-8},{-92,0}})));
  iPSL.Connectors.PwPin P2 annotation (Placement(transformation(extent={{80,50},{100,70}}), iconTransformation(extent={{90,10},{98,18}})));
  iPSL.Connectors.PwPin P3 annotation (Placement(transformation(extent={{80,-50},{100,-30}}), iconTransformation(extent={{90,-28},{98,-20}})));
  iPSL.Electrical.Branches.PSSE.Old_transformer.TwoWindingTapRatio No_1(
    initialtapratio=1,
    angle_d=0,
    COD=1,
    Zeq(re=0.0025, im=0.005)) annotation (Placement(transformation(
        extent={{-28,-23},{28,23}},
        rotation=180,
        origin={-40,-1})));
  iPSL.Electrical.Sensors.PwVoltage V1 annotation (Placement(transformation(
        extent={{-7,-9},{7,9}},
        rotation=90,
        origin={-71,-25})));
  iPSL.Connectors.PwPin P1_control annotation (Placement(transformation(extent={{-100,-60},{-80,-40}}), iconTransformation(extent={{-102,24},{-94,32}})));
  iPSL.Electrical.Branches.PSSE.Old_transformer.TwoWindingTapRatio No_2(
    initialtapratio=1,
    angle_d=0,
    COD=0,
    Zeq(re=0.0025, im=0.005)) annotation (Placement(transformation(
        extent={{-28,-23},{28,23}},
        rotation=0,
        origin={38,15})));
  iPSL.Connectors.PwPin P2_control annotation (Placement(transformation(extent={{80,14},{100,34}}), iconTransformation(extent={{90,42},{98,50}})));
  iPSL.Electrical.Sensors.PwVoltage V2 annotation (Placement(transformation(
        extent={{-7,-9},{7,9}},
        rotation=180,
        origin={69,-1})));
  iPSL.Electrical.Branches.PSSE.Old_transformer.TwoWindingTapRatio No_3(
    initialtapratio=1,
    angle_d=0,
    COD=0,
    Zeq(re=0.0025, im=0.005)) annotation (Placement(transformation(
        extent={{-28,-23},{28,23}},
        rotation=0,
        origin={40,-35})));
  iPSL.Electrical.Sensors.PwVoltage V3 annotation (Placement(transformation(
        extent={{-7,-9},{7,9}},
        rotation=180,
        origin={71,-51})));
  iPSL.Connectors.PwPin P3_control annotation (Placement(transformation(extent={{80,-82},{100,-62}}), iconTransformation(extent={{90,-60},{98,-52}})));
equation
  connect(V1.p, P1_control) annotation (Line(
      points={{-71,-28.5},{-71,-50},{-90,-50}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(P1, No_1.P2) annotation (Line(
      points={{-90,8},{-74,8},{-74,-4.68},{-65.2,-4.68}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(V1.v, No_1.sensored_voltage) annotation (Line(
      points={{-68.3,-21.57},{-68.3,5.215},{-64.64,5.215},{-64.64,3.14}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(No_2.P1, No_1.P1) annotation (Line(
      points={{11.68,17.76},{11.68,12.5},{-13.68,12.5},{-13.68,-3.76}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(No_2.P2, P2) annotation (Line(
      points={{63.2,18.68},{76.04,18.68},{76.04,60},{90,60}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(V2.p, P2_control) annotation (Line(
      points={{72.5,-1},{81.25,-1},{81.25,24},{90,24}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(V2.v, No_2.sensored_voltage) annotation (Line(
      points={{65.57,1.7},{65.57,3.5},{62.64,3.5},{62.64,10.86}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(No_3.P1, No_1.P1) annotation (Line(
      points={{13.68,-32.24},{13.68,-37.5},{-13.68,-37.5},{-13.68,-3.76}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(V3.v, No_3.sensored_voltage) annotation (Line(
      points={{67.57,-48.3},{67.57,-46.5},{64.64,-46.5},{64.64,-39.14}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(No_3.P2, P3) annotation (Line(
      points={{65.2,-31.32},{78.04,-31.32},{78.04,-40},{90,-40}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(V3.p, P3_control) annotation (Line(
      points={{74.5,-51},{74.5,-69.5},{90,-69.5},{90,-72}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Documentation(info="<html>
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
end ThreeWinding;
