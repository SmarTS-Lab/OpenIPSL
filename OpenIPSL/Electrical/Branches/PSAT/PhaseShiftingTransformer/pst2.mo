within OpenIPSL.Electrical.Branches.PSAT.PhaseShiftingTransformer;
model pst2
  parameter SI.ApparentPower SystemBase(displayUnit="MVA")=100e6 "System base power";
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
  parameter SI.PerUnit pmes0=0.01;
  parameter SI.PerUnit vm0=1.007257703014177;
  parameter SI.Angle anglevm0=-0.009372077496959;
  SI.PerUnit vk "Voltage at primary (pu)";
  SI.PerUnit vm(start=vm0) "Voltage at secondary (pu)";
  SI.Angle anglevk "Angle at primary";
  SI.Angle anglevm "Angle at secondary";


  Real alpha;
  Real pmes;
  OpenIPSL.Interfaces.PwPin p annotation (Placement(visible=true,
        transformation(extent={{-120,-10},{-100,10}})));
  OpenIPSL.Interfaces.PwPin n
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput pk
    annotation (Placement(transformation(extent={{-140,-60},{-100,-20}})));
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
initial equation
  alpha = alpha0;
  pmes = pmes0;
equation
  vk = sqrt(p.vr^2 + p.vi^2);
  vm = sqrt(n.vr^2 + n.vi^2);
  anglevk = atan2(p.vi, p.vr);
  anglevm = atan2(n.vi, n.vr);
  if alpha > alpha_max and der(alpha) > 0 and der(pmes) > 0 then
    der(alpha) = 0;
    der(pmes) = (pk - pmes)/Tm;
    p.vr = n.vr*cos(alpha_max) - n.vi*sin(alpha_max);
    p.vi = n.vr*sin(alpha_max) + n.vi*cos(alpha_max);
    // pk=p.vr*p.ir + p.vi*p.ii;
    p.ir + n.ir = 0;
    p.ii + n.ii = 0;
  elseif alpha < alpha_min and der(alpha) < 0 and der(pmes) < 0 then
    der(alpha) = 0;
    der(pmes) = (pk - pmes)/Tm;
    p.vr = n.vr*cos(alpha_min) - n.vi*sin(alpha_min);
    p.vi = n.vr*sin(alpha_min) + n.vi*cos(alpha_min);
    // pk=p.vr*p.ir + p.vi*p.ii;
    p.ir + n.ir = 0;
    p.ii + n.ii = 0;
  else
    der(alpha) = Kp*(pk - pmes)/Tm + Ki*(pmes - pref);
    der(pmes) = (pk - pmes)/Tm;
    p.vr = n.vr*cos(alpha) - n.vi*sin(alpha);
    p.vi = n.vr*sin(alpha) + n.vi*cos(alpha);
    // pk=p.vr*p.ir + p.vi*p.ii;
    p.ir + n.ir = 0;
    p.ii + n.ii = 0;
  end if;
end pst2;
