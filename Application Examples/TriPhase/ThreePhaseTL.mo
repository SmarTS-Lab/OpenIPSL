within TriPhase;
model ThreePhaseTL
  outer OpenIPSL.Electrical.SystemBase SysData;

  OpenIPSL.Connectors.PwPin p1in
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  OpenIPSL.Connectors.PwPin p2in
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  OpenIPSL.Connectors.PwPin p3in
    annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
  OpenIPSL.Connectors.PwPin p1out
    annotation (Placement(transformation(extent={{80,80},{100,100}})));
  OpenIPSL.Connectors.PwPin p2out
    annotation (Placement(transformation(extent={{80,-10},{100,10}})));
  OpenIPSL.Connectors.PwPin p3out
    annotation (Placement(transformation(extent={{80,-100},{100,-80}})));

  SI.Voltage var "Real part of the voltage drop between the two pins";
  SI.Current iar "Real part of the current flowing from pin p1in to pin p1out";
  SI.Voltage vai "Imaginary part of the voltage drop between the two pins";
  SI.Current iai
    "Imaginary part of the current flowing from pin p1in to pin p1out";

  SI.Voltage vbr "Voltage drop between the two pins (= p.v - n.v)";
  SI.Current ibr "Current flowing from pin p to pin n";
  SI.Voltage vbi "Voltage drop between the two pins (= p.v - n.v)";
  SI.Current ibi "Current flowing from pin p to pin n";

  SI.Voltage vcr "Voltage drop between the two pins (= p.v - n.v)";
  SI.Current icr "Current flowing from pin p to pin n";
  SI.Voltage vci "Voltage drop between the two pins (= p.v - n.v)";
  SI.Current ici "Current flowing from pin p to pin n";

  parameter Real R_p "Resistence for the positive sequence (pu)" annotation (Dialog(group="Power flow data"));
  parameter Real X_p "Reactance for the positive sequence (pu)" annotation (Dialog(group="Power flow data"));
  parameter Real R_0 "Resistence for the zero sequence (pu)" annotation (Dialog(group="Power flow data"));
  parameter Real X_0 "Reactance for the zero sequence (pu)" annotation (Dialog(group="Power flow data"));
  parameter Real V = 1 "Nominal Voltage (kV)" annotation (Dialog(group="Power flow data"));
  parameter Real S = SysData.S_b "Nominal Power (kVA)" annotation (Dialog(group="Power flow data"));
  parameter Real f = SysData.fn "System Frequency" annotation (Dialog(group="Power flow data"));
equation
  //Phase A - Kirchhoff
  var = p1in.vr - p1out.vr; // real voltage drop
  vai = p1in.vi - p1out.vi; // imaginary voltage drop
  0 = p1in.ir + p1out.ir; //
  0 = p1in.ii + p1out.ii; //
  iar = p1in.ir; //
  iai = p1in.ii; //

  //Phase B - Kirchhoff

  //Phase C - Kirchhoff

  annotation ();
end ThreePhaseTL;
