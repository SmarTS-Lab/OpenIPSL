within OpenIPSL.Electrical.Branches.PSAT.ThreeWindingTransformer;
model Branch1 "First winding of Three Winding Transformer"
  OpenIPSL.Interfaces.PwPin p
    annotation (Placement(transformation(extent={{-120,-6},{-100,14}})));
  OpenIPSL.Interfaces.PwPin n1
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  parameter Real SystemBase=100;
  parameter Real Sn=100 "Power rating MVA";
  parameter Real Vbus=400000 "Sending end bus voltage, V";
  parameter Real Vn1=400000 "Voltage rating of the first winding, V";
  parameter Real Vn2=100000 "Voltage rating of the second winding, V";
  parameter Real Vn3=40000 "Voltage rating of the third winding, V";
  parameter Real fn=50 "Frequency rating, Hz";
  parameter Real R12=0.01 "Resistance of the branch 1-2, p.u.";
  parameter Real R13=0.01 "Resistance of the branch 1-3, p.u.";
  parameter Real R23=0.01 "Resistance of the branch 2-3, p.u.";
  parameter Real X12=0.1 "Reactance of the branch 1-2, p.u.";
  parameter Real X13=0.1 "Reactance of the branch 1-3, p.u.";
  parameter Real X23=0.1 "Reactance of the branch 2-3, p.u.";
  parameter Real m=0.98 "Fixed Tap ratio";
  Real r1;
  Real x1;
  Real anglev2 "Angle of the fictious bus";
  Real vbus2 "Voltage of the fictious bus";
equation
  vbus2 = sqrt(n1.vr^2 + n1.vi^2);
  anglev2 = atan2(n1.vi, n1.vr);
  r1 = 0.5*(R12 + R13 - R23);
  x1 = 0.5*(X12 + X13 - X23);
  r1*p.ir - x1*p.ii = 1/m^2*p.vr - 1/m*n1.vr;
  r1*p.ii + x1*p.ir = 1/m^2*p.vi - 1/m*n1.vi;
  r1*n1.ir - x1*n1.ii = n1.vr - 1/m*p.vr;
  x1*n1.ir + r1*n1.ii = n1.vi - 1/m*p.vi;
  annotation (Documentation);
end Branch1;
