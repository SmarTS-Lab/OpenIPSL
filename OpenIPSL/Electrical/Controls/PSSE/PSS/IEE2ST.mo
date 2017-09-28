within OpenIPSL.Electrical.Controls.PSSE.PSS;
model IEE2ST "IEEE Stabilizing Model With Dual-Input Signals"
  parameter Real K_1;
  parameter Real K_2;
  parameter Real T_1 "(s)";
  parameter Real T_2 "(s)";
  parameter Real T_3 "(s), if T_3 equals 0, sT_3 will equal 1.0";
  parameter Real T_4 ">0 (s)";
  parameter Real T_5 "(s)";
  parameter Real T_6 "(s)";
  parameter Real T_7 "(s)";
  parameter Real T_8 "(s)";
  parameter Real T_9 "(s)";
  parameter Real T_10 "(s)";
  parameter Real L_SMAX;
  parameter Real L_SMIN;
  parameter Real V_CU "(pu)";
  parameter Real V_CL "(pu)";
  Modelica.Blocks.Interfaces.RealInput V_S1 "PSS input signal 1"
    annotation (Placement(transformation(extent={{-200,20},{-160,60}})));
  Modelica.Blocks.Interfaces.RealInput V_S2 "PSS input signal 2"
    annotation (Placement(transformation(extent={{-200,-60},{-160,-20}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=L_SMAX, uMin=L_SMIN)
    annotation (Placement(transformation(extent={{96,-10},{116,10}})));
  Modelica.Blocks.Interfaces.RealOutput VOTHSG "PSS output signal"
    annotation (Placement(transformation(extent={{180,-10},{200,10}})));
  Modelica.Blocks.Continuous.Derivative imDerivativeLag(
    k=T_3,
    T=T_4,
    y_start=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  NonElectrical.Continuous.SimpleLag imSimpleLag(
    K=K_1,
    T=T_1,
    y_start=K_1*ICS10)
    annotation (Placement(transformation(extent={{-150,30},{-130,50}})));
  NonElectrical.Continuous.SimpleLag imSimpleLag1(
    K=K_2,
    T=T_2,
    y_start=ICS20)
    annotation (Placement(transformation(extent={{-150,-50},{-130,-30}})));
  NonElectrical.Continuous.LeadLag imLeadLag(
    K=1,
    T1=T_5,
    T2=T_6,
    y_start=0) annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  NonElectrical.Continuous.LeadLag imLeadLag1(
    K=1,
    T1=T_7,
    T2=T_8,
    y_start=0) annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  NonElectrical.Continuous.LeadLag imLeadLag2(
    K=1,
    T1=T_9,
    T2=T_10,
    y_start=0) annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Modelica.Blocks.Interfaces.RealInput VCT
    "Compensated machine terminal voltage (pu)" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-60})));
protected
  Modelica.Blocks.Interfaces.RealOutput VSS
    annotation (Placement(transformation(extent={{136,-10},{156,10}})));
protected
  parameter Real ICS10(fixed=false);
  parameter Real ICS20(fixed=false);
initial equation
  ICS10 = V_S1;
  ICS20 = V_S2;
equation
  if V_CU == 0 and not V_CL == 0 then
    if VCT > V_CL then
      VOTHSG = VSS;
    else
      VOTHSG = 0;
    end if;
  elseif V_CL == 0 and not V_CU == 0 then
    if VCT < V_CU then
      VOTHSG = VSS;
    else
      VOTHSG = 0;
    end if;
  elseif V_CU == 0 and V_CL == 0 then
    VOTHSG = VSS;
  elseif VCT > V_CL and VCT < V_CU then
    VOTHSG = VSS;
  else
    VOTHSG = 0;
  end if;
  connect(limiter.y, VSS)
    annotation (Line(points={{117,0},{146,0}}, color={0,0,127}));
  connect(V_S2, imSimpleLag1.u)
    annotation (Line(points={{-180,-40},{-152,-40}}, color={0,0,127}));
  connect(imSimpleLag1.y, add.u2) annotation (Line(points={{-129,-40},{-120,-40},
          {-120,-6},{-102,-6}}, color={0,0,127}));
  connect(V_S1, imSimpleLag.u)
    annotation (Line(points={{-180,40},{-166,40},{-152,40}}, color={0,0,127}));
  connect(imSimpleLag.y, add.u1) annotation (Line(points={{-129,40},{-120,40},{
          -120,6},{-102,6}}, color={0,0,127}));
  connect(imLeadLag2.y, limiter.u)
    annotation (Line(points={{81,0},{94,0}}, color={0,0,127}));
  connect(imLeadLag1.y, imLeadLag2.u)
    annotation (Line(points={{41,0},{49.5,0},{58,0}}, color={0,0,127}));
  connect(imLeadLag.y, imLeadLag1.u)
    annotation (Line(points={{1,0},{9.5,0},{18,0}}, color={0,0,127}));
  connect(imLeadLag.u, imDerivativeLag.y)
    annotation (Line(points={{-22,0},{-39,0}}, color={0,0,127}));
  connect(add.y, imDerivativeLag.u)
    annotation (Line(points={{-79,0},{-62,0}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-180,-60},{180,
            60}})),
    Icon(coordinateSystem(extent={{-180,-60},{180,60}}, preserveAspectRatio=
            false), graphics={Text(
          extent={{-156,52},{-114,28}},
          lineColor={28,108,200},
          textString="ICS1"),Text(
          extent={{-158,-28},{-114,-54}},
          lineColor={28,108,200},
          textString="ICS2"),Text(
          extent={{-20,-20},{22,-42}},
          lineColor={28,108,200},
          textString="VCT"),Text(
          extent={{106,12},{178,-14}},
          lineColor={28,108,200},
          textString="VOTHSG"),Text(
          extent={{-50,32},{58,-32}},
          lineColor={28,108,200},
          textString="IEE2ST"),Rectangle(extent={{-180,60},{180,-60}},
          lineColor={28,108,200})}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td></td>
IEE2ST, PSSE Manual
</tr>
<tr>
<td><p>Last update</p></td>
<td></td>
2015-08-17
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
</html>"));
end IEE2ST;
