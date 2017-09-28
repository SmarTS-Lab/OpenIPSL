within OpenIPSL.Electrical.Controls.PSSE.ES;
model URST5T "IEEE Proposed Type ST5B Excitation System"
  extends OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter;
  parameter Real T_R=0.025;
  parameter Real T_C1=0.1;
  parameter Real T_B1=0.2;
  parameter Real T_C2=1;
  parameter Real T_B2=1;
  parameter Real KR=1;
  parameter Real V_RMAX=10;
  parameter Real V_RMIN=-10;
  parameter Real T_1=0.58;
  parameter Real K_C=0.3;
  Modelica.Blocks.Interfaces.RealInput XADIFD annotation (Placement(
        transformation(
        extent={{20,-20},{-20,20}},
        rotation=0,
        origin={200,-60}), iconTransformation(extent={{-10,-10},{10,10}},
          origin={-200,-70})));
  Modelica.Blocks.Math.Add VERR1 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-10,0})));
  NonElectrical.Logical.LV_GATE lV_Gate
    annotation (Placement(transformation(extent={{-56,-6},{-32,6}})));
  NonElectrical.Logical.HV_GATE hV_Gate
    annotation (Placement(transformation(extent={{-86,-6},{-64,6}})));
  NonElectrical.Continuous.LeadLagLim LL1(
    K=1,
    outMax=V_RMAX/KR,
    outMin=V_RMIN/KR,
    T1=T_C1,
    T2=T_B1,
    y_start=VR0/KR)
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));
  NonElectrical.Continuous.LeadLagLim LL2(
    K=1,
    outMax=V_RMAX/KR,
    outMin=V_RMIN/KR,
    T1=T_C2,
    T2=T_B2,
    y_start=VR0/KR)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Blocks.Math.Gain K_R(k=KR) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={80,0})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_RMAX, uMin=V_RMIN)
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Math.Add VERR2(k1=-1, k2=1) annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={178,0})));
  Modelica.Blocks.Math.Gain K_c(k=K_C) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={160,-30})));
  Modelica.Blocks.Math.Gain Vmin(k=V_RMIN) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={150,50})));
  Modelica.Blocks.Math.Gain Vmax(k=V_RMAX) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={150,90})));
  NonElectrical.Continuous.SimpleLagLimVar simpleLagLimVar(
    K=1,
    T=T_1,
    y_start=VR0)
    annotation (Placement(transformation(extent={{130,-10},{150,10}})));
  NonElectrical.Continuous.SimpleLag TransducerDelay(
    K=1,
    T=T_R,
    y_start=ECOMP0)
    annotation (Placement(transformation(extent={{-170,-10},{-150,10}})));
  Modelica.Blocks.Interfaces.RealInput VT annotation (Placement(transformation(
        extent={{20,-20},{-20,20}},
        rotation=0,
        origin={200,70}), iconTransformation(extent={{-10,-10},{10,10}}, origin
          ={-200,50})));
protected
  parameter Real VR0(fixed=false);
initial equation
  VR0 = Efd0 + K_C*XADIFD;
  V_REF = VR0/KR + ECOMP;
equation
  connect(LL1.u, VERR1.y)
    annotation (Line(points={{8,0},{8,0},{1,0}}, color={0,0,127}));
  connect(LL1.y, LL2.u)
    annotation (Line(points={{31,0},{31,0},{38,0}}, color={0,0,127}));
  connect(ECOMP, TransducerDelay.u)
    annotation (Line(points={{-200,0},{-186,0},{-172,0}}, color={0,0,127}));
  connect(TransducerDelay.y, DiffV.u2) annotation (Line(points={{-149,0},{-132,
          0},{-132,-6},{-122,-6}}, color={0,0,127}));
  connect(VUEL, hV_Gate.n1) annotation (Line(points={{-130,-200},{-130,-200},{-130,
          -20},{-90,-20},{-90,3},{-87.375,3}}, color={0,0,127}));
  connect(DiffV.y, hV_Gate.n2) annotation (Line(points={{-99,0},{-92,0},{-92,-3},
          {-87.375,-3}}, color={0,0,127}));
  connect(VOEL, lV_Gate.n2) annotation (Line(points={{-70,-200},{-70,-200},{-70,
          -34},{-70,-20},{-60,-20},{-60,-3},{-57.5,-3}}, color={0,0,127}));
  connect(hV_Gate.p, lV_Gate.n1) annotation (Line(points={{-65.375,0},{-62,0},{
          -62,3},{-57.5,3}}, color={0,0,127}));
  connect(lV_Gate.p, VERR1.u1) annotation (Line(points={{-33.5,0},{-30,0},{-30,
          -6},{-22,-6}}, color={0,0,127}));
  connect(VOTHSG, VERR1.u2) annotation (Line(points={{-200,90},{-200,90},{-30,
          90},{-30,6},{-22,6}}, color={0,0,127}));
  connect(LL2.y, K_R.u)
    annotation (Line(points={{61,0},{61,0},{68,0}}, color={0,0,127}));
  connect(K_R.y, limiter.u)
    annotation (Line(points={{91,0},{98,0}}, color={0,0,127}));
  connect(limiter.y, simpleLagLimVar.u)
    annotation (Line(points={{121,0},{124.5,0},{128,0}}, color={0,0,127}));
  connect(VERR2.y, EFD)
    annotation (Line(points={{189,0},{210,0}}, color={0,0,127}));
  connect(K_c.u, XADIFD) annotation (Line(points={{160,-42},{160,-42},{160,-60},
          {200,-60}}, color={0,0,127}));
  connect(K_c.y, VERR2.u1) annotation (Line(points={{160,-19},{160,-19},{160,-6},
          {166,-6}}, color={0,0,127}));
  connect(simpleLagLimVar.y, VERR2.u2) annotation (Line(points={{151,0},{160,0},
          {160,6},{166,6}}, color={0,0,127}));
  connect(VT, Vmax.u) annotation (Line(points={{200,70},{172,70},{172,90},{162,
          90}}, color={0,0,127}));
  connect(Vmin.u, Vmax.u) annotation (Line(points={{162,50},{172,50},{172,90},{
          162,90}}, color={0,0,127}));
  connect(Vmin.y, simpleLagLimVar.outMin) annotation (Line(points={{139,50},{
          124,50},{124,-20},{132,-20},{132,-14}}, color={0,0,127}));
  connect(Vmax.y, simpleLagLimVar.outMax) annotation (Line(points={{139,90},{
          128,90},{128,20},{148,20},{148,14}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-200,-200},{200,160}}, initialScale=0.1)),

    Icon(coordinateSystem(
        extent={{-200,-200},{200,160}},
        preserveAspectRatio=true,
        initialScale=0.1), graphics={Text(
          extent={{-188,60},{-154,40}},
          lineColor={28,108,200},
          textString="VT"),Text(
          extent={{-178,-62},{-114,-82}},
          lineColor={28,108,200},
          textString="XADIFD")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSS/E Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2016-04-29</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Tin Rabuzin,SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end URST5T;
