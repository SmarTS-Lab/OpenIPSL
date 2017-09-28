within OpenIPSL.Electrical.Branches.PSAT.PhaseShiftingTransformer;
model PSTransformer
  constant Real pi=Modelica.Constants.pi;
  parameter Real SystemBase=100;
  parameter Real Vbus1=20000 "Sending end Bus nominal voltage, change of base";
  parameter Real Vbus2=20000 "Receiving end Bus voltage, change of base";
  parameter Real Sn=100 "Power rating MVA";
  parameter Real Vn1=20000 "Primary Voltage rating,KV";
  parameter Real Vn2=20000 "Secondary voltage rating, KV";
  parameter Real fn=50 "Frequency rating Hz";
  parameter Real Tm=0.001 "Measurement time constant, s";
  parameter Real Kp=0.05 "Proportional gain";
  parameter Real Ki=0.01 "Integral gain";
  parameter Real p_ref=0.01 "Reference Power, p.u.";
  parameter Real alpha_max=pi/2 "Maximum phase angle, rad";
  parameter Real alpha_min=-pi/2 "Minimum phase angle, rad";
  parameter Real xT=0.1 "Transformer Reactance, p.u.";
  parameter Real rT=0.01 "Transformer Resistance, p.u.";
  parameter Real m=0.98 "Transformer fixed tap  ratio, p.u./p.u.";
  parameter Real alpha0=0.002062339234360;
  parameter Real pmes0=0.01;
  parameter Real vk0=0.997649085060455;
  parameter Real vm0=1.007257703014177;
  parameter Real anglevk0=-0.007392164704867;
  parameter Real anglevm0=-0.009372077496959;
  Real vk(start=vk0);
  Real vm(start=vm0);
  Real anglevk(start=anglevk0);
  Real anglevm(start=anglevm0);
  OpenIPSL.Interfaces.PwPin p
    annotation (Placement(transformation(extent={{-122,-8},{-102,12}})));
  OpenIPSL.Interfaces.PwPin n
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealOutput pk(start=p_ref) annotation (Placement(
        transformation(extent={{100,-50},{120,-30}}), iconTransformation(extent
          ={{100,-50},{120,-30}})));
  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(extent={{-144,36},{-104,76}})));
  pst1 pst1_1(
    SystemBase=SystemBase,
    Vbus1=Vbus1,
    Vbus2=Vbus2,
    Sn=Sn,
    Vn1=Vn1,
    Vn2=Vn2,
    fn=fn,
    Tm=Tm,
    Kp=Kp,
    Ki=Ki,
    p_ref=p_ref,
    alpha_max=alpha_max,
    alpha_min=alpha_min,
    xT=xT,
    rT=rT,
    m=m,
    alpha0=alpha0,
    pmes0=pmes0,
    vk0=vk0,
    anglevk0=anglevk0)
    annotation (Placement(transformation(extent={{-46,-10},{-26,10}})));
  pst2 pst2_1(
    SystemBase=SystemBase,
    Vbus1=Vbus1,
    Vbus2=Vbus2,
    Sn=Sn,
    Vn1=Vn1,
    Vn2=Vn2,
    fn=fn,
    Tm=Tm,
    Kp=Kp,
    Ki=Ki,
    p_ref=p_ref,
    alpha_max=alpha_max,
    alpha_min=alpha_min,
    xT=xT,
    rT=rT,
    m=m,
    alpha0=alpha0,
    pmes0=pmes0,
    vm0=vm0,
    anglevm0=anglevm0)
    annotation (Placement(transformation(extent={{16,-10},{36,10}})));
protected
  parameter Real Vb2new=Vbus1*Vbus1;
  parameter Real Vb2old=Vn1*Vn1;
  parameter Real R=rT*(Vb2old*SystemBase)/(Vb2new*Sn)
    "Transformer Resistance, p.u.";
  parameter Real X=xT*(Vb2old*SystemBase)/(Vb2new*Sn)
    "Transformer Reactance, p.u.";
  parameter Real pref=p_ref*(Sn/SystemBase);
  parameter Real gt=R/(R^2 + X^2) "Converting resistance to conductance p.u.";
  parameter Real bt=-X/(R^2 + X^2) "Converting reactance to susceptance p.u.";
equation
  vk = sqrt(p.vr^2 + p.vi^2);
  vm = sqrt(n.vr^2 + n.vi^2);
  anglevk = atan2(p.vi, p.vr);
  anglevm = atan2(n.vi, n.vr);
  pk = p.vr*p.ir + p.vi*p.ii;
  connect(pst2_1.n, n) annotation (Line(
      points={{37,0.2},{70.5,0.2},{70.5,0},{110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pst2_1.p, pst1_1.n) annotation (Line(
      points={{15,0.2},{-25,0.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pst1_1.p, p) annotation (Line(
      points={{-47,0.2},{-76.5,0.2},{-76.5,2},{-112,2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(u, pst2_1.pk) annotation (Line(
      points={{-124,56},{-8,56},{-8,-4.2},{13.8,-4.2}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Ellipse(extent={{-48,24},{10,-32}}, lineColor={0,
          0,255}),Ellipse(extent={{-6,26},{52,-30}}, lineColor={0,0,255}),Line(
          points={{-104,0},{-48,0}},
          color={0,0,255},
          smooth=Smooth.None),Rectangle(extent={{66,10},{94,-12}}, lineColor={0,
          0,255}),Line(
          points={{50,0},{66,0},{66,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{100,0},{94,0},{96,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{82,-12},{82,-44},{-48,-44},{-48,0},{-48,0}},
          color={0,0,255},
          smooth=Smooth.None),Text(
          extent={{74,4},{84,-2}},
          lineColor={0,0,255},
          textString="%Angle%"),Text(
          extent={{-28,78},{40,46}},
          lineColor={0,128,0},
          textString="%PST%")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>15/07/2015</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end PSTransformer;
