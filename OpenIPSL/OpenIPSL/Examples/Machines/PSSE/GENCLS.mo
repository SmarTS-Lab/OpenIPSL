within OpenIPSL.Examples.Machines.PSSE;
model GENCLS
  extends OpenIPSL.Examples.SMIBpartial;
  OpenIPSL.Electrical.Machines.PSSE.GENCLS gENCLS2(
   H = 6.0,
   M_b=100000000,
   P_0=40000000,
   Q_0=5416582,
   v_0=1,
   angle_0=4.046276,
   omega(fixed=true)) annotation (Placement(transformation(extent={{-100,-20},{-60,20}})));
equation
	connect(gENCLS2.p, GEN1.p)
    annotation (Line(points={{-60,0},{-60,0},{-40,0}}, color={0,0,255}));
   annotation (experiment(StopTime=10));
end GENCLS;