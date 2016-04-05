within iPSL.Examples.Controls.PSAT.AVR;
model AVRTypeII_OEL_TGI_Test

  iPSL.Electrical.Machines.PSAT.SixthOrder.Order6 order6Type2_Inputs_Outputs(
    Sn=Sn,
    Vn=Vn,
    V_b=Vbus,
    xd=xd0,
    xq=xq0,
    V_0=1,
    angle_0=0,
    P_0=0.160352698692006,
    Q_0=0.11859436505981,
    ra=0.001,
    xd1=0.302,
    M=10,
    D=0) annotation (Placement(transformation(extent={{-68,-12},{12,66}})));
  iPSL.Electrical.Controls.PSAT.OEL.OEL oXL(
    vOELmax=0.05,
    xd=xd,
    xq=xq,
    iflim=2.7,
    T0=5) annotation (Placement(transformation(extent={{84,72},{40,112}})));
  parameter Real xd=order6Type2_Inputs_Outputs.xd "d-axis reactance, p.u.";
  parameter Real xq=order6Type2_Inputs_Outputs.xq "q-axis reactance, p.u.";
  parameter Real Sn=370 "Power rating, MVA";
  parameter Real SystemBase=100;
  parameter Real Vn=400000 "Nominal voltage";
  parameter Real Vbus=400000 "Bus nominal voltage, change of base";
  parameter Real xd0=1.9 "d-axis reactance, p.u.";
  parameter Real xq0=1.7 "q-axis reactance, p.u.";
  iPSL.Electrical.Controls.PSAT.AVR.AVRTypeII exciter_Type_II(
    vref0=1,
    vrmin=-5,
    vrmax=5,
    Ta=0.1,
    Te=1,
    Tr=0.001,
    Ae=0.0006,
    Be=0.9,
    Kf=0.45,
    Tf=1,
    Ka=400,
    vf0=1.064,
    Ke=0.01) annotation (Placement(transformation(extent={{22,58},{-40,110}})));
  iPSL.Electrical.Controls.PSAT.TG.TGTypeI tGTypeI(
    wref=1,
    pref=p0,
    R=0.2,
    pmax=1,
    pmin=0,
    Ts=0.1,
    Tc=1,
    T3=0.04,
    T4=5,
    T5=0.04) annotation (Placement(transformation(extent={{-24,-64},{-90,-20}})));
  parameter Real p0=0.160352698692006 "Power flow, node active power";
  inner iPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{-80,-80},{-56,-60}})));
equation
  connect(oXL.v, order6Type2_Inputs_Outputs.v) annotation (Line(
      points={{78.72,108.4},{96,108.4},{96,40},{30,40},{30,38.7},{16,38.7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(order6Type2_Inputs_Outputs.Q, oXL.q) annotation (Line(
      points={{16,3.6},{16,-76},{138,-76},{138,93.8},{78.72,93.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(exciter_Type_II.vf, order6Type2_Inputs_Outputs.vf) annotation (Line(
      points={{-35.35,90.76},{-68,90.76},{-68,46.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(exciter_Type_II.v, order6Type2_Inputs_Outputs.v) annotation (Line(
      points={{15.8,81.4},{42,81.4},{42,40},{30,40},{30,38.7},{16,38.7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(order6Type2_Inputs_Outputs.P, oXL.p) annotation (Line(
      points={{16,15.237},{32,15.237},{32,-62},{136,-62},{136,101.4},{78.72,
          101.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(tGTypeI.w, order6Type2_Inputs_Outputs.w) annotation (Line(
      points={{-30.325,-38.7},{24,-38.7},{24,62.1},{16,62.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(tGTypeI.pm, order6Type2_Inputs_Outputs.pm) annotation (Line(
      points={{-78.175,-39.14},{-90,-39.14},{-90,7.5},{-68,7.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(exciter_Type_II.vref, oXL.v_OXL) annotation (Line(points={{15.8,98.04},{30.9,98.04},{30.9,96.4},{44.4,96.4}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-100,-100},{140,120}}, preserveAspectRatio=false)),
    Icon(coordinateSystem(extent={{-100,-100},{140,120}})),
    Documentation(revisions="<html>
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
end AVRTypeII_OEL_TGI_Test;
