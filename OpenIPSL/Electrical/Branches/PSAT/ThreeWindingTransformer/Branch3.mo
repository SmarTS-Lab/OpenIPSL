within OpenIPSL.Electrical.Branches.PSAT.ThreeWindingTransformer;
model Branch3
  OpenIPSL.Interfaces.PwPin p3
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  OpenIPSL.Interfaces.PwPin n3
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  parameter Real SystemBase=100;
  parameter Real Sn=100 "Power rating MVA";
  parameter Real Vbus=400000 "Sending end bus voltage, V";
  parameter Real Vn1=400000 "Voltage rating of the first winding, V";
  parameter Real Vn2=100000 "Voltage rating of the second winding, V";
  parameter Real Vn3=40000 "Voltage rating of the third winding, V";
  parameter Real fn=50 "Frequency rating Hz";
  parameter Real R12=0.01 "Resistance of the branch 1-2, p.u.";
  parameter Real R13=0.01 "Resistance of the branch 1-3, p.u.";
  parameter Real R23=0.01 "Resistance of the branch 2-3, p.u.";
  parameter Real X12=0.1 "Reactance of the branch 1-2, p.u.";
  parameter Real X13=0.1 "Reactance of the branch 1-3, p.u.";
  parameter Real X23=0.1 "Reactance of the branch 2-3, p.u.";
  parameter Real m=0.98 "Fixed Tap ratio";
  Real r3;
  Real x3;
equation
  r3 = 0.5*(R23 + R13 - R12);
  x3 = 0.5*(X23 + X13 - X12);
  r3*p3.ir - x3*p3.ii = p3.vr - n3.vr;
  r3*p3.ii + x3*p3.ir = p3.vi - n3.vi;
  r3*n3.ir - x3*n3.ii = n3.vr - p3.vr;
  x3*n3.ir + r3*n3.ii = n3.vi - p3.vi;
  annotation (Documentation);
end Branch3;
