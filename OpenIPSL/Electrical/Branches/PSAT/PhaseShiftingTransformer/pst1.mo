within OpenIPSL.Electrical.Branches.PSAT.PhaseShiftingTransformer;
model pst1
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
  parameter Real pmes0=0.01;
  parameter SI.PerUnit vk0=0.997649085060455;
  parameter SI.Angle anglevk0=-0.007392164704867;

  SI.PerUnit vk(start=vk0);
  SI.PerUnit vm;
  SI.Angle anglevk(start=anglevk0);
  SI.Angle anglevm;

  OpenIPSL.Interfaces.PwPin p annotation (Placement(visible=true,
        transformation(extent={{-120,-10},{-100,10}})));
  OpenIPSL.Interfaces.PwPin n
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
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
end pst1;
