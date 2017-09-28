within OpenIPSL.Electrical.Branches.PSAT.ThreeWindingTransformer;
model ThreeWindingTransformer
  OpenIPSL.Interfaces.PwPin b1
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  OpenIPSL.Interfaces.PwPin b2
    annotation (Placement(transformation(extent={{100,20},{120,40}})));
  OpenIPSL.Interfaces.PwPin b3
    annotation (Placement(transformation(extent={{100,-40},{120,-20}})));
  parameter Real Sb=100 "System base power (MVA)"
    annotation (Dialog(group="Power flow data"));
  parameter Real Sn=100 "Power rating (MVA)"
    annotation (Dialog(group="Power flow data"));
  parameter Real Vbus=400000 "Sending end bus voltage (V)"
    annotation (Dialog(group="Power flow data"));
  parameter Real Vn1=400000 "Voltage rating of the first winding (V)"
    annotation (Dialog(group="Power flow data"));
  parameter Real Vn2=100000 "Voltage rating of the second winding (V)"
    annotation (Dialog(group="Power flow data"));
  parameter Real Vn3=40000 "Voltage rating of the third winding (V)"
    annotation (Dialog(group="Power flow data"));
  parameter Real fn=50 "Frequency rating (Hz)"
    annotation (Dialog(group="Power flow data"));
  parameter Real R12=0.01 "Resistance of the branch 1-2 (pu)"
    annotation (Dialog(group="Transformer data"));
  parameter Real R13=0.01 "Resistance of the branch 1-3 (pu)"
    annotation (Dialog(group="Transformer data"));
  parameter Real R23=0.01 "Resistance of the branch 2-3 (pu)"
    annotation (Dialog(group="Transformer data"));
  parameter Real X12=0.1 "Reactance of the branch 1-2 (pu)"
    annotation (Dialog(group="Transformer data"));
  parameter Real X13=0.1 "Reactance of the branch 1-3 (pu)"
    annotation (Dialog(group="Transformer data"));
  parameter Real X23=0.1 "Reactance of the branch 2-3 (pu)"
    annotation (Dialog(group="Transformer data"));
  parameter Real m=0.98 "Fixed tap ratio"
    annotation (Dialog(group="Transformer data"));
  Real v1;
  Real v2;
  Real v3;
  Real anglev1;
  Real anglev2;
  Real anglev3;
  Branch1 branch1_1(
    SystemBase=Sb,
    Sn=Sn,
    Vbus=Vbus,
    Vn1=Vn1,
    Vn2=Vn2,
    Vn3=Vn3,
    fn=fn,
    R12=R12,
    R13=R13,
    R23=R23,
    X12=X12,
    X13=X13,
    X23=X23,
    m=m) annotation (Placement(transformation(extent={{-66,-10},{-46,10}})));
  Branch2 branch2_1(
    SystemBase=Sb,
    Sn=Sn,
    Vbus=Vbus,
    Vn1=Vn1,
    Vn2=Vn2,
    Vn3=Vn3,
    fn=fn,
    R12=R12,
    R13=R13,
    R23=R23,
    X12=X12,
    X13=X13,
    X23=X23,
    m=m) annotation (Placement(transformation(extent={{18,20},{38,40}})));
  Branch3 branch3_1(
    SystemBase=Sb,
    Sn=Sn,
    Vbus=Vbus,
    Vn1=Vn1,
    Vn2=Vn2,
    Vn3=Vn3,
    fn=fn,
    R12=R12,
    R13=R13,
    R23=R23,
    X12=X12,
    X13=X13,
    X23=X23,
    m=m) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={30,-30})));
equation
  v1 = sqrt(b1.vr^2 + b1.vi^2);
  v2 = sqrt(b2.vr^2 + b2.vi^2);
  v3 = sqrt(b3.vr^2 + b3.vi^2);
  anglev1 = atan2(b1.vi, b1.vr);
  anglev2 = atan2(b2.vi, b2.vr);
  anglev3 = atan2(b3.vi, b3.vr);
  connect(branch1_1.p, b1) annotation (Line(
      points={{-67,0.4},{-110,0.4},{-110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(branch2_1.n2, b2) annotation (Line(
      points={{39,30},{110,30}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(branch3_1.p3, b3) annotation (Line(
      points={{41,-30},{110,-30}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(branch2_1.p2, branch3_1.n3) annotation (Line(
      points={{17,30},{10,30},{10,-30},{19,-30}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(branch1_1.n1, branch3_1.n3) annotation (Line(
      points={{-45,0},{10,0},{10,-30},{19,-30}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={Ellipse(extent={{-52,34},{12,-28}}, lineColor={0,
          0,255}),Ellipse(extent={{-4,64},{60,2}}, lineColor={0,0,255}),Ellipse(
          extent={{-2,16},{62,-46}}, lineColor={0,0,255}),Line(
          points={{-54,-22},{10,42},{10,42}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{2,40},{10,42},{10,42}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{8,34},{10,42}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{60,32},{100,32},{100,32}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{58,-28},{102,-28},{100,-28}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-100,0},{-52,0}},
          color={0,0,255},
          smooth=Smooth.None),Text(
          extent={{-54,-62},{54,-78}},
          lineColor={0,128,0},
          textString="%TWT%")}),
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
end ThreeWindingTransformer;
