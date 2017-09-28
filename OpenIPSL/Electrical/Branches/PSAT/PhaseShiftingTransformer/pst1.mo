within OpenIPSL.Electrical.Branches.PSAT.PhaseShiftingTransformer;
model pst1
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
  parameter Real anglevk0=-0.007392164704867;
  Real vk(start=vk0) "Voltage at primary, p.u.";
  Real vm;
  Real anglevk(start=anglevk0);
  Real anglevm;
  OpenIPSL.Interfaces.PwPin p annotation (Placement(visible=true,
        transformation(extent={{-120,-8},{-100,12}})));
  OpenIPSL.Interfaces.PwPin n
    annotation (Placement(transformation(extent={{100,-8},{120,12}})));
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
  R*p.ir - X*p.ii = 1/m^2*p.vr - 1/m*n.vr;
  R*p.ii + X*p.ir = 1/m^2*p.vi - 1/m*n.vi;
  R*n.ir - X*n.ii = n.vr - 1/m*p.vr;
  X*n.ir + R*n.ii = n.vi - 1/m*p.vi;
  annotation (
    Placement(transformation(extent={{-120,-10},{-100,10}})),
    Placement(transformation(extent={{100,-10},{120,10}})),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics),
    Documentation);
end pst1;
