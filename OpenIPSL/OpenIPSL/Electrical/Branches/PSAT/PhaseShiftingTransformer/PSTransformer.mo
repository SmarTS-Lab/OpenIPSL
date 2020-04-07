within OpenIPSL.Electrical.Branches.PSAT.PhaseShiftingTransformer;
model PSTransformer
  outer OpenIPSL.Electrical.SystemBase SysData;
  parameter SI.ApparentPower S_b(displayUnit="MVA")=SysData.S_b "System base power";
  parameter SI.Voltage Vbus1(displayUnit="kV")=20e3 "Nominal bus voltage of sending end";
  parameter SI.Voltage Vbus2(displayUnit="kV")=20e3 "Nominal bus voltage of receiving end";
  parameter SI.ApparentPower Sn(displayUnit="MVA")=100e6 "Power rating";
  parameter SI.Voltage Vn1(displayUnit="kV")=20e3 "Primary Voltage rating";
  parameter SI.Voltage Vn2(displayUnit="kV")=20e3 "Secondary voltage rating";
  parameter SI.Frequency fn=50 "Frequency rating";
  parameter SI.Time Tm=0.001 "Measurement time constant";
  parameter Real Kp=0.05 "Proportional gain";
  parameter Real Ki=0.01 "Integral gain";
  parameter SI.PerUnit p_ref=0.01 "Reference Power (pu)";
  parameter SI.Angle alpha_max=C.pi/2 "Maximum phase angle";
  parameter SI.Angle alpha_min=-C.pi/2 "Minimum phase angle";
  parameter SI.PerUnit xT=0.1 "Transformer Reactance (pu)";
  parameter SI.PerUnit rT=0.01 "Transformer Resistance (pu)";
  parameter Real m=0.98 "Transformer fixed tap  ratio, (pu/pu)";
  parameter SI.Angle alpha0=0.002062339234360;
  parameter Real pmes0=0.01;
  parameter SI.PerUnit vk0=0.997649085060455;
  parameter SI.PerUnit vm0=1.007257703014177;
  parameter SI.Angle anglevk0=-0.007392164704867;
  parameter SI.Angle anglevm0=-0.009372077496959;
  SI.PerUnit vk(start=vk0);
  SI.PerUnit vm(start=vm0);
  SI.Angle anglevk(start=anglevk0);
  SI.Angle anglevm(start=anglevm0);
  OpenIPSL.Interfaces.PwPin p
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  OpenIPSL.Interfaces.PwPin n
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealOutput pk(start=p_ref) annotation (Placement(
        transformation(extent={{100,-50},{120,-30}}), iconTransformation(extent=
           {{100,-50},{120,-30}})));
  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(extent={{-140,36},{-100,76}})));
  pst1 pst1_1(
    SystemBase=S_b,
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
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  pst2 pst2_1(
    SystemBase=S_b,
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
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
protected
  parameter Real Vb2new=Vbus1*Vbus1;
  parameter Real Vb2old=Vn1*Vn1;
  parameter Real R=rT*(Vb2old*S_b)/(Vb2new*Sn)
    "Transformer Resistance, p.u.";
  parameter Real X=xT*(Vb2old*S_b)/(Vb2new*Sn)
    "Transformer Reactance, p.u.";
  parameter Real pref=p_ref*(Sn/S_b);
  parameter Real gt=R/(R^2 + X^2) "Converting resistance to conductance p.u.";
  parameter Real bt=-X/(R^2 + X^2) "Converting reactance to susceptance p.u.";
equation
  vk = sqrt(p.vr^2 + p.vi^2);
  vm = sqrt(n.vr^2 + n.vi^2);
  anglevk = atan2(p.vi, p.vr);
  anglevm = atan2(n.vi, n.vr);
  pk = p.vr*p.ir + p.vi*p.ii;
  connect(pst2_1.n, n) annotation (Line(
      points={{41,0},{70.5,0},{70.5,0},{110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pst2_1.p, pst1_1.n) annotation (Line(
      points={{19,0},{-2,0},{-2,0},{-19,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pst1_1.p, p) annotation (Line(
      points={{-41,0},{-76.5,0},{-76.5,0},{-110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(u, pst2_1.pk) annotation (Line(
      points={{-120,56},{-8,56},{-8,-4},{18,-4}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Ellipse(extent={{-48,24},{10,-32}}, lineColor={0,
          0,255}),Ellipse(extent={{-6,26},{52,-30}}, lineColor={0,0,255}),Line(
          points={{-104,0},{-48,0}},
          color={0,0,255},
          smooth=Smooth.None),Rectangle(extent={{66,10},{94,-12}}, lineColor={0,
          0,255}),Line(
          points={{52,0},{66,0},{66,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{100,0},{94,0},{96,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{80,-12},{80,-44},{-50,-44},{-50,0},{-50,0}},
          color={0,0,255},
          smooth=Smooth.None),Text(
          extent={{74,4},{84,-2}},
          lineColor={0,0,255},
          textString="%Angle%"),Text(
          extent={{-40,-52},{40,-92}},
          lineColor={0,128,0},
          textString="PST"),
        Text(
          extent={{-100,100},{100,40}},
          lineColor={0,0,255},
          textString="%name")}),
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
