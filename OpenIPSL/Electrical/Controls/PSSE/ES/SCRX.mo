within OpenIPSL.Electrical.Controls.PSSE.ES;
model SCRX "Bus Fed or Solid Fed Static Exciter"
  extends OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter;
  parameter Real T_AT_B;
  parameter Real T_B;
  parameter Real K;
  parameter Real T_E;
  parameter Real E_MIN;
  parameter Real E_MAX;
  parameter Boolean C_SWITCH;
  parameter Real r_cr_fd;
  Modelica.Blocks.Math.Add3 V_erro
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  OpenIPSL.NonElectrical.Continuous.LeadLag imLeadLag(
    K=1,
    y_start=VR0/K,
    T1=T_AT_B*T_B,
    T2=T_B) annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  OpenIPSL.NonElectrical.Logical.NegCurLogic negCurLogic(nstartvalue=Efd0,
      RC_rfd=r_cr_fd)
    annotation (Placement(transformation(extent={{150,-10},{180,10}})));
  NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=K,
    T=T_E,
    y_start=VR0,
    outMax=E_MAX,
    outMin=E_MIN)
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{72,18},{84,30}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=C_SWITCH)
    annotation (Placement(transformation(extent={{40,46},{52,58}})));
  Modelica.Blocks.Math.Product product
    annotation (Placement(transformation(extent={{42,14},{54,26}})));
  Modelica.Blocks.Math.Add DiffV1(k2=-1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-100,-150})));
  Modelica.Blocks.Interfaces.RealInput XADIFD annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-200,-70}), iconTransformation(extent={{-10,-10},{10,10}},
          origin={-200,-70})));
protected
  parameter Real VR0(fixed=false);
initial equation
  if not C_SWITCH then
    VR0 = Efd0/ECOMP0;
    V_REF = VR0/K + ECOMP0;
  else
    VR0 = Efd0;
    V_REF = VR0/K + ECOMP0;
  end if;
equation
  connect(V_erro.y, imLeadLag.u)
    annotation (Line(points={{-39,0},{-39,0},{-22,0}}, color={0,0,127}));
  connect(imLeadLag.y, simpleLagLim.u)
    annotation (Line(points={{1,0},{8,0}}, color={0,0,127}));
  connect(booleanConstant.y, switch1.u2) annotation (Line(points={{52.6,52},{66,
          52},{66,24},{70.8,24}}, color={255,0,255}));
  connect(product.u2, simpleLagLim.y) annotation (Line(points={{40.8,16.4},{36,
          16.4},{36,0},{31,0}}, color={0,0,127}));
  connect(product.y, switch1.u3) annotation (Line(points={{54.6,20},{70.8,20},{
          70.8,19.2}}, color={0,0,127}));
  connect(switch1.u1, simpleLagLim.y) annotation (Line(points={{70.8,28.8},{62,
          28.8},{62,0},{31,0}}, color={0,0,127}));
  connect(ECOMP, DiffV.u2) annotation (Line(points={{-200,0},{-132,0},{-132,-6},
          {-122,-6}}, color={0,0,127}));
  connect(DiffV.y, V_erro.u2)
    annotation (Line(points={{-99,0},{-62,0}}, color={0,0,127}));
  connect(VOTHSG, V_erro.u1) annotation (Line(points={{-200,90},{-140,90},{-80,
          90},{-80,8},{-62,8}}, color={0,0,127}));
  connect(DiffV1.u2, VOEL) annotation (Line(points={{-94,-162},{-94,-170},{-70,
          -170},{-70,-200}}, color={0,0,127}));
  connect(DiffV1.u1, VUEL) annotation (Line(points={{-106,-162},{-106,-170},{-130,
          -170},{-130,-200}}, color={0,0,127}));
  connect(DiffV1.y, V_erro.u3) annotation (Line(points={{-100,-139},{-100,-139},
          {-100,-20},{-80,-20},{-80,-8},{-62,-8}}, color={0,0,127}));
  connect(negCurLogic.Efd, EFD)
    annotation (Line(points={{182.5,0},{210,0},{210,0}}, color={0,0,127}));
  connect(product.u1, DiffV.u2) annotation (Line(points={{40.8,23.6},{-160,23.6},
          {-160,0},{-132,0},{-132,-6},{-122,-6}}, color={0,0,127}));
  connect(switch1.y, negCurLogic.Vd) annotation (Line(points={{84.6,24},{120,24},
          {120,5},{147.5,5}}, color={0,0,127}));
  connect(XADIFD, negCurLogic.XadIfd) annotation (Line(points={{-200,-70},{-32,
          -70},{140,-70},{140,-5},{147.5,-5}}, color={0,0,127}));
  annotation (
    Placement(transformation(extent={{-114,44},{-102,58}}), iconTransformation(
          extent={{-100,-50},{-90,-40}})),
    Diagram(coordinateSystem(extent={{-200,-200},{200,160}}, initialScale=0.1)),

    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-200,-200},{200,160}},
        initialScale=0.1), graphics={Text(
          extent={{-186,-62},{-116,-82}},
          lineColor={28,108,200},
          textString="XADIFD"),Text(
          extent={{-100,156},{100,96}},
          lineColor={28,108,200},
          textString="SCRX")}),
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
</html>"));
end SCRX;
